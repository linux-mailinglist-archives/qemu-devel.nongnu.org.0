Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F9691886
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:32:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMx9-00057l-7y; Fri, 10 Feb 2023 01:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx6-00056u-C1
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:08 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx4-0007gD-LI
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:07 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 bv2-20020a0568300d8200b0068dc615ee44so1274290otb.10
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0JhpVPOTJNunW/+RFyMjuxpZq9yWKqBvO16ePPxhWc=;
 b=XeXVMLFl/DFm1/l89eR+Uq12dUEsUWTsxCgOMFt7M1xr5ofJ7GcP8TbJAjZZY/witF
 k7S3mSFUCAC/d7USas5mSxf3jCaq2CNQeER2uNArWeYYfeAWT7ivGRJ4pdfxLxLfIxIF
 PsZJpdw5kdZOKr6DfOLgy7DzigOtOcnQRhHbC0MwuWb38yibN6T0oSN/zqio33asQvHY
 JLnoR7QdLx5i3y5GPbJfbS77JbemxR9y2mH+R/MKUR/gwFuXA5Kdx4mXZV8upkYiPxtW
 BMyAHVHQD3LN7PN1XZhxaDJ/hWK2rXzY3gVPetnAduoYWCnwwHQE2MxTucjUp7Kh8iRu
 NDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0JhpVPOTJNunW/+RFyMjuxpZq9yWKqBvO16ePPxhWc=;
 b=0sZMSXVYiZKntIUwv5CO/GxZ/82oHBzW93/LzGaXZ8uFwejY1BkDu4iELnT2nvL6ro
 6OQ8gNaAg9ijAGFwBgHKV2K+lbCl/gvHvJ4+Px/jFlIaEL50eoAYF/fNP649zQwitpiO
 XIZGWT8ZlvHjavpMz1/zJHmC0deYKGFSxtvGt/ZI+miLWreUDrg971UrFyRlDRmkJhtY
 4MXVia3JHjGudx8AbUZ5x2oAI6IDwmaozjst4o/A7nIz1RZVfpKVCG/NMwnW+0eaHe01
 OqCHVVtHu+neFVHRHkrGeINY76V05/QbYjdxYp/fC63IHfemv/o54pTruGiEkrmgI263
 uVAA==
X-Gm-Message-State: AO0yUKWiQnO1ZPw1XE2dKUd0BEwiSDhIMrZq01a8ZDrXaGbq8rtf4BmD
 OTcsvnCi+pQPUPlGSmMyWZc=
X-Google-Smtp-Source: AK7set/UUa3NmF+czS02gsUIk+R1uf1Uz6g7mU+Uc8kmoiULGyxlyrsyZRdpfl0UeoCUgoFwaLFNLw==
X-Received: by 2002:a05:6830:923:b0:684:d3d1:6df8 with SMTP id
 v35-20020a056830092300b00684d3d16df8mr10548377ott.29.1676010725111; 
 Thu, 09 Feb 2023 22:32:05 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a9d6a52000000b00688449397d3sm1686285otn.15.2023.02.09.22.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:32:04 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 2/4] migration/multifd: Remove unnecessary assignment on
 multifd_load_cleanup()
Date: Fri, 10 Feb 2023 03:31:43 -0300
Message-Id: <20230210063145.530952-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210063145.530952-1-leobras.c@gmail.com>
References: <20230210063145.530952-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=leobras.c@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Before assigning "p->quit = true" for every multifd channel,
multifd_load_cleanup() will call multifd_recv_terminate_threads() which
already does the same assignment, while protected by a mutex.

So there is no point doing the same assignment again.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 migration/multifd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 174726982c..1a445b36f1 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1034,7 +1034,6 @@ void multifd_load_cleanup(void)
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         if (p->running) {
-            p->quit = true;
             /*
              * multifd_recv_thread may hung at MULTIFD_FLAG_SYNC handle code,
              * however try to wakeup it without harm in cleanup phase.
-- 
2.39.1


