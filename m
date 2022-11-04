Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31717618F67
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 05:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqny8-0002LP-4d; Fri, 04 Nov 2022 00:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1oqny5-0002L9-10
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:06:09 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1oqny0-00027l-Qc
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:06:08 -0400
Received: by mail-pf1-f177.google.com with SMTP id 130so3461710pfu.8
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 21:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P4LC/7PLsjVCcxplCJoM85quaVSWNZZqnTllAmueLQs=;
 b=JAkjYjykQnNYHNtp9v/sGOOJU+743I2so9XABYjp7gBWABvzf7LckM+g3q+U4gtNAr
 XXpCRCy+QT+Lrx216pRgcK+sZaWSWD8cJE1i0TGsZNLoqYJf4bmCIFIfKop3ucIFZGad
 WbfCXiL/fYh0xcYV8NahWcPZSBYngeRACux3vzcF7ZDuWO8qPob0FPqQALGzBgJ7WWVh
 86uuQtDTHnyIkkkSBv2nTtkOGNw9mwCbsjE22sQ2S+FlDjtREgn6WXbCB1oLqvcLLQSN
 cp1Aspj2haobBbANO01g9pdYDqvFRpjgDAck8Yq6xnsjD7tnKdvu1Za32iAaqSkhWghA
 t9WQ==
X-Gm-Message-State: ACrzQf3qIHWtRBV3+pLNPzaLrTKaJ2gEBn2pqUUU9FQ47na/DY7jd+ce
 8aY1pSlh2dCbUVFCHph5gaVSYQ==
X-Google-Smtp-Source: AMsMyM7Ht4uJcKqV1uWBqruZ/GYNA8eIdwDC9klpjQiE523f/5XZIHYMXuesNu1uEjcwe8hDp/W0oA==
X-Received: by 2002:a05:6a00:17aa:b0:56d:1d65:91e9 with SMTP id
 s42-20020a056a0017aa00b0056d1d6591e9mr31126220pfg.12.1667534763056; 
 Thu, 03 Nov 2022 21:06:03 -0700 (PDT)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79991000000b005636326fdbfsm1562308pfh.78.2022.11.03.21.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 21:06:02 -0700 (PDT)
From: Rui Wang <wangrui@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org, hev <qemu@hev.cc>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH v3 0/2] target/loongarch: Fix emulation of float-point disable
 exception
Date: Fri,  4 Nov 2022 12:05:15 +0800
Message-Id: <20221104040517.222059-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.177; envelope-from=r@hev.cc;
 helo=mail-pf1-f177.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

v3:
  target/loongarch: Adjust the layout of hardware flags bit fields
  target/loongarch: Fix emulation of float-point disable exception

 target/loongarch/cpu.c                        |  2 ++
 target/loongarch/cpu.h                        | 11 +++++-
 .../loongarch/insn_trans/trans_farith.c.inc   | 30 ++++++++++++++++
 target/loongarch/insn_trans/trans_fcmp.c.inc  | 11 ++++--
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 34 +++++++++++++++----
 target/loongarch/insn_trans/trans_fmov.c.inc  | 29 ++++++++++++++--
 .../insn_trans/trans_privileged.c.inc         |  2 +-
 target/loongarch/translate.c                  |  6 +++-
 8 files changed, 111 insertions(+), 14 deletions(-)

-- 
2.38.1


