Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E646F5A7F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:57:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDtq-0006cx-LJ; Wed, 03 May 2023 10:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puDtn-0006cT-CS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puDtl-0003JU-TD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683125765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzoXzppR2fwEvCJm4gqIZYVt1zy/5vbq707Ih0qVaLU=;
 b=hzHgap0mjgMU2EJXw9KjgkQrzzkkgGzPhoAPIbD4GNlRFixeX5EGFmpE46tbdfh2mdh0qb
 RMMQjKwJGlLxK6PEPQ5UAcGn3Msi8+wMBZrnOuQDviy8nXf6aUuhhx38X3/KtEuTrp3TB5
 glm62jrsJNLGnDHbH83XvuJNhNrMs20=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-AaPgRv2QOO2eGl11tq7P5w-1; Wed, 03 May 2023 10:56:04 -0400
X-MC-Unique: AaPgRv2QOO2eGl11tq7P5w-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-63b679e4c09so3052808b3a.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683125763; x=1685717763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzoXzppR2fwEvCJm4gqIZYVt1zy/5vbq707Ih0qVaLU=;
 b=AwZDbRvQt8dUFAG4nC3D1cxxp1gZbEx8+kRL9jrxs13YxXSIZwOwnohJAvFJnr9tQE
 qIsVU2S+ZXSosCv7qmeiEwdwhQcLXYnB58YGFc1SQxx1+8pzHyKh3f+Z4oHJd0ZlGSWe
 hWKIvuoU3/Vtg3QrK7vJ/JqVr4SkEeIgfzU2XzGbbU+BEm0XAAGZlxZBpBMKsJ9Rdz0c
 TdnU1zLsaHmE1MM9fFS8RL/NjuS5Bky4lhSyqq80xqGertyHWzR81isog1gODmJxUe0N
 O73kkulaaFqePJCpTeymG3e2Pn+SSn4d9R7D5xh/TXV3py8JZseLhNJedIGj07QT7qXv
 Jojg==
X-Gm-Message-State: AC+VfDz5xVf+M3SaUl0t+hqDNefpimLtlLCwTa7rtglbZ0pAFdZKulBP
 3g8AKWM+YFJCOBxfAbrrFE9Inv1BG9eEpCsByxDlgcBPIQCS8WK5FTY6djyZ5hLL59n97padGxF
 QG5qQzm1SRLYFVSQ=
X-Received: by 2002:a05:6a21:340a:b0:fd:afba:9728 with SMTP id
 yn10-20020a056a21340a00b000fdafba9728mr1981908pzb.45.1683125763032; 
 Wed, 03 May 2023 07:56:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UND8GFjkE2vv0b7jplNG04BCZSSw97ZiY+cZuKzMPe+BRtkVb0Qa3v4aF13W1gWJGQzMM7g==
X-Received: by 2002:a05:6a21:340a:b0:fd:afba:9728 with SMTP id
 yn10-20020a056a21340a00b000fdafba9728mr1981885pzb.45.1683125762730; 
 Wed, 03 May 2023 07:56:02 -0700 (PDT)
Received: from localhost.localdomain ([115.96.153.99])
 by smtp.googlemail.com with ESMTPSA id
 p14-20020a62ab0e000000b0063a5837d9e8sm23584061pff.156.2023.05.03.07.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:56:02 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: alex.bennee@linaro.org, philmd@linaro.org, thuth@redhat.com,
 wainersm@redhat.com, bleal@redhat.com
Cc: qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>, mst@redhat.com,
 berrange@redhat.com
Subject: [PATCH 1/2] tests: libvirt-ci: Update to commit 'c8971e90ac' to pull
 in mformat and xorriso
Date: Wed,  3 May 2023 20:25:46 +0530
Message-Id: <20230503145547.202251-2-anisinha@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230503145547.202251-1-anisinha@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Pull in the following changes from lcitool:

* tests/lcitool/libvirt-ci 85487e1...c8971e9 (18):
  > mappings: add new package mappings for mformat and xorriso
  > docs: testing: Update contents with tox
  > .gitlab-ci.yml: Always test against installed lcitool
  > gitlab-ci.yml: Start using tox for testing
  > tox: Allow running with custom pytest options with {posargs}
  > gitignore: Add the default .tox directory
  > dev-requirements: Reference VM requirements
  > requirements: Add tox to dev-requirements.txt and drop pytest and flake
  > test-requirements: Rename to dev-requirements.txt
  > Add tox.ini configuration file
  > tests: commands: Consolidate the installed package/run from git tests
  > Add a pytest.ini
  > facts: targets: Drop Fedora 36 target
  > gitlab-ci.yml: Add Fedora 38 target
  > facts: targets: Add Fedora 38
  > facts: mappings: Drop 'zstd' mapping
  > facts: projects: nbdkit: Replace zstd mapping with libzstd
  > docs: mappings: Add a section on the preferred mapping naming scheme

CC: mst@redhat.com
CC: berrange@redhat.com
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 tests/lcitool/libvirt-ci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 85487e1404..c8971e90ac 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
+Subproject commit c8971e90ac169ee2b539c747f74d96c876debdf9
-- 
2.31.1


