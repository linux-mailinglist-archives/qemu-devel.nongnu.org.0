Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D94E53F5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:07:22 +0100 (CET)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1dx-0005Wu-E7
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:07:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Um-0007WH-KC; Wed, 23 Mar 2022 09:57:52 -0400
Received: from [2607:f8b0:4864:20::f2b] (port=45975
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uj-0000x6-N2; Wed, 23 Mar 2022 09:57:51 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id r1so1218022qvr.12;
 Wed, 23 Mar 2022 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTfdWEeO7UkuiZBNMdlAE3Mf1b3IlIIqRvP07nFA/Ow=;
 b=o0XGcoPL1KIfCgnU2sr/y9EyaXmc3cNOXdey6C7+TBG3xPlIkl+LaI431snebT9oqz
 cGpCQLokdzHJq14pg0/bQdBNjkRtBN2kaLfF/91EDdY18mFea8oGS5y0NDspSjG2Oin3
 ZwrD7VdAfkzARsa3EPKpA+3DUdpEhfPU32oJRled9+cqhx6oFkeOEkryykvvkkFK/dsS
 9GQl+Z7TsZbVtDVEYqYR6O8IBtJkI+YOe3XiJPqmtA1CjC5A3ezw/D7JZnARgP2fQPcE
 fUz3/hNAxGOFfu4vBRuCGj0nn9M0MF+tq0S1h1kgjsTxVRpHKaJ0UHPqf8jvvSU2Cl+w
 pFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTfdWEeO7UkuiZBNMdlAE3Mf1b3IlIIqRvP07nFA/Ow=;
 b=KVCMLTy1mSIm8Va7ZPWaiYoCCGBxEN5EZJj/GsCtmpBhY8MwxwnGHPDxJpB34VcagJ
 TCOTrfRKGk1TNJWd9Ls3ehpn2RO0E6l1Ld4L4CjbWta5Q2cUAAUKrz42FebZds3L5ugL
 1ij/jxMqqjbgN7V2aodVDWC4Ntfm6aVyQIrr2W+/LhWbiAtxV7Iyn1DsexCtKwtuEizd
 lJ71RWVQuXboHcF9useWoZxkAeGqjxlErPduK0yKrLINBC836Z564Lf+NJpfV7xR0Dei
 TtB5N8btcp60xcsOoISUpw/aKJpbU3396yHmk8POSYaW2DATyE0QZMexPXoeCvMpg+L+
 Uz7g==
X-Gm-Message-State: AOAM530qkCHqTCkCT5VRThi7QBSul9f0k89Ou2cwnb9gr+JpuZdW7hDt
 VJJrMUxPlpKKW+cJOQB1YzDfK7RJv/PxiA==
X-Google-Smtp-Source: ABdhPJwrYd/nNaIxz+zDE//RBbGZ1K/DaYvpYGni2s0yfZkAgZRkTKltgL7T+aEcWknWFUvpA1Lxsg==
X-Received: by 2002:a05:6214:2a49:b0:440:c955:347f with SMTP id
 jf9-20020a0562142a4900b00440c955347fmr23641902qvb.84.1648043868422; 
 Wed, 23 Mar 2022 06:57:48 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:48 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU
 model
Date: Wed, 23 Mar 2022 09:57:20 -0400
Message-Id: <20220323135722.1623-10-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2b.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


