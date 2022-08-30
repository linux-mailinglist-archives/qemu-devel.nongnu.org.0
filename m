Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641F5A5944
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 04:21:00 +0200 (CEST)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSqs7-0003Xk-HY
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 22:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSqjg-000754-E3
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 22:12:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSqje-0006j3-Q7
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 22:12:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso16460376pjk.0
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 19:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=yWGgvwGYTdnRCAocAoxtCEkb6NNgwoyY8c4xm5wxUvM=;
 b=Y4X1ar8wCI7ySunFrUCNrJ3TOdVp+Ear8pIdGnYDIjtWlpIw7A8fQmObZngJ5e6YPO
 mK4G3WjConAlcBsM4BYtw/ACz1zmOGJwqRs6s3ZbFZKP8GtUZD+VW93wZxT4R6JLNEB2
 WAbd464gXcJRMrt6NubzBY0+AXjeUVHFhpjHq+aVakllgQt+iKqS8pyuc1mGutnM7lKA
 4kS/++T25LfO/MhUeYSrbRrobiPNHfWBYHlSEo1iRmrdVQOlEy+i43UCI6gKaRRswS+S
 eAbFsb9Hi7MkG0tQ+NEFCpipAwnlbIGJmGJ622YbuunCJC/1EMu7G0SA79CUkocPmErc
 zPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=yWGgvwGYTdnRCAocAoxtCEkb6NNgwoyY8c4xm5wxUvM=;
 b=PgGGq5La5CGOXE3Ewru9OX9GX+lybiKeR59yBfO6M5i91/3gDqS+rwJsg5TS62x9ur
 IhoOIKr77aGGlhc0+b9pne02jzYwPYb4cnbMDxZRa159rXnt4YDo+hNe5QTaMPGMgpxs
 NziUqG59SRGlsZe2uDaT0x3GgLNGNpvdhladeEkqeRtNaNGJGusBxaQsr+sZzhTAhw+f
 32eS6WP73qJBZDgQaKtdr8vSjYy8VL22jqow0f/ecPmRLUpXX5KxUaASyv3YtC7VWOzK
 1aj4xvXvODEalhvzRriBiUMTkwQy4afAJsHWDwPocY1OJb+32xBgIrimvOkP5eF7LFrq
 4dzw==
X-Gm-Message-State: ACgBeo0eghFmP4sOKhOw1xXjZx4GTgJcqaL5vXRJxOc3Y0z3sda0YkaG
 hwkYKaOW3UWuDNk3lTEBlACjeKG16OQK4A==
X-Google-Smtp-Source: AA6agR7wlCKsHuiPi33t2hLu9YSS2ipIt+J1rqsnikF3NyAwao0vtFdlYtllth8JkGggv3h2KrUUew==
X-Received: by 2002:a17:902:ce01:b0:172:59a6:fb3d with SMTP id
 k1-20020a170902ce0100b0017259a6fb3dmr19294381plg.119.1661825532801; 
 Mon, 29 Aug 2022 19:12:12 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-17-78.hsd1.ca.comcast.net.
 [98.35.17.78]) by smtp.gmail.com with ESMTPSA id
 d11-20020a62f80b000000b0053624c50d74sm7935656pfh.126.2022.08.29.19.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 19:12:11 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH v2 0/1] target/i386: Raise #GP on unaligned m128 accesses when
 required.
Date: Mon, 29 Aug 2022 19:11:51 -0700
Message-Id: <20220830021152.40618-1-ricky@rzhou.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Richard for the detailed comments/code pointers! I've switched to
using MO_ALIGN_16 and implemented record_sigbus and do_unaligned_access
hooks to simulate #GP(0) as suggested. Given what was said about the low
likelihood of implementing #AC anytime soon, I have hardcoded #GP(0) in
these hooks for now rather than plumbing through an extra bit in MemOp.
Let me know if that seems reasonable, thanks!

Ricky Zhou (1):
  target/i386: Raise #GP on unaligned m128 accesses when required.

 target/i386/tcg/excp_helper.c        | 13 ++++++++
 target/i386/tcg/helper-tcg.h         | 28 +++++++++-------
 target/i386/tcg/sysemu/excp_helper.c |  8 +++++
 target/i386/tcg/tcg-cpu.c            |  1 +
 target/i386/tcg/translate.c          | 49 ++++++++++++++++++----------
 target/i386/tcg/user/excp_helper.c   |  7 ++++
 6 files changed, 77 insertions(+), 29 deletions(-)

-- 
2.37.2


