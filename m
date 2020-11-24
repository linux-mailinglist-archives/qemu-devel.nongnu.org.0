Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42A2C2210
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:50:34 +0100 (CET)
Received: from localhost ([::1]:47168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUy1-0007Oh-CP
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1khUtt-0004mS-B7
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:46:18 -0500
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:42075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1khUtm-0005C3-Pq
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1606211166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yubSQK+bCmGb0bgNOyVuBzrv8B+UwMKIcSEfo0sM1+I=;
 b=R3EtzmUzKVEmoTsIBVg6JpAiX8znZznOCCHZtUJuOWv2FYNrFi+TdnOO/3uangkR+hLRGH
 tpXDAJ/CveoLhKynAnc/SxuF0ZROp1TE2iIksXtAX+C/vxDNDCJ5ZM0umxN5R1LLHEQymL
 SS26eJHUrrhP04ZUVfwGpyauezWL278=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-Rdsvi1p_MnSXmu208dYSzg-1; Tue, 24 Nov 2020 10:45:55 +0100
X-MC-Unique: Rdsvi1p_MnSXmu208dYSzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNre/6zAlBn20Yfjz7xgFWjravKkYUT0kxaTRTLyazCQ08dGVmF4RWBucilcCkA2OByPt/ncTUCUx8x+IE6N4EOJgX0TkoVBRZ1HLTKbldIhB4eCNPokjHTLRMkT4IDXxP6vCWzrFveuh3AV15KAlkZFvlalNGGzKVkud63XwHyIqrxf5gPyH/jER28ioepXePx2ONqxhr9P52riLCGQCoycoueZikTbzLkT6RYMKv3Rqvy8bryz4ycPK2Fbh8uYVSpPpqJT4WvQUysS85foOszzJ22k3ncAyO+wFLGSn3CfpxqAJVsrlQdU35YIW7ykIvabCDCGIvSttWIKX1sJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k67sobDzvnbXOfYVs97bPZ6b22BxpqTry074WnEfncU=;
 b=Hsfl2rYW2EIz6StSyQpozAOiHGdxa7m8egKSADcA4h+/pbAZfgfo4WoN/UrJNS6KmjgccxavUV8UPzBozthxVbUy2pdzEtNqX+CIwOVKhM6me8xUk+rVpbO6hhOdjzF7dU6313N8eJtzegV5x9lNvB29uZqIhRaWGynccSWE+MH//ML4EMP1o3EzbOWj+woQc8ZBCBVwjf2cSnY7Ai+/wWKfEq2AmakOMklE/pv/bVMXE0Uzp9xYZRfQ3sg/Q43DGnREyP4Kx3kHmV+aAwG+rTr8GVhZUJ9DoF5Qlw9pcqk2XGQlWQNlqWdw06JEdpOzZdNMNPdmFFecX/cT0iV+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0402MB3327.eurprd04.prod.outlook.com
 (2603:10a6:803:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 09:45:53 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%6]) with mapi id 15.20.3589.029; Tue, 24 Nov 2020
 09:45:53 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org
CC: thuth@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 alex.bennee@linaro.org, fam@euphon.net, cfontana@suse.de, brogers@suse.com,
 lyan@suse.com
