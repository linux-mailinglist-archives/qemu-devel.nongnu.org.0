Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337C64A5B55
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:40:20 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErWF-0007cM-12
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:40:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7n-0004vS-Mg
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:03 -0500
Received: from [2607:f8b0:4864:20::134] (port=46841
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003Xb-5v
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:03 -0500
Received: by mail-il1-x134.google.com with SMTP id e8so13933743ilm.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=crCQBRHKtRPhHypZONQxqwtL7agng1pX4NR7iXT9wi4=;
 b=bDfo2sfWH51d0uVlrG1INGyOIQbThfcLsJexG1mNSBPiNFpogPV/1ARESd8/amK0Jm
 PL9RsDpsHhSgBfvy/Ne9Vht/Sum24vzljt23Vjs9vsShoPHkrgzQ3ugsNsTvhEVAHHrz
 0ooIfFaWRS1jgLNTlmRt7wdcdwUlKvUhktl2svKwdDkk4ug+gN1UdTerSn+Ky4GzvVuo
 G1A2F7T4098RTZnbY+lM7H+a+54NxwwSLSu9Ca+GYDpaheEJ5QK+HH6FRtiA44jSKHGk
 st+/Uoll+47GGGU66G+wWGRhaHSu4C5rWifcy5RRC6ihuZ/47wn00YKQVNmPJ3oHU4az
 Njig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=crCQBRHKtRPhHypZONQxqwtL7agng1pX4NR7iXT9wi4=;
 b=2+B3iIlygH0lPD42t2BJDALmx3ayWlaukEYztqx7NspP8wXPL2zFrYm+RQpEmDb3B0
 yBLQMMgymRBPDcfbxcC5n/OUeV7KZqEAePjYqq6dZ5SHuJZzzqXylxu2Vew08GvsfOMO
 INsxt0AU2X0m1lF3jozuBRWmlHeNOgvPhnFIi0zTZJFB3vmnpkD3HZQPZMsEVZ8oMlFZ
 gHrlMdGu04hP+wacIrQa4p+u3Hf70/X7EBherHRYhERLsDbpViVN2SxsI6TR4wMBS3sG
 I92z1QgY1+F6cTYV5MgCo27klf1OJEq6X79m6CVbu4pGbJ8eY3FgjVO78p2k0tCV5KM/
 TWoA==
X-Gm-Message-State: AOAM530eG+XRX3DASjUxeiOWzis2yySY8+DhBNCpXWRekmEbMZzEZAQn
 Tu+2tiLDc83BdXOhVYAU9fmN3SDJdeCd8Q==
X-Google-Smtp-Source: ABdhPJwhut4/Qvkszv+P4gONaXvzcYSggISdxoqVkmsFtOldyevK1yKP/maeAA/FSgT8eUeqVv62gw==
X-Received: by 2002:a05:6e02:15c2:: with SMTP id
 q2mr8570577ilu.226.1643714098037; 
 Tue, 01 Feb 2022 03:14:58 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:57 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/22] bsd-user: Move system call building to os-syscall.c
Date: Tue,  1 Feb 2022 04:14:43 -0700
Message-Id: <20220201111455.52511-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/meson.build | 1 +
 bsd-user/meson.build         | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/meson.build b/bsd-user/freebsd/meson.build
index 4b69cca7b90..f87c788e846 100644
--- a/bsd-user/freebsd/meson.build
+++ b/bsd-user/freebsd/meson.build
@@ -1,3 +1,4 @@
 bsd_user_ss.add(files(
   'os-sys.c',
+  'os-syscall.c',
 ))
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 8380fa44c25..5243122fc56 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -13,7 +13,6 @@ bsd_user_ss.add(files(
   'mmap.c',
   'signal.c',
   'strace.c',
-  'syscall.c',
   'uaccess.c',
 ))
 
-- 
2.33.1


