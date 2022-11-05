Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7B61A6D6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 03:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or8eH-0003bO-6s; Fri, 04 Nov 2022 22:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1or8eD-0003bG-Qz
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 22:11:01 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1or8eB-00052B-8T
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 22:11:01 -0400
Received: by mail-pg1-f176.google.com with SMTP id s196so5848188pgs.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 19:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i938vGbEL9biQadUsCaY2D70YLoBakVpMZAiAOfk6bA=;
 b=YC53SQbnouxvZkNdTAn78syQJKNoTDmxarPhAVZJu4pAKtKYhYJN6svSUms8ODLh11
 I8R+3RvYK4viws2qsdFpoeO5F/4wDwXL8j5EjWbJYZZWEAMD2u3znQyzpKvt9lIgkrQK
 bq8Qk1dpgJpRb6Rj8eas+A1mVE/HXg1RXSEIbOVW/9i8RsSJWPfyGuu/j/rSItuz/lN+
 7NBwouJIJrQ/zjXEgWrQjFoWtoEbHVtxBnfbcxV6ZC0hpMH+ia1rmOUlhYWh1GyFyiJm
 Uv3cRMSbazBE9tNHCvAuLUMWrQ+TNJsiwTQTq/zlAj6ouUvyCk9tX2Gqkc1RsxQ0NrhU
 1ScA==
X-Gm-Message-State: ACrzQf1rovq8WLUhrS5YNiO8252m4GpqQBlJObAcJEV7aCtYpb4XuzyW
 d4gKLSyYfp7HQgrfFCOvxO799Q==
X-Google-Smtp-Source: AMsMyM4kPdkhTIfCpOqEwoPnHSn9V5THcxB7R5ayA9il3K+gFrkfGrRSCiycWNNGPWutYhEOImhiJg==
X-Received: by 2002:a63:d757:0:b0:46f:9446:273d with SMTP id
 w23-20020a63d757000000b0046f9446273dmr29659594pgi.436.1667614256584; 
 Fri, 04 Nov 2022 19:10:56 -0700 (PDT)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902aa9200b00186a2274382sm407809plr.76.2022.11.04.19.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 19:10:56 -0700 (PDT)
From: Rui Wang <wangrui@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org, hev <qemu@hev.cc>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH v4 0/2] target/loongarch: Fix emulation of float-point disable
 exception
Date: Sat,  5 Nov 2022 10:10:20 +0800
Message-Id: <20221105021022.558242-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.176; envelope-from=r@hev.cc;
 helo=mail-pg1-f176.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v4:
 - Separate hardware flags to mmu index and plv.
 - Fix return value of check fpe.

Rui Wang (2):
  target/loongarch: Adjust the layout of hardware flags bit fields
  target/loongarch: Fix emulation of float-point disable exception

 target/loongarch/cpu.c                        |  2 ++
 target/loongarch/cpu.h                        | 29 ++++++++++------
 .../loongarch/insn_trans/trans_farith.c.inc   | 30 ++++++++++++++++
 target/loongarch/insn_trans/trans_fcmp.c.inc  | 11 ++++--
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 34 +++++++++++++++----
 target/loongarch/insn_trans/trans_fmov.c.inc  | 29 ++++++++++++++--
 .../insn_trans/trans_privileged.c.inc         |  4 +--
 target/loongarch/tlb_helper.c                 |  4 +--
 target/loongarch/translate.c                  |  7 +++-
 target/loongarch/translate.h                  |  3 +-
 10 files changed, 126 insertions(+), 27 deletions(-)

-- 
2.38.1


