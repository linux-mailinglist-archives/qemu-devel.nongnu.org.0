Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13564D514D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:36:22 +0100 (CET)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNe9-0004ga-QQ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:36:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYn-0000c1-14; Thu, 10 Mar 2022 13:30:49 -0500
Received: from [2607:f8b0:4864:20::c2a] (port=35638
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYl-0006UD-A5; Thu, 10 Mar 2022 13:30:48 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so7829691ooj.2; 
 Thu, 10 Mar 2022 10:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3MXs1Jg1LsZl8U6hUCx64ZzTZJTp4QnDhjPu1cVR9o=;
 b=DkSfW2YAmlxhXx+fJ6V3/POH/S1EGcVjTyininZ2MNa/L+JMv3MPo1zolDECJLqCAH
 pdRUYX6wa7KeSdb72dVy3kEiAwfZgQrSCj4eEHPrDtBnMhQ+obkO8QZRtFiutEPH4/Qd
 wI8hCp12VnH2BaA2dSZAGneZjrVLvm4LqBLuE/5W9GZCrwohP49mvkPbqP+JrK4jAC6O
 NtOLvgnW5vK9Njq5GDpUBkuwlvRR/bVaJ+USqAjTuSeNzhkGPBKtlc8JEvoFZ7X5ZCjD
 hFCI3doFupnJEKvD/fZ1p3eDapWFLAA9zGCG9nNq95hHbaF5FTSNjkthDjRuYyig7mFz
 tTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3MXs1Jg1LsZl8U6hUCx64ZzTZJTp4QnDhjPu1cVR9o=;
 b=YK4Zi94/kXjzcXMXREgzdMwOem1yElJ74lOSazmxfal0O/GxHwdWsvoceWtSI99R6v
 lwTSCNYjotkf/jsHRXG6KfJzMztrxzbf5aHm2Pc1Jmrkt6p44tCeYUU6OEi+dz9eV1cQ
 wVc2pllqosqsqa9xwNjeNHMofqA9VuEZHYQoj1eFrkMWZcXzeRtC80GX/dGde+zMYONf
 Bh94LZBHEhAaGmTo1/3Wfe4sEhPgpe2wd/PUVpoMNcUcZ9B1WND3l/dlgqdjC+Zt4P+M
 ah/SLr1fxLsKE7VMbbLaeXeLNbO2fH538KcCeoAET/5LFHsTxJ4GK5yCtVRgQshLohS6
 bTiw==
X-Gm-Message-State: AOAM531apHDp3D1ajIIMhRisLpGzYw78J/75i4P+cOwKNRDiknZbhXyY
 6zgOmsPmVoRjRvLQs8k4140ZK1zgZv4=
X-Google-Smtp-Source: ABdhPJwDknHzzW2Vx1rzlAUymem/77z+jssuGC8Rif1r8RRuQWdczC6QE0fe0Odvj+NXKCOf4aZzTQ==
X-Received: by 2002:a05:6870:3052:b0:da:a150:befe with SMTP id
 u18-20020a056870305200b000daa150befemr3519269oau.129.1646937045853; 
 Thu, 10 Mar 2022 10:30:45 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] avocado/ppc_virtex_ml507.py: check TCG accel in
 test_ppc_virtex_ml507()
Date: Thu, 10 Mar 2022 15:30:11 -0300
Message-Id: <20220310183011.110391-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test times out when running in an IBM POWER host and --disable-tcg.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/ppc_virtex_ml507.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/ppc_virtex_ml507.py b/tests/avocado/ppc_virtex_ml507.py
index a6912ee579..6b07686b56 100644
--- a/tests/avocado/ppc_virtex_ml507.py
+++ b/tests/avocado/ppc_virtex_ml507.py
@@ -19,7 +19,9 @@ def test_ppc_virtex_ml507(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:virtex-ml507
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2020/download/hippo.tar.gz')
         tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
-- 
2.35.1


