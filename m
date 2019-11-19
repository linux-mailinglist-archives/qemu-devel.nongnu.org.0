Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965191028FB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 17:11:14 +0100 (CET)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX65x-0003Qf-1R
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 11:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iX63k-0001k2-Kp
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 11:08:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iX63j-00062Q-LE
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 11:08:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iX63j-00060n-FR
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 11:08:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t1so24521428wrv.4
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=3iLhuLQVXfPXmdgg2LSG63xjVI9pM45wRFe4JLQs6+A=;
 b=d8pago/jDfbLZZ+HPbpx2LkXGbpfxHc4LIkIG7awHRewvbJ5NC8RoAAQkSdzOwLo3S
 4wWBC0VTTkmnRyZsNu0ENKdhZCNAocz6wwLooTk+h8lbJ9ZojXjwj8W0ZwkEFagBh0Dm
 78rqsL/IbWMK9J+y4GiWg+7ABhfsqmhGP9SZdTrq5m2FGHYn7VZTrbJOvtF2M0YAh9Rx
 6jkIZBOQ+pS0FfeaFWN7c8lKSZz4HcPqjwsvhOPo8vZnqLu2hEq19uRlRf2woBJ2LK13
 gdTLLf+EHTfw0RCCVqrhTc9EtIwjrD+Lm+DeEaXfUx3GuT0ssBg9xbt9B6ATGWlKHtKi
 wsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=3iLhuLQVXfPXmdgg2LSG63xjVI9pM45wRFe4JLQs6+A=;
 b=a97PQ39lIUVqjFy4pJ+8XIy9ruz/PuaCO0WBAb3qCyoy0eaL9Vjww/KyGE7fBZGGjk
 xDTN1/dAbv4f1W2l2cXagdFdvv9DJBNMz1A0fYyeavTqPFUMRDqaHzQDUqSf0t4Q89qE
 sZHHHh13o5jkLASkkif9X03mKks8DnhtuTNBcU4AXhLDqimacOYceBaM7CO5Rtfc2YgS
 ku41sYu7Y4HtBGWh3gLZinTRcC2yltAIBgf/gBgJ28YOgzO4y65G7zjBQUzi9VhsUbSp
 D5Mw0u2qyvstRUJFXgou+67aH0lTUQPoXGckxqAulWupg6zww8KyzHNZw3ev0+imZeac
 geyw==
X-Gm-Message-State: APjAAAVzv/9C/rd88PS9z4cd+ztAxuWZHJInNF6GJNGtGka9eB5VmNvA
 is6YmAM68Q2T4FnfVAM3XNSn1Fp4
X-Google-Smtp-Source: APXvYqzyB9RYsynBNv6Kf9XgHDG+BfBZaPpDJ8C5MxPvU7Bnjeq0eS680XGXC5yQ3ZZ8MMWP1+c72A==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr16805682wrv.107.1574179734119; 
 Tue, 19 Nov 2019 08:08:54 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n13sm3442203wmi.25.2019.11.19.08.08.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:08:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] target/i386: add PSCHANGE_NO bit for the
 ARCH_CAPABILITIES MSR
Date: Tue, 19 Nov 2019 17:08:39 +0100
Message-Id: <1574179728-35535-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574179728-35535-1-git-send-email-pbonzini@redhat.com>
References: <1574179728-35535-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is required to disable ITLB multihit mitigations in nested
hypervisors.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a624163..2f60df3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1204,7 +1204,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = MSR_FEATURE_WORD,
         .feat_names = {
             "rdctl-no", "ibrs-all", "rsba", "skip-l1dfl-vmentry",
-            "ssb-no", "mds-no", NULL, NULL,
+            "ssb-no", "mds-no", "pschange-mc-no", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-- 
1.8.3.1



