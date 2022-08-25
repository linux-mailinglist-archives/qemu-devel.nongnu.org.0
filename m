Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B915A1549
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:10:38 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREV6-0000zR-Kb
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERu-00040V-Ey
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERs-0002Mn-Sb
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso2683744wmr.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=4boT9ZMp8UNLQGnPh1ZGB1JNd8shwOC+FWZasArxRX0=;
 b=wk5KsKhJ4H6O4nuab22EGZzNJgjJHaF5skcbPGGbpT13em+JPLha8Uj9hXj3/rcHx9
 NPINAOlwIPSAzGlSB0Qi7ZxoaWOj+lxopxSTiQwsvTMZQ+gXzDJVf/UIpOcmsE0C1mMS
 EdtcpPwk/9Ym0Zs/OkjCG88uEGGML3MAllyNKad2noglVvj0NuRPJjlHg6+iZ6yTiYH8
 pMJmpnc/5ve3LPwwKG4HMWOP3HDeG8+Mbp7RhJud6LO7LgkzivWoJmg88tqSWOdoU5RF
 GufZOTo1Ot6PIKjepUqxJtCAv/lNm8qIUkbVV8F9ijq/fBRUZAhqnayhMr4whRh3DESh
 O9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=4boT9ZMp8UNLQGnPh1ZGB1JNd8shwOC+FWZasArxRX0=;
 b=SYzZusGqva/zo4thDp63haYUl4CZTfVyPcHk44mnko3Cpd7cvE2epx0FmSFncbEf+e
 ODTCz2oVcmh7ZLDyJjoO+fozCV0lCnQyFp7suoUKM24UGRk9HFgd8mXLWcdM9swVrvMd
 uHR/Sg1XL6/30aJQ+zPl3z3yFs7HhagJoNUq5VHBgugxE7z0/Ny/3t/scieDL7vPfGJW
 g/+a9LC+mu/pbDtmE5pTsqhE7jsQEtAdvx7XupcYD4OtQnoj76FYPxHYVHOWfLHwcAaX
 0LAJZ37+0YnheVwOclFtNpZTaLiC0UXSYbIgXqg96lj1EfhAekTuUC8m2GEBnhFhqnid
 qb0Q==
X-Gm-Message-State: ACgBeo1r0UBHnhbRRjwBzG+AfGNwZM73oMJRrk13oVmnmWm5sAJ49PbL
 X/a6KWK1QUrsoLSdBqVyjrSUABd58t6mEw==
X-Google-Smtp-Source: AA6agR7cMuC0irGvo+jcKaWvOMmjZC+KZerO1itFi2j6SmiY7L5isI1fn5zMVNZ/PHdAqyaenFOZqg==
X-Received: by 2002:a1c:7703:0:b0:3a5:aefa:68e3 with SMTP id
 t3-20020a1c7703000000b003a5aefa68e3mr2755344wmi.158.1661440031363; 
 Thu, 25 Aug 2022 08:07:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] configure: Check mkdir result directly, not via $?
Date: Thu, 25 Aug 2022 16:07:02 +0100
Message-Id: <20220825150703.4074125-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Shellcheck warns that we have one place where we run a command and
then check if it failed using $?; this is better written to simply
check the command in the 'if' statement directly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configure b/configure
index 5c1992d5bce..f8d7270a60e 100755
--- a/configure
+++ b/configure
@@ -67,8 +67,7 @@ fi
 # it when configure exits.)
 TMPDIR1="config-temp"
 rm -rf "${TMPDIR1}"
-mkdir -p "${TMPDIR1}"
-if [ $? -ne 0 ]; then
+if ! mkdir -p "${TMPDIR1}"; then
     echo "ERROR: failed to create temporary directory"
     exit 1
 fi
-- 
2.25.1


