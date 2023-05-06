Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E522A6F8FD2
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:21:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCDk-0002Vb-67; Sat, 06 May 2023 03:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pvCDc-0002Uz-Df
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pvCDa-0003tr-8K
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683357628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QnPB2BYU9Iu+jMAG2o2hVEPT1XATPoA6UkH++BNC/EE=;
 b=UULLQkOIGEj4Y67A7Z7evZgKd9TRAfAwK08DbEfqqzh/pQYaJEWtIm50yWkPJAAtpPsBfJ
 n6eWp261LAyB7jW6GJkYCbLiOJhey0ME2H3vdAiBfZeDygq4pTrHCd5kVhVltVvSHAx6gb
 b56TD2e9fDYsmNjOxmItC1KjasD4Ylk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-7F0s7MhnPviFFs1SKth9Rw-1; Sat, 06 May 2023 03:20:27 -0400
X-MC-Unique: 7F0s7MhnPviFFs1SKth9Rw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1aae625e57dso12937665ad.1
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357626; x=1685949626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QnPB2BYU9Iu+jMAG2o2hVEPT1XATPoA6UkH++BNC/EE=;
 b=heFGuKI0prJDTvUxzZOQbjZ3RAyjsMbKJekT187bPBKEIndXPbgvhe6Y2Jz7ybmbWp
 ihro/GZm6AUzTLQY/0cuEfjCs/c77mVPzVs3RkFR9SfluZy74iT02S1K0LLBuUAHYwRu
 AvAQ9XmZhlvBUemmw9o3U380fVB1aGuz02HjIXfflZu39rfdXVMeOec5GyQ7bYaCl//i
 /FOF/iCwAH2W5dQnFZcal3jEUsNelhRK6055r2FFW5T3l28YCbZjbdXqxqXGQimHIWdI
 hA6SCWbzmeZfTbhoBJmuEfkHNMZLejC89ehr//dyEzpP0KFAMLEk9pTqpaT2DSbtyv/F
 rZoA==
X-Gm-Message-State: AC+VfDyhQfqDOmjipXtT8z2x4mg8u15YVzUazcDGsNmcq1gpCxFbsvca
 ZpxSTEfi92tNdUeDMxgS6GBexFo4whdba9PimK+ntDbfmuhsH+Q/+yDuV+V7qZiDW0YlKf4ADvz
 j8PdVVl3LcsepG64=
X-Received: by 2002:a17:902:bd85:b0:1a6:9ec2:a48f with SMTP id
 q5-20020a170902bd8500b001a69ec2a48fmr3688933pls.34.1683357626242; 
 Sat, 06 May 2023 00:20:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5P19ijFeS7PGafi1GpRc6l5gufXtS4sy4nUgBJy206cjTWKF1y4Nn7DV74gV8LtjFdO4X/lg==
X-Received: by 2002:a17:902:bd85:b0:1a6:9ec2:a48f with SMTP id
 q5-20020a170902bd8500b001a69ec2a48fmr3688920pls.34.1683357625878; 
 Sat, 06 May 2023 00:20:25 -0700 (PDT)
Received: from localhost.localdomain ([203.212.242.230])
 by smtp.googlemail.com with ESMTPSA id
 jk1-20020a170903330100b001a216d44440sm2898092plb.200.2023.05.06.00.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:20:25 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: berrange@redhat.com, Ani Sinha <anisinha@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] docs/devel: remind developers to run CI container pipeline
 when updating images
Date: Sat,  6 May 2023 12:50:12 +0530
Message-Id: <20230506072012.10350-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
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

When new dependencies and packages are added to containers, its important to
run CI container generation pipelines on gitlab to make sure that there are no
obvious conflicts between packages that are being added and those that are
already present. Running CI container pipelines will make sure that there are
no such breakages before we commit the change updating the containers. Add a
line in the documentation reminding developers to run the pipeline before
submitting the change. It will also ease the life of the maintainers.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 docs/devel/testing.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4071e72710..203facb417 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -479,6 +479,12 @@ first to contribute the mapping to the ``libvirt-ci`` project:
    contains the ``mappings.yml`` update.  Then add the prerequisite and
    run ``make lcitool-refresh``.
 
+ * Please also trigger gitlab container generation pipelines on your change
+   for as many OS distros as practical to make sure that there are no
+   obvious breakages when adding the new pre-requisite. Please see
+   `CI <https://www.qemu.org/docs/master/devel/ci.html>`__ documentation
+   page on how to trigger gitlab CI pipelines on your change.
+
 For enterprise distros that default to old, end-of-life versions of the
 Python runtime, QEMU uses a separate set of mappings that work with more
 recent versions.  These can be found in ``tests/lcitool/mappings.yml``.
-- 
2.31.1


