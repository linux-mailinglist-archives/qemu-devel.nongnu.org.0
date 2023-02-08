Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05C68F44F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:21:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7X-0005VE-2g; Wed, 08 Feb 2023 12:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo7V-0005Rt-6q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo7T-0001du-4R
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+vL4OFtafgQgZupdNxcfjPLno/cd7zOHkTcPOHnfyg=;
 b=QsiBZ1cWAlTc9bIL0X94QsNEaGNDUb9cIFJJzkZ/N/rO0Rjd/wb+mfwc3JHfJo/S8u1Wkz
 fCoFyGVbYhFri8kDTAkw5wjIAmPcLbHcBySnYp6vji8V7OT8aw+FO1Ww5WnUsjPTQ1a9qG
 2aoP/9hQSWyuI+I6QoF0po/CA9dKTA0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-N_y0A9f9OL6Uoah6VUEP5g-1; Wed, 08 Feb 2023 12:19:50 -0500
X-MC-Unique: N_y0A9f9OL6Uoah6VUEP5g-1
Received: by mail-ej1-f69.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso13618692ejb.14
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+vL4OFtafgQgZupdNxcfjPLno/cd7zOHkTcPOHnfyg=;
 b=y+m9ADwr3Kw5K6anyRmZXxYlkhHNQYPw7wfcq++k9Nsg9vMtGaa4RmEBpwVzpykjZN
 kfXyLFFW/T80oCFj79DmiS4RarSRMQYwszw6Ovdl2Mr+t9BfbW7B3cn8+mg9PfAdH7hw
 uVifnxVj12yGUhFAuSZpDBpUbDXt53hkIXH3pzyMz3HItulUcHq1NRLizl7uVxDtu2u8
 BWeh8CiRFjBL6C3pcS4GZms4XrqynBuEcBDM6FPqAG5V0Lej01FvMci5lrzvnrNB/iRK
 c6hOiQHzWlkB/GYEf7YXMz8DhuQ6fx95jA8hpsMIUYB0je96CZ7hIHbMS4SZfPkoYHQt
 Gi4A==
X-Gm-Message-State: AO0yUKV5SCvOtFuBUHgKAZmr60HmrsA345/3cXMdwvG5dunYDV1mK7kU
 8zQdOCxkWzGiqRrVwQoWCmHDS2pmo1IOFEoBHbK06VoY3TcVfRm1A1/sM9iIgJw+cu1iOHQneN6
 0pgRZ2EhlVoDjs+bAWYqJZqKO4NOPe57TlIbkGnnFlwiq/OeJHsl6Zwip+g+d8pxFp7X9Il/E
X-Received: by 2002:a17:906:e0c9:b0:88a:1ea9:a5ea with SMTP id
 gl9-20020a170906e0c900b0088a1ea9a5eamr8250709ejb.65.1675876770798; 
 Wed, 08 Feb 2023 09:19:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+Yj9yQmTM7V4YHfVARujIyBTHZt56S5+GmZMv2tuaECNMujeijuZdVhPE6mg3Rqqbjg22hWg==
X-Received: by 2002:a17:906:e0c9:b0:88a:1ea9:a5ea with SMTP id
 gl9-20020a170906e0c900b0088a1ea9a5eamr8250690ejb.65.1675876770457; 
 Wed, 08 Feb 2023 09:19:30 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bn18-20020a170906c0d200b0087f68a2681bsm8593567ejb.96.2023.02.08.09.19.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] remove unnecessary extern "C" blocks
Date: Wed,  8 Feb 2023 18:19:13 +0100
Message-Id: <20230208171922.95048-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
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

A handful of header files in QEMU are wrapped with extern "C" blocks.
These are not necessary: there are C++ source files anymore in QEMU,
and even where there were some, they did not include most of these
files anyway.

Remove them for consistency.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/disas/dis-asm.h  | 8 --------
 include/qemu/bswap.h     | 8 --------
 include/qemu/envlist.h   | 8 --------
 include/qemu/rcu.h       | 8 --------
 include/qemu/rcu_queue.h | 8 --------
 include/qemu/uri.h       | 7 -------
 6 files changed, 47 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 64247ecb11f4..32cda9ef14c5 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -11,10 +11,6 @@
 
 #include "qemu/bswap.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 typedef void *PTR;
 typedef uint64_t bfd_vma;
 typedef int64_t bfd_signed_vma;
@@ -506,8 +502,4 @@ static inline bfd_vma bfd_getb16(const bfd_byte *addr)
 
 typedef bool bfd_boolean;
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* DISAS_DIS_ASM_H */
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 3cbe52246b81..b1650daedf9c 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,10 +1,6 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
 #undef  bswap32
@@ -395,8 +391,4 @@ DO_STN_LDN_P(be)
 #undef le_bswaps
 #undef be_bswaps
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* BSWAP_H */
diff --git a/include/qemu/envlist.h b/include/qemu/envlist.h
index b9addcc11f7d..6006dfae44c3 100644
--- a/include/qemu/envlist.h
+++ b/include/qemu/envlist.h
@@ -1,10 +1,6 @@
 #ifndef ENVLIST_H
 #define ENVLIST_H
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 typedef struct envlist envlist_t;
 
 envlist_t *envlist_create(void);
@@ -15,8 +11,4 @@ int envlist_parse_set(envlist_t *, const char *);
 int envlist_parse_unset(envlist_t *, const char *);
 char **envlist_to_environ(const envlist_t *, size_t *);
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* ENVLIST_H */
diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index b063c6fde81d..313fc414bc2a 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -31,10 +31,6 @@
 #include "qemu/sys_membarrier.h"
 #include "qemu/coroutine-tls.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 /*
  * Important !
  *
@@ -196,8 +192,4 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_auto_unlock)
 void rcu_add_force_rcu_notifier(Notifier *n);
 void rcu_remove_force_rcu_notifier(Notifier *n);
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* QEMU_RCU_H */
diff --git a/include/qemu/rcu_queue.h b/include/qemu/rcu_queue.h
index 0e53ddd5305e..4e6298d47307 100644
--- a/include/qemu/rcu_queue.h
+++ b/include/qemu/rcu_queue.h
@@ -28,11 +28,6 @@
 #include "qemu/queue.h"
 #include "qemu/atomic.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-
 /*
  * List access methods.
  */
@@ -311,7 +306,4 @@ extern "C" {
          (var) && ((next) = qatomic_rcu_read(&(var)->field.sle_next), 1); \
          (var) = (next))
 
-#ifdef __cplusplus
-}
-#endif
 #endif /* QEMU_RCU_QUEUE_H */
diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index d201c61260de..db5218c39ec0 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -53,10 +53,6 @@
 #ifndef QEMU_URI_H
 #define QEMU_URI_H
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 /**
  * URI:
  *
@@ -105,7 +101,4 @@ struct QueryParams *query_params_new (int init_alloc);
 extern QueryParams *query_params_parse (const char *query);
 extern void query_params_free (QueryParams *ps);
 
-#ifdef __cplusplus
-}
-#endif
 #endif /* QEMU_URI_H */
-- 
2.39.1


