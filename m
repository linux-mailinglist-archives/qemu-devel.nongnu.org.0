Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C841FEA6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 01:33:39 +0200 (CEST)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWoVe-0000Ut-Fx
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 19:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoT7-0006zS-JM
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:04 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoT6-00033D-4J
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so22042776wrc.11
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 16:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=829ysH2Ytjy0VWw9cHVz/PDYE3QZu3TaG/oEq5KtAwY=;
 b=JOMJnZ+ZSBHSVmsWsX1qRx1BMSMYOY2iEpSBbx1thBrehr/wAuhmV7Ayz0JNeCYs1W
 hs1x9jhigb2uXuJIPCYHRxjoUPLPKNxhYSfXONTKH7T9tDFQwMr6jYajaMp67Tzixd20
 I+ffQSn788i6Esb2l3bPCPFmvwuWwGq42B/XT+L4f2HmuqP2OpMslmKi7SdkrEnGVUCe
 L1WxBei37TID+TJUQZkHjifzyIQT1PmzfBzqStB8PNDgtKzraGwX+pgufLZ7O7XrM/jr
 1rOxxwzD9NyMyTTiHYEi2Q5nlDIgXA24Gks1jQ9YGwzo1g51ZfWNi+lH4jTt30NzXNNi
 ZOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=829ysH2Ytjy0VWw9cHVz/PDYE3QZu3TaG/oEq5KtAwY=;
 b=xHIXsuec6VTx7zkPd3kA+4YRpFPC2oSrswOpgU0mmrRDTIxtxS39QanuNoVpkTscZn
 dcRkUXs5D/pzxQFM+focM0OsaWzlnnXbs/e2GRUj2XpTkgVy01PL8wKhwoy39k+B0agv
 zUInVIukJIaSCUFWStGpn7r8b7wh/itqdLWwR69lmXyzycJ2rZ155aS1avphXDOp1XUM
 NKf2o+aSVjMIoPTdvNuZltqG151kx9o1slPGU8YC8N8SpT/VVHuii+wh7ez05DU95pVf
 2+ErtmL84iuii7PiJxOEtP4qhCyqpOKcUmqerauW8+hCiZlLLIHXlw2jGts3M/A6CL9x
 sfIg==
X-Gm-Message-State: AOAM530gcn52NhmxGDdwGHp46FzagdP1DW3ATXSGG8FF7Ehph9xRi02m
 dLjc1rQQTJVsF3OLnQFUb74B1QRnAAI=
X-Google-Smtp-Source: ABdhPJwL1t4ta6Fv9Ena17KT60CoxrGJYjyz2SxtsLZa82DEXsz7co/j4zoLN1Iq/oAFEX0PXxXqnw==
X-Received: by 2002:adf:b185:: with SMTP id q5mr3311642wra.213.1633217457223; 
 Sat, 02 Oct 2021 16:30:57 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q3sm9585181wmc.25.2021.10.02.16.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:30:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/nios2: Use tcg_constant_*
Date: Sun,  3 Oct 2021 01:30:51 +0200
Message-Id: <20211002233054.3575646-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace temporary TCG registers by tcg_constant_*() when possible.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/nios2: Replace load_zero() by zero constant in DisasContext=0D
  target/nios2: Use DisasContext::zero constant instead of temporary=0D
  target/nios2: Use tcg_constant_*=0D
=0D
 target/nios2/translate.c | 33 ++++++---------------------------=0D
 1 file changed, 6 insertions(+), 27 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

