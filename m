Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE76DAFBD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:34:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5V-0007dF-I3; Fri, 07 Apr 2023 11:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5T-0007bp-E8
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5R-0003aM-PB
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpTNIJp2jzLQWaYj8M/uAT/YjQMVtu79+bYHv9/gMhM=;
 b=h2OiZ1MHmvSaXlpzE5zvY/MvvIeph9VfiOuUzDVa2fiqiueGXRyF9FNFJ8eY8aT7ZNXD/U
 usKBjfNLCaxazgadT8a0Q+92vodCtF4R3MXTKDUz5y0UBW81OBGXUgDFyKxH/U3tDyNaNJ
 tnbQPi2hX9k7GqEI7IM5NNreLFnhidw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-3jJX1g0WPNSKxyETachBFA-1; Fri, 07 Apr 2023 11:33:11 -0400
X-MC-Unique: 3jJX1g0WPNSKxyETachBFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 gw11-20020a05600c850b00b003ee8db23ef9so758889wmb.8
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881589; x=1683473589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HpTNIJp2jzLQWaYj8M/uAT/YjQMVtu79+bYHv9/gMhM=;
 b=pzRjAzmPSIwjSSGWLjvHb0n8pnBBXfuqiiphCjtjvyO+YpPCF9ZZlhuhqLKzKKeZ/Z
 7uWG5Zep++vurOQiQmRgVowdiWuqqy4GtV6h8FmDKlz8SDebbubCfg8Rvh4EWjlQW3a2
 89Ki85cFQrAHL/53PsYdi3fFUjrScr8zguFCn0QDEdeko+d/oqDhBX0Ympp69MHME0+p
 qJaUb9MBGp/RMyrjaCamaz2sxCpBjIe6hpQ+Mg9ThzOMWleukEPft+GYyjxbvq4qFKph
 WauYgcMH1exwcYwnBMHGqOMO6p+yDpMeWDgSVNiDCmbPJ4OBhVFhEY9qHS7sJM+9eTOa
 weMw==
X-Gm-Message-State: AAQBX9eu4Yq2bVGb4C/D4hXbBmMfPPgFf83xCPsAj5970fivlf91n/u4
 liSC1F98YpmTL+wpEeDQOz2k4FHk7C5iZWr9sDH3MwQ/jBm8Cd71vWwa0tEcVT06dJBq7+kfOup
 ZQmG3DAVZrBpuNZXS5RkLm+o1MSp7xZsMuRU474Xs2VqE09KFi6Np0vZJaffwZNiJC2okVsu6u2
 8=
X-Received: by 2002:a05:6000:12cb:b0:2e6:348:5fef with SMTP id
 l11-20020a05600012cb00b002e603485fefmr1974179wrx.55.1680881589492; 
 Fri, 07 Apr 2023 08:33:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350aSWKUhipA5WWZc4xUget97iWnYnsU5s8XukW90/I7DzOMDzvgfQ3A3KmxHKIu2kUjmhMbViA==
X-Received: by 2002:a05:6000:12cb:b0:2e6:348:5fef with SMTP id
 l11-20020a05600012cb00b002e603485fefmr1974166wrx.55.1680881589220; 
 Fri, 07 Apr 2023 08:33:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d420b000000b002ceacff44c7sm4751913wrq.83.2023.04.07.08.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 2/8] block: remove has_variable_length from filters
Date: Fri,  7 Apr 2023 17:32:57 +0200
Message-Id: <20230407153303.391121-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Filters automatically get has_variable_length from their underlying
BlockDriverState.  There is no need to mark them as variable-length
in the BlockDriver.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/copy-on-read.c    | 1 -
 block/filter-compress.c | 1 -
 block/preallocate.c     | 1 -
 block/replication.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index cc0f848b0f10..b4d6b7efc30f 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -259,7 +259,6 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_co_eject                      = cor_co_eject,
     .bdrv_co_lock_medium                = cor_co_lock_medium,
 
-    .has_variable_length                = true,
     .is_filter                          = true,
 };
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index ac285f4b6657..320d9576fa1c 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -146,7 +146,6 @@ static BlockDriver bdrv_compress = {
     .bdrv_co_eject                      = compress_co_eject,
     .bdrv_co_lock_medium                = compress_co_lock_medium,
 
-    .has_variable_length                = true,
     .is_filter                          = true,
 };
 
diff --git a/block/preallocate.c b/block/preallocate.c
index 71c360180945..4d821250366e 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -558,7 +558,6 @@ BlockDriver bdrv_preallocate_filter = {
     .bdrv_set_perm = preallocate_set_perm,
     .bdrv_child_perm = preallocate_child_perm,
 
-    .has_variable_length = true,
     .is_filter = true,
 };
 
diff --git a/block/replication.c b/block/replication.c
index de01f9618467..ea4bf1aa8012 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -762,7 +762,6 @@ static BlockDriver bdrv_replication = {
 
     .is_filter                  = true,
 
-    .has_variable_length        = true,
     .strong_runtime_opts        = replication_strong_runtime_opts,
 };
 
-- 
2.39.2


