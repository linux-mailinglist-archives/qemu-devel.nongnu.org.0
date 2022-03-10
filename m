Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA4E4D5146
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:32:24 +0100 (CET)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNaJ-0003wx-O3
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYh-0000Df-3e; Thu, 10 Mar 2022 13:30:43 -0500
Received: from [2607:f8b0:4864:20::c35] (port=38715
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYf-0006TO-Ii; Thu, 10 Mar 2022 13:30:42 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 x26-20020a4a9b9a000000b003211029e80fso7799762ooj.5; 
 Thu, 10 Mar 2022 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cws2rcOAAtRNO3jJK+A1VPeuM4fzirt/2n3rW/BbZEQ=;
 b=HLtd5bVYwaRKo+9yTPaYZIAs2l0HivGDhfvJO+bVgmv10bQjGqMSvama3/Ae3AisX2
 S5YlDDqE3f1krpYNCXbqI0rVxN33RaY0A+uYQblVk6/p1jGFg2N0KGxjJW26YFFpIoq4
 1i4KRnukqSeBl6pO58rtLv18bJBfbF+ncM3XiLRFTeY9bu8Pl3KPJF63MyD573XMDoZE
 NeCQjijwSLlLCpnX7E3CLYqH32rV/YCjRkykVZb0h4Of9dZ9msBkBsSst3g2Bu+TXMDf
 m9Vc9AQlzVFHL9YG1RjEiduaqh/bitX3ZHoAo0zvziNlvvkYEXBswdTgfRN0KuMEi0HM
 diJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cws2rcOAAtRNO3jJK+A1VPeuM4fzirt/2n3rW/BbZEQ=;
 b=2AhFK2g0DhGfcdhhUIWGaC96R9FYl62XnRXSujI3QF8qEsSnpaXlU/GH+WI+rYQsXp
 7C5eqPQvvEPAtaCkc05qlne7JFyeJeYW+qBcUvkt2LDgMnz0TqgwgxXtMh0fLDRpjnpb
 nIb+x84bkQ+MOdt8Ka/tJiRG43FyoynWHpcLFHSS6cKzBvceKbfE3MH2TJJHvhandIMf
 5bA9X6jYDG5+vq9CqQ/1btncAG4CMLbWbr4cTr7DHLYGASntctG0L2+HAWukR4G0Hqmx
 4KqMZWEve0uMMPaLlyAN9HOov02rPrcGx1cYydiaqOx7FJie0oBv37IbRTNvWVJugSHm
 JInQ==
X-Gm-Message-State: AOAM53394VSeKQpTFFlhLnYmgwukfpYb6FIAWlk1aJLiZWNBuBF4Ru4g
 9mOLdLrJSDiDekcsxecfrzQbER/iaCc=
X-Google-Smtp-Source: ABdhPJxwYWs0nVJkrQai1Xvfhz1wwdo6sySMbiqI6CE4naLWoLNSHXKjW6QbtpLWTYZDTuPJXl2Znw==
X-Received: by 2002:a05:6870:238c:b0:d6:f796:c98e with SMTP id
 e12-20020a056870238c00b000d6f796c98emr3681142oap.82.1646937040074; 
 Thu, 10 Mar 2022 10:30:40 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:39 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] avocado/ppc_mpc8544ds.py: check TCG accel in
 test_ppc_mpc8544ds()
Date: Thu, 10 Mar 2022 15:30:09 -0300
Message-Id: <20220310183011.110391-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
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

This tests times out in an IBM POWER host when compiled with
--disable-tcg.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/ppc_mpc8544ds.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/ppc_mpc8544ds.py b/tests/avocado/ppc_mpc8544ds.py
index 886f967b15..8d6a749201 100644
--- a/tests/avocado/ppc_mpc8544ds.py
+++ b/tests/avocado/ppc_mpc8544ds.py
@@ -19,7 +19,9 @@ def test_ppc_mpc8544ds(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mpc8544ds
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2020/download/day17.tar.gz')
         tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
-- 
2.35.1


