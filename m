Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D72FFEA1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 09:48:34 +0100 (CET)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2s7M-0001Rd-Os
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 03:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2s5S-0000Wd-St
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:46:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2s5P-0002AN-Ij
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611305190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6VQ9wv0Q+WwDgpYoVR6pGpYj77vTsYCWQd7/HY6XE6o=;
 b=TwSDuGPEbCaI8DzKKaM56+qUcOHNduBHGfEBGitXBvjiko6kKfa1dKMXzPm+8pPs5AbEjX
 yo3JApVuW2WP+tfASBEt8K5aaBcgLBlaKTr4c5jhNQayUSrh26P7dQKD9UI3r3JGquDBW5
 mDlRjFS9+IdRnabxEqq17XG9uEJsKIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-DLvdKXxwMwuG43Q_yBuHWg-1; Fri, 22 Jan 2021 03:46:28 -0500
X-MC-Unique: DLvdKXxwMwuG43Q_yBuHWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE73192CC4A
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 08:46:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2326EF40;
 Fri, 22 Jan 2021 08:46:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42B8B18000AB; Fri, 22 Jan 2021 09:46:21 +0100 (CET)
Date: Fri, 22 Jan 2021 09:46:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PULL 10/11] vnc: move initialization to
 framebuffer_update_request
Message-ID: <20210122084621.rdfxbamfzyc7aaft@sirius.home.kraxel.org>
References: <20210115102424.1360437-1-kraxel@redhat.com>
 <20210115102424.1360437-11-kraxel@redhat.com>
 <26961441-e25b-25a1-b2e7-a6bb6a439022@redhat.com>
MIME-Version: 1.0
In-Reply-To: <26961441-e25b-25a1-b2e7-a6bb6a439022@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This patch breaks QEMU for me.

> The symptom is the following: in virt-manager, the display remains dead
> (black), when I start an OVMF guest. At the same time, unusually high
> CPU load can be seen on the host; it makes me think that virt-manager is
> trying, in a busy loop, to complete the VNC handshake, or some such.
> Ultimately, although the guest boots up fine, virt-manager gives up, and
> the display window says "Viewer was disconnected".

It is the vnc_colordepth() call. Seems gtk-vnc sends a update request
with incremental=0 as response to the VNC_ENCODING_WMVi message.  So
sending that as response to an incremental=0 update request creates an
endless loop ...

take care,
  Gerd

diff --git a/ui/vnc.c b/ui/vnc.c
index d429bfee5a65..0a3e2f4aa98c 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2041,7 +2041,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
-        vnc_colordepth(vs);
         vnc_desktop_resize(vs);
         vnc_led_state_change(vs);
         vnc_cursor_define(vs);


