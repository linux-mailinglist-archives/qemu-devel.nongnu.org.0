Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7364B66B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55SE-00014h-0N; Tue, 13 Dec 2022 08:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RY-00013j-Cm
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RW-0002zc-Jo
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:35 -0500
Received: by mail-pl1-x629.google.com with SMTP id m4so15640442pls.4
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfmFKXvPbYDVO7QdoAaOz/IKaZzu933l8Zdg5qycnZA=;
 b=bO1sytPBMwImixy5yKcyKuDN2Jp/WkqPGf+ClLAH7XblbkijqLKOoHesA81+dEBPdv
 L3P8WEu1aMw7E87Sx98HK6fPc0M2LYQWufQIIGR52t/sCKWj/2v0gsc/QaVLu8DOwLlR
 RDfz5a0B00OHu7jvNk3TsedfwX9Q0rpUH/c5TiNZKXYblf/qWhxvQBW/XbTeFvmGU1V2
 njqPhu92Xl9h3mGTx3xItUh9wbueM20G1bO9zN8ADvOkxBGJiEFH/+S+TiFUlR+RBaam
 SueVf+mhEPmajgHR0MFlU9D9IfL8348CS+YQbPhYMWqeWBKwNc1mCuFXJ+3AjBQEQ7sr
 DJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfmFKXvPbYDVO7QdoAaOz/IKaZzu933l8Zdg5qycnZA=;
 b=qHGK/IHOFKUq9VsdQQ784MrczO1bpClpHEed+s+OaxskIVUMwb9DXjM8t9bYEEncIw
 kmNRdERTmBdVhJA/S7o1NAQC38ZRgBwzCDeHIRIH7D+BE2diDO1GG5QCWVo9jHMFi0sJ
 r1GtzqsGdLfkrOwRNeI7tNLacYG6U3PLaxne1SFbyZqKjlexzJIAaFaSVCrUA8VbgE77
 6Rhlwq9b0PmfFf7GNkcgA37b09JFITXeTA2CQga748rfmjENNIzTLEXP5nBKwMP+erzE
 psxzNMD/fblj9SJGyzLYDSft+SqgSxTKH5bJoKELrvCtTGU2Kz+f8aguaA58Cqs7oNY6
 ElFw==
X-Gm-Message-State: ANoB5pmzkQBTtPccaB/ibgTMRwjWExflIuyAgWYKWdHizUWLJbZVoaUZ
 Xa+IQB3LzJSG5oMev3Q5hNiqhRC1pCC3lxng
X-Google-Smtp-Source: AA0mqf7nUBHrEE8Wd69u+eFPeY4JS9SV8kJcLXbuEcobchf1tpgFWf/YPTVuylU9oac2uPs6ZNRA8Q==
X-Received: by 2002:a17:902:f114:b0:18f:aca1:b0c9 with SMTP id
 e20-20020a170902f11400b0018faca1b0c9mr4419515plb.53.1670938533704; 
 Tue, 13 Dec 2022 05:35:33 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170903229200b00182a9c27acfsm8440033plh.227.2022.12.13.05.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 05:35:33 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, mst@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v3 3/3] migration: reduce time of loading non-iterable vmstate
Date: Tue, 13 Dec 2022 21:35:10 +0800
Message-Id: <20221213133510.1279488-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test results:
test vm info:
- 32 CPUs 128GB RAM
- 8 16-queue vhost-net device
- 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate
before		about 210 ms
after		about 40 ms

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 migration/savevm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..19785e5a54 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2617,6 +2617,9 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
     uint8_t section_type;
     int ret = 0;
 
+    /* call memory_region_transaction_begin() before loading vmstate */
+    memory_region_transaction_begin();
+
 retry:
     while (true) {
         section_type = qemu_get_byte(f);
@@ -2684,6 +2687,10 @@ out:
             goto retry;
         }
     }
+
+    /* call memory_region_transaction_commit() after loading vmstate */
+    memory_region_transaction_commit();
+
     return ret;
 }
 
-- 
2.20.1


