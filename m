Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD1B463141
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:40:57 +0100 (CET)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0ZC-0000rs-Rv
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WM-0006lF-5C
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:37:58 -0500
Received: from [2a00:1450:4864:20::42f] (port=43585
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WK-0000Oz-OG
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:37:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v11so43329794wrw.10
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 02:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ySnMoUXJta0tvcOXx1e7UJrwE9XJaWr7Nt7D7fKcAE=;
 b=Ri+04WzF7mDq/0Q3amZSj8YPdam0/QMRgD93VB3kvV3utYURhZN1XOFhUwNVrR6pee
 V/Tc7KZuMzhy+i2fnv03/rWh3WRe33MyowE2pYIfI3jPuFt4KOTiAxX7TNCuNkLIk+sr
 XGUl0ouGa4/m3ETkGRHPXHCq1vuNyyv3QazqGvG6qERQl/U3ETyoxDHJwoYQbG2sd12i
 vroqsghXA29TxO/YEVNlAyeV3n6r5Bqgc2/kqgLjLuEoyAVOuy2iui+VWE9JjqotvOlL
 OHVIuQ6JBo0KKpZ3w3ESvql9OqM+UMaQQq0ymNFhWJuy9I12y0xmfxInwLMCDQ2M+IU7
 VTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ySnMoUXJta0tvcOXx1e7UJrwE9XJaWr7Nt7D7fKcAE=;
 b=KzanQMpTB+tqgMg17a6PA3dWL9Mucc6HCnW09Pw+5eefdokm7V85mCfAhKxBJXqXXP
 yADLZ/eWhUG0R1mbTyo8QEqoAgi/aI2zDQ9AWAjJU3Ge/DXsAQrolmJ1F1m8WIDCtpzW
 J5/fWmdr3Us9d2r0YhfbTnn8Zw981l/FaJ96gsv6FqDuD5xoxRdwMSiTeA1PMunZXuBC
 4eqDbliSsMUim6ucKKaz7fcHyWcmmFCXCcJ7gXL2nXS8tPogfZ84bWp9VU/PwPjuUaay
 /fyz5BylnJ7aq2fhl0Z2gezop3bxFUekbcNwbJYN74ZNhqL3UfwG9sp9Bikkk9XhQek2
 68hw==
X-Gm-Message-State: AOAM532pm2wLgcYSP+Jr3cNtCZ27L3cV4ve6v4xl0bxnKqS2qkYYkICJ
 z9QXJv/RMiBDppugx7IOzduIZLnb4fxH0iO/bn8=
X-Google-Smtp-Source: ABdhPJyRFa1CucRawbKRu5V//zRoKBsaa2feecdSE/5X7knArsGepJdQv+ss0nYCHxXTGQydcXMLnA==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr40621740wri.242.1638268674701; 
 Tue, 30 Nov 2021 02:37:54 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m21sm16311280wrb.2.2021.11.30.02.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:37:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 0/3] target/m68k: Implement conditional traps
Date: Tue, 30 Nov 2021 11:37:49 +0100
Message-Id: <20211130103752.72099-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While looking at #754 for trapcc, I noticed that the other
conditional traps, trapv and ftrapcc, are also missing.


r~


Richard Henderson (3):
  target/m68k: Implement TRAPV
  target/m68k: Implement TRAPcc
  target/m68k: Implement FTRAPcc

 target/m68k/cpu.h       |  2 ++
 target/m68k/cpu.c       |  1 +
 target/m68k/translate.c | 76 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

-- 
2.25.1


