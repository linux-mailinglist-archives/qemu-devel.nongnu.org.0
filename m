Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1402670B6C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9H-00007x-7D; Tue, 17 Jan 2023 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9F-00006G-0W
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9A-0007YB-1I
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHxiNfcZZImYagsz+S2qwPW9isNnxPRikDxHv8UG8ok=;
 b=P+CtS6B25n/3QTlP8PUGxD9RTDhzvMQCCpV0o0woaRUd8uA6VWqJdi22s6FqeYTPpJSUKr
 OPBzcNAZYNne9zRTShCBRnk2qYaGNYA7yN+L4Ug93K3SyHoFMvUMi/OlcBg2ICjSGv3grG
 FTubhwLxGigkV4mMfjW5F9GzCDtJBsQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-Iknmb9dWMJ2L3LyO1yWI_Q-1; Tue, 17 Jan 2023 17:09:30 -0500
X-MC-Unique: Iknmb9dWMJ2L3LyO1yWI_Q-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4b34cf67fb6so340180567b3.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHxiNfcZZImYagsz+S2qwPW9isNnxPRikDxHv8UG8ok=;
 b=P0lTG2/kORNYxL7/QE2fAllELEWbj2ZsHIr+mqTd8J8kg5eHHyeEYxWVXatZY73ymH
 3KbyB5dURxyu1cupT64/P26Mvyi2FuJw3Ta3JasvNAVtsO1EKzce4h5LPysFhguyVche
 b7BlMfN+CQfi0ptwXnkxCE7zj6Z4OWYEFL/cztPUfMNcU/JZm8298n4uJWKrhRDqzIbb
 /rOej4sSjJBIEYsi4I65dr9waXcg4zz07VfAqvDSDrsiUkJFvFsdWP3OsPEBr8KRIYkP
 pDTeAAJBVN3Y8Ynv7FXgGy+SvIakCv0milUlmZrV3qbKpQxPAeWcmx6hbjM9oW8sZubN
 tjNA==
X-Gm-Message-State: AFqh2kqsBIINbwRxOvuQsKVkpQdo+O9Y/EAgx/dJDhf1BcMGaFtOiou9
 aa+dV+Jx28/sp9zYPzOHCspCAEeHdtJ35yORLgJklnl1YGyQaYO7U/oyPb/4ZbcHGolNkp68vhR
 jEnQM5erPgMo242/hBnorDvWYC7nbbCC+gUoKTEShZwjvClh1gcPBvHFHi3CrBx78
X-Received: by 2002:a0d:f244:0:b0:4d7:5784:59c2 with SMTP id
 b65-20020a0df244000000b004d7578459c2mr3422114ywf.50.1673993368591; 
 Tue, 17 Jan 2023 14:09:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsaW6V/8te66s7U03cHPel2Bp8u7+SrV0q9ceXXu+Zs8cQ4F42ce8GCZKDHCpAYflVgB+P0Fg==
X-Received: by 2002:a0d:f244:0:b0:4d7:5784:59c2 with SMTP id
 b65-20020a0df244000000b004d7578459c2mr3422090ywf.50.1673993368313; 
 Tue, 17 Jan 2023 14:09:28 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:27 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 05/21] madvise: Add QEMU_MADV_SPLIT
Date: Tue, 17 Jan 2023 17:08:58 -0500
Message-Id: <20230117220914.2062125-6-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

MADV_SPLIT is a new madvise() on Linux.  Define QEMU_MADV_SPLIT.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/madvise.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/madvise.h b/include/qemu/madvise.h
index b6fa49553f..3dddd25065 100644
--- a/include/qemu/madvise.h
+++ b/include/qemu/madvise.h
@@ -63,6 +63,11 @@
 #else
 #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 #endif
+#ifdef MADV_SPLIT
+#define QEMU_MADV_SPLIT MADV_SPLIT
+#else
+#define QEMU_MADV_SPLIT QEMU_MADV_INVALID
+#endif
 
 #elif defined(CONFIG_POSIX_MADVISE)
 
@@ -77,6 +82,7 @@
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
 #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+#define QEMU_MADV_SPLIT QEMU_MADV_INVALID
 
 #else /* no-op */
 
@@ -91,6 +97,7 @@
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_REMOVE QEMU_MADV_INVALID
 #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+#define QEMU_MADV_SPLIT QEMU_MADV_INVALID
 
 #endif
 
-- 
2.37.3


