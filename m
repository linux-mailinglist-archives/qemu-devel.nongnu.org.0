Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2102C7D91
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 05:29:02 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjao8-00058F-L8
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 23:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kjan7-0004iX-Hz
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 23:27:57 -0500
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:21788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kjan5-0000dA-1W
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 23:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1606710471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yubSQK+bCmGb0bgNOyVuBzrv8B+UwMKIcSEfo0sM1+I=;
 b=R/G1Hexa+LpRgXVJsF2ksnJv/4PdE1UCtFEornVZazsrpLGKjGxvQr7VBgwuA22NzbWV9U
 R/UNu+apZ6MXjv50xnjLwbitc+ehKqf/beEuf1amhFrV3HfcOz/O0eCOiETvb98F8Nh57u
 CxEZ6SdYcE89/ifI7MwtfSP+3Kb/iqE=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-KOv5UJDWMJSEtm5oGzw1Hw-1; Mon, 30 Nov 2020 05:27:49 +0100
X-MC-Unique: KOv5UJDWMJSEtm5oGzw1Hw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCwSM7z6AWwCLFQE3WGiuVV6app6L+FCfusMdOh7FfJie4rQb3PVkO9wYexY/DuBCsdxFfHt2nJmQ2HIT4buH0aVWDurqFyuiSuJGeqsgVCKcIm/JM0ns9+xhoPGRjpUNhdnStfjnR4TT/vDWugPyk0QjiDu4ypp835QmKHZNkGnFgBYJczpk67AChOV3uLai/wJ/O+bQRPzKYRr+8ErzwCaO7NItUHNm3a1QGRVv3a07l+9lUuMtf71g6K+3HEI3oXlfF9kSYz6ZUi59i4MlV4tz9ghPGbe8qe70VzQ5qIGppr4xmGw8/pReb6VWGCs2x2GE+XXkx8R8hduoMnYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k67sobDzvnbXOfYVs97bPZ6b22BxpqTry074WnEfncU=;
 b=XgLzuvUJAt06ExSPGp40Yu7CV3YqGLpD+n9biqgvSKxTeVuDzvhmn/Prugz6i02jA28U5XjcYT9V50ZbUuwxgVLy+VT5q87rIjvsjq1OAaOF7mzqj5CGaq34c2P9awRIa20z/YSER3ZARxtP3aR5aFO7pDGBTNL6c2NINQ3xAzCnrdeseOc25j5Xso+cncOUmCVP8xA8p8L2/m0HJB4rYI0x7vNaQujqVb+pzVJRHUmTpm+rXl8DmmmXKESBG4Iw7Y2rxO2/oR4k1E6hIi8lpKPGYVGU44Bk+R3i8lfXpZ84UmHYBZ6aEvWtJbeJU6+j0HK+iXzTGQaGp+Mtq+dO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB2990.eurprd04.prod.outlook.com
 (2603:10a6:802:6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 30 Nov
 2020 04:27:48 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 04:27:48 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org
CC: thuth@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 alex.bennee@linaro.org, fam@euphon.net, cfontana@suse.de, brogers@suse.com,
 lyan@suse.co, acho@suse.com
Subject: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Date: Mon, 30 Nov 2020 12:26:59 +0800
Message-ID: <20201130042659.29333-1-acho@suse.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (60.251.47.115) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.7 via Frontend Transport; Mon, 30 Nov 2020 04:27:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4733cec7-28cf-4d42-98b7-08d894e84a81
X-MS-TrafficTypeDiagnostic: VI1PR04MB2990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29901D43F6EF560F2AF47C5EA0F50@VI1PR04MB2990.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVa2b8/t3bxpblRozSv0qu+t/B7hW8H0OgZSBUkbvplkHoDo1BM9p/BiZlCvde0Ls42Z1/AHg9/lY6PW7tFgjW89Znp6PnLXYLjAu2ZgtH+nPxnk+IzUC5YEmKBf21e/akOR1TpehnKci8ZO0lPsrlF1lJ1BHVfIpWb0GdTeK08Jfz+FCg3fRPoaobqvNLFo6kBobqYxMv3xydWWqEGuUp6saF5DMJlkBn8+zSW3+D4Gw0oa055umdXm5w6Ng/JbVlpSvcHeAZomJGvI4r5QBvOSUcm/pKu+eQn0ViA8V6lBqXsFvKeRdT+ShaqQ9A9kipKamPtKSRk2U1gIKbwEQoNzuxGcpGXmVgbj8igaELjT3xWYkTiNHC8YW16nDLZw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(366004)(376002)(39860400002)(478600001)(6666004)(1076003)(4326008)(36756003)(2616005)(6486002)(8936002)(107886003)(956004)(6512007)(26005)(66946007)(69590400008)(66556008)(316002)(66476007)(52116002)(86362001)(2906002)(6916009)(186003)(8676002)(83380400001)(6506007)(16526019)(55236004)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U2GbgPf1zLdlo3KVCWCaoweHfXJRhUFEI5DXkVnqcKRuKLF3LtS/AWFkQk3/?=
 =?us-ascii?Q?GAlpXYWnKQvmr2Bsk2+asD8+JZbChspjqerdi7CllmqmLJU2UiIvKzMDtn4Q?=
 =?us-ascii?Q?QimX4DxLbVG+kJprOGvzx0UkiGJvWrT69YXRsaSX5StbrPlIrC5tpCqD7w5K?=
 =?us-ascii?Q?0cGxtTExgY0i1kZYdMgjE+4dSmwy1g9bUIDW50NA/krZkAWtFrvnAsxhxhZ+?=
 =?us-ascii?Q?pXmg5ihyCRGT1s7MAwPYJm/IE/yTBaSgkL13zDAelZzgQAvOplDTK99fm1qm?=
 =?us-ascii?Q?nt273qWYUgQhg5gMRCGLkZ4TrsBX1or/hOuJMdr+EY43tUHnno9NCo+YoVHh?=
 =?us-ascii?Q?JhhL+JKpW6y/tt94cxjptMvSy5jiDPZnY+OjNqkMglruWdksuykt40J7KzgL?=
 =?us-ascii?Q?KWuPQ71xZ4CVMOuto/nY1oE8GvJzbFjBs4NxGp9Bwn6mskiQpv1Z7aTpGR7t?=
 =?us-ascii?Q?aGQUI7N7qAmm7SzsH8hRconLa1bADvHcL4E3xrTiT+T1m2J7kQk9OeQc6ht0?=
 =?us-ascii?Q?CXZ9fkoiCFfH0T953g9wF9/HSlpT40zl7Wx7x5/L4vGNB/qBLoOoR4b/DaxY?=
 =?us-ascii?Q?8DDtuyEhRYNVWmBmzgtcS/u4I1BvP14GhbIdQa+HiiDjnB2Ph7orAUCTS4ra?=
 =?us-ascii?Q?WX9vDzgJgBoEgTaBJo1WKFPa68B07SGSRTtzXL2aRFdzDrJarptTFoV+olSD?=
 =?us-ascii?Q?J0zdsCStn4bNRZqDjBogynMSmBZJ01VSZoX0M/au0fTN86m10z/lLb57VtrK?=
 =?us-ascii?Q?uKr5UuQ3qpAxPOpKWCnQcDUnjN/+Ns/ifhneIofzhkKXT0d77fYcURIdBS8y?=
 =?us-ascii?Q?O1WFEdrR8upFQVST0w73RIUj8DNgjFmlIAbGIuuvAt85Z2VKTn31VCDiGx1X?=
 =?us-ascii?Q?Wub9nwrEjPUJNQ+e5yWdgm38xnhQdQlk12hQr/HSVv+858PCscLCQI5ZI9n/?=
 =?us-ascii?Q?QMOKfm/BL9ccyO4H0hHqYsqOVTDgPrZNXKmxXcb8d7DVg3tiGn22iP8GQ1zi?=
 =?us-ascii?Q?SPwV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4733cec7-28cf-4d42-98b7-08d894e84a81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 04:27:47.9434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzNhoDgbh+XzGRcb/s7jyiglADMO8DafmK6FOxJ/jR/7AyVhXp2sV4PjtXdLLU/V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2990
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


