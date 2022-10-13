Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D55FDAC1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:24:16 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyC7-0005r7-Lz
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUA-0001mm-EH
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixU3-0004Hf-1U
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtEvum89bDy7P3QnxKlNjBZFWsWoVVMcWvMHogJ1enU=;
 b=VRG+2Wx/FXWz+RKf6JpBX/9WrEqZ48XE3NZGVEwb/EVOCr2ZgRLGUpRZhEIScxR+7KnbzU
 VL6hvlzwsTqEI1wY5gMVhEvO+sFoUWwWaxykxuh2BNzuaUyi7qovS3f740AYJEXjUXbg8o
 8v38T4K8R8T0GApXa9Xlry6WWFVtiGA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-PGN9H0wpOUOyIEG-DiXPFg-1; Thu, 13 Oct 2022 08:38:19 -0400
X-MC-Unique: PGN9H0wpOUOyIEG-DiXPFg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m10-20020a056402430a00b0045968bb0874so1416143edc.10
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtEvum89bDy7P3QnxKlNjBZFWsWoVVMcWvMHogJ1enU=;
 b=Ymft8i6o0wl5e9GIcrQD+scWt9T3MOkkyhxQkMzxsTV0WUhTR4a9C6rJ2m8sSJU90h
 4VLzwrG5UAP9hWNzF5OaXtpXhuLY/FGv9ZkmBHns/S+FeBjqfvUHVj2tccMUeoCOzntv
 9Yg4URDzOWOpr3lNo/xh15TRIqz41lxcVSm5DwTWSGmFFfeFNA0Zx7I3VQI8rZ2Y0Za0
 vM8EKOuOwZvnvbF80hjPFNeid1WL6+LPLUPMgnihqD31UGLySeoM9nlOlLHjaSzK9jaF
 kN9rrCAS6cbMGJTHM6z2ebs1o+o1+HWt96TroWpM+oOzmaGGkoIf4GGRW+nt/NN1aX2H
 3s9A==
X-Gm-Message-State: ACrzQf2+XUMJ1wA+oGAQ3cUpajRA9dpfmFNsxVajIn7LTufqryPwXsSq
 LWteV/23AM875s8F42jSDgg6hAAJNSMSnTXfGGpl8ztISSjXW5jauHgcvXOtfBCcnxdNdPPw0cK
 cdEgpbKlSDQ6s6SmH+dLzcwZf0bXoxUcJJHGfRAIComlPNxXB1KnjORSaF/3yTDdLP0E=
X-Received: by 2002:a05:6402:190f:b0:45b:d959:e2ae with SMTP id
 e15-20020a056402190f00b0045bd959e2aemr23994959edz.187.1665664698165; 
 Thu, 13 Oct 2022 05:38:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4B1wlgLhgEQw3ymfAAStC+lfzWAlski8MIlkJPBeBCGXLI234TuOdtd12ULrFAmG+nQUlw/w==
X-Received: by 2002:a05:6402:190f:b0:45b:d959:e2ae with SMTP id
 e15-20020a056402190f00b0045bd959e2aemr23994937edz.187.1665664697917; 
 Thu, 13 Oct 2022 05:38:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kw24-20020a170907771800b0073d87068042sm2880255ejc.110.2022.10.13.05.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 22/24] vhdx: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:09 +0200
Message-Id: <20221013123711.620631-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vhdx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index e10e78ebfd..f7dd4eb092 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2012,15 +2012,15 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
     creator = g_utf8_to_utf16("QEMU v" QEMU_VERSION, -1, NULL,
                               &creator_items, NULL);
     signature = cpu_to_le64(VHDX_FILE_SIGNATURE);
-    ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET, sizeof(signature), &signature,
-                     0);
+    ret = blk_co_pwrite(blk, VHDX_FILE_ID_OFFSET, sizeof(signature), &signature,
+                        0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to write file signature");
         goto delete_and_exit;
     }
     if (creator) {
-        ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET + sizeof(signature),
-                         creator_items * sizeof(gunichar2), creator, 0);
+        ret = blk_co_pwrite(blk, VHDX_FILE_ID_OFFSET + sizeof(signature),
+                            creator_items * sizeof(gunichar2), creator, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to write creator field");
             goto delete_and_exit;
-- 
2.37.3


