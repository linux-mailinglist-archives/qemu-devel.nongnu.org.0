Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87421E1ADB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 07:59:30 +0200 (CEST)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdSca-0001ia-Io
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 01:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSba-0000uU-MZ
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:58:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSbZ-0006PF-Uu
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:58:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id s8so19096415wrt.9
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 22:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OjikxZJqKYWyGNB2Nj82kz4FyRssinnND9PjTJAmeF4=;
 b=aF3FTq75oV9daXNuyrUmMnTFEoELHt6vtQamWCwuJ/wxrBHm472WzEg4+EGZ6BbT77
 eo4JLk0KVyitaLuZophUd6SFPpNAZV/YE7e4CTwsC2+xAKTfo2TCDPL0Oo43+j8HyYv5
 ndgRl6cMLeBcfi/ApqoBTkCcrWPvHzzMsIixgQxYxc4h0bK3SGtGU2LEd1g7ggrxIQy9
 8C6ar4GpthmUoO+oeUFszHu4PmaZienl1cKjvDLhjkheJs5sNYJ0pqg1UVMDU2CapkJ9
 ptQRI5wo8Ld1h4Rk4XCdbrgAOYwKcI6ksx4zUieg+0YaIUFrHTk33mjZlli+ZQjzcQby
 9Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OjikxZJqKYWyGNB2Nj82kz4FyRssinnND9PjTJAmeF4=;
 b=ayNG4CKJ0/LSaDJ23pfhm9quWzAgTDBL/grJIPJpA/OTyMAVPRESh97pjOHdrUj7pE
 u4c4ymd+SMOAmDLgTucZZn8Xn8kz2NsKppmSQSrBCRV8qTTFJHXChWJ4uD/EYkUv4xGK
 scUToGT7F0GMpNM4n6/L2KtouFuTV7hJyAGbHW6PEPjcBG7dXlEHBjQAUSW8iljS2AyD
 TyWroUGb9O8v5m8OKYZYMIb7PZpfLCjRt7qeTg4TnLCWSInWFwcSPXyickysxcy2KLz7
 iDoDS1Ak8O9m/bbFV3NFtoKH+yLMXiRW7i9FcVsk7OuW1fyp4J8Z01y/GfVGfQP3JGb2
 Wn1g==
X-Gm-Message-State: AOAM531iFaKG9U5ZEFGIR4Y8qlXL9wy39VCD8yNoJJ2ZzM7ezpX4vNX+
 ZjrbgMGuDDJCmpZvZDcVpk9Ud3FmD10=
X-Google-Smtp-Source: ABdhPJzuuWn2J/om0UBzfP2q8BPmNQHKXTTsCtboxMWscYqhzy9ZbmZk/iCHLaucdwl+QRSs5lJAAA==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr17809081wrx.36.1590472703357; 
 Mon, 25 May 2020 22:58:23 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id s8sm19887710wrt.69.2020.05.25.22.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 22:58:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/qtest/fuzz: Avoid QTest serialization
Date: Tue, 26 May 2020 07:58:18 +0200
Message-Id: <20200526055820.12999-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexander,

I forgot to share these 2 patches wrote before
the direct MemoryRegion fuzzer sent yesterday.

Regards,

Phil.

Philippe Mathieu-Daudé (2):
  tests/qtest/fuzz: Avoid QTest ioport serialization
  tests/qtest/fuzz: Avoid QTest mmio serialization

 tests/qtest/fuzz/i440fx_fuzz.c      | 19 +++++++++++++------
 tests/qtest/fuzz/virtio_net_fuzz.c  |  6 ++++--
 tests/qtest/fuzz/virtio_scsi_fuzz.c |  6 +++++-
 3 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.21.3


