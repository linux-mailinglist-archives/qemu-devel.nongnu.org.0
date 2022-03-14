Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E24D7F05
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:51:45 +0100 (CET)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThMe-0002Ao-EP
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:51:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3r-00086w-I4; Mon, 14 Mar 2022 05:32:21 -0400
Received: from [2a00:1450:4864:20::32c] (port=44888
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3o-00086U-RZ; Mon, 14 Mar 2022 05:32:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so9212226wmb.3; 
 Mon, 14 Mar 2022 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mg5iWtD7MOJT8Ls3DbxLZ9+nVrhyeni7925+IBj1RuU=;
 b=LdGmA48D/mmgSlDiR9XEI1NoUicM6uAxEnnsqJq3z+j50D/v20b8WwWWvbF3yUPOdY
 U6ausHt8VBjhVx0F+xJjXjk4MI1rF4dFXqhWRgOv8z4EEmtceBhM1Dh6HzcJHujivS1s
 rk+sQJgPrEAjLVVUezzc5inROIeoPnsCvcDTg1DNg2Aa8uxUFpFxMtQyPl80+DluUUji
 cgeikx6gr2G6L98wbxrbYdvTcozAdBFurIe5bpJfHUkRMklPd8kYVhP62GTKd39xJnku
 hrDV6MpLFUIlZnFB3Fdukhx6wKpoxKU7B1MIbS1lJc3afVOt4786Av7q+xow+hUkUwjj
 W92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mg5iWtD7MOJT8Ls3DbxLZ9+nVrhyeni7925+IBj1RuU=;
 b=uEUWaSOQcFSt4Jzj2/hK5iGi/ZcgFbXkh7U1aoGFMryGrUf9UOIzUw6ksRW+XK3AWW
 SpwmwFI8nVaCWKYiKNLEalm8u+0QJ3Nh1squpHiJq9kSUDBN7a1y0/qzqDeISHgKrPCY
 EPRpBfEWUUrCOOywoq8RloowjgbJdRwH7aR48/qT9bpsOVnJsL9BlRMhkuHX8+DYCwmA
 DX4+nw7KkSqPTGe9gb4WiyXqeF23rpjXS+CHchF3MKm1x0TPzmtTLskLjErm2jE6RsKt
 SdkAwuoJzwL/7+Ox9FZscP0rG3O/sjJ/9NNYYruo/pC2JCPb/PQ/y1GvN47zl/HJwgd1
 p2mQ==
X-Gm-Message-State: AOAM533smjR2tMqXGxHF05NihKm0QA/1SFItef6+/Q9kfwho8dMWRaua
 wuuyYvsh4zBqxDSnnaPdSzo7bGw52U4=
X-Google-Smtp-Source: ABdhPJzN9rHnWdPKTIszXt7Mhfd15gCG1Cxh/84bpMzlBXmtSPTitrxs5UX229IedfcADlkam/YjZQ==
X-Received: by 2002:a05:600c:1548:b0:389:cde3:35cc with SMTP id
 f8-20020a05600c154800b00389cde335ccmr21552810wmg.133.1647250335115; 
 Mon, 14 Mar 2022 02:32:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 12/16] remove "new" keyword from trace-events
Date: Mon, 14 Mar 2022 10:31:59 +0100
Message-Id: <20220314093203.1420404-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is invalid in C++.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/trace-events | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/util/trace-events b/util/trace-events
index 5bc718eff7..9e23c11d11 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -3,8 +3,8 @@
 # aio-posix.c
 run_poll_handlers_begin(void *ctx, int64_t max_ns, int64_t timeout) "ctx %p max_ns %" PRId64 " timeout %" PRId64
 run_poll_handlers_end(void *ctx, bool progress, int64_t timeout) "ctx %p progress %d new timeout %" PRId64
-poll_shrink(void *ctx, int64_t old, int64_t new) "ctx %p old %" PRId64" new %" PRId64
-poll_grow(void *ctx, int64_t old, int64_t new) "ctx %p old %" PRId64" new %" PRId64
+poll_shrink(void *ctx, int64_t prev, int64_t curr) "ctx %p old %" PRId64" new %" PRId64
+poll_grow(void *ctx, int64_t prev, int64_t curr) "ctx %p old %" PRId64" new %" PRId64
 poll_add(void *ctx, void *node, int fd, unsigned revents) "ctx %p node %p fd %d revents 0x%x"
 poll_remove(void *ctx, void *node, int fd) "ctx %p node %p fd %d"
 
@@ -57,13 +57,13 @@ hbitmap_reset(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uint64_t
 hbitmap_set(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uint64_t ebit) "hb %p items %" PRIu64",%" PRIu64" bits %" PRIu64"..%" PRIu64
 
 # lockcnt.c
-lockcnt_fast_path_attempt(const void *lockcnt, int expected, int new) "lockcnt %p fast path %d->%d"
-lockcnt_fast_path_success(const void *lockcnt, int expected, int new) "lockcnt %p fast path %d->%d succeeded"
-lockcnt_unlock_attempt(const void *lockcnt, int expected, int new) "lockcnt %p unlock %d->%d"
-lockcnt_unlock_success(const void *lockcnt, int expected, int new) "lockcnt %p unlock %d->%d succeeded"
-lockcnt_futex_wait_prepare(const void *lockcnt, int expected, int new) "lockcnt %p preparing slow path %d->%d"
+lockcnt_fast_path_attempt(const void *lockcnt, int expected, int newval) "lockcnt %p fast path %d->%d"
+lockcnt_fast_path_success(const void *lockcnt, int expected, int newval) "lockcnt %p fast path %d->%d succeeded"
+lockcnt_unlock_attempt(const void *lockcnt, int expected, int newval) "lockcnt %p unlock %d->%d"
+lockcnt_unlock_success(const void *lockcnt, int expected, int newval) "lockcnt %p unlock %d->%d succeeded"
+lockcnt_futex_wait_prepare(const void *lockcnt, int expected, int newval) "lockcnt %p preparing slow path %d->%d"
 lockcnt_futex_wait(const void *lockcnt, int val) "lockcnt %p waiting on %d"
-lockcnt_futex_wait_resume(const void *lockcnt, int new) "lockcnt %p after wait: %d"
+lockcnt_futex_wait_resume(const void *lockcnt, int newval) "lockcnt %p after wait: %d"
 lockcnt_futex_wake(const void *lockcnt) "lockcnt %p waking up one waiter"
 
 # qemu-sockets.c
-- 
2.35.1



