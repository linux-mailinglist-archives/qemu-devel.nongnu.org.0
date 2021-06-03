Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBD399D5F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:05:25 +0200 (CEST)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojI5-0006PS-1Q
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGE-0003uG-Df
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGD-0000B8-42
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id w21so6129647edv.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sevVFrnb8PFEJqb8tjfwJ5PpGOfYaPfNnd2GAELM28=;
 b=spT1DOgqGrG7fS96sbEzZX1jWqOkX2yKvAoAzo/hvMRUZkMejLSHUVomZU9dmDXk83
 ySsS+9wV1BZrS3dtOPrronExChdfjh70HI8N8pkeXHduZP4CLl07xVYoWNnf0c5gOTst
 jL9pu2WCTaFKrdqRmVhKB8Sy302lGnnI1uobLGH9RaDhdcZ2S6S4neMBVRa/8uy8uCls
 jt7Ajotnu++pIHuK9VGw3lldH5ebGy5Ph3ZA/umO+yhMIQLXbL1CpaRMei4E9LvNJ4AH
 LtO91kbKzV4qvV252XgDgKiI9GrGqVkE3R7Bkc0kavQKepjcQy00NquCvU9P1t8ADyFU
 xKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5sevVFrnb8PFEJqb8tjfwJ5PpGOfYaPfNnd2GAELM28=;
 b=B8PWEiJkv7IDBPAaC1wiiLsx9/ExD/Ie+A9+5LH6Yjn3VGwwFQnJFzCCOMm4Lu0TAt
 OkOdT1DWHuKA80FalqZKB7t3aHuzaxvdQTr+yMuhgj0yd4/rLNWT5XBYLKsWWrSoyxcU
 NKzw5FHs0iGqxwdB2JYRMcWjpZuOAl1rtydVlk5N77LNBL0wUqoQJI7a/jJiik7TWmQf
 3gS2+szukPWLqitOrFbqFWJBm1Qvg61TVXm6NStTB/+l5QiYJvuQlJkwKC6sSz3WkfA8
 BdhGoTaAi0mxwMkYlCNTPuBDsvkoIzswJmqam74u2mE7PS8SDKytUUmBlHz9pbU0d2En
 Y4yA==
X-Gm-Message-State: AOAM531whg0+jHLiF6LUj34/76WDxemXHjpQ+Z/qMCJUpZEIIhSn2mRh
 eq36eZJoO328I9LsqmOjRnJBLNWXJjzKig==
X-Google-Smtp-Source: ABdhPJw0l2ndqqHOCmeS+6Z9vZBweHDQFaWjuseXXATWzkfB7GmQ5MF7ZBMv8gmWSBMlKW2L9/tk2g==
X-Received: by 2002:aa7:ca50:: with SMTP id j16mr11466174edt.158.1622711007594; 
 Thu, 03 Jun 2021 02:03:27 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id i12sm1412143edx.13.2021.06.03.02.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/microblaze: Assert transaction failures have
 exception enabled
Date: Thu,  3 Jun 2021 11:03:07 +0200
Message-Id: <20210603090310.2749892-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603090310.2749892-1-f4bug@amsat.org>
References: <20210603090310.2749892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If exceptions are disabled, we must not get a transaction failure.
Assert they are enabled passed that point.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/op_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 8d20522ee88..1048e656e27 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -122,9 +122,7 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                   access_type == MMU_INST_FETCH ? "INST_FETCH" :
                   (access_type == MMU_DATA_LOAD ? "DATA_LOAD" : "DATA_STORE"));
 
-    if (!(env->msr & MSR_EE)) {
-        return;
-    }
+    assert(env->msr & MSR_EE);
 
     if (access_type == MMU_INST_FETCH) {
         if (!cpu->cfg.iopb_bus_exception) {
-- 
2.26.3