Subject: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Date: Tue, 24 Nov 2020 17:45:35 +0800
Message-ID: <20201124094535.18082-1-acho@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116113046.11362-1-acho@suse.com>
References: <20201116113046.11362-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR04CA0079.apcprd04.prod.outlook.com
 (2603:1096:202:15::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (60.251.47.115) by
 HK2PR04CA0079.apcprd04.prod.outlook.com (2603:1096:202:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:45:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f451a1-a8cd-40a1-a646-08d8905dbbcc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB33279352ADFC7B320CDC4C48A0FB0@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Smu8qQZpeS4NUomIDgoVRZ/4Hf/PGAWgbbN3lnlEU6swPlhbSl64cy2VsL68jIkjTQOQur9rY2ayX4mwxmTN4EzqeBrqrpJaRXBNa4TNZ4pyMBV30ld56OHrmQTH7Z+ssWMAIQZIfvEobQwUMZRjjAMAdXXYH/Qj6vgjDemCUB8gvq7JwvqaKnb5Rzl851nHGaHvCy/VuXnRYksQAn6BKP31tp62d4XsQvcI2ZNerp/QFNCguuYNRv2hwX8SkQc5zuqlt4Szu7pKzB/eAkx4qTfAgud1E5DytnFOqU/gr8ZsAbYdsQvv6E5Tr3tve5wbe+2LA2Ehxk/Ukb73qksBn5I8Othq231xGBd8Fn58zd1A4L1XWa0DZwPsTpAxTMP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(376002)(346002)(136003)(478600001)(5660300002)(6666004)(6512007)(52116002)(1076003)(66476007)(107886003)(83380400001)(2906002)(6916009)(66556008)(4326008)(66946007)(6486002)(86362001)(36756003)(8936002)(69590400008)(8676002)(316002)(6506007)(186003)(2616005)(956004)(16526019)(26005)(55236004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FcP8LD8ydRBHbeCy5FMs9kmLzwcYesrBPtx0guu3LsMM6sKR76XL1+hldLN5piVw6H5qdyg5TtimMNdr2B3jMLWmNunAk5kcHNxQZfA+Tud+Dugw4sDEHbZb5CwhPhyUXrR01qwPCR0EXn1lkW3RpMmVUj0x7TVLfRXUDdhn38Va1TbH34J4cOaSQuN2hktVBn3DXoYzmKsETwm9nkg9WZtJSiZvYcmUqg2jJt96aK7XC3kLOrC8Jlekpg1z3odH2nO5i/QjFb4jzolM7vUHMAYCBEf3n3gfn7yt1Fz560Wz+uHqxfuWQ1AB/x/e0TjoJNdx3cCKuTaXLebnYLhTybalHgeuGqrTdjTjywVrwhWfRMUyikNaYSvpHfAG4BRcKIT9NukPBgYawGy6VeVOIhCUtd13kG1yFNNs5CQLunTEgPz+Mqo4Y3xyx6eZbhZ3XAcuKLescsQCwez/tb2Uoyc1DQhNCWbwWFGT9o+7J65LFGKYWAtNkQWaOTjZ/BXCszLba4X0gmq7WJkvOfd2WGhZkC1Ck+O8ZYm08gf1uBv3yd8PiFZmSDX/ArtGPaXkwhl9PT8Z0RH2RvQJNmOqwZ80lV/yAUUEO3fclJ5GmJDo5Dw8i+c+c9qmAvaZR5iebLHzPbDibQXdvgT6s09abm2Zkj0r6BWdaylheE9KOqqIoPZpZ/ZunP2MUdGA9hk/T8wN+Pir8Zx7nz+ktsd64UulJsIUhVO20oW01yRYRIUsDFAHVKrlr+i/+GMa3Q2KPIePF/joH6JPE0fX6SCb5lzuA/CazdVXIG3hemg1da64o94iKbVHV6JbDLZ846GZnGHj9D/W8teNKnRVwIYnN3RBdRq6ZkcMNqTE1xp6utFWiBfQW5d35hmAXZuSSM5tH4DwUMa+vyXN/+uF3tgOOQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f451a1-a8cd-40a1-a646-08d8905dbbcc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:45:53.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hv2dezsDbesm1N2s1xv5muuQqvt/g1zaHhZam/+w6fCk9nRJbK/vutqcv5XIVmQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Received-SPF: pass client-ip=51.163.158.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
Drop some package from dockerfile to make docker image more light.

v1:
Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.

Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 .gitlab-ci.d/containers.yml                   |  5 ++
 .gitlab-ci.yml                                | 30 +++++++++++
 tests/docker/dockerfiles/opensuse-leap.docker | 54 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 892ca8d838..910754a699 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -246,3 +246,8 @@ amd64-ubuntu-container:
   <<: *container_job_definition
   variables:
     NAME: ubuntu
+
+amd64-opensuse-leap-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensuse-leap
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b1..6a256fe07b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -195,6 +195,36 @@ acceptance-system-centos:
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
=20
+build-system-opensuse:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensuse-leap
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensuse:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensuse:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 build-disabled:
   <<: *native_build_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/d=
ockerfiles/opensuse-leap.docker
new file mode 100644
index 0000000000..8b0d915bff
--- /dev/null
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -0,0 +1,54 @@
+FROM opensuse/leap:15.2
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    cyrus-sasl-devel \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    libaio-devel \
+    libattr-devel \
+    libcap-ng-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    lzo-devel \
+    make \
+    libSDL2_image-devel \
+    ncurses-devel \
+    ninja \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python3-base \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    usbredir-devel \
+    virglrenderer-devel \
+    xen-devel \
+    vte-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
+
+RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
--=20
2.29.2


