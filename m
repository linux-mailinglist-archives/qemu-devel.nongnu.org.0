Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABF420330
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:01:58 +0200 (CEST)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5oD-00079m-PE
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kD-0002WR-QC
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:57:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kB-0003CI-8a
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:57:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t2so2560029wrb.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYPyyXAZEu8GEUtHzXFcAKpbgIiA4z7eFBbsZmJe6gw=;
 b=c+/poP30gdTf5K15jvth5D3KWLwIu0oMcubqLjvxy6Bjdl9C0fEYOUu1UxX8iAtBy2
 bm6h1gfPBi8a6Rsv5WuLrE/zL1ucIW98ti8QdrIbK1alb/vo4cabOr8ud1EdIwd6WnfQ
 OM08KMqDIC0x/atvB3DJdT+K4/jNiKofOblIQgvgO4Za4mvTyUy1oF8Iu/KvoHNSIoii
 DsjHwIr5CTXk2t0jxaCDBWFOb3V6SQZ6GWq31pKHrG5fZoaqphWHcFN2xNDxyFurJ54s
 aE9RpF2BMcpNJz33AvrQbIB8NLImHL+jWvyeO77YW61OMyc/dNSkHX9jUGL2Zc3ie/74
 KiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mYPyyXAZEu8GEUtHzXFcAKpbgIiA4z7eFBbsZmJe6gw=;
 b=61vTFDZKX8omDXOeS3F5rP0XiPndjYRMnkT1RworFHX1TZc/H7qoTNrfWWhXXwGCOm
 kyDIyXc5h5MqcxMD9MUkpgB2QtiVbTlCEpiR7TI6+I0Jzx1PRsOjj7a2qJYeiFDc6BUU
 dkNi1dCG+W13eNe7nMjqh/zYLSlMBjsoyuCxPgC7PxXCi5siWxC2QVOiaZkvEbo6SkL1
 /wQye+KwhQUhMmOXzmsCMD+qW7Ndzuw7adcPZrWbPg/bmqe1yAmEAf9Rjsj2MEjKxZUk
 1Fd+sJxnW/ULQ5PDU6CJnCMPt0bhP9NJLcgmh81kENF6H4bTNKcTzuL4OTvaowA1Hjt7
 fe1g==
X-Gm-Message-State: AOAM532HOhfhOjbAiROI6L4LzC6CVaCZ2XnuoMCY15sNxDCcr/FY0/M7
 J9l01/ekCCsBFfv/LzYXpim7RhoSTnE=
X-Google-Smtp-Source: ABdhPJxixZFw8ANtwyytS54pQlFrdKS7YyL3T9VYgaifQj0U7Z0J1slT3hjFxnMpWX9avM/q4hkn7A==
X-Received: by 2002:adf:a183:: with SMTP id u3mr2768625wru.330.1633283865225; 
 Sun, 03 Oct 2021 10:57:45 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j4sm12212252wrt.67.2021.10.03.10.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:57:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] target/mips: Use tcg_constant_*
Date: Sun,  3 Oct 2021 19:57:35 +0200
Message-Id: <20211003175743.3738710-1-f4bug@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace temporary TCG registers by tcg_constant_*() when possible.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  target/mips: Remove unused register from MSA 2R/2RF instruction format=0D
  target/mips: Use tcg_constant_i32() in gen_msa_elm_df()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_2rf()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_2r()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_3rf()=0D
  target/mips: Use explicit extract32() calls in gen_msa_i5()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_i5()=0D
  target/mips: Use tcg_constant_tl() in gen_compute_compact_branch()=0D
=0D
 target/mips/tcg/msa_translate.c | 87 +++++++++++++++++----------------=0D
 target/mips/tcg/translate.c     |  4 +-=0D
 2 files changed, 45 insertions(+), 46 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

