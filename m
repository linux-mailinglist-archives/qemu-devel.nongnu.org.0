Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B534420081
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:45:49 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwBs-0005uF-66
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9B-00038p-7e
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw99-0000jk-2x
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:56 -0400
Received: by mail-ed1-x532.google.com with SMTP id bm13so1798419edb.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QBaM+Y80mgyN7Ia3X+TH5nDhKBewjU9UfIHCLGMa7G4=;
 b=jmO/vDHI5l03/xBNPcm8K0kLpq7e/7ntYYTyX3XzZWu/RJjnL4VUSeLeKKVuOZneE4
 vdTPwZBCMySoez856PNofw0oix1TNJnh1MuFe1UPrDmXik8nLwTIsoYYGvv45eDir1Jf
 TxW5kT7+8Qvp4xRmqbD/bzMb9QonoCG3pDtBIX01UYV1CBt3ooZYmhm/t7WY9u2X07/V
 1qwoZibt4Ft2X60FeDapYXz0UUUwE8pUk3j/l0QBEI40kVcyNU+mLmuCBZQ4ZXr4KqRp
 SoPO6nglZSxPsAnYglcvx5qyLE/RVU5TtwagEVxS1INFF6Vn/9OjE9jXTz8xAsZ6/O0b
 Shkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QBaM+Y80mgyN7Ia3X+TH5nDhKBewjU9UfIHCLGMa7G4=;
 b=dKVRzLyMJY6OLBjIUdArczPLBUPqNtSUMo1eVWN6WZTotzrkPiTZt2jGnO2QJK5eCB
 /h8sb9MiLXTXXoCh1RKv67zCJGuZD3OwvVVrP861F/0sovMw9MNgXep/h00L0MSf0tYC
 cQodbtzry2ni34VPuY5BxrH625R4wm+3dx0tNQtVcw6W4mKw8Jay51lVblsbE66T8NQR
 59aWROgQxDRHGLaYebK/SZlokGI01+AUKlaCjynySUZd24TcDp8FzYyZJTN5Wdx8s1Gh
 j1UiY+spiA4IsJrATRl+ciZ7lKp6/mIqOONZn84OMiGKksZ4GMOGrOtpeWYbhSkG3LTx
 QF0A==
X-Gm-Message-State: AOAM531796ocqAgBDN3+YqHKkmWc7cvK0RN6ol4Z1wpN67+ocDUYhrE3
 Rgbi+u7SoLgGbcEwngJmC9uDte1HZaQ=
X-Google-Smtp-Source: ABdhPJxNqKR6gOlGSt8TC5WUb5NOE3l7+M/F/sL9740v1FnUq35BcTpBVGathzlPQhiSYllmHBB8YQ==
X-Received: by 2002:a05:6402:4305:: with SMTP id
 m5mr6516409edc.277.1633246973378; 
 Sun, 03 Oct 2021 00:42:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] qapi/machine: Fix an incorrect comment of
 SMPConfiguration
Date: Sun,  3 Oct 2021 09:42:21 +0200
Message-Id: <20211003074250.60869-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

The explanation of @cores should be "number of cores per die" but
not "number of cores per thread". Let's fix it.

Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-2-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/machine.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index f1c4983b64..0e91a57a76 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1393,7 +1393,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
-- 
2.31.1



