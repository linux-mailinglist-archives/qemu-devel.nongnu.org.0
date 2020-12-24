Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5B2E2595
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 10:01:44 +0100 (CET)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksMVD-0005xU-GT
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 04:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ksMTa-0005Pa-H9
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 04:00:02 -0500
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:49821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ksMTY-0008PF-1B
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 04:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608800395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZwIGYC6HQ1+Z+UvPUe3VXKEJVm9kmh7+iARIRgfBYSQ=;
 b=U4RG5Fi05pvRlPSjb362HPsSA6QGWt5MJkV5Oq5drER45WsHrXUxdJFZj5yRdva08FYMXC
 9wzp4T7Vi9e9n+3BhsGpSOeUx76lp9rWao8uWkhFmu8yK2/XYggl1IOMu//A1EgS1V3MZf
 yN+LwXWhVRgdMvVFrQWJmVVBUqT5rFo=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-3zsGbUy7MFC-XR_s91RPMw-1; Thu, 24 Dec 2020 09:59:54 +0100
X-MC-Unique: 3zsGbUy7MFC-XR_s91RPMw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efc20uVPnukOmTLO1TUsQBaBshoPSmc++kXu3EIN4xrgNN79qFALFCtkddhwaARiCMYrUNUdQNWw7TbyuHh+CZhb3ASFvjKh7unuHIug3t1ZSWro5ymN3N2xYjjOFboHkZBAzx8jfuUbgyPVzFwm4HHg0MHtpSiPu+A+V2oCtsXug1HSJ2PtoeVcA7g/yaKJAKTYqtC87oW8XDb6wxBf63btatrKaH9SMFtpUUkMkMTRHIKVutfdry7C2lvJNItb4d2Bn9b9w+0zHxVXN9L9wdqqQDZg39Fi+ME4WiJ2HIPMSlgMmFJxI8LBLkITDRPVtGq/GXKfDlbu9zaLEkGJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebg5qR2pTMWsSgCfriXCrUNdEYAAkyVzJ57NXX5GQMY=;
 b=EDxnU5B7pDCG301KJLjGCfrXgQrbnTi/S/KYUQg82T11DZX5o5Bg6bKoWUhVmz595FcC1IcuDDM7nOCmzsRZzNLsBmNOH6SQosqq3oDTrPNLxb5zuUajmMJP7bXJrS6V0VVi++z1ilcpOUDgTeRO0VxEpqDB7n5CPjWyylReSQ3puMJNTWc5i7rMpH9cLG8O9B1XTJ2FQEB6TpH5qVf8GKucBGtadgD7+ghLigcdl6oRl/77cfIEKU5MP7Xb00lBuyZEhRmSW+D1MlE/ROPBQUehNElBB4B3hvclSd4uM/x+EntSOo4YAlyTuidBDOoL3h0BUvxTKZnSI8v0lcf/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4302.eurprd04.prod.outlook.com
 (2603:10a6:803:3f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 24 Dec
 2020 08:59:52 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 08:59:51 +0000
To: qemu-devel@nongnu.org
Subject: [PATCH v3] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Date: Thu, 24 Dec 2020 16:59:31 +0800
Message-ID: <20201224085931.20465-1-acho@suse.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: AM4PR0902CA0016.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::26) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-vvou.suse.cz (60.251.47.115) by
 AM4PR0902CA0016.eurprd09.prod.outlook.com (2603:10a6:200:9b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Thu, 24 Dec 2020 08:59:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e489a9a-7b3e-4eb4-0287-08d8a7ea466f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4302186F9F504B2B8EC16407A0DD0@VI1PR04MB4302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rg47kWPsBRIGIgM2zyZ6ri8tXph5Nrn8+6qnNAewVgxd3Wo2AVULuYvWb/deO4lo2LUzSq8tTGhqUmQwMl22jRa6gX2N6ErT1NPxKxmgLXHZn/ukHTcMcW8gBe9jpDjMjz98cN/XfTc0hhwOp4Y/6rCwuq4tsZk6UE9FkQu2NPXwaCsWBb6ZU8N3URQ81CaEOVKHmukZ49ypGwA6bK1whm60rGkX/GCCjBhC5QwA6gsJ8HgYlQ2OH5rEMqwAwxD0gno+upbRJoWchFewGOjF7f+HZWxmB4arV3mwgFBq8wxQ3ZI0p9ElRh9K4Ds7UhccF9DvXOuXFrE+M5tktPE7oxPbmMmh3FWfL9unraBaOij3bTsgA5zcWYo2zlglM4HaDtI6fMvrlEUULCSml376gQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39860400002)(396003)(136003)(366004)(52116002)(66946007)(86362001)(66476007)(6506007)(107886003)(956004)(186003)(66556008)(478600001)(2616005)(55236004)(5660300002)(1076003)(36756003)(6666004)(8936002)(2906002)(6486002)(6916009)(83380400001)(16526019)(4326008)(316002)(8676002)(26005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sTE5NXRgVqMHKx69WAEb3n5VF3YdwOr8ZPdvWS20+RIWFl4z7qgG0kjBq88C?=
 =?us-ascii?Q?NKPmIe27Ce9sDgp1nswLc4XzYv4XIY74GeWO+24jtZcniWsPX1+TqBAIE3Ob?=
 =?us-ascii?Q?ThdHFXdGxY2fbyCLjWXkwIhpRh5YEks+l+RLJfJiDsi3vkZPEaqH2HkaeDwz?=
 =?us-ascii?Q?cArE0t+G9DM8iy3Z/zh8Ln4djuE2PeAXCTPApWEHbsG1obmJ++OmbAXllLYw?=
 =?us-ascii?Q?UtE6OXExk8ToyJiUo9puVHkOyJLKoyqYaCUEY3PXZSf2mI7E5C+wBow2Zi52?=
 =?us-ascii?Q?Fh1GTSXndaTACIiOCGz0k4/CuTWBXCsLfB2SQ5FLrdFE77yhWlWKriywqE7C?=
 =?us-ascii?Q?j55guyFT1StdVW6mKb/u7cd0y1KzB3A6vnvua3QXp1Km7Ah1nD58m7glwdCi?=
 =?us-ascii?Q?MgUocyYhr0IfpqE3RUOBuFEB3rbdSxVlT30+aYm5V7AYw8Fb+RZ8GEnO5sgR?=
 =?us-ascii?Q?iMWKVQbcXHfQwNRbQUym+nzFJvDgEF8L++6zG3roJj5HjLMm0lfwjOqrT5aS?=
 =?us-ascii?Q?szFd9iQfsBq6w+0RU3Y1a7bTeQ3NQMROCMiyFrfJlZUivNL+2QmTYNeoRy9k?=
 =?us-ascii?Q?5lkOFSy9AKUml0o1tGmd/c2vKdpaI3+Hqqz2JQPMBpSRp1uL3CTEXrbqakQ+?=
 =?us-ascii?Q?VFo8OQQBHca88yGshWHNozJEDL001kiHCbA/lwWL/En/u5C435Qddrusd34J?=
 =?us-ascii?Q?P4fswm4h3r06u9z9/s/UxotwzBJ7gZ/IOWU/IqlsxWbs/C2CRAzJA0WR9xVZ?=
 =?us-ascii?Q?UlwFTiizB16R/uTxyiMGXmeXxDFgIOvJR1UMjdvposxSKC0xFSW21pZJGVOO?=
 =?us-ascii?Q?PMQaBm7LlhaswiKy/QxwHAHCy1SBrehCr3E4TvRWwmNQGm/4gLcOApFdOWr5?=
 =?us-ascii?Q?mNpLwM568KCuky/ryCxZZFV/7uiihDFTGj+EkHc5/qGuxKKPZE+jBCkHwiVs?=
 =?us-ascii?Q?csTD2l5fKlYlFw1EaZA2NGGg9gsOij2OVAUecPXj8v7xBwaXF1XcXlOXJHgc?=
 =?us-ascii?Q?YCMa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 08:59:51.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e489a9a-7b3e-4eb4-0287-08d8a7ea466f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHbeERzf5Zb18GZI75JHpxamF6xJf3B8ejDK1Zb/NAuSug9FuMNnBnTqKuQeAi3U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4302
Received-SPF: pass client-ip=62.140.7.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: fam@euphon.net, lyan@suse.com, thuth@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, brogers@suse.com, cfontana@suse.de,
 alex.bennee@linaro.org, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: "Cho, Yu-Chen" <acho@suse.com>
From: "Cho, Yu-Chen" via <qemu-devel@nongnu.org>

Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.

Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
v3:
Drop the "acceptance-system-opensuse" job part of the
patch for now to get at least the basic compile-coverage

v2:
Drop some package from dockerfile to make docker image more light.

v1:
Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.
---
 .gitlab-ci.d/containers.yml                   |  5 ++
 .gitlab-ci.yml                                | 20 +++++++
 tests/docker/dockerfiles/opensuse-leap.docker | 54 +++++++++++++++++++
 3 files changed, 79 insertions(+)
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
index 98bff03b47..a1df981c9a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -195,6 +195,26 @@ acceptance-system-centos:
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


