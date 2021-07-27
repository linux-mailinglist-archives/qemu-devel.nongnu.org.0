Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413A3D7875
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:27:44 +0200 (CEST)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O3b-0002yG-6A
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0w-0005LQ-Oe
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0u-0001uG-Rk
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5skV1VcH8VE4F7YVyHyIQxPMq2PPLQR3Z673qUopZ2M=;
 b=Z2UE5qYXVStv7oyCTZVYZ7MxrHh05zeikV7x2O0i+zqO+9iXjuVMzsyTUjInwlBB3t+ua3
 bSmgxF2NQqrbnQH28SQj99vZtnJPHQJ29HqkAtUUiwUmTqea0sonOj/ZjJ0mqu3uxiR5Jw
 S6WKp4kG2VpdcDA49ch3C4sdMgrmWZ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-1Z8wL4xmPIC1hAbBn8xvQw-1; Tue, 27 Jul 2021 10:24:53 -0400
X-MC-Unique: 1Z8wL4xmPIC1hAbBn8xvQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020adfeec70000b0290140ab4d8389so6105787wrp.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5skV1VcH8VE4F7YVyHyIQxPMq2PPLQR3Z673qUopZ2M=;
 b=PiyVCvQz4IrkRNMMXwUeIFRCZCSFxK6x1scpTrJUnRbbItkUSdJ3H6bqAsdjGF50CD
 Pox6p2/3kKBbXvHLehMnGDKvS93TxbtpA0n/0+LFGqM1PNCyiSOUbIe+QqvgTyMrHOe/
 5Un4xIbwn8bVHZR1hSrnXT9CoDCFRgMPUQtzwWLU2xhU1SgZffvX4+TzC9GZkysieHMy
 +GFV+ShC+vMFRj9kqau/yAciRJsPItRrQPG7k/zi37KGEWdu2KT9igsGp6cwpKyZc79S
 BOvP7c4JBveQPDgAoYnxWW54FR+1K8ieygaTcA6nJBAbUu2n/uNDF1iq8rH5gY49u5SL
 XGIw==
X-Gm-Message-State: AOAM531NDKjSiayj77JeSYkT5NUuExJwkk1rml/JgXmT9lXxvxcAUPhu
 h5NZOupG1Dz6LseG9m60tkA7UWnY6vsXXOMLw4xL5tRThtugEbOIIxDnwTAo1lBb51OS9eccba7
 c52p5ZugB3COAexM2IAA7LCvYRxtYHyCASvTm6CfC1B0qZ0VOXYbNLDFHhKPPZ0or
X-Received: by 2002:a5d:4251:: with SMTP id s17mr9858711wrr.154.1627395891832; 
 Tue, 27 Jul 2021 07:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy58mqYnHRsuUNSk2O9DTDkT0ZtECoN18xtbcvhs3sMaVtjuZpC14erUuTv8PgRS3g9/MDewQ==
X-Received: by 2002:a5d:4251:: with SMTP id s17mr9858691wrr.154.1627395891675; 
 Tue, 27 Jul 2021 07:24:51 -0700 (PDT)
Received: from x1w.redhat.com (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f26sm3570962wrd.41.2021.07.27.07.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 07:24:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v5 4/4] gitlab-ci: Fix 'when:' condition in OpenSBI
 jobs
Date: Tue, 27 Jul 2021 16:24:31 +0200
Message-Id: <20210727142431.1672530-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727142431.1672530-1-philmd@redhat.com>
References: <20210727142431.1672530-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep
running jobs depending on it. The correct condition is
'when: on_success'.

Fixes: c6fc0fc1a71 ("gitlab-ci.yml: Add jobs to build OpenSBI firmware binaries")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index d8a0456679e..5e0a2477c5d 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -6,14 +6,14 @@
    - .gitlab-ci.d/opensbi.yml
    # or the Dockerfile is modified
    - .gitlab-ci.d/opensbi/Dockerfile
-   when: always
+   when: on_success
  - changes: # or roms/opensbi/ is modified (submodule updated)
    - roms/opensbi/*
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
-   when: always
+   when: on_success
 
 docker-opensbi:
  extends: .opensbi_job_rules
-- 
2.31.1


