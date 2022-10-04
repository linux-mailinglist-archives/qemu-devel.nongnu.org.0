Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A15F4957
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 20:39:25 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofmpA-0002Jr-Lt
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 14:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmb1-0007Sj-FV
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmaq-0005df-Ch
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664907873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ISLkWt2w3iGliymeTL4S7G40avE00UQHalAL2FcMB28=;
 b=irptILTiGxJLT6W5d1aD7PTtI5g5WleiCu0p396ufXpjRLifUNweD4Kby+cAi9K6zYI9Z/
 r2VqGKLMY8hTXcR+Yedb5DnpxS2xSjYh9cS30yGFUp5Sc0hRKiUE+bzUCpFeJl71GT648u
 biSkANU1BeNInvKnDm1/5ZcbHCrxYx4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-1CeTzdOLN1mgmypwmwPfsQ-1; Tue, 04 Oct 2022 14:24:33 -0400
X-MC-Unique: 1CeTzdOLN1mgmypwmwPfsQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 bs33-20020a05620a472100b006cef8cfabe2so12299547qkb.12
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 11:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ISLkWt2w3iGliymeTL4S7G40avE00UQHalAL2FcMB28=;
 b=EeeNCjIi5tU8nOR8xOD02qH3WU1HR+uA+miWQsS+MGgBeVKgW+pHeSa1mB3uQXDS7h
 oQen+DX5T0uCP6VGBBHHD30M10fye281MLE6DsDOXz0OucXvHfj1jBpx2Ph4CEN82O/+
 1kwuIf2OCR0Ue0TFFSpbBuHAvcAo1GROny9y9A5n9/sh0/GX4vdTlWiRP1bwEQrcNWcL
 Eof34y3dyxY8Z59VeEjk4ccSievcUKrXe8tsnbNzoEQg69/AWtaSMaDLYQzfAdz2ZFWd
 SmiQhx1a/5QWI7Hay24SmDK65AEWSsucz3xOZaM3+fwYUfJkrONWwQeWXAu5Yj7O8mJ7
 E4MA==
X-Gm-Message-State: ACrzQf1gMOEGFZFlUYBc8k2y16J93Br26t8RXJ0HOH3Xgb9mOpaOy1Ft
 e5IfSZHPCOQWg4LXQTzD3KnyQVqIAZv0gNR7ijqp5K4C9IR8frKUr89jZD+9yeegvFkxzox5aPg
 N8jiKUYnXiHqMB6wFkwZKggEsXq5a5ALKYtL53/cy9ovnTFzCU1I6GukJcuWjNKjv
X-Received: by 2002:a0c:f343:0:b0:4b1:7016:667e with SMTP id
 e3-20020a0cf343000000b004b17016667emr15756573qvm.105.1664907872368; 
 Tue, 04 Oct 2022 11:24:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6p6kzCjwEYAYX7yw9Vjf8BH8IfouqNSjw2glKQqXZIKpYYwkZPPQxkpZhMwt2lUoMcu2pMzQ==
X-Received: by 2002:a0c:f343:0:b0:4b1:7016:667e with SMTP id
 e3-20020a0cf343000000b004b17016667emr15756554qvm.105.1664907872074; 
 Tue, 04 Oct 2022 11:24:32 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i1-20020ac813c1000000b0035c1e18762csm12334514qtj.84.2022.10.04.11.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 11:24:31 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 0/5] migration: Bug fixes (prepare for preempt-full)
Date: Tue,  4 Oct 2022 14:24:25 -0400
Message-Id: <20221004182430.97638-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- Drop patch "migration: Disallow xbzrle with postcopy" [Dave]
- Added patch "migration: Disable multifd explicitly with compression"
  (according to the comment in the other series) [Dave]
- s/deadloop/infinite loop/ in patch 1 subject [Dave]

v1: https://lore.kernel.org/qemu-devel/20220920223800.47467-1-peterx@redhat.com

This patchset does bug fixes that I found when testing preempt-full.
Please refer to each of the patch on the purpose.  Thanks,

Peter Xu (5):
  migration: Fix possible infinite loop of ram save process
  migration: Fix race on qemu_file_shutdown()
  migration: Disallow postcopy preempt to be used with compress
  migration: Use non-atomic ops for clear log bitmap
  migration: Disable multifd explicitly with compression

 include/exec/ram_addr.h | 11 +++++-----
 include/exec/ramblock.h |  3 +++
 include/qemu/bitmap.h   |  1 +
 migration/migration.c   | 18 +++++++++++++++++
 migration/qemu-file.c   | 27 ++++++++++++++++++++++---
 migration/ram.c         | 27 ++++++++++++++++---------
 util/bitmap.c           | 45 +++++++++++++++++++++++++++++++++++++++++
 7 files changed, 114 insertions(+), 18 deletions(-)

-- 
2.37.3


