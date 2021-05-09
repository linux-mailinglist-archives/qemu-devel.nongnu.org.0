Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F168B3777A0
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 18:32:38 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfmMA-0003E4-3Q
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 12:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caspervector@gmail.com>)
 id 1lflW8-0000Nn-GT
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:38:52 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caspervector@gmail.com>)
 id 1lflW6-0001mK-Ud
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:38:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id g14so15853243edy.6
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tauc76cU4lN8uJEzr5hS8uaJ0kx3Mpcdbn3VAeX2x5U=;
 b=XjtTL33NRvXHM9Kl8+7pgcu9OmloTT1LoGodLMKjP4g4zzsH/QPYn0NbCYH+2UhopO
 Ma3u5/7Qsnp6MVhTdHPBN2EEBJ/HenbKpBxgAu1pI+HCVXimZ4UQnmbHuHMsq7RKwlzj
 u16SwfrC7LNzAU/gXPyShMdGnMEftsNk7NcjIPfLzjgbsZfyJFvehV8wtjT4Tk4QKUEk
 LD/52AAW/WFVEw3xjOtjzFltST6TJKdeIdUWui429brUf1Bl0ziiubfeGvtvQDuLHEmA
 mJxgwD2ZPLi2YfwZeHKuz0+Po/B53XzM4oee8V7zmQIo2tQK6ZfR6mp4Ftt0hOZaqkTM
 CEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tauc76cU4lN8uJEzr5hS8uaJ0kx3Mpcdbn3VAeX2x5U=;
 b=K+D7/PcrCPaW90ZF1Nu6bGbuShwM+y3Nfl5Gb/yQuMB/Jrb6JlMoo5PedQlNderekK
 Bf+9r3tqs2b2oA6joSkaecOqM5HO97UGthvN6wplctdUr9BFZqPulkkG9DisI4dup0vF
 1OaciBv0e0veMWsg+TiLC7wb0/sVp1wVhnMYrNfDR3Dom/8mVm4OtymZ5QEAUv98sRQa
 YNcwnTm7X2/SdBpMnfp5uCSrLn3uMGjyCiusc4vQWUFv0iOjUedgtnqmaOJaPS1rkvrw
 3GRVIg9fdHsLsrE6AYhrisJtTFSkTb46dazm1kqAJqreTAYh2x4JUeuUb3lKzJsV7hO5
 LS7Q==
X-Gm-Message-State: AOAM530zDPdxrzw9U/20EOZifgghGyucZf4qKmQZ4VsHUZzYsSM9rgC0
 yqkdNwzChIG9ooBbfDC7zOwkPPrXPwg=
X-Google-Smtp-Source: ABdhPJxPUtckeBN1cXHDoBqeqDK3E1/tcv1+Uqbm8DNxwfwOo8BO7Vjglya/UJ+To035SPEu2/lotw==
X-Received: by 2002:a50:a404:: with SMTP id u4mr24572971edb.112.1620574728904; 
 Sun, 09 May 2021 08:38:48 -0700 (PDT)
Received: from localhost ([2400:dd01:1026:129:7487:a3ff:fe31:e137])
 by smtp.gmail.com with ESMTPSA id j16sm8990016edr.9.2021.05.09.08.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:38:48 -0700 (PDT)
From: "Casper Ti. Vector" <caspervector@gmail.com>
X-Google-Original-From: "Casper Ti. Vector" <CasperVector@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] net/slirp.c: fix SMB share with Samba 4 and Windows XP guests
Date: Sun,  9 May 2021 23:36:52 +0800
Message-Id: <f92e58a44fd2b294f6684b9cc521be1f1e78d0dd.1620573930.git.CasperVector@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=caspervector@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 May 2021 12:31:46 -0400
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
Cc: "Casper Ti. Vector" <CasperVector@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cf. <https://askubuntu.com/questions/379044/>

Signed-off-by: Casper Ti. Vector <CasperVector@gmail.com>
---
 net/slirp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/slirp.c b/net/slirp.c
index 7a4e96d..73042af 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -876,6 +876,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             "printing = bsd\n"
             "disable spoolss = yes\n"
             "usershare max shares = 0\n"
+            "server min protocol = NT1\n"
             "[qemu]\n"
             "path=%s\n"
             "read only=no\n"
-- 
2.31.1


