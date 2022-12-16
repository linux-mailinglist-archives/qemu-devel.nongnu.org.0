Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF664F3D3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:15:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6ImU-0005qv-F2; Fri, 16 Dec 2022 17:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ImP-0005pB-7Z
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:10 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ImK-0004WP-PH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:08 -0500
Received: by mail-ej1-x62a.google.com with SMTP id x22so9195152ejs.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mhGZna9l3lENd7UZY/4yLG5pT7hOcb2EMxgKyYLwAN0=;
 b=NwjtsWrBvMzFs/3Y3Kfr+Ft1HiqHGv2UXDCRGQI1DmUnWsh9uHvJUqIwp+ZHJcd4fN
 6XlhNexwKhNXMLqvqiyRU/nc6F26didM5WoHJDixUjGbueQ6ukN0ASQiH5O5541yVtav
 fYKeUr2cF/gvIkZg1WlE/UluKLIdntPsI21aRqCx3ZYP4gcWZ6McLckK+P68mI0K9s63
 1Vg8AaRqYdjTvLRzszt2d8p5d3kaC0ilzaSdBYK44f2uxadj4n3hdPTVKYJGM7oT7m7J
 LSGJie45pig0uAr0mafjXcp4r50bCiXfsDIQgPaZslIgFU3Lyst1m5r2vYeXkKGZ3uLi
 II8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mhGZna9l3lENd7UZY/4yLG5pT7hOcb2EMxgKyYLwAN0=;
 b=zQ4PXPD7sAx0j9lb4JqTk26hz/UGOdCYgJ4bOx+3bYGikOZwLu/+GGCaTzlexKcBcY
 V1f+oglVr0tKtc/suCDOyYFwHBRna9wWNJ1n4CTIZRl7c0dNy49QBTSfyqSgpVCCtv4D
 XQz1WEOLwKt0uL+QBOd0u2fJshkUQl4TG+lQuGb0mv45/IEyuXtw9p9RzQGJf7kqFQ0X
 nzxYwVuaib8O3Xf6yC2iq94fVThKFvZG9jfImrLRFnYPH/5eehSlN4Y+ElFzMBqY59QC
 7m6JJk69HCTv/XyTtSYZTELJ5GkYyVj+25bFbdpKptMHHbChXnTqIGJJKiO5/xDpdZqp
 MqyQ==
X-Gm-Message-State: ANoB5pkSlXoTo7uyqvjjDrinsC6NVDuzKzuViggwCzgRiEKV7DaUrdvS
 DJ3I+as0wyUJkskCSAI7Yv1JQHQxdcIHXTUTOa0=
X-Google-Smtp-Source: AA0mqf6J9e78waO50YbqbzYNdjM+S5FEynqS/xXZsLvISQBCw4rSRISlRggiaTaG/LceEYnL2zrJUw==
X-Received: by 2002:a17:907:10c9:b0:7c0:cee0:2f55 with SMTP id
 rv9-20020a17090710c900b007c0cee02f55mr29026552ejb.28.1671228121799; 
 Fri, 16 Dec 2022 14:02:01 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lb17-20020a170907785100b007bd0bb6423csm1275371ejc.199.2022.12.16.14.02.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:02:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] target/i386: Header cleanups around "cpu.h"
Date: Fri, 16 Dec 2022 23:01:53 +0100
Message-Id: <20221216220158.6317-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
  target/i386: Remove NEED_CPU_H guard from target-specific headers
  target/i386/cpu: Remove dead helper_lock() declaration
  target/i386/ops_sse: Include missing "cpu.h" header
  target/i386: Remove x86_cpu_dump_local_apic_state() dead stub
  hw/i386/x86: Reduce init_topo_info() scope

 hw/i386/x86.c                | 2 +-
 include/hw/i386/x86.h        | 3 ---
 target/i386/cpu-dump.c       | 5 +----
 target/i386/cpu.h            | 7 ++++---
 target/i386/hax/hax-i386.h   | 2 --
 target/i386/hvf/hvf-i386.h   | 4 ----
 target/i386/ops_sse.h        | 1 +
 target/i386/ops_sse_header.h | 3 +++
 8 files changed, 10 insertions(+), 17 deletions(-)

-- 
2.38.1


