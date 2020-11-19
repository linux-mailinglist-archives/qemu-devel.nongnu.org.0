Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4C2B8C7A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 08:40:15 +0100 (CET)
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfeYA-0002z8-FJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 02:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kfeWB-0002P2-EX
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:38:11 -0500
Received: from de-smtp-delivery-52.mimecast.com ([51.163.158.52]:53408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kfeW8-0003GD-0T
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605771484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00SE26c4hYV1FemUbBE2JKhKoZl3v8bkILqjpXxl6bk=;
 b=VeRAz1HTP1adWtxwrdkTWJbwizv6cpGYDD4Lk1prYJ9Eur1Sbr37NEV0LUxgR1V3lqXFd+
 OS1UtAMc7GEC4UvL6YQoiSRjV6LVQNM8dGInaI3AqepI2IqolE8oL8JnoH6Zgwf2oWT5q7
 s5uxVNrOZvVjjAaBZThrDpdt++WVfRY=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-7-KE7n_VPaWzvfn5vm-b8Q-1;
 Thu, 19 Nov 2020 08:38:02 +0100
X-MC-Unique: 7-KE7n_VPaWzvfn5vm-b8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB6KhSTuwzyJ0Z5rDpwJ88v5jjJSHXlADm6/0MkLY7Uh3KWr8LfTs0SzTUDjdrDsqmtj0vO0VsS9sLJOeZnI0UYk8NS3XqzMcHMMPvDg5RbxetnadXNIiyqwatBFtoEeXawVzFPB8FIhdTDbi8XiKdVzJ/hVxW0rp9Zj5vW+K2S4t2Q7/JYRZ8U/One9IzKIbWa3zNQF7TQ4RPqL79zKs668Lb0xdPEbDZ0mH0uMRRhzLfXtAIOXglYFfdl6cmX+5Pr4PTAneJ6Rcze8G5TGIrqQQ/2VttG2S1OJBCbNxuqcTUh8hwGtuoFpQ8tDIsT+pRiu6BSlPT3JfGxOEEdllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00SE26c4hYV1FemUbBE2JKhKoZl3v8bkILqjpXxl6bk=;
 b=YjqlMi5Fni+akVQki6g6p1puMApAGlayRMjNRoWxejlCCVRmdnO8Jn7f8aC4deUAfyYBfvlSqh3GspSJ6DBPbF1NOPwJCKuYfCodSMJ41HeRqeXVzRguVkNHDzWpy5ORqjhVtBD7yW4YIvGUqiG3n7gEHMOZikLQbzwmb5F2tt18woMZU3iyGpqP4trTYWA5FPytaQIP/nnJ30Ro8q273s3NLUcHxuNFcjNusTyw2//PK8vbiIXdJQf7mH30C73mMVhqc69kqDxs3M5tf3C8PSziZSMF5Obgz2lTr8IAE/7njrfYVnHCmmCsHfj5mLPmAktOM9KASXwW6cXtjUYZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6446.eurprd04.prod.outlook.com
 (2603:10a6:803:11f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 07:38:00 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 07:37:59 +0000
Message-ID: <d225bed3fbd208b305cf79d7a8c5e108db53e655.camel@suse.com>
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
From: AL Yu-Chen Cho <acho@suse.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: philmd@redhat.com, wainersm@redhat.com, alex.bennee@linaro.org, 
 fam@euphon.net, cfontana@suse.de, brogers@suse.com, lyan@suse.com
Date: Thu, 19 Nov 2020 15:37:50 +0800
In-Reply-To: <877a38a0-0f39-eba7-618a-658f16fe56bc@redhat.com>
References: <20201116113046.11362-1-acho@suse.com>
 <20201117065719.30150-1-acho@suse.com>
 <877a38a0-0f39-eba7-618a-658f16fe56bc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
Content-Transfer-Encoding: 7bit
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.41.170] (60.251.47.115) by
 HK2PR03CA0048.apcprd03.prod.outlook.com (2603:1096:202:17::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.9 via Frontend Transport; Thu, 19 Nov 2020 07:37:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7efc36e9-5648-4b68-759c-08d88c5e09f3
X-MS-TrafficTypeDiagnostic: VE1PR04MB6446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB64462C979A3F4C5893836097A0E00@VE1PR04MB6446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lh1ql/j6K8KH/iECR17xxs6KJc2lCmpZREamZNp2kfgqDzfxoux56yBo4YfwI7nQHYfheQ4oKmNWFw4lP7AnAjbKcIKoB1PyJNvXcx7sMsWxvtdUF7xXFJ0r+WZuYo+T2dqH4ZtiXqVVvJiVXvv5Yq+0xNBl7m7nrtjeX7VkJmevFzQWfbJ9e5rpEvTD1aviY2u9vgwZfjAxzcHw+S9XU7hSzpeo46e19B1KA7IkvIj9Ynp5Y1qJMYrDpwdxbzCuN1SAeeVoZtm5IeLrDw3TunqmnSGCfegq8ol4DQRjOT97jgZIj/anPte5iC000faS1dQ0cFYtVHF7IvkMY0Hi+qquBpmb3HDMWmRUO7uTnRyc7QF65s24KAcM6uiUY5Oj2jp4wVBgHaX5tHSLzqF9MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(66556008)(6666004)(83380400001)(4001150100001)(8676002)(2906002)(52116002)(956004)(26005)(55236004)(16526019)(6486002)(186003)(2616005)(8936002)(316002)(36756003)(66946007)(66476007)(966005)(107886003)(4326008)(5660300002)(86362001)(478600001)(16576012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yHu7XDStYhjaa80qSafbEEcTHD5/Ie/bES/h3sXjMtLKLUrjw9ukLmJLbtaCpTqZuxC4KUsOLhY5grMPOMD3RkuGfHZOWZA9/rPiAvmVPpFxF6ozOwVBB627xfURAOqcZuucBA/t7amCQjhiNEv9xDtUDGaJKRrjv/L4AUaBvcav9Yk7cCNSoDggYR1DQ+yKWzQzGeOHulK2701IMZP4HvadjAcy3BVHTsRNvrOHdKy80a7v2cwamxeFsD0QY4fB8GYtX7G4l8TwLLaQUllVVPVUJSEC9yMmYQv1oATZrL19b9kAH5xTIrGiE36m8NkNR2JAbF+Ccxtdz3XlLDvuODUE2VIhbbQib7Sa8c9iobA0WL9XwsAeAACP6T6/drgPvcmQtLU2ExtP2KieqlYp0+0dZKRj8+TDUQzdmv94IzfRnUWWhFg73NV3RRxnddyu7aFB9gblyxpr17h+Ndj0wCWrQfuHXov5GkUHjVwrEUztVUXnbQEtunPS+ZZsiGUiTHk4geeZ1vmIuGxm+2OrGIhNpWUtnwVqai53k/qd32txXpsG7jG2KiiRrd77eI47sm98Furt4aw33R0tO8zggqIQ5AI1XccfA3K2eI4XnlLmRXHGx2uX2wFi7SrnvUva+L1AYUlw90hqklIgEWJzJg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efc36e9-5648-4b68-759c-08d88c5e09f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:37:59.6848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZyW018bUiFY/10kt+7VrmbzSdIiX9IjXkCoWT5mwYqtodogNK/4kcGE6TStIX2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6446
Received-SPF: pass client-ip=51.163.158.52; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:09:04
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

On Tue, 2020-11-17 at 12:51 +0100, Thomas Huth wrote:
> On 17/11/2020 07.57, Cho, Yu-Chen wrote:
> > Add build-system-opensuse jobs and add opensuse-leap.docker
> > dockerfile.
> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> > 
> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> > ---
> >  .gitlab-ci.d/containers.yml                   |  5 ++
> >  .gitlab-ci.yml                                | 30 +++++++
> >  tests/docker/dockerfiles/opensuse-leap.docker | 88
> > +++++++++++++++++++
> >  3 files changed, 123 insertions(+)
> >  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
> > 
> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-
> > ci.d/containers.yml
> > index 11d079ea58..082624a6fa 100644
> > --- a/.gitlab-ci.d/containers.yml
> > +++ b/.gitlab-ci.d/containers.yml
> > @@ -246,3 +246,8 @@ amd64-ubuntu-container:
> >    <<: *container_job_definition
> >    variables:
> >      NAME: ubuntu
> > +
> > +amd64-opensuse-leap-container:
> > +  <<: *container_job_definition
> > +  variables:
> > +    NAME: opensuse-leap
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 9a8b375188..bf4759296a 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -195,6 +195,36 @@ acceptance-system-centos:
> >      MAKE_CHECK_ARGS: check-acceptance
> >    <<: *acceptance_definition
> >  
> > +build-system-opensuse:
> > +  <<: *native_build_job_definition
> > +  variables:
> > +    IMAGE: opensuse-leap
> > +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> > +    MAKE_CHECK_ARGS: check-build
> > +  artifacts:
> > +    expire_in: 2 days
> > +    paths:
> > +      - build
> > +
> > +check-system-opensuse:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-system-opensuse
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: opensuse-leap
> > +    MAKE_CHECK_ARGS: check
> > +
> > +acceptance-system-opensuse:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-system-opensuse
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: opensuse-leap
> > +    MAKE_CHECK_ARGS: check-acceptance
> > +  <<: *acceptance_definition
> > +
> >  build-disabled:
> >    <<: *native_build_job_definition
> >    variables:
> > diff --git a/tests/docker/dockerfiles/opensuse-leap.docker
> > b/tests/docker/dockerfiles/opensuse-leap.docker
> > new file mode 100644
> > index 0000000000..712eb4fe3a
> > --- /dev/null
> > +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> > @@ -0,0 +1,88 @@
> > +FROM opensuse/leap:15.2
> > +
> > +RUN zypper update -y
> > +
> > +# Please keep this list sorted alphabetically
> > +ENV PACKAGES \
> > +    bc \
> > +    brlapi-devel \
> > +    bzip2 \
> > +    libzip-devel \
> > +    ccache \
> > +    clang \
> > +    cyrus-sasl-devel \
> > +    dbus-1 \
> > +    device-mapper-devel \
> > +    gcc \
> > +    gcc-c++ \
> > +    mkisofs \
> > +    gettext-runtime \
> > +    git \
> > +    glib2-devel \
> > +    glusterfs-devel \
> > +    libgnutls-devel \
> > +    gtk3-devel \
> > +    hostname \
> > +    libaio-devel \
> > +    libasan5 \
> > +    libattr-devel \
> > +    libblockdev-devel \
> > +    libcap-ng-devel \
> > +    libcurl-devel \
> > +    libepoxy-devel \
> > +    libfdt-devel \
> > +    libiscsi-devel \
> > +    libjpeg8-devel \
> > +    libpmem-devel \
> > +    libpng16-devel \
> > +    librbd-devel \
> > +    libseccomp-devel \
> > +    libssh-devel \
> > +    libubsan0 \
> > +    libudev-devel \
> > +    libxml2-devel \
> > +    libzstd-devel \
> > +    llvm \
> > +    lzo-devel \
> > +    make \
> > +    mingw32-filesystem \
> > +    glibc-devel-32bit \
> > +    libSDL2_image-devel \
> > +    mingw64-binutils \
> > +    nmap \
> > +    ncat \
> > +    ncurses-devel \
> > +    libnettle-devel \
> > +    ninja \
> > +    mozilla-nss-devel \
> > +    libnuma-devel \
> > +    perl \
> > +    libpixman-1-0-devel \
> > +    python3-base \
> > +    python3-PyYAML \
> > +    python3-numpy \
> > +    python3-opencv \
> > +    python3-Pillow \
> > +    python3-pip \
> > +    python3-Sphinx \
> > +    python3-virtualenv \
> > +    rdma-core-devel \
> > +    libSDL2-devel \
> > +    snappy-devel \
> > +    sparse \
> > +    libspice-server-devel \
> > +    systemd-devel \
> > +    systemtap-sdt-devel \
> > +    tar \
> > +    tesseract-ocr \
> > +    tesseract-ocr-traineddata-english \
> > +    usbredir-devel \
> > +    virglrenderer-devel \
> > +    libvte-2_91-0 \
> > +    which \
> > +    xen-devel \
> > +    zlib-devel
> > +ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.8
> > +
> > +RUN zypper  --non-interactive install -y $PACKAGES
> > +RUN rpm -q $PACKAGES | sort > /packages.txt
> 
> Thanks, I gave it a try now and it seems to work fine so far ... but
> the
> initial creation of the container was quite slow, 28 minutes, that's
> quite a
> bit more from what I've seen with the other containers so far:
> 
>  https://gitlab.com/huth/qemu/-/jobs/853630446
> 
> (other containers took e.g. only 10 minutes like
> https://gitlab.com/huth/qemu/-/jobs/853630446 or 15 minutes like
> https://gitlab.com/qemu-project/qemu/-/jobs/812284100)
> 
> Did I maybe just hit a bad point in time?
> 

No, Thanks for your suggestion, I think I can decrease the docker build
duration.


> Or would it make sense to trim the list of packages that need to be
> installed?

yes, I already started to trim, will submit v2 sson.

> 
> For example, unless you want to test m68k-softmmu in this container,
> too,
> you don't need tesseract-ocr.
> 
> And why do you need mozilla-nss-devel ?
> 
> And I think you could also drop the mingw packages for now, unless
> you want
> to cross-compile some Windows binaries with this container?
> 

yes, no problem. The origin plan is add some cross-compiler after this
patch, and that I am not sure which one way to add it is that best (
and that would not use the resource to create the docker image again.
but I think I should patch it later.

> Also, do we need clang/llvm in here? sparse? nmap? glibc-devel-32bit?
> libzip-devel?
> 
> And why is there libvte-2_91-0, but no libvte-2_91-devel ?
> 

yes, it's wrong, that should be vte-devel.

> I think at least some of those packages could be dropped, indeed.
> 

Yes, I'm not so familiar with gitlab CI/CD, but I will modify the
dockerfile to fit the processes, thanks a lot for your suggestion and
comments.

Cheers,
      AL



