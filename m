Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED32B5A02
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 08:03:57 +0100 (CET)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kev1w-0007Wa-RF
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 02:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1keuwp-000435-6L
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 01:58:39 -0500
Received: from de-smtp-delivery-52.mimecast.com ([62.140.7.52]:38963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1keuwm-0007FM-Ox
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 01:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605596314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVp+9S2TOIrYglfVkn4RiY2iuu688JFFkCPLs/r+SvA=;
 b=nbTfEmnCrlgbySOVjk9jWwEqG7WWO61GVP0xmIVJM4pkKDqOqnp0Frvw8e22nWG3UD98mU
 N2mIo1h/BN94U2pmgwtnCAP4UzM7Y6pJPo+5XRKope0wtYS2V05/a5mwtCR9UWqTZ+oNlw
 EykRCzEiJPHAAVM4fpfz8jlc37QzinA=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-oLTvaVr-Mvm4r_brynBIiA-1; Tue, 17 Nov 2020 07:58:32 +0100
X-MC-Unique: oLTvaVr-Mvm4r_brynBIiA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjzeaPKoQ1T5aDjaP5lcwPPukVCqL8c8Nr75XsWck7qbMJ+TE+OtKl67hffz+C1uhHM6+1qXyIET6E0B/Qq3H6pKHjVGXX3sqHhBKwRGknWvaBL/Gf4LBhzcnci50bc1D+7i9m/1lGbvL3m9Z0gltD+qyneesfr6/NUWFSlzG7FdGIxy4xZ3kAa9XAWhEsroN6iXZkeaX3zMhI1wcVXrHvKLe6iMxXKoIh9unoISdf4+LlZVyYy8FoWnOlZgPYUh1CUagN+QflgJuwa8YFNaJu/+hCXK+CA/ha0xHMpzwYlipeGztkHPMQAzeuI/dYZ0O7aQiwnE8DvYP3SluR/MMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On+KaHsTH1VlI+c5vUDpCVKH1ZkonH+Eqgl8ejFngDQ=;
 b=cl9fxxj2tNEVlZFsBm8G7RGlPFRN7/+viT6l3J/4b6UOl6o8b3ghZJeyHcixKH0AHnGnYkpsSNpT58i1l7xxvbzdjjsTMsaST+b3hztj4ceT/7eETLYNVTu1kk1NxGuhrPkoXjX0Yz7pLyoww6CL8Z1uwA5vUJgxpP/LLepEEBYHw7IcWw4gRa/Krwj6D863KEfcVD0U1aiv4eu499w2KHqt9Au7S0XT/T+lNygvN4goZsSFkAYaVI0goHsdgr0YBgHgQxX4RX6pLd3/+c8mfzoFhbUrweQ8zm1cNvcNAVq5t506LdFQ7OF/PGFKXQ4tfyXAizuOVkTb0t8k1Ree+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6446.eurprd04.prod.outlook.com
 (2603:10a6:803:11f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 06:58:30 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 06:58:29 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org
CC: thuth@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 alex.bennee@linaro.org, fam@euphon.net, cfontana@suse.de, brogers@suse.com,
 lyan@suse.com
Subject: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Date: Tue, 17 Nov 2020 14:57:19 +0800
Message-ID: <20201117065719.30150-1-acho@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116113046.11362-1-acho@suse.com>
References: <20201116113046.11362-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR02CA0176.apcprd02.prod.outlook.com
 (2603:1096:201:21::12) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (60.251.47.115) by
 HK2PR02CA0176.apcprd02.prod.outlook.com (2603:1096:201:21::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Tue, 17 Nov 2020 06:58:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75d61a4f-f4cf-4351-7a73-08d88ac630ad
X-MS-TrafficTypeDiagnostic: VE1PR04MB6446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6446E24530CECAB7B17D22D7A0E20@VE1PR04MB6446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJyv+Fy7Xp53D29Tkc5naRP1WhXM9+3hj9RCTxSMU/zBxOMzsuSC5n3Zcj1Q5u9rjrjayC71lMlgk5ZRdxcZMP5gj9XRSNVuQ812w2dOwiuFaKtUz9f4k1nyB7lPA1frx3hYP259Gq/c/iT5WtA/Iazbrx9bYu0rDh8jOtrrEf/QFKlxOX3DbcnZ1xYvvntO9NqYKCSgS8vM2PLplonpJv/Qrl7bMMbtHmsqb6PZm4dBalM5YBlqMa+qw0KCuRsq/dlivzVx7sBgD9Z5ItHgTIwiSGqFhZdfCUvY/lowpZ2EC6tCvkCCl7li4lhGw/DFHcv/IoCbvTRDh/DpQDpjB3K6RPETHL6jcnDBUYWER/GdGzs/37YgVscJkMB7I0nl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(376002)(346002)(366004)(26005)(1076003)(956004)(2616005)(6666004)(6506007)(36756003)(8676002)(186003)(55236004)(52116002)(316002)(16526019)(6916009)(6486002)(5660300002)(86362001)(478600001)(107886003)(6512007)(4326008)(66556008)(66476007)(8936002)(66946007)(2906002)(69590400008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Wf4YRM4OTAapsCy+LGNygnCeHzKe4mw5YklbLubh1cl9L9pzBdUtiUNhLMtStkTUhU/4Qfn9Uq6NyWAG/r6/1urRL6glMwOUO+9rKf+piHCa0b5++Lf7JcrGmLmBlrtnfqjy41cmBjjVUTFsEEBli31bV5+6gdHrkFeYI2F+wF7hyPz4bneUOl0mKjGrHME/L6xlSDpao6tw6iUKPFqQ2SeJTQeHR2Jfi+X50e8ughppdAZaSaM8v+zJKB99Fszvk3iTEPs48rUFKRx2VIID8dJYsIw1x/NZAPdwOFjfq0Hk2T+kWYrWAFYhZ469vKGjCT+MKJkElvM/tQ6TkptSVRiSAU9i3dslustij9Vev8aNg/LBnQ38Ormey8Zd4876m2HykilCuBq4tbsldBRA2rzRFET35Lxe3bH8YmMqlHTLrS+bIcBWQ8XcBtMWWGBZxjYNm9QatXX6CcIp755da9e4oL0tyDrJu05kiDhZmftzeK/ZwNNRydYaIV62pU2f4YUkMMouYy4X7PaAqMIAA1JpDt6ygDuyEkSo3PUPOWZZjaC9RXPw7fgS+B39/mgMega9Getq2WpeuFXukTCHrQ9Inq6tNMoISV8mTO/0RMKsEB1LtWfhi1hOtelfoyT0Xz5a/BXwXxBEHDCCcUb9qQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d61a4f-f4cf-4351-7a73-08d88ac630ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 06:58:29.8827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fk6qLnB5cYXaVEsgPIhHqfTOXVLifB+cWdoGrgNrsLzz0z5HH9y6L2xdEHATxeKv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6446
Received-SPF: pass client-ip=62.140.7.52; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:58:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Add build-system-opensuse jobs and add opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.

Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 .gitlab-ci.d/containers.yml                   |  5 ++
 .gitlab-ci.yml                                | 30 +++++++
 tests/docker/dockerfiles/opensuse-leap.docker | 88 +++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 11d079ea58..082624a6fa 100644
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
index 9a8b375188..bf4759296a 100644
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
index 0000000000..712eb4fe3a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -0,0 +1,88 @@
+FROM opensuse/leap:15.2
+
+RUN zypper update -y
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    libzip-devel \
+    ccache \
+    clang \
+    cyrus-sasl-devel \
+    dbus-1 \
+    device-mapper-devel \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    hostname \
+    libaio-devel \
+    libasan5 \
+    libattr-devel \
+    libblockdev-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    libubsan0 \
+    libudev-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lzo-devel \
+    make \
+    mingw32-filesystem \
+    glibc-devel-32bit \
+    libSDL2_image-devel \
+    mingw64-binutils \
+    nmap \
+    ncat \
+    ncurses-devel \
+    libnettle-devel \
+    ninja \
+    mozilla-nss-devel \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python3-base \
+    python3-PyYAML \
+    python3-numpy \
+    python3-opencv \
+    python3-Pillow \
+    python3-pip \
+    python3-Sphinx \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    sparse \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    usbredir-devel \
+    virglrenderer-devel \
+    libvte-2_91-0 \
+    which \
+    xen-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
+
+RUN zypper  --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
--=20
2.29.2


