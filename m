Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143D4CF254
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:57:51 +0100 (CET)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7JW-0001Gf-7u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HU-0006Rd-D1; Mon, 07 Mar 2022 01:55:45 -0500
Received: from [2607:f8b0:4864:20::42b] (port=45776
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HS-0007kj-Mr; Mon, 07 Mar 2022 01:55:43 -0500
Received: by mail-pf1-x42b.google.com with SMTP id s8so8846907pfk.12;
 Sun, 06 Mar 2022 22:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b93chAdBgu04CLd1Y4nffuj2enoiMljuIQeQ3NfisD8=;
 b=pgnb8pHKTJ877XxIVUd4at4SiECi9NR+VIHSDf7yIu9d5HLWueMXiRTziMaUfFiQei
 o5EgqkSTwY5j2Djs7iblKaN8o6U8t8vxyICG9NykL47Bur+JJAC/4NBFumz5CuhfwQIt
 9ZtvsQTxTK8eoBZmWBaEh9YDkdL5sT7D2bdbYYAxV355z/WmZ2mRJTU0XEqbccoAbFsM
 YvbY2BR2DrojhGztv8RrmX6lUi96DizHGHniAvx36dDWjqRnuQqei2zG/c7WWb9tuMww
 VHlIIiiXhXMVQpdSGwxAzh8d49WH/Gt+UGw67JLyA5pFy+g9d2FGDEy69WWKtY4QqHJz
 NFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b93chAdBgu04CLd1Y4nffuj2enoiMljuIQeQ3NfisD8=;
 b=2ekcwoz91867RwqKRAjpooLEtYtUWcErsVRUVIqGcsZOgW031m7aQuU1ymkYSpPpNg
 FJqlgCS3wQOkeJ9fzEGY2AB9MY8ggC6pMPDNMwekl/2UbeNkye3aYakZSoq7ZVoSPpNx
 iqd1UmecA2nZ/NUspMGrUGMukyGOYvn46605Agxhk+2z/lzEE6Q5LmFhA097qXNxuyZK
 hNX/ZX0npljEjg0LsAf1rwwakqK5pIIDFww7FZu6gGdSTBqeE3HGWnGsc/A78xNvQqhI
 fFgpYQLXQLrG+p3nPlKPQ7C9X6CFRYtIAPtArpkc/ZMsGns84BGIedU8mFRZCYGVPskz
 8osw==
X-Gm-Message-State: AOAM533WZY5slMROR2unxAzAsACBwbGZI61iVd1J51OxBHqzaSjvJg1E
 61m7PoZV+MBdeSdlFJzoIPYnND3aKak=
X-Google-Smtp-Source: ABdhPJzg81aLJHcL1zIf/V65UURSTYNY2MotVlzqrlU5amrAobbMXQqxzEWQ5NsaE/3jT+g6gFI+1w==
X-Received: by 2002:a63:e84b:0:b0:372:a079:302 with SMTP id
 a11-20020a63e84b000000b00372a0790302mr8666178pgk.272.1646636141059; 
 Sun, 06 Mar 2022 22:55:41 -0800 (PST)
Received: from bobo.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm1902477pgn.35.2022.03.06.22.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:55:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v3 2/4] target/ppc: Remove chip type field from POWER9 DD2.0
 PVR
Date: Mon,  7 Mar 2022 16:55:25 +1000
Message-Id: <20220307065527.156132-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220307065527.156132-1-npiggin@gmail.com>
References: <20220307065527.156132-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The POWER9 DD2.0 PVR does not follow the same format as the other
POWER9/10 PVRs, it includes a non-zero value in the "chip type" field.
This does not cause problems because the pvr check is masks it out and
matches against the base, but it's a small inconsistency. Zero the
field.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/cpu-models.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index 76775a74a9..b42f2ab162 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -349,7 +349,7 @@ enum {
     CPU_POWERPC_POWER8NVL_v10      = 0x004C0100,
     CPU_POWERPC_POWER9_BASE        = 0x004E0000,
     CPU_POWERPC_POWER9_DD1         = 0x004E0100,
-    CPU_POWERPC_POWER9_DD20        = 0x004E1200,
+    CPU_POWERPC_POWER9_DD20        = 0x004E0200,
     CPU_POWERPC_POWER10_BASE       = 0x00800000,
     CPU_POWERPC_POWER10_DD1        = 0x00800100,
     CPU_POWERPC_POWER10_DD20       = 0x00800200,
-- 
2.23.0


