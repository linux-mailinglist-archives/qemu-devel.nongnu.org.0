Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8A28DB29
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 10:24:15 +0200 (CEST)
Received: from localhost ([::1]:51510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSc4z-0001ne-45
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 04:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSc2w-0008WK-Sg
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 04:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSc2q-0007aw-8B
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 04:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602663718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VfFOvNeUB3poGAbVH2m77W30dHai+FCaZ0AIgehCXE=;
 b=Asd6f1fTB0MWBw62fn7jHoJ+DTZfv7tVAVovfChN9I6zbpx18w4WYR76xUwhdheph2Wt93
 y8KYXoiB9PofGJgCAL8gPXajw1VOuoZXIS7Cb3RJlysYznDb2BeOMwX7yF/JUa7Z7PZDZl
 LKJqBG6ks4GStfSElALqgTH68ELFBhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-d0HQEm9WMsqlk1mxKLQHng-1; Wed, 14 Oct 2020 04:21:56 -0400
X-MC-Unique: d0HQEm9WMsqlk1mxKLQHng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D3818014D9;
 Wed, 14 Oct 2020 08:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 071286EF54;
 Wed, 14 Oct 2020 08:21:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56C8931E23; Wed, 14 Oct 2020 10:21:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] input-linux: Reset il->fd handler before closing it
Date: Wed, 14 Oct 2020 10:21:48 +0200
Message-Id: <20201014082149.26853-9-kraxel@redhat.com>
In-Reply-To: <20201014082149.26853-1-kraxel@redhat.com>
References: <20201014082149.26853-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Li Qiang <liq3ea@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Colin Xu <colin.xu@intel.com>

If object-del input-linux object on-the-fly, instance finalize will
close evdev fd without resetting it. However the main thread is still
trying to lock_acquire/lock_release during ppoll, which leads to a very
high CPU utilization.

Signed-off-by: Colin Xu <colin.xu@intel.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-id: 20200925021808.26471-1-colin.xu@intel.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/input-linux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/input-linux.c b/ui/input-linux.c
index ab351a418701..34cc531190f9 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -418,6 +418,7 @@ static void input_linux_instance_finalize(Object *obj)
 
     if (il->initialized) {
         QTAILQ_REMOVE(&inputs, il, next);
+        qemu_set_fd_handler(il->fd, NULL, NULL, NULL);
         close(il->fd);
     }
     g_free(il->evdev);
-- 
2.27.0


