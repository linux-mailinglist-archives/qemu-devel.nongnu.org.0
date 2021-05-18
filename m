Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA338744D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:47:31 +0200 (CEST)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livNy-0001Lu-VI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIP-0007eo-EG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIN-0005Zm-IN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id df21so10110340edb.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HyLcj1YtK5IYUxge5C+XbulYhgKF2hWTVH09HPhIs0=;
 b=KVq0lmxHsStTDbXNaGMFd88dyevtEWOQVB1j0Zp9ETjWxzPtOZVhtBfCgdLXlepA6c
 q9uMG/cGIjtcqJvoJeXiseP829Rte63xjYDgkPtMRRHbJ1Sk2BTXC7KdkDyML2eRiQoR
 AtMrGgourVfNf7AgHEW0IbT0BmQWwiiIEd8JOvkPXctA1e9PJ40BvjbQtOhotffwcoN6
 xRjRTl+fJYPKWNWgEknIz8OnlkSDZwOg5ZBe60ThOJlHa7hLSNHP2BDgO5c01K8zwr1u
 vQy43nBAMhENYQijCkk3ff7AxQ9onxtp89NMyjsYGdWlLxIkiajwOjQa83RU6Oxc3yLG
 hJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2HyLcj1YtK5IYUxge5C+XbulYhgKF2hWTVH09HPhIs0=;
 b=iolBzkyQK1qPAyc8DRo0m/7tTwgS1tU8OOZKDULzu/QGqPgk6wQ6CH9tdyKI+ORofO
 CCoPiYCGj1spyMs3/agTINyrxUBabZa5PXLJfxlzpe0bBOrr0GpkHfT6gOY6vvtRmsj6
 OsYz6We+wTLt7YnllMWqTdnu8dGWRQ60E6/aLJw7vxCTN6r5BJsOWdvz/0sGauhIP87M
 sLB085O0lnlMfXCHM3+vKijkKrtQXc+sgz7FFkoYs2bRqCMZfAMcFF6P4np6ZvDJ68lA
 lBVTKBNp44R49WA0C+tPBRe4v2KORYrJIDLaBZOesQ2/ort5B3sO6nA8A3xPLb3RAYEo
 9oTg==
X-Gm-Message-State: AOAM533jOOkAZ6fwZ67F3qECYBV/vq4u0t9RCPb1n/WLwzgYZHRzfD4e
 NmzcN7G+xUaq5wfp7kRhxAxSSkHBaBSDUg==
X-Google-Smtp-Source: ABdhPJzmgLnSnA5H7TKnD/KLw53ZC32K5WTE+bSd8hywEXwl3FdKhR/2uXcWF8RdGnNoncWkpRaTPQ==
X-Received: by 2002:a05:6402:1158:: with SMTP id
 g24mr5663365edw.134.1621327302149; 
 Tue, 18 May 2021 01:41:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d7sm9851917ejk.55.2021.05.18.01.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:41:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] ci: do not use #processors+1 jobs, #processors is enough
Date: Tue, 18 May 2021 10:41:38 +0200
Message-Id: <20210518084139.97957-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518084139.97957-1-pbonzini@redhat.com>
References: <20210518084139.97957-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I could not reconstruct the origin of the $(($(nproc) + 1)) idiom,
but I suspect it was there only to have a sensible result when nproc
or getconf do not exist.  This can be achieved also with an "||".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4bd1a91aa8..3f0d86cf0a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -17,7 +17,7 @@ include:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
-    - JOBS=$(expr $(nproc) + 1)
+    - JOBS=$(nproc || echo 1)
   script:
     - if test -n "$LD_JOBS";
       then
-- 
2.31.1



