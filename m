Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E364F3C0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:10:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Iob-0007cg-QS; Fri, 16 Dec 2022 17:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IoU-0007ar-Kh
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:18 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IoS-000526-VS
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:18 -0500
Received: by mail-ed1-x530.google.com with SMTP id r26so5452016edc.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UmKj596+Spl5Mq0rrnKISHcFLMYc7tS8XKUwXGtA7io=;
 b=sj5yeOPZvjGqp6gGyVuGfmUsf6cqbq5Nb2FmzGIknUwqqVUrspmOGTYArANE3SkSLH
 azQFN1t3RNKrqnAiVSsETCFie83CjfaD8en1H6yrXxk3hgdN5xW1FWZ/ksD85yleyzUj
 /BRaVhR+iEHhT6HXS6M64bPPdr2hElb1akzxC00iRo7GO+F2YtVPL+P1/ql1cT/6XnH1
 0UQWj4r4rfZbwSsXXLucEiOPJBWPAonvUJ+sEyui+Cr7sw+JNbv8lqR/5IYRgq9zbg6U
 WA0pXgxg43O/vDec0iELR6p+moYwSnbAssxeAM1koqikf0aQoCMXw6+j4B3dNrozPCaA
 NmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmKj596+Spl5Mq0rrnKISHcFLMYc7tS8XKUwXGtA7io=;
 b=C0wMUsvbzlsFHd2TzdKTnjbmt8bt2/RrEgt5gdBIHQ681p4DPPhsi0UbeOhmS6RDF5
 ZHpyBbSFSQF/JxVFMIcMwLEI+1jon+fsADxFtm35Ft2GMzfItT3TVeHksahlVfXNDFYG
 OQlG7lCuHafwSP3rac+T8SEDAAPE1SWmfth0j4jKerFPQ3OkXJJqSaEGgZhgVbu3J8JB
 fiKPVIG7oW02NmZj8RDFJBBtetm97lQMHl4VlfjfNXznDSt0ljp9/aIaDFRHxpk7XoiC
 tuHhU4TcPJ0ECLrk+M1EuMr/QN27JkIKsXpWSmbLdp6apDmU12sJqfTxCbca3+3DucYv
 sfPw==
X-Gm-Message-State: ANoB5pnX5ZBk5jPMU8yViTgSCJ+MGYRxeWr1tT2jiYVyqF8baL23Ev99
 IHZxl5D77SfI82uDZSuBX2EdYan0dRdw4fqS0FE=
X-Google-Smtp-Source: AA0mqf6u+ZQImmTIEFnxYU4O5qSy06/1qtCwW97nwAaCbdiSgtH/xzaemkxBH638Fin18LWMazJ5Pg==
X-Received: by 2002:a05:6402:e97:b0:461:6219:4b16 with SMTP id
 h23-20020a0564020e9700b0046162194b16mr17525107eda.33.1671228254871; 
 Fri, 16 Dec 2022 14:04:14 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w26-20020aa7cb5a000000b0046c53c3b2dfsm1314417edt.38.2022.12.16.14.04.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:04:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 0/5] target/s390x: Header cleanups around "cpu.h"
Date: Fri, 16 Dec 2022 23:04:06 +0100
Message-Id: <20221216220411.6779-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches are part of a big refactor cleanup
around "cpu.h". Most changes should be trivial IMHO.

Philippe Mathieu-Daudé (5):
  exec/memory: Expose memory_region_access_valid()
  hw/s390x/pv: Un-inline s390_pv_init()
  hw/s390x/pv: Simplify s390_is_pv() for user emulation
  target/s390x/tcg/misc_helper: Remove unused "memory.h" include
  target/s390x/tcg/excp_helper: Restrict system headers to sysemu

 hw/s390x/pv.c                  | 13 +++++++++++++
 hw/s390x/s390-pci-inst.c       |  2 +-
 include/exec/memory-internal.h |  4 ----
 include/exec/memory.h          |  4 ++++
 include/hw/s390x/pv.h          | 20 ++++++++------------
 target/s390x/tcg/excp_helper.c | 10 +++++-----
 target/s390x/tcg/misc_helper.c |  1 -
 7 files changed, 31 insertions(+), 23 deletions(-)

-- 
2.38.1


