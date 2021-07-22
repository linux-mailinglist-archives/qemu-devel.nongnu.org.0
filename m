Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6063D2CCF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:34:19 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6eSY-0000iY-Gs
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6eR1-00087x-9C
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6eQx-0001qh-OJ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626982358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8kWmnTafqk1HYvz2nKR5LUXc4SrlIfMPmcYW4BXVas=;
 b=KgcWu2au2xHV4P6vSbDSIMpOkC1P3egKCN4RCkgYQp7LxSRs8cJ8hcIneUrBV2mZYxBtYz
 r1xiRIrZysEuJz9CsxhZQNmLztfoDR5qwSHGT1CXXoSRUVN7xeNci2smFTfP3lPykUSA1g
 3uKqxACg4WIfb7/Ga94JRlff7+XczPQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-ktO0YHaSP5KeGnjVglaa6w-1; Thu, 22 Jul 2021 15:32:37 -0400
X-MC-Unique: ktO0YHaSP5KeGnjVglaa6w-1
Received: by mail-qk1-f198.google.com with SMTP id
 a6-20020a37b1060000b02903b488f9d348so4814402qkf.20
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V8kWmnTafqk1HYvz2nKR5LUXc4SrlIfMPmcYW4BXVas=;
 b=OCCfGxYjPdBQP2SYyQuquHXiiL6JTB9/YpecB7Uqt8md6jFHlGeyiyrOMImQNYT8z2
 z5zHjtGQEjhTYQXilR6AHgFYCeoynKhG+nZeyJqrgi/WBfi6qnjOgZeXkWW6rIgUL6ya
 yqDEpwfroPiWBm7zgg7BeJnogi0F02POmWMMPfBLWm3wzddelaL+jXdh40lbfG/+RnHE
 yllO/QsrZlF1Oz1XedrrQYo2zCcw50TQBaEtWrFn+CpKjwXn/4BdszhxrZyhfyzCHu7m
 fUJIG2Wy5B+MhvE47A+wAIdQBOX8BRMKDS9xJIKNG4IVLxakQ4Q2nMxWX97fJW+/V9mn
 8e2Q==
X-Gm-Message-State: AOAM5312B9UNc2pN9iExtOEtTxn6DlQ4tqgYM/R0XXwW6cEvNQSThySw
 YpYKx189h3hC7pEW4oUNvlFtaTJe7EB0srNYF7e3BrP3mp2LSjYvEk/mHA2wzbyJe47ktA8hyh3
 z+yKjDYGkzSFttCOvwqNOnJWgjzVeMN/IeCBa5/+kouCaREtziT2aDUflEm0ydBbQ
X-Received: by 2002:a05:6214:961:: with SMTP id
 do1mr1315736qvb.25.1626982355891; 
 Thu, 22 Jul 2021 12:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5TpkAhq7N05hFo8iNneHDmfwc0DsChESu/FxNubmrgKgAzSd/CdwneQJH7MvYder00mPCkg==
X-Received: by 2002:a05:6214:961:: with SMTP id
 do1mr1315711qvb.25.1626982355611; 
 Thu, 22 Jul 2021 12:32:35 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id g206sm339975qke.13.2021.07.22.12.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:32:34 -0700 (PDT)
Date: Thu, 22 Jul 2021 15:32:33 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/5] migration: Make from_dst_file accesses thread-safe
Message-ID: <YPnH0bvgG7sGhr8d@t490s>
References: <20210722175841.938739-1-peterx@redhat.com>
 <20210722175841.938739-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722175841.938739-3-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 01:58:38PM -0400, Peter Xu wrote:
> Accessing from_dst_file is potentially racy in current code base like below:
> 
>   if (s->from_dst_file)
>     do_something(s->from_dst_file);
> 
> Because from_dst_file can be reset right after the check in another
> thread (rp_thread).  One example is migrate_fd_cancel().
> 
> Use the same qemu_file_lock to protect it too, just like to_dst_file.
> 
> When it's safe to access without lock, comment it.
> 
> There's one special reference in migration_thread() that can be replaced by
> the newly introduced rp_thread_created flag.
> 
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

(Dave should have helped fixing this which I appreciated a lot, but just make
 it be together with the record..)

Below needs to be squashed into the patch:

diff --git a/migration/migration.c b/migration/migration.c
index a50330016c..041b8451a6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2696,7 +2696,7 @@ static void migration_release_from_dst_file(MigrationState *ms)
 {
     QEMUFile *file;

-    WITH_QEMU_LOCK_GUARD(&s->qemu_file_lock) {
+    WITH_QEMU_LOCK_GUARD(&ms->qemu_file_lock) {
         /*
          * Reset the from_dst_file pointer first before releasing it, as we
          * can't block within lock section

-- 
Peter Xu


