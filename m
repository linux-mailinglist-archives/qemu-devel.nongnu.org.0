Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF312E77E6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 11:58:50 +0100 (CET)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuZBo-0004lY-KV
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 05:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1kuZA7-0003QE-3O; Wed, 30 Dec 2020 05:57:03 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1kuZA5-00078N-IE; Wed, 30 Dec 2020 05:57:02 -0500
Received: by mail-ej1-x635.google.com with SMTP id d17so21400557ejy.9;
 Wed, 30 Dec 2020 02:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nx1UEZYw4H7PC6JT8xndwP5/HKmjeqfovtan9QJXxA0=;
 b=Dxng0TjVIpu3I3OXJD/IEWSzi+69GPjY2S9voj+JQwzp4Wt2xWAAEYnyTQ1BLh498P
 U2qDqbkoUV4IqNm7g+WD3YNCRDFTRpG3bGQ12nAEjPsUjF6DTLB260rcPj+z1u+Lx+ex
 8hqMsVv5cnBJ7ItGG5gYO4RvRZKagxjyu7NU5AiZ3Q81LJOrdSOKJZxESVB7YRgcY2W3
 sbsEv8wE03t0oqhLpA+l9fs0h6XWPu9jl6W13GOLPLmM97MThBlBmBS0HEAed1aE9AVA
 D1uLt4i0CE5ONFOHA4/HzZO1f+MTdzXzkL7DUyRAnAXjQt9tpjzHqAavPi/N4QqiZztQ
 ApJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nx1UEZYw4H7PC6JT8xndwP5/HKmjeqfovtan9QJXxA0=;
 b=fQUI9Qnpa0daDli+IXvCvjJ0+H37Qd+D1VUkqnvioxTvNePBJa/LQGfV6B96twftrT
 W1afBP+9pSQLzixw2HQFA3CKMV6WojpqEh8aNKvYS0/6M5tvEgsM5LjaKDyiMEg5hZoj
 VQF6BUqNBElJb8IcylUdFfCm0SvhPRX0rnkrsm4I0fj9wA8WIgZmjSee+BItiX/26x1x
 K61efpgJZCAmAMEoRbibaKmj52rvUoLDGyDgDS9hr4ZsefJi+fRDkYmfU1+uZgH9LoZL
 aamIiQbiMfH9Fq+BIsA6SlYyEWOlc9DDur6fRA5VJkncm4LUfkJQqck/0BMVnHvqR58F
 ispg==
X-Gm-Message-State: AOAM531/e3dZ7Iuny3Vw6g0Z+Xi7x70t5tAPZTT2e0q49q0Hu4VsNJyw
 nJYvqjT3akRgfHZa0yxZMKaJQiNuu4vZQearFi9k5P50p+OQoB5y
X-Google-Smtp-Source: ABdhPJzW2O0ZL9jrb3GDpRm9sWfzClxxHN2NH4fcJNlG7cC+1gqJlwl1gDQBT1RbC2HUW7bxWsy5fHt32ZW2pOlr8rk=
X-Received: by 2002:a17:906:1488:: with SMTP id
 x8mr37466509ejc.124.1609325817293; 
 Wed, 30 Dec 2020 02:56:57 -0800 (PST)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 30 Dec 2020 10:56:46 +0000
Message-ID: <CA+XhMqw-Oq+nRDTbYe+TdfgSEhYHqaP4odyRRoTCQht7ioBRNA@mail.gmail.com>
Subject: [PATCH]: osdep set MADV_DO/DONTDUMP on FreeBSD
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=devnexen@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From a79128e87b0eb1ef4ef0f046ea943a212e62eb6e Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Wed, 30 Dec 2020 10:54:45 +0000
Subject: [PATCH] osdep: define MADV_DO/DONTDUMP on FreeBSD.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 include/qemu/osdep.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..8debf924d9 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -370,11 +370,15 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #endif
 #ifdef MADV_DODUMP
 #define QEMU_MADV_DODUMP MADV_DODUMP
+#elif defined(MADV_CORE)
+#define QEMU_MADV_DODUMP MADV_CORE
 #else
 #define QEMU_MADV_DODUMP QEMU_MADV_INVALID
 #endif
 #ifdef MADV_DONTDUMP
 #define QEMU_MADV_DONTDUMP MADV_DONTDUMP
+#elif defined(MADV_NOCORE)
+#define QEMU_MADV_DONTDUMP MADV_NOCORE
 #else
 #define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
 #endif
-- 
2.30.0

