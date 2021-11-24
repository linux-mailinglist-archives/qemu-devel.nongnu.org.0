Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A43C45B7ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:00:48 +0100 (CET)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp55-0001Yi-9l
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozz-0002k9-W8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozx-0004UI-QI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPYxMrCOWugGC2Ig3skogvxaOmXOSxKYsh8Dbjvo4MY=;
 b=GuY/ei5S9A6b5s6QjI0jQIfogYQBEOvZObD7uonGFFUyxziDIwmksloxU0rnsHgu4CjuP8
 BD3R8ppIf3jP4yT/oP73CeJhv7rAugXFNazV0KH3kIRrFZmJuR5RSYFCvMviDhF2SwkxJU
 EpXD2fiquumyyteRf3ic3Q9wYEs3XXE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-3zZeBZhEOCek_5YVci3T2A-1; Wed, 24 Nov 2021 04:55:28 -0500
X-MC-Unique: 3zZeBZhEOCek_5YVci3T2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso1049767wmc.5
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPYxMrCOWugGC2Ig3skogvxaOmXOSxKYsh8Dbjvo4MY=;
 b=ut/788C9Dn31WfyuF31bEQ8D74A62lfbpglUmQLhXrBkK3DwKsW5UNJcM/nNKrFiLU
 l4rI/95KMVX9fcOu1gL50oEpLuGB+KfZjexMW+KFyUMNi9NSIvVU1yGuBUaAD3nzP77K
 Asc1C9FGF9KU/eeBPvrJUYL0A+OTLTxlHedDH5/WL7uQwLlSc3p6xb2mGWhgOgTHO2SK
 wmGfldcra6zLN+gBevomN1jXrnEExDMs95Al686HZhxbHZYfOVcDmLVFID0Se1bIzlqn
 ER1moXkJRoboSHw5MqmTqcIp53GqFAOYB+w8HsEkp0cev18QUYJO8tGrHF61z0NK/ofu
 mFyA==
X-Gm-Message-State: AOAM533zfXrwnYOm8SvGar4QZngT8rbWVhHcn7iUzAhYlN5q6YBl5Z5G
 L28QRWDocBy7N6gzcmUj+L2vmQ9UxUsVA3jfgwHao+B33TmjyTaABrs4R4bq5fyK8kxnUkyYdmf
 Hbru9vuDYoEalAoR6ewcOUPQX9oO3tC4AiX/CdlvivMX2GbZ0exs+lvkB03jgbcTz130=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr12587769wmk.172.1637747726720; 
 Wed, 24 Nov 2021 01:55:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWhrbYEVTBbciDpN7gSK8Hg70XcKFdhaFossBS5xYwAVlOUihH5pauNrPqYRB4T7n3ZokKyw==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr12587739wmk.172.1637747726509; 
 Wed, 24 Nov 2021 01:55:26 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id g13sm20303994wrd.57.2021.11.24.01.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/23] multifd: Add missing documention
Date: Wed, 24 Nov 2021 10:54:41 +0100
Message-Id: <20211124095500.42078-5-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 2 ++
 migration/multifd-zstd.c | 2 ++
 migration/multifd.c      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 3fc7813b44..d0437cce2a 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -72,6 +72,7 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
  * Close the channel and return memory.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
@@ -94,6 +95,7 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  *
  * @p: Params for the channel that we are using
  * @used: number of pages used
+ * @errp: pointer to an error
  */
 static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index cc3b8869c0..09ae1cf91a 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -84,6 +84,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
  * Close the channel and return memory.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
@@ -107,6 +108,7 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  *
  * @p: Params for the channel that we are using
  * @used: number of pages used
+ * @errp: pointer to an error
  */
 static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
diff --git a/migration/multifd.c b/migration/multifd.c
index 8ea86d81dc..cdeffdc4c5 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -66,6 +66,7 @@ static int nocomp_send_setup(MultiFDSendParams *p, Error **errp)
  * For no compression this function does nothing.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
-- 
2.33.1


