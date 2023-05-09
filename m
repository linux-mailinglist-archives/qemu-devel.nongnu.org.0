Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249846FC255
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHP-0005Dk-32; Tue, 09 May 2023 05:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHM-0005DM-82
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHJ-0004iH-JV
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T3lUxASRRZiDAjXLHzjrGoyMWaICe5bjD1E3Dk0IgHM=;
 b=bhQJtydKPTII1xwCcsNpnASzxPXjDHDZ+rRHMk/c1dWX5S7x3PicFHmXXNUdOVdPVaryXN
 aLG+f69hFl/I8bHvIeIQpDsZA826pt1J05WEs/Vqzat18rGJ55WDWH5N1uikhwaP2VdcXO
 NS3LibMVZ6xrmXkpnedbvn4tAJUAj1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-1MSjNLJlO5u5Ki7kNY9I-w-1; Tue, 09 May 2023 05:04:59 -0400
X-MC-Unique: 1MSjNLJlO5u5Ki7kNY9I-w-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so5129409a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623098; x=1686215098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3lUxASRRZiDAjXLHzjrGoyMWaICe5bjD1E3Dk0IgHM=;
 b=SysczUwn6dKU/tzGNCOHyH0zi+WYHQ0icODe7uKFFWZfgMihLbq2bDSVtzB6buLkiJ
 hnezMMqLJ95VqSFtbewJp4IJ6+iE10H+qk4Q4nxW2TTnRdsq1TYoFJWeCzPKPXtimbMp
 TaNbetSCDmhamgYpIjoPFyKx+/2TPmO3xo5AqsNCLl3c4ZXDL1hvKNBNDCLlVx5e3n2a
 zizDvzyB46CMDg9pEPLbWCdtJBo2V8nII7twkV6TagNQcIfBzH5UAF4c/cVuHGXObN5H
 KxPdLIjf9Kv68UtX1IBmyTVYofXYfdC2Kkkrshz9pugeZZ/1s2XzM2pnPRmPNHY/G75J
 IEsQ==
X-Gm-Message-State: AC+VfDxX0n92kWmEp/U8mbRRh/RqPkdJ8TzpKF5/YQNlhmhNvtTvRZO8
 u/8IPO3dwhqrAAXe10oG1+goqJLwE+sXa8scp9uGkEkJhc+P+l7j5OVqGfMkS4V5aldY2VmwwCv
 rUaTTzQJjioJWBFmKgmyLWYivBR7tRMiS+T4gWjF4rqwUGJkPKJuw6pxgaP9EVkbfhjjidMRTcV
 s=
X-Received: by 2002:a05:6402:27d2:b0:506:71bd:3931 with SMTP id
 c18-20020a05640227d200b0050671bd3931mr12541143ede.2.1683623097808; 
 Tue, 09 May 2023 02:04:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rahnd0X8NjFORgWvZICgkIlC+ghXzvl20izQGmOllFrbQeg6u+6l0L9rtlzvhYY4PssOgPw==
X-Received: by 2002:a05:6402:27d2:b0:506:71bd:3931 with SMTP id
 c18-20020a05640227d200b0050671bd3931mr12541112ede.2.1683623097336; 
 Tue, 09 May 2023 02:04:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 dy28-20020a05640231fc00b0050d8b5757d1sm511581edb.54.2023.05.09.02.04.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:04:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] Misc patches for 2023-05-09
Date: Tue,  9 May 2023 11:04:37 +0200
Message-Id: <20230509090453.37884-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:

  Merge tag 'pull-loongarch-20230506' of https://gitlab.com/gaosong/qemu into staging (2023-05-06 08:11:52 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ef709860ea12ec59c4cd7373bd2fd7a4e50143ee:

  meson: leave unnecessary modules out of the build (2023-05-08 19:04:52 +0200)

----------------------------------------------------------------
* target/i386: improved EPYC models
* more removal of mb_read/mb_set
* bump _WIN32_WINNT to the Windows 8 API
* fix for modular builds with --disable-system

----------------------------------------------------------------
Babu Moger (5):
      target/i386: Add a couple of feature bits in 8000_0008_EBX
      target/i386: Add feature bits for CPUID_Fn80000021_EAX
      target/i386: Add missing feature bits in EPYC-Milan model
      target/i386: Add VNMI and automatic IBRS feature bits
      target/i386: Add EPYC-Genoa model to support Zen 4 processor series

Michael Roth (2):
      target/i386: allow versioned CPUs to specify new cache_info
      target/i386: Add new EPYC CPU versions with updated cache_info

Paolo Bonzini (8):
      rcu: remove qatomic_mb_set, expand comments
      test-aio-multithread: do not use mb_read/mb_set for simple flags
      test-aio-multithread: simplify test_multi_co_schedule
      call_rcu: stop using mb_set/mb_read
      tb-maint: do not use mb_read/mb_set
      MAINTAINERS: add stanza for Kconfig files
      docs: clarify --without-default-devices
      meson: leave unnecessary modules out of the build

Thomas Huth (1):
      include/qemu/osdep.h: Bump _WIN32_WINNT to the Windows 8 API

 MAINTAINERS                       |  10 +
 accel/tcg/tb-maint.c              |   4 +-
 docs/devel/kconfig.rst            |  16 +-
 include/qemu/osdep.h              |   2 +-
 include/qemu/rcu.h                |   5 +-
 meson.build                       |   4 +
 target/i386/cpu.c                 | 375 +++++++++++++++++++++++++++++++++++++-
 target/i386/cpu.h                 |  15 ++
 tests/unit/test-aio-multithread.c |  30 +--
 util/rcu.c                        |  69 ++++---
 10 files changed, 479 insertions(+), 51 deletions(-)
-- 
2.40.1


