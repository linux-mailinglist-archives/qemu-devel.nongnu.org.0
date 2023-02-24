Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED56A1C81
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXaj-0007ig-37; Fri, 24 Feb 2023 07:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVXag-0007i5-BV
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:54:22 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVXae-0004gP-R3
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:54:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAD6838C57;
 Fri, 24 Feb 2023 12:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677243259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElH4Mq23iJVdPlHGVDaYT00k2ser04rfkqGJntNiPz8=;
 b=JqKWBX2s1UrgsQ9HR6NcVdxUQC1VhqQQEOFRCvwSbmfpNZ3XIWux1ZRo1ley1o/x0dU54C
 Q3I70zZ4F8t3HFgtp9PSmXdNILiKVL/sPAU4btSONXC3XHQtmbTEr0x/fhBrBnEMbWXAyS
 NYqurIHu1Soxr5C/RBrDhzMmmRWw9zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677243259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElH4Mq23iJVdPlHGVDaYT00k2ser04rfkqGJntNiPz8=;
 b=Rl7RaatL0s4ljcitNralqxmtRHr8QS/fhtPE+pJuipmd1QDPhIsh2fuDbplR5rhmeVLpZM
 nfPZbkeih0FWR3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB5F313A3A;
 Fri, 24 Feb 2023 12:54:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cF7AIHmz+GMHMwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 24 Feb 2023 12:54:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 3/3] gitlab: Remove COMMON_TAG from
 container-template.yml
Date: Fri, 24 Feb 2023 09:52:07 -0300
Message-Id: <20230224125207.19616-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230224125207.19616-1-farosas@suse.de>
References: <20230224125207.19616-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

We're not using the COMMON_TAG and we cannot have a push to a
different registry than we pull from because that would get in the way
of forks testing their changes to a dockerfile.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 .gitlab-ci.d/container-template.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 31e4e36a7d..e7c1fa1522 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -6,13 +6,11 @@
     - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
     - apk add python3
     - docker info
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
     - docker pull "$TAG" || true
     - docker build --tag "$TAG" --cache-from "$TAG"
       --build-arg BUILDKIT_INLINE_CACHE=1
-- 
2.35.3


