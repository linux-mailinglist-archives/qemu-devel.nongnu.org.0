Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED574CC20A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:58:01 +0100 (CET)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnq4-0000tj-2t
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:58:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUS-00039A-P5; Thu, 03 Mar 2022 10:35:40 -0500
Received: from [2607:f8b0:4864:20::32b] (port=38900
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUR-0000o0-Cg; Thu, 03 Mar 2022 10:35:40 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so4901948oti.5; 
 Thu, 03 Mar 2022 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXNjeD6Sxe9ZmAZM+td3uKObrrg2Nxe5x51VPpl+OnI=;
 b=PSwXI3MwaxqKwXs8WZgNGL4qDv55ERbbldBmTZBtS5uGRmO9X0u6wbXbPiL/B6Cu/M
 Hl145wUGJZTVPhwJf8orSYtFqWAYEY8e8M9Bm0//edsazFKtVlbAt6LrnPkewXyXXHUD
 jUB9w553AtF543xVxElBc0l4h6LH630UoT6LzgkJB+wVsQr5i7BwqoLCwyOxnzw/QVX+
 EM8+mzt3+0SsgZ9U5r9lC1Xz7lnuigMzuWiVoZ/7G3LXoDHH9hqtODXPXLNQ+MunHmrI
 oJNGI72CcI/LkFA/TW+BX+FyvVQzysmhD8UlXSBCSyy2nKhDw4SbM+c3TMws1DS6JoD5
 H2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXNjeD6Sxe9ZmAZM+td3uKObrrg2Nxe5x51VPpl+OnI=;
 b=ScAkSB76ZRRKivxLDAXLhP0g6cE/GHZr6tIeTO+lCOTPXNU5fPYhxchCNiKINQsti5
 QahYjZ5hCdVjvnd8h2hGYh3/9xGK0GyyZakvGWHzEgTy6CUNtO2JZWSAh78b6BEi3Rwk
 nUcnEYjjFu9EjWKTmadoOZJNhG4RkR5l0D75Ohoh27vdpTw9i4qE51ZHZXEBkvbOwMau
 am/U5gOp3qY4CHX4A8FSsbGFfpFaB45dlONzxvhC05e+NEWauvANmJM1bXtedkUIq3NY
 bd5Xc+3161ie6iRBZ5Ga0xG/mHi7exnf7P6B3TQ/PvdasFePFK/wnIL7pga5DsQbEWdz
 hnDA==
X-Gm-Message-State: AOAM533/cjiGtEoySGPpFJaegde41ghAB89OHeJ5oN5UDCyIeXqN6n+Z
 agEy7xTStMANp20j9gtYDfnRm+ipIYk=
X-Google-Smtp-Source: ABdhPJx5s7VjrQPMe37QqoWURuK6Z9r0hB8u0a/aR4SAm9ZCQK6ChCBNXJCAdrzO0N9xZP/Ec0UjJQ==
X-Received: by 2002:a9d:721a:0:b0:5af:a50:eb65 with SMTP id
 u26-20020a9d721a000000b005af0a50eb65mr18905449otj.295.1646321737777; 
 Thu, 03 Mar 2022 07:35:37 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a056870770700b000d9aa7a6d63sm1178798oab.6.2022.03.03.07.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:35:37 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] avocado/boot_linux_console.py: check tcg accel in
 test_ppc64_e500
Date: Thu,  3 Mar 2022 12:35:16 -0300
Message-Id: <20220303153517.168943-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303153517.168943-1-danielhb413@gmail.com>
References: <20220303153517.168943-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some ppc64 hosts (e.g. IBM POWER hosts) aren't able to run the e500
machine using KVM accel. Skip this test if TCG accel isn't available.

Cc: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/boot_linux_console.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index d7d9130329..6d6e748572 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1165,7 +1165,9 @@ def test_ppc64_e500(self):
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
         :avocado: tags=cpu:e5500
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
 
-- 
2.35.1


