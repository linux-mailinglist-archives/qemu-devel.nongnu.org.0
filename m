Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89468D5A8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMIl-0001v8-RO; Tue, 07 Feb 2023 06:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIj-0001uP-JY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIh-0003yW-Tf
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DhRlWkcnyhGe1IgwSPcvSqZaY/VzZisF6GMb5saIMF4=;
 b=GXW38Jyk6bh7YQO6y3VvdXqs5nxslZq8tg4Fa02KDam5pk1K4FAIIglEAduRDSgFnnl1VA
 WPofbA/9YOSS7l4Pv6XC2fGXnh9SihtmI/z9SNMnZISLtCmJGUrziSU0Shf4Bvtco1LkQr
 gKybIvi8/Tyswg8glDqVxAq2TdkzmVA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-20F2qVDWO3upVdUuDYZ9hA-1; Tue, 07 Feb 2023 06:38:12 -0500
X-MC-Unique: 20F2qVDWO3upVdUuDYZ9hA-1
Received: by mail-ej1-f70.google.com with SMTP id
 he34-20020a1709073da200b00887ced84328so10990367ejc.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DhRlWkcnyhGe1IgwSPcvSqZaY/VzZisF6GMb5saIMF4=;
 b=0p9Ry+JEYDLxGsGBOENHWnU1/u5gCzixQIXcpt8R3aqBk/CgXc28VM0kM8l5r8x45c
 IQIe8j/SmGB86/FYxRUtvytOeYWHV/8VMsfVqtI0xEtSq95eOlvxgTUZF0wTm74wi9OH
 u4hNHnQLQJXR+y7sciWaCOMCuoXmsSgpJEK6+1od+eHLTgSwrfzNy+yEvtNyqCrfD0WK
 IQGeAOYY59Ocnm/A9oQxUCNm9pCeX0Klm35RrMaSAuJq1g92wRF+5C9NOhzRe2d5jDwJ
 nxdI0fqvYqooUiJtpJwOjvSgxlrG5wXnw5Le+eiOUvLrZnjRDInIL40QWltJZGvykeG0
 e6EQ==
X-Gm-Message-State: AO0yUKWlBqzMeAi8ae9mmyQjejpC+LS3WdpmrUJkUHza51TU/WuXBJP7
 CjNUNulhEG3y8yyor0V9JDHnpXnv14pesQQRi5BcuhFp1Q1iAQpSNz6/ep0GiAquUqVWXh8u2SY
 gY81DvYHki6ocku8tg+I96UKoAxowHD9iISAPKCLXxOoF/bcmZgg7AklicAusbqhnxwDHZeGG
X-Received: by 2002:a17:907:2c66:b0:88d:ba89:184c with SMTP id
 ib6-20020a1709072c6600b0088dba89184cmr18843024ejc.29.1675769890411; 
 Tue, 07 Feb 2023 03:38:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+88+9ueU5nXyUh1XR3JLh8PydSu+Nrnob5rCVMkZnLfEXxmgc8CZDpxQNU3aktWlF5p079YA==
X-Received: by 2002:a17:907:2c66:b0:88d:ba89:184c with SMTP id
 ib6-20020a1709072c6600b0088dba89184cmr18843007ejc.29.1675769890134; 
 Tue, 07 Feb 2023 03:38:10 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170906498200b00878803d4049sm6795750eju.93.2023.02.07.03.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PULL 0/5] Update CentOS 8 custom runner to use Python 3.8
Date: Tue,  7 Feb 2023 12:38:02 +0100
Message-Id: <20230207113807.67322-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit b52388129bf0097954515c097e83e6112de1b579:

  Merge tag 'pull-tcg-20230204' of https://gitlab.com/rth7680/qemu into staging (2023-02-04 19:12:41 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-py38

for you to fetch changes up to 11b4a4eeec6054161aafdcb2f2faeb7c6ff36c99:

  scripts/ci: bump CentOS Python to 3.8 (2023-02-06 13:21:28 +0100)

----------------------------------------------------------------
Update CentOS 8 playbook and CI configuration to Python 3.8

The playbook has already been run by Cleber on the machine.

----------------------------------------------------------------
Paolo Bonzini (5):
      scripts/ci: remove unnecessary checks from CentOS playbook
      scripts/ci: support CentOS Stream 8 in build-environment.yaml
      scripts/ci: add capstone development packages
      scripts/ci: unify package lists for CentOS in build-environment files
      scripts/ci: bump CentOS Python to 3.8

 .../ci/org.centos/stream/8/build-environment.yml   | 38 ++++++++++++--
 scripts/ci/org.centos/stream/8/x86_64/configure    |  1 +
 scripts/ci/setup/build-environment.yml             | 58 ++++++++++++++++++++--
 3 files changed, 90 insertions(+), 7 deletions(-)
-- 
2.38.1


