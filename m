Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770693AB14E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:25:01 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpCm-0002O3-JL
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltopv-0000Ow-Vi
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltopq-0002Oi-Kh
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623924078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPF4WI5Nhj7pYy1LTD6gND5E/hIrRuh64G+eWogc8YM=;
 b=XNdOMBxWRzgcT2H4EbMK/FOKBXbJ64HmjaPAgcbCVTdTji9aGgJ3h3xnPl3Z3yEXjLbM8g
 AJr7vF0TCgH9QN6SV5ysDSl9KBkgoM07GrEvIgjk6mQU4kaDnKvphiagzkvJTaiW/9kN0X
 h6YXUI1ZeZKi9VbyV7frjZm7/kaGRRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-bBnCW6JEPwOOLvhxGaSfSQ-1; Thu, 17 Jun 2021 06:01:16 -0400
X-MC-Unique: bBnCW6JEPwOOLvhxGaSfSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD4FA8015C6;
 Thu, 17 Jun 2021 10:01:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85ED45C1C5;
 Thu, 17 Jun 2021 10:01:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BDF0D18000B2; Thu, 17 Jun 2021 12:01:13 +0200 (CEST)
Date: Thu, 17 Jun 2021 12:01:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] coreaudio: Fix output stream format settings
Message-ID: <20210617100113.ova5qg4r5jgj3rj7@sirius.home.kraxel.org>
References: <20210616141721.54091-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210616141721.54091-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 11:17:21PM +0900, Akihiko Odaki wrote:
> Before commit 7d6948cd98cf5ad8a3458a4ce7fdbcb79bcd1212, it was coded to
> retrieve the initial output stream format settings, modify the frame
> rate, and set again. However, I removed a frame rate modification code by
> mistake in the commit. It also assumes the initial output stream format
> is consistent with what QEMU expects, but that expectation is not in the
> code, which makes it harder to understand and will lead to breakage if
> the initial settings change.
> 
> This change explicitly sets all of the output stream settings to solve
> these problems.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to audio queue.

thanks,
  Gerd


