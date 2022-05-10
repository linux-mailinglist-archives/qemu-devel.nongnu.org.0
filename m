Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B41521B42
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:06:30 +0200 (CEST)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQVQ-0008EX-Tr
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noJa0-0005tc-N9
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:42:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:32983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noJZx-0008UC-Jn
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:42:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so1393410pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8IhicH2gHlNfTgfegpg/zkoYnjoTUmLta4pv1eT89A=;
 b=3RjS+uB559RobrnJTnZJzqGKI0J6KC+cm30Yq7zeO/arm4HFBQY7/mTEgIOgi+7sT5
 Nwr4sodkiQ2zshXg1hANVZ58gXhL6x9CJ3wG/ggAAmFs7OWFBXXXdS6PqGihU+raoV6I
 qP0pmraFShH89yMp8ezGbvMV+st3uJOgv9i6zPGeeMfW9DcYCpLtUCxAqJtggBw03kJf
 Bk95825lsb7+q+YZUpF2sSf103Ga1cTY+75gDKkKJSy+V3cyeSH0DhWD9qr4Zq7iDfPp
 CtXgw+4mlTuJ3lyzzBy29nwBgzYGuxhVIWntErYRSv74+JrBrISZVM4cZYSgl2PNm8Jl
 225Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8IhicH2gHlNfTgfegpg/zkoYnjoTUmLta4pv1eT89A=;
 b=Ejye/87foRhQxpzGn/XnVLRCgb5p7ATTX94tdtO5lrPcrOvp4iw7c1mscxuM3vUTZO
 dklGuuVNJAatSHe0//B6SjDPxeXGEzeVUa8D52hZETbCB4yYTQ0niadGEmc/XQIj4+UP
 Ql8pw2RRybCJlQENCM28nIhC84olwqk5yKOtwrd50hUB7H+qiN+yXlWSfUVTJQY2CqaD
 mr1sqf/yIgsHiELhxoNDMKb0YR5uXB3/1S3ptChu6YBHOXJuu42q4rzU7II4cRxdHeK7
 WuXefIgCMdzJvBoMtdBVLSfvqGso1fsFwttRvryYr5V2s1kOio3NbEkVzl2DwAb76/FX
 B6mA==
X-Gm-Message-State: AOAM531CL2ezF+OXHPJH97CYuSVLxYNQMfm5mUx41BOD885GCEsIOGBG
 nGPpGfr4OkwaIdaafa+Fc8CkYn62W9GXUw==
X-Google-Smtp-Source: ABdhPJxxNdldJdu8+EgJJ+WvBCxyPZ/8SJWKmna/gbTi7E4zToXD4YHMR7yj4jcgwM1e/vUp5HnkRQ==
X-Received: by 2002:a17:902:ec81:b0:15e:9cfc:a07a with SMTP id
 x1-20020a170902ec8100b0015e9cfca07amr19383196plg.62.1652164958169; 
 Mon, 09 May 2022 23:42:38 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090331cd00b0015e8d4eb247sm1078082ple.145.2022.05.09.23.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:42:37 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 0/1] Add Zihintpause support 
Date: Mon,  9 May 2022 23:42:30 -0700
Message-Id: <20220510064231.1384670-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 May 2022 09:56:51 -0400
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

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause for TCG to mainly be a no-op and break reservation.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.36.0


