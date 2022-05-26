Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49315355CB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:45:59 +0200 (CEST)
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLIs-00029F-RD
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBu-0000uR-BG; Thu, 26 May 2022 17:38:46 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:34931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBs-00085m-Gq; Thu, 26 May 2022 17:38:46 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-f16a3e0529so3773631fac.2; 
 Thu, 26 May 2022 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PyTl8+lSVsVjSgTsn48felgJQ6hKzAQD0I/3SyX7ojk=;
 b=VE8tbp6HK6wpF6Yfk11fZyap6kAiIZiHiOVqxiSlIdusdiUGMCbyOOS/Of4aKrnJRy
 gvJc9awGbV/t3ONW7mq6xJ/asiSuXdpr2msyhqT8Q5u7B+6qp3meokn/2fAMjbyAjYUG
 V2zYyQyLinZi1GjWSRsT4KW03tErs8ahvPNtV4supf25qW6p3QtjfLYG+mbD7hUWo3xL
 yjbQTVp0tJ2WmRXN2nQUroM546cXDl88IdD87M8GI3fZUNhlrY9aatEBH0WhHtUvI0rK
 QbvyZ7u7UzpVziUmgo0OnBCuLRZ0mM59c+7O+CovixdxqDaws5lg3+XEVMBhy2lJfTkW
 kN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PyTl8+lSVsVjSgTsn48felgJQ6hKzAQD0I/3SyX7ojk=;
 b=I7S7ISjruSzldtaVKkCNsZHlOS9USogVLvPuQZhqmtoVsaLlv/bx0G+srMn1GckAMa
 x3fSARQ5XjNNEB9V71a+v1uGfAqTd9RVNkYWTDh8X7zHZKA/zvxy/BQEXD2JpWxQjKPM
 VToYqPvkv40N7EpGVqeodj6ls9jHnI2Ut97Kdng6zHWTlI0pLt750Dgn6yLGeuaPCjKX
 FGydy1ZBU4xCbtH+cMgB3/0Am/rYC6JhRdFklSal3b9oecEBnmAeAXhWqj5CAFqDTo0d
 4Ps9ubLLmx4X9CV+uOrCH3GiKoN4whgTNiOQOLAJEj7slETqu5IEJYlfzC2dK2lwe+47
 vNRg==
X-Gm-Message-State: AOAM530PlH51MGDPxSQ/3TXHlssXFyPQL1JZUC4WqplRLpGV46Rh9II1
 DSHpWXEMv9gNqExvqC2FNboHDDuhj88=
X-Google-Smtp-Source: ABdhPJwuGqjC5FpPEcRM8PUTzPuRnTtPEU+epMKN+XrsvZLtjfLfoYqNvXaAVBvpbDPav7h4DP4ufQ==
X-Received: by 2002:a05:6870:11cd:b0:e5:e565:9185 with SMTP id
 13-20020a05687011cd00b000e5e5659185mr2402305oav.251.1653601122915; 
 Thu, 26 May 2022 14:38:42 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PULL 04/34] spapr/docs: Add a few words about x-vof
Date: Thu, 26 May 2022 18:37:45 -0300
Message-Id: <20220526213815.92701-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

The alternative small firmware needs a few words of what it can and
absolutely cannot do; this adds those words.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20220506055124.3822112-1-aik@ozlabs.ru>
[danielhb: added linebreaks before and after table]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/system/ppc/pseries.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index d9b65ad4e8..3e1bbe6726 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -32,14 +32,43 @@ Missing devices
 Firmware
 ========
 
+The pSeries platform in QEMU comes with 2 firmwares:
+
 `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
 implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
 Configuration) Firmware: Core Requirements and Practices
 <https://standards.ieee.org/standard/1275-1994.html>`_.
 
+SLOF performs bus scanning, PCI resource allocation, provides the client
+interface to boot from block devices and network.
+
 QEMU includes a prebuilt image of SLOF which is updated when a more recent
 version is required.
 
+VOF (Virtual Open Firmware) is a minimalistic firmware to work with
+``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
+shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
+
+VOF does not have device drivers, does not do PCI resource allocation and
+relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
+to PCI resource assignment. It is ideal to use with petitboot.
+
+Booting via ``-kernel`` supports the following:
+
++-------------------+-------------------+------------------+
+| kernel            | pseries,x-vof=off | pseries,x-vof=on |
++===================+===================+==================+
+| vmlinux BE        |     ✓             |     ✓            |
++-------------------+-------------------+------------------+
+| vmlinux LE        |     ✓             |     ✓            |
++-------------------+-------------------+------------------+
+| zImage.pseries BE |     x             |     ✓¹           |
++-------------------+-------------------+------------------+
+| zImage.pseries LE |     ✓             |     ✓            |
++-------------------+-------------------+------------------+
+
+¹ must set kernel-addr=0
+
 Build directions
 ================
 
-- 
2.36.1


