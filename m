Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974096646AA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:56:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6b-0003Yo-Gu; Tue, 10 Jan 2023 11:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5x-0003AT-Lh
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5w-000538-7i
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RTiLb6IkSRfHEH978vGHK7YphgS54b204kI9E5ptdA=;
 b=cWxc0H377Cjq410+rSYHP3XFfWLqqqAcvh/l+A+2fplIi0nhhCiUlgQah384xo2z2jqhRT
 JO5W4U4aJgmG1sW+m6VOIwaMenFsU0SxvFN+YfnodGHpE/r8Ia4vi/1TzVbt1/S+CqBLya
 9MCviKwyf10AoqXMPJLYI7WhfAzJ25Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-kCpyuZSWO56nqc0oCjqNIA-1; Tue, 10 Jan 2023 11:03:22 -0500
X-MC-Unique: kCpyuZSWO56nqc0oCjqNIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l17-20020a05600c1d1100b003d9a145366cso6483046wms.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RTiLb6IkSRfHEH978vGHK7YphgS54b204kI9E5ptdA=;
 b=v6Gc1i6Dc2tbs7TXK+uWj1pPFYArzlDm4QQsZMUVKqUu1U0BAptx77gXVWUo/llqZK
 W534+dX4+CaiUqpVNzCqpaq3MDrFcJRiw5IsCGGgo+lxsBaDYZIsbpBQTGGkFjtWYWrn
 BieWmSu4BRXQwA6VmrGFhKvcql6LdFv80H4VXzidf/NUbficSoo5JzvE4bmOsEe5Q0sJ
 GsoM5ZUpDytO8/KIV1XPsgrWnt/yUDKr8PqCvvznGDIGTxUJ0Hxu18d5mtmaa33etwub
 rAxwFuDTMbPUZ6wN+8KurySYLEvdtTYX0dnnHc7Id4mhnEf5eDkNXnmGnq0IbcK3dP/A
 5egw==
X-Gm-Message-State: AFqh2kpnino3uZGKgdbYHOJK8QARGA2DYv2KtM7CyCdBPfbV1likxnbZ
 xsfGhwknE3zmQ3FUJYsaDHt9HCG5PdKPCsOtelwWFfRXxHXRIV9QobHBNNTe1Kfv1MBRg9NBTYe
 Boo1zV6kRWam6aCa7FijdKw2Y79ii4JDH1pIg9lpHDB8qflORTXWUP/11MFRZvWqL3uA=
X-Received: by 2002:a5d:5685:0:b0:2bb:4b40:2d18 with SMTP id
 f5-20020a5d5685000000b002bb4b402d18mr8672878wrv.62.1673366600602; 
 Tue, 10 Jan 2023 08:03:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQV9QQRp9JoAQC8P3ERgQB1Fi9lMWvPig51S8pyrn9ABXu6i+6q+5ww3dg4kG5iCshXhEGEQ==
X-Received: by 2002:a5d:5685:0:b0:2bb:4b40:2d18 with SMTP id
 f5-20020a5d5685000000b002bb4b402d18mr8672857wrv.62.1673366600338; 
 Tue, 10 Jan 2023 08:03:20 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bu3-20020a056000078300b002bbe7efd88csm7097263wrb.41.2023.01.10.08.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/29] libvhost-user: Replace typeof with __typeof__
Date: Tue, 10 Jan 2023 17:02:21 +0100
Message-Id: <20230110160233.339771-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

Strictly speaking only -std=gnu99 support the usage of typeof and for
easier inclusion in external projects, it is better to use __typeof__.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_log_queue_fill’:
libvhost-user.c:86:13: error: implicit declaration of function ‘typeof’ [-Werror=implicit-function-declaration]
   86 |             typeof(x) _min1 = (x);              \
      |             ^~~~~~

Changing these two users of typeof makes the compiler happy and no extra
flags or pragmas need to be provided.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <981aa822bcaaa2b8d74f245339a99a85c25b346f.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b55b9e244d9a..67d75ece53b7 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -62,8 +62,8 @@
 #endif  /* !__GNUC__ */
 #ifndef MIN
 #define MIN(x, y) ({                            \
-            typeof(x) _min1 = (x);              \
-            typeof(y) _min2 = (y);              \
+            __typeof__(x) _min1 = (x);          \
+            __typeof__(y) _min2 = (y);          \
             (void) (&_min1 == &_min2);          \
             _min1 < _min2 ? _min1 : _min2; })
 #endif
-- 
2.38.1


