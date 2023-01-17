Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60A66D9AD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHi5I-0004gF-FA; Tue, 17 Jan 2023 04:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5G-0004fo-E5
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5E-0005f0-DL
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673947003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s/ps581BeR9iAFczco5WKIk6uCrFMpjYFsUY9YBZsGY=;
 b=doVlhr9d+4MZC2KZKU8Faf5pbhohBqCor/l5NlJobwF658JG1WHDU0RmNGd+1rrWTeAL3h
 1h8oVY/nUWnngosTUPHXOS886eyvo4IPqGmGy61Zf8BjJKJ1z5VLe8I3o4i5Zp2szNImSm
 y2r+1jIpvJab6s5KNSsxSP/cNxXpczo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-u5J0S6UWNCmTzJxhj9WWaA-1; Tue, 17 Jan 2023 04:16:42 -0500
X-MC-Unique: u5J0S6UWNCmTzJxhj9WWaA-1
Received: by mail-ej1-f70.google.com with SMTP id
 qa18-20020a170907869200b007df87611618so21041278ejc.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s/ps581BeR9iAFczco5WKIk6uCrFMpjYFsUY9YBZsGY=;
 b=fRM7xUKVhDFW2EYMe1zp4e8hirtT4Sq+Q0wuE0z7E4gXJ0GE7XW6Kr3C7DRdw/gjEQ
 3s20yK961HRRHZwGCSe5rx/kwE9zJ4yYFNdbvRj1+sAhR4qgpLHJwfH3gGZ409h2kCUW
 aFAeR6SVhV47Bs+vq0CJ9HBVSH8wU9/qW+5TWnWPlfZWbaSjU/ck85cJnzR443dtsVNZ
 WOZnT82jRvqYJMTWhylILooL41W6DcKwVoXxnmxkUUXGe2gqNPjR//0Ksn50rknJMTTy
 Qri0946jxVKZd+BWvq6uOsGC0yfC+nLBqGOpecCTb/RCQ7Y1YcjL8wLGbUf8o3rRdpF4
 AUBg==
X-Gm-Message-State: AFqh2kpCHG/WBGWLkRP6thqL6Mw20q/hTZppqNqzi6PCndSBMElHnIE6
 54uB7tyhXDYbQkHrTrz73nMb6ByAzXCbNsl0kmVEcnWHxMsaFyaanABjFT7MKOSkuKzzngy6W1a
 +uiwKCbDi1Kk4c3G1IT8j3TzTbi/NURkKxh74z4zZf+BRgRWNIBO0vc1+/n33WoxtONg=
X-Received: by 2002:a05:6402:27cf:b0:49a:23ce:2ab4 with SMTP id
 c15-20020a05640227cf00b0049a23ce2ab4mr2879043ede.42.1673947000732; 
 Tue, 17 Jan 2023 01:16:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2H3vqgT9NvwOhn/8XdsdEOXpVLRtEws9g/5FCjO9/DrRCaud5WI6+/CvpuD32d2WO5dDFHQ==
X-Received: by 2002:a05:6402:27cf:b0:49a:23ce:2ab4 with SMTP id
 c15-20020a05640227cf00b0049a23ce2ab4mr2879013ede.42.1673947000333; 
 Tue, 17 Jan 2023 01:16:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 n25-20020aa7c699000000b0049dfa1bc9eesm3489274edq.40.2023.01.17.01.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:16:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	berrange@redhat.com
Subject: [RFC PATCH 0/4] Update CentOS and OpenSUSE CI to Python >=3.7
Date: Tue, 17 Jan 2023 10:16:34 +0100
Message-Id: <20230117091638.50523-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

QEMU build and test scripts would like to use some new features that
were added to Python 3.7.  Useful additions include removing the need
for OrderedDict, improved handling of default text encoding, postponed
evaluation of type annotations, and improvements to asyncio.

Using new features that were added to Meson 0.63 is also being blocked
by usage of EOL'd versions of Python; Meson 0.63 does not work with the
3.6 version of Python that is provided by CentOS Stream 8 and OpenSUSE
LEAP 15.  Therefore, this series upgrades the CentOS Stream 8 and OpenSUSE
LEAP 15 dockerfiles to use the alternative Python runtimes provided by
the distros.

The main obstacle here is updating the lcitool-generated Dockerfiles;
lcitool is (by design) quite opinionated on the mapping between
"generic" package names and target-specific package names, and it
caters to Libvirt's needs in terms of package versions.

There are two possibilities to change this.

First, lately I have been working on allowing lcitool to be used as
a library.  As of this morning, it is possible for QEMU to use
lcitool's databases and formatters directly from Python, and only
replace the search mechanism to allow mappings and target paths to
be overridden.  This is the approach that is implemented in this RFC:
the first two patches in this series use libvirt-ci as library, while
the third implements the custom search path.

However, I have also proposed the custom search mechanism directly
upstream (https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341).
If this is accepted, patch 3 will become much smaller and will not
need to know any lcitool internals; in addition, using lcitool as
a library could be evaluated on its own merits because command-line
operation would be a possibility as well.

With the lcitool changes in place, the final patch shows how to
install custom package mappings and update CentOS and OpenSUSE Python
respectively to 3.8 and 3.9.

Thanks,

Paolo

Paolo Bonzini (4):
  lcitool: update submodule
  lcitool: use libvirt-ci as library
  lcitool: allow overriding package mappings and target facts
  ci, docker: update CentOS and OpenSUSE Python to non-EOL versions

 .gitlab-ci.d/cirrus/freebsd-12.vars           |  8 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  8 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |  8 +-
 scripts/ci/setup/build-environment.yml        |  2 +-
 tests/docker/dockerfiles/alpine.docker        |  7 +-
 tests/docker/dockerfiles/centos8.docker       | 29 +++---
 .../dockerfiles/debian-amd64-cross.docker     |  7 +-
 tests/docker/dockerfiles/debian-amd64.docker  |  7 +-
 .../dockerfiles/debian-arm64-cross.docker     |  7 +-
 .../dockerfiles/debian-armel-cross.docker     |  7 +-
 .../dockerfiles/debian-armhf-cross.docker     |  7 +-
 .../dockerfiles/debian-mips64el-cross.docker  |  7 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  7 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |  7 +-
 .../dockerfiles/debian-s390x-cross.docker     |  7 +-
 .../dockerfiles/fedora-win32-cross.docker     |  7 +-
 .../dockerfiles/fedora-win64-cross.docker     |  7 +-
 tests/docker/dockerfiles/fedora.docker        |  7 +-
 tests/docker/dockerfiles/opensuse-leap.docker | 29 +++---
 tests/docker/dockerfiles/ubuntu2004.docker    |  9 +-
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/mappings.yml                    | 80 ++++++++++++++++
 tests/lcitool/projects/qemu.yml               |  1 +
 tests/lcitool/refresh                         | 96 ++++++++++++-------
 tests/lcitool/targets/centos-stream-8.yml     |  3 +
 tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
 26 files changed, 215 insertions(+), 154 deletions(-)
 create mode 100644 tests/lcitool/mappings.yml
 create mode 100644 tests/lcitool/targets/centos-stream-8.yml
 create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

-- 
2.38.1


