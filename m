Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ECD5FC3F5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 12:52:11 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiZLK-0007ic-Tn
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 06:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiZGW-0001ym-BV
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiZGT-00085O-IN
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665571623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Y6JRCPJYnU7EA9Q/xiJsHykpakyC0YBGJoYLaALFxw=;
 b=e/VLrwBELkpCPbARAbx9iXgGvgD62qk7wfcY3cWMwPahuePhn0qtybEjZW7tx+y5m2yocT
 V6O2Tn+sYqQs9dxYYYnOQIRygWVJlaIgWyJh6Gzfganoh2w2iMefa6Wg4AJ40FRvmajTfv
 dbuCZqARYtUrqOBhtmDGm8RtLZVgBWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-d3Wu7DpONZaKpUBXCh-2Tg-1; Wed, 12 Oct 2022 06:47:00 -0400
X-MC-Unique: d3Wu7DpONZaKpUBXCh-2Tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 167B786F12C;
 Wed, 12 Oct 2022 10:47:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC442157F45;
 Wed, 12 Oct 2022 10:46:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8DC2B18003A8; Wed, 12 Oct 2022 12:46:58 +0200 (CEST)
Date: Wed, 12 Oct 2022 12:46:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/gtk: Fix the implicit mouse ungrabbing logic
Message-ID: <20221012104658.pwovhhdnrh2hq52j@sirius.home.kraxel.org>
References: <20221008140116.11473-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008140116.11473-1-akihiko.odaki@daynix.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 08, 2022 at 11:01:16PM +0900, Akihiko Odaki wrote:
> Although the grab menu item represents the tabbed displays, the old
> implicit mouse ungrabbing logic changes the grab menu item even for
> an untabbed display.
> 
> Leave the grab menu item when implicitly ungrabbing mouse for an
> untabbed display. The new ungrabbing logic introduced in
> gd_mouse_mode_change() strictly follows the corresponding grabbing
> logic found in gd_button_event().

Added to queue.

thanks,
  Gerd


