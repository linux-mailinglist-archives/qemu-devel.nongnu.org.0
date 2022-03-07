Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CFF4CEF54
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:08:51 +0100 (CET)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2nq-0001aI-Ni
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2iv-0002Xv-1T; Sun, 06 Mar 2022 21:03:46 -0500
Received: from [2607:f8b0:4864:20::735] (port=46009
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2it-0005xX-Lg; Sun, 06 Mar 2022 21:03:44 -0500
Received: by mail-qk1-x735.google.com with SMTP id b13so10843566qkj.12;
 Sun, 06 Mar 2022 18:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1S9HK47aAlcIuTwb3EXmQ/QPe41R1k9AG8Cx39D8k2I=;
 b=Od2eroLPiYilKEOp0Zgp/dqcfWmqtV5lcqeGxgBFhmcqQuhu81vxM5CAGHsd/k8JxB
 BVGRBYgm83NreWCj1odLWx+NnHRvdr1Ap92/5xC5ViiY0xsQTArFEoHYXyVYwL+f9uLY
 i8/0lbCFqPDWa1+UjsVOg0Sn+oH3OOp9oxx690jRz/s3Y5li/8jFiPJzZTgVV/D6Jy/N
 /5zMw71oq3aGCRy9HxmlhqIQnYZYi9hg5d5jO9WvTXRXLLDieWTbew7bSMf8AH4tlHrc
 jsTKUmhMW1YG4KArz+guqyxSSHu+I2QNa/J6qrbdxL0JNiqPxsH6exuJskezz0H4jmY7
 jXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1S9HK47aAlcIuTwb3EXmQ/QPe41R1k9AG8Cx39D8k2I=;
 b=CWw9VoV1MDeRATCRiXL5kUZDtXY+yREJF0VGZhIgnSIiUJ1zMLABBSwrU0zh4uzB5N
 8quWfWqisFB+svEvpIQV5mEOXQup5QHNBWdcoQXbG++NUo4QmUiSlIXVQ4N3mVkeS2nZ
 127/pdGjGCf7AsQQUqr9/NliBpvHvDTdiJt/zhhlmdbiuCNzlh69KSlR5PjTxOQaAM17
 MC9zNOOoanr2+3WmL3LYYbFjzqYmm0DjaFNAAEPVFxzlBdKVFOBRqi0fZHwDYFwKHJsI
 n9jECIOsMYqAJ9h1hFX+DfunID18lExi6XVYRymhUU/Sn5b0P5LvOlLWDQxTC64+DGgK
 K4UA==
X-Gm-Message-State: AOAM533EjNkM1fKGpJo55AhqYk3CuNLLd8SN4uiXIIzGFPZcj9jT0ZXI
 EvZMUkVq8FQWz1hC6gyHedbAfoZxwM66Zw==
X-Google-Smtp-Source: ABdhPJw9U5EBsKqe5zJNM/2DBTSEyAhikXjN45Fy3ZQEaobacqy1R1afTvaIfFl6mukQ1KuvK6++fg==
X-Received: by 2002:a05:620a:2446:b0:67b:a0:86f7 with SMTP id
 h6-20020a05620a244600b0067b00a086f7mr4363970qkn.744.1646618621704; 
 Sun, 06 Mar 2022 18:03:41 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:41 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
Date: Sun,  6 Mar 2022 21:03:26 -0500
Message-Id: <20220307020327.3003-7-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307020327.3003-1-dmiller423@gmail.com>
References: <20220307020327.3003-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 target/s390x/gen-features.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 22846121c4..499a3b10a8 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -740,7 +740,9 @@ static uint16_t qemu_V6_2[] = {
 
 static uint16_t qemu_LATEST[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
+    S390_FEAT_VECTOR_ENH2,
 };
+
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
     /* generates a dependency warning, leave it out for now */
-- 
2.34.1


