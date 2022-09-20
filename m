Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CC5BF141
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:33:30 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamk5-0001Yt-4P
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001S4-3b; Tue, 20 Sep 2022 15:42:56 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8a-0001qy-Qm; Tue, 20 Sep 2022 15:42:34 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1280590722dso5863203fac.1; 
 Tue, 20 Sep 2022 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VZ/UgZ7DVkOUyxT3dk+Nu3qdmFXFl44Qx7PfIfFeBU8=;
 b=B16Q9dGjJYY7UgTKV2O5+6KSOC6//45ntlVb/fABQRaq5vL7Pq6Ya5WtGkDgN7ksfh
 V+5k7eDssXtRIuGPH9E8wozPVzDmKQ001vIw03dRSzIpFkzT5Q8/RHk6i/7haFaxedlF
 E+pd6xkv/k9NXLmZ9NcCjfRFK4pQFPBly2laa7w9HUqG0s7LNbegVh7063xitZznnY8g
 F7cVVRlJYsNRp2NM2c+lc9NFrRCWjqd0vsX/w+5UwaTQy5wu1AUVs/ToAK4djZPoLroV
 co1CzG1dus0P6rUrmtSw8v1U0H199k1zKsrrcQd+M2GGdQ1n5NnyIZVKtUN5bTFK2+uR
 R2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VZ/UgZ7DVkOUyxT3dk+Nu3qdmFXFl44Qx7PfIfFeBU8=;
 b=e0ghoGBpAk6B/OVn0qIPiP9jl4TreOO+I6pcUlcUugSEIkBhFuCrnT5eD/WcsEXPkM
 MSUsqza0kP0XLKWifK9CGnLPfCNIA1kFGOHCG7xdqc1n4tELbuvIMST0C2xksQEZ/jHb
 kfrrMk9hnxlahJN4rKWodR3MEr0GyHY/G1HqCmVVVaxA6B5VVLgCc1Mq4axIzd4CUtZr
 sIMqfqgE3cTETzSsmYtAgHCi2r+sSjtevA0RNU2uwRESvOsI3MN8zSfDd2wS58xi0aNS
 nof2WcwB/bswe/m7vLelhMtV4ckTuN+CwmCOvrrOJBiYoWNDnN6+Gc6pm7hsHX8AWJde
 Er6A==
X-Gm-Message-State: ACrzQf338qDwi2c529FZs4Gkygep7psFfMVgctJB2s+DGUja9ssncdd4
 WLvJYUpdSyvzyww6MeqIPvVqESkf6bA=
X-Google-Smtp-Source: AMsMyM43X9FaxlH65p1YK/UyQhlCdlmm5omP9PV4b9w1eGWVSxXT9W/njOW6Xlf6/nBk/WhXCoIWdA==
X-Received: by 2002:a05:6870:c10e:b0:126:696d:405a with SMTP id
 f14-20020a056870c10e00b00126696d405amr3126436oad.99.1663702948825; 
 Tue, 20 Sep 2022 12:42:28 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 07/17] target/ppc: Remove extra space from s128 field in
 ppc_vsr_t
Date: Tue, 20 Sep 2022 16:41:52 -0300
Message-Id: <20220920194202.82615-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Very trivial rogue space removal. There are two spaces between Int128
and s128 in ppc_vsr_t struct, where it should be only one.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-2-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 4551d81b5f..602ea77914 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -246,7 +246,7 @@ typedef union _ppc_vsr_t {
 #ifdef CONFIG_INT128
     __uint128_t u128;
 #endif
-    Int128  s128;
+    Int128 s128;
 } ppc_vsr_t;
 
 typedef ppc_vsr_t ppc_avr_t;
-- 
2.37.3


