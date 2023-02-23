Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C06A0BEE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:34:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCf9-00089Z-1e; Thu, 23 Feb 2023 09:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVCf7-00089F-Pp
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:33:33 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVCf6-0006YC-7Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:33:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E6BE34381;
 Thu, 23 Feb 2023 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677162241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVWcObd8BoLIURFn7whFJYNSHIA/FCiM0TftHJr6TJs=;
 b=U3Al9bXR5Z20S6+JbBtKN7ANy8VKhN+4lydxB6CcrrnVp3NkdVjXB5/RL4ZKueBqe0sSe6
 +YMhYOJ08J5cyQMg4zA+O2c2Cifz0GGsZrheyW6J0YyJLQkAxK8gFLrSlgSY9YSSsuFBup
 aGduUTV/aIPR+QCP7il5sWIe8vtYlYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677162241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVWcObd8BoLIURFn7whFJYNSHIA/FCiM0TftHJr6TJs=;
 b=rYcokt7Nq40zZZm9hRoO76RXvAPDjwZktr/DC8Z6iymXl8e05+/RyRxkdF/5uO0U3pfkBw
 DzVMri3NU+vCFuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 370EB13928;
 Thu, 23 Feb 2023 14:23:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +JqUAP9292M+GAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 14:23:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH 1/1] ci: Attempt to pull container images before building
Date: Thu, 23 Feb 2023 11:21:54 -0300
Message-Id: <20230223142154.31975-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223142154.31975-1-farosas@suse.de>
References: <20230223142154.31975-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

We currently build and push container images at every pipeline
run. Since the main objective of the CI is testing QEMU, we don't need
to build the containers at every single run, we could pull the images
that were built in previous runs.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 .gitlab-ci.d/container-template.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..0c7f744384 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -13,6 +13,7 @@
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
+    - docker pull "$TAG" && exit || true
     - ./tests/docker/docker.py --engine docker build
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
           -r $CI_REGISTRY/qemu-project/qemu
-- 
2.35.3


