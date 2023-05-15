Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728B702EF4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:59:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYij-0005Xl-Bw; Mon, 15 May 2023 09:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyYig-0005Vq-Oe
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:58:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyYib-0006QS-Ga
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684159108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iLk666Lb0MJpuDjqpMEEZwiejkqdJewNDxu/Du9I2/E=;
 b=NAYAokPRjJ5DHtIVxFgZe4USrI7K8AkkqBY3Ri7rwpdBelVQYN+bdAb2eh8rvDzDI8qMa5
 5cig9FttiSd3bSUnNXiMxjNggkAhBixLImGWDXdPNaYQM9/OZSfBd2BFqIlb/HyK9Vm6Ed
 9tKmTYCbP12j/Xr165i4EYRGNvtr3AY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-FIbk9ACcNQS2ILbwx0xSJw-1; Mon, 15 May 2023 09:58:27 -0400
X-MC-Unique: FIbk9ACcNQS2ILbwx0xSJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so24594010a12.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684159105; x=1686751105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLk666Lb0MJpuDjqpMEEZwiejkqdJewNDxu/Du9I2/E=;
 b=MydizF3FEp5rkU9wDT+YzWGw2fN4xaKFUtVUW7lSk8rOPKPiyWMquHWNpsvRXWNg0C
 982LfvDc1+Tch4O/81qFckcbdIj+ND3zJicCrBIBOlfpEhdfKv14kHcW1rUUqFAlsJcn
 h+4w2zSxjlKe5K9rE5mFGzTopHrAWHljseNubU4QoyeZPJh0364/7EZE4tzV6WZnjML6
 uqu0KKZY80SrMRydnDUj93J53qEqvsJMfJMIlX1tV923CbFAvOm90jJehbv6MY4oKrjT
 RvFiv4sPjq1obz0FUgHNeauke0ISWL8ybnmFJ2VRqlscKPPWENTnoOlpKwRsH1e4nm1U
 L3rQ==
X-Gm-Message-State: AC+VfDywCJZlf+ceUJ50bG9U/tzutm+Zb55msqJ/0k2YrHxKD3sUsbXz
 YOHfFnuas/++IolrKCQIOtsgfgjtjz1PLrFOladfX8Llp9D5S4SpN82x/XUZZoKiKamsd7zLAcw
 zWrT9pIPPTCrrgudE6lHJv63CQGgTj+xvw+HToTpefuE4Eqs47KjO0KBzN42qwWf3/Hks71jrd0
 E=
X-Received: by 2002:a17:906:dc8e:b0:965:f69b:4949 with SMTP id
 cs14-20020a170906dc8e00b00965f69b4949mr28691633ejc.36.1684159105648; 
 Mon, 15 May 2023 06:58:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5240Lj8Mxp1Lk86w0om8T0gSp1jzO+xwjGmfg8ApQZ+0Mb+x1wen2uYf8rBoLiDMDgMfswYg==
X-Received: by 2002:a17:906:dc8e:b0:965:f69b:4949 with SMTP id
 cs14-20020a170906dc8e00b00965f69b4949mr28691614ejc.36.1684159105231; 
 Mon, 15 May 2023 06:58:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 kz23-20020a17090777d700b009659fed3612sm9483460ejc.24.2023.05.15.06.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:58:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Th=C3=A9o=20Maillart?= <tmaillart@freebox.fr>,
 qemu-stable@nongnu.org
Subject: [PATCH] scsi-generic: fix buffer overflow on block limits inquiry
Date: Mon, 15 May 2023 15:58:23 +0200
Message-Id: <20230515135823.382388-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Using linux 6.x guest, at boot time, an inquiry on a scsi-generic
device makes qemu crash.  This is caused by a buffer overflow when
scsi-generic patches the block limits VPD page.

Do the operations on a temporary on-stack buffer that is guaranteed
to be large enough.

Reported-by: Théo Maillart <tmaillart@freebox.fr>
Analyzed-by: Théo Maillart <tmaillart@freebox.fr>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-generic.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index ac9fa662b4e3..373fab0a2a61 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -191,12 +191,15 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
     if ((s->type == TYPE_DISK || s->type == TYPE_ZBC) &&
         (r->req.cmd.buf[1] & 0x01)) {
         page = r->req.cmd.buf[2];
-        if (page == 0xb0) {
+        if (page == 0xb0 && r->buflen >= 8) {
+            uint8_t buf[16] = {};
             uint64_t max_transfer = calculate_max_transfer(s);
-            stl_be_p(&r->buf[8], max_transfer);
-            /* Also take care of the opt xfer len. */
-            stl_be_p(&r->buf[12],
-                    MIN_NON_ZERO(max_transfer, ldl_be_p(&r->buf[12])));
+
+            memcpy(buf, r->buf, r->buflen);
+            stl_be_p(&buf[8], max_transfer);
+            stl_be_p(&buf[12], MIN_NON_ZERO(max_transfer, ldl_be_p(&buf[12])));
+            memcpy(r->buf + 8, buf + 8, r->buflen - 8);
+
         } else if (s->needs_vpd_bl_emulation && page == 0x00 && r->buflen >= 4) {
             /*
              * Now we're capable of supplying the VPD Block Limits
-- 
2.40.1


