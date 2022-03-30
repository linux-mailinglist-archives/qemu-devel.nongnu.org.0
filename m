Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6924ED042
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:41:29 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhwO-0004ih-HO
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:41:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft4-0008Fc-3P
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:54 -0400
Received: from [2a00:1450:4864:20::143] (port=46024
 helo=mail-lf1-x143.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft0-0003Jv-HF
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:53 -0400
Received: by mail-lf1-x143.google.com with SMTP id p10so32198792lfa.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CR4tpKwUbqNCp3vPghajNadmUDfn2CftEskMgZuONo=;
 b=ucriP8HbMlr64lT07ALgEJQt1aAegJQS7SVcMbGPwQvt4MFX/+jVqHYSAoi8eDv+zE
 RvakHHacpYBhJrCtiKWu2jnGrz/5vTTOE5QkCrPFuvLEx0bn7KSSh+1X4T49wqhiRdpm
 pEM8zG4v+ifzDFvDA7bEN0BaRNrVHuoyP/buw7WjnybsSM9cZkw4zafKqeX7TUiyxfgE
 SEwoduH3ksgZgyvlrNy+q6AeiFn/iJhLzVfoNGoAbN8ikiFl39KQN7JDOOsIAMns4lBz
 dKoE9Y/SVapj7P9Whl8aKWTmFbGG20Ui5c7wKi1hNlHYOeVEvcLSr+abdE6vr35IB5LL
 r0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CR4tpKwUbqNCp3vPghajNadmUDfn2CftEskMgZuONo=;
 b=05yvSYEcqBSl6Eb28au9IJ05QMNwszP4uqRZ4GRlifspYnkUNCWjnOnvPq2zxD74pj
 wFoW2uffD62xJj0w8MFmCa9REHOkUtX5wz4rSUqehToC/wn89NqpE5w8DaZmPSqM3ONu
 Cki29e1qDXNKy1vIKcfyDIAwxuYHyxwOv07bvvNcv3Wwq1MxOezDdmlaPtM6mv3jQSgg
 8r8Ruk0WwFkJ2EdEfMD9SKUJqUIm0zzIHd06ZEJtZU1R+zBTm4/9I6TAwRep434HnUiq
 wbrjCiNGjSBk+K+qBaYK5vijkRrYlrM4mFukJtET1VxaxizqRR372M8s8QZVLco/UcQm
 wHMg==
X-Gm-Message-State: AOAM53049LXLTvFqeLV+K/J8CQUhmMq1KmAH+bENRzvS5Fqj+LHBg2JK
 0sizt1YnMIX1oTyWYOotDtmceA==
X-Google-Smtp-Source: ABdhPJwhRhl+I0uVtCJPHa/aGzh/egb21Ze4nW56WHaB8Kxz6ecFXWaJ01oZr4SvfkSxc1fBhEOQ4A==
X-Received: by 2002:a05:6512:3a81:b0:44a:616f:f75b with SMTP id
 q1-20020a0565123a8100b0044a616ff75bmr8450895lfu.2.1648675786923; 
 Wed, 30 Mar 2022 14:29:46 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:46 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 25/45] blockdev: qmp_transaction: refactor loop to classic
 for
Date: Thu, 31 Mar 2022 00:28:42 +0300
Message-Id: <20220330212902.590099-26-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::143
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x143.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:25 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 177f3ff989..b44f0ca101 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2386,7 +2386,7 @@ void qmp_transaction(TransactionActionList *actions,
                      struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *act = actions;
+    TransactionActionList *act;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
@@ -2405,14 +2405,11 @@ void qmp_transaction(TransactionActionList *actions,
     bdrv_drain_all();
 
     /* We don't do anything in this loop that commits us to the operations */
-    while (NULL != act) {
-        TransactionAction *dev_info = NULL;
+    for (act = actions; act; act = act->next) {
+        TransactionAction *dev_info = act->value;
         const BlkActionOps *ops;
         BlkActionState *state;
 
-        dev_info = act->value;
-        act = act->next;
-
         assert(dev_info->type < ARRAY_SIZE(actions_map));
 
         ops = &actions_map[dev_info->type];
-- 
2.35.1


