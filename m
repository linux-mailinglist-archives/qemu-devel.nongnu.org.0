Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B94141CF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:26:57 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvia-000150-4K
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWs-0001M7-Iq
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:51 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWr-0007Wn-6j
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:50 -0400
Received: by mail-io1-xd2e.google.com with SMTP id n71so2056436iod.0
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdMf1pNNEOvkez9WfeJ2j4FMzgl9gPUSEytioy1vA84=;
 b=Z7yUD4RrJ8NMlIev2cx3rK2JzwVUtYEiZBMtwJ4S+o1UtCF5vuVjrGETVgkLWqesCF
 8j7ytjafFo+KSullRGPhW3UjKNvuS6DucIlz9nTGS+4lnHB1RBEDaZW86iU8yVI3detL
 Bjk9xEGo+RmcJ4X2JXYyed/R5YnHZgl1tWOj/LykkR4NQ+sMZVA/FuPo3GcBBtHKd3/l
 NgUmGZ/VJQGiwMpGAq4tZaf0yrnDsnDlZYTb6eZh5bX26tjC69c1A+GSqgh1rcEL/3vn
 g96MCL3Ik6BVDTjv/5+RFMzVLFCR1oEwDwCVxl6y08qhR2gQ7TJJkEn41BkzbCrS730o
 Ek8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdMf1pNNEOvkez9WfeJ2j4FMzgl9gPUSEytioy1vA84=;
 b=F2dEzFUgGrbBAPR2Lf3+t/FnO+G7kYwQ/vOos/VgWd4dAvrkzqZdObuC8LI1+fLVW7
 4L7a7TMLDTqGJTNutF+bbiB4nkEDPkaYxRIdXivtlziGiM/lvdjWXj4RAkXHdWwM9WaR
 xxh7qVBwb5mDA96bBImcRR85s+rjXpoCC2B/hobrDBxM3+pf1VDo/w3PfkFONYWj2k8v
 JGbmnBkpGtZBSq4aj01yzZl5b1qv0elh6Hvop4Wcld7OtljcIhwJf98Ws72ZDpgOR3Zb
 XWIWm9lv9PcPrhR46Ysn0Yq0+vvLQH+q9YCP12CIHgrnX8DokKHPdUX4uOm2N6WNVhar
 W8iQ==
X-Gm-Message-State: AOAM5322sP5E7XbFH9bi4/2XzOhIfpSQaBIQgcWT4u9HSkYtRUtpbI4H
 NPyJQNNtq87q0iW4Zl255bpLj1ee204AyroESSg=
X-Google-Smtp-Source: ABdhPJyhHeC2F4WyKi2VXDgp9nqv1i/Dy6QaqA6TpV1tUylsq9abzXDN/qjQxIp1OciMQshWV3hPsQ==
X-Received: by 2002:a6b:b785:: with SMTP id h127mr3052597iof.149.1632291287887; 
 Tue, 21 Sep 2021 23:14:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] bsd-user/target_os_elf: If ELF_HWCAP2 is defined,
 publish it
Date: Wed, 22 Sep 2021 00:14:32 -0600
Message-Id: <20210922061438.27645-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some architecutres publish AT_HWCAP2 as well as AT_HWCAP. Those
architectures will define this in their target_arch_elf.h files.  If it
is defined, then publish it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_elf.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
index adcffd1ddb..e5ac8e8e50 100644
--- a/bsd-user/freebsd/target_os_elf.h
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -112,6 +112,10 @@ static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
         NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
         features = ELF_HWCAP;
         NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
+#ifdef ELF_HWCAP2
+        features = ELF_HWCAP2;
+        NEW_AUX_ENT(FREEBSD_AT_HWCAP2, features);
+#endif
         NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
         NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
         NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
-- 
2.32.0


