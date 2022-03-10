Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A134D514A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:34:18 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNc9-0000OK-KY
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYe-0008Ut-Qp; Thu, 10 Mar 2022 13:30:40 -0500
Received: from [2607:f8b0:4864:20::22c] (port=42632
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYd-0006T2-4c; Thu, 10 Mar 2022 13:30:40 -0500
Received: by mail-oi1-x22c.google.com with SMTP id q189so6817007oia.9;
 Thu, 10 Mar 2022 10:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bAYqnbcXXzzdvS/QwhyF42BUGZazn5D9bPKDfDcXNk=;
 b=IOoEfsrT3mrlwVmDYJ4yjgs3gQuk4lUVDCnManhHkyYq3cT94z14Q7GPygqp1aFgI8
 aKWV3EjTbin1zw6bMuIzTn+zLuovPI1JL3bb93oFI/G2YdfPrq39jVbSep8CRkXGgXKG
 hYml+gUxh3ERRhMwHGRkmVpSgmgLRAR0FT7U7U8gpYRuIru4pR8Bu0e8q5Q1xKLw1Xnv
 pvD34eHBqvcdpnnghhwX45tCEY3/Ly5YzbJ8/s/BYCVQSniJxAPYdDaOWgMr9xa9kI72
 v7nsryaADg46so593roXypV18O63FByY2+AuD9szddTNQi/GxvARnrY2ky+JMlZFtG6x
 e5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bAYqnbcXXzzdvS/QwhyF42BUGZazn5D9bPKDfDcXNk=;
 b=EQ6HWjXGZz0uPZNIT1JR3SDlAP8SPIi1ceEkv81Zu1Beo/2NpgK9l0v9cNeiA8aaDA
 D1IJNNyoHtS9IoHObrVt4NYbxAvbyYSTN0lUVuGnqHFYy6ujPwtilABFUymVql+LQknF
 TMq4YtFiebMFnht0OfL92oPy48MNoLcT3VX0gxdwqdKNWqb6u2oEF867YSLp3ChF/8mO
 pifqGwjw1cCxnRI/HNEyOYfsvjLadbU1UEOg9EDWEb+P/fKT9pII3rjwQg0bLFpfyY4d
 6HFuJ/PofPYpjkt4BLv5sd916TDn/RfCtFkhi4OhWdhEnVFEfoqCxVh1CbOOu/4QDcDs
 9tBg==
X-Gm-Message-State: AOAM532Il0jXnYxOOIsa3p+kt5SJzNx6Cpo57CakUU6F0+8JZxU3r1Tj
 TmkeZcCrz5aWK7znS4I5a7cCFmj2l10=
X-Google-Smtp-Source: ABdhPJzArxuOD9m1okzPETgTs1qAcCOD+g2+3I/hQ8irzI5au2m6gjwDyrkJl1I33lUfnvkepJweYw==
X-Received: by 2002:a05:6808:1809:b0:2da:3311:3290 with SMTP id
 bh9-20020a056808180900b002da33113290mr4357260oib.295.1646937037726; 
 Thu, 10 Mar 2022 10:30:37 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:37 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] avocado/ppc_bamboo.py: check TCG accel in
 test_ppc_bamboo()
Date: Thu, 10 Mar 2022 15:30:08 -0300
Message-Id: <20220310183011.110391-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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
 tests/avocado/ppc_bamboo.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/ppc_bamboo.py b/tests/avocado/ppc_bamboo.py
index 40629e3478..102ff252df 100644
--- a/tests/avocado/ppc_bamboo.py
+++ b/tests/avocado/ppc_bamboo.py
@@ -20,7 +20,9 @@ def test_ppc_bamboo(self):
         :avocado: tags=machine:bamboo
         :avocado: tags=cpu:440epb
         :avocado: tags=device:rtl8139
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
                    'system-image-powerpc-440fp.tar.gz')
         tar_hash = '53e5f16414b195b82d2c70272f81c2eedb39bad9'
-- 
2.35.1


