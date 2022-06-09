Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924FF544C46
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:37:51 +0200 (CEST)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHQ6-0006i2-L5
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF1K-0002K8-Hi
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF1I-0006SB-28
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654769043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mm+B+sZjuPBdfuv9miEAz0TvNcbmRdnWw2D4aJrdjVo=;
 b=EAfUBff2Qut/Yv+Re+tn2wZ1D94mhqaqxBT3EifiC3jwSl2b4nBDQ/QZo6mzpcceL5u4b6
 EDYrYUXnBEsVJ3dpXTBT1QhnPVKHbMN1N4CD6wV2RX/XFDSkQ60KN8g5rkVS3iT0T3OX6a
 2tJo/Q6OYpTXBMaF5yHcQbxBXa14QiE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-ywQKpzFROVe9HK22TI9X6A-1; Thu, 09 Jun 2022 06:04:00 -0400
X-MC-Unique: ywQKpzFROVe9HK22TI9X6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BADDC3979688;
 Thu,  9 Jun 2022 10:03:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 927A4492C3B;
 Thu,  9 Jun 2022 10:03:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 331631800094; Thu,  9 Jun 2022 12:03:58 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:03:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] usbredir: avoid queuing hello packet on snapshot restore
Message-ID: <20220609100358.ar3n232pnecu54lw@sirius.home.kraxel.org>
References: <20220507041850.98716-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507041850.98716-1-j@getutm.app>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 06, 2022 at 09:18:50PM -0700, Joelle van Dyne wrote:
> When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
> setting up the hello packet (just as with "-incoming". On the latest version
> of libusbredir, usbredirparser_unserialize() will return error if the parser
> is not "pristine."
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Patch queued up.

thanks,
  Gerd


