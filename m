Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6871E68F459
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoAD-0004XL-Vm; Wed, 08 Feb 2023 12:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPoAA-0004Mk-EY
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:23:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPoA8-0004zh-JG
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOW4+waIiZmM+Kp3mkQXrU9qnOkabndxARrBQ2vuWiE=;
 b=EkoqD0iNiJ/oJg27P9uBP6AeIy5ktQV6XKhjkGc7mxH7Rs7x4/WUr8aO9zIOFyFvxMer/o
 Mug+vWAmxisD+7V4mou/hBZpe4QLVyrXF7d/ZvYbI5i4/7kzcw+hrn7DnE8TyvAUVpfQna
 8nOD05vFm55hrXeQdnOmHX/p0SoAPCc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-rSkECo1QMjK2Ah7FoEDrkg-1; Wed, 08 Feb 2023 12:23:07 -0500
X-MC-Unique: rSkECo1QMjK2Ah7FoEDrkg-1
Received: by mail-ua1-f72.google.com with SMTP id
 f40-20020ab049eb000000b006780ae44d28so8088677uad.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vOW4+waIiZmM+Kp3mkQXrU9qnOkabndxARrBQ2vuWiE=;
 b=6GBUAbYsA1/8BXeXRVBVH7Kni2BOSEJ3vHfSncXX+Xiff7lxOg4LhUhiUDTDPvK3Vy
 IXzn98HaF7VrOScaGepit/KyT0L55UyVQiAaGJ+EneMpcrkjX9DJsxfir3oF3Dke7IgQ
 QEaOIuJ4TT5xiWxWZLsRu5GW3xFE9/32iigAtCsF96b3o+GFeS3rH2zZGPisjc4OcUWX
 HZZs748faaFGKT5BAQXqYUmU/nqM86jNN0BxFAa4EwE4dC0c/BCl1Z14gmEzQflMW/Qp
 VJbVOuuZA++Vex+oO6y/f33oPAQBjwAWeMRtwtv3V/XPlIk87klaePQhXtuCp5ZUp9Lp
 f3cw==
X-Gm-Message-State: AO0yUKUCEVct5kSJ028fTNdODvUU6S+4R1TzPbFFt5huALVc5Ij+dDQ+
 0wtWOPbJo/FSaFiyozZTSwaxbhDnoFv7UiFf2+FDC9zOwQ/v7bSiyVUnWqMi3Oul7mHtcUZpLSs
 GoWqOTSRIBoJFonYoJIf1OlyYrew+NRIsGVru
X-Received: by 2002:a05:6102:9ca:b0:411:c0cc:ba77 with SMTP id
 g10-20020a05610209ca00b00411c0ccba77mr325534vsi.54.1675876980595; 
 Wed, 08 Feb 2023 09:23:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9SGf5AtvGXd5jTOljZntbToelEsRv4xMN5MEx2ffs0VUgNRG/fF+IXVnJo4iyT66Du9wl6aGOCRCRljAlx1xw=
X-Received: by 2002:a05:6102:9ca:b0:411:c0cc:ba77 with SMTP id
 g10-20020a05610209ca00b00411c0ccba77mr325524vsi.54.1675876980304; Wed, 08 Feb
 2023 09:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20230117091638.50523-1-pbonzini@redhat.com>
In-Reply-To: <20230117091638.50523-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 8 Feb 2023 18:22:48 +0100
Message-ID: <CABgObfaEyii9gyEPLb+so_7aWWsqrBhT_FKqTQaKE+F46b3v_Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Update CentOS and OpenSUSE CI to Python >=3.7
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, berrange@redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Ping.

Paolo

On Tue, Jan 17, 2023 at 10:16 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> QEMU build and test scripts would like to use some new features that
> were added to Python 3.7.  Useful additions include removing the need
> for OrderedDict, improved handling of default text encoding, postponed
> evaluation of type annotations, and improvements to asyncio.
>
> Using new features that were added to Meson 0.63 is also being blocked
> by usage of EOL'd versions of Python; Meson 0.63 does not work with the
> 3.6 version of Python that is provided by CentOS Stream 8 and OpenSUSE
> LEAP 15.  Therefore, this series upgrades the CentOS Stream 8 and OpenSUSE
> LEAP 15 dockerfiles to use the alternative Python runtimes provided by
> the distros.
>
> The main obstacle here is updating the lcitool-generated Dockerfiles;
> lcitool is (by design) quite opinionated on the mapping between
> "generic" package names and target-specific package names, and it
> caters to Libvirt's needs in terms of package versions.
>
> There are two possibilities to change this.
>
> First, lately I have been working on allowing lcitool to be used as
> a library.  As of this morning, it is possible for QEMU to use
> lcitool's databases and formatters directly from Python, and only
> replace the search mechanism to allow mappings and target paths to
> be overridden.  This is the approach that is implemented in this RFC:
> the first two patches in this series use libvirt-ci as library, while
> the third implements the custom search path.
>
> However, I have also proposed the custom search mechanism directly
> upstream (https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341).
> If this is accepted, patch 3 will become much smaller and will not
> need to know any lcitool internals; in addition, using lcitool as
> a library could be evaluated on its own merits because command-line
> operation would be a possibility as well.
>
> With the lcitool changes in place, the final patch shows how to
> install custom package mappings and update CentOS and OpenSUSE Python
> respectively to 3.8 and 3.9.
>
> Thanks,
>
> Paolo
>
> Paolo Bonzini (4):
>   lcitool: update submodule
>   lcitool: use libvirt-ci as library
>   lcitool: allow overriding package mappings and target facts
>   ci, docker: update CentOS and OpenSUSE Python to non-EOL versions
>
>  .gitlab-ci.d/cirrus/freebsd-12.vars           |  8 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars           |  8 +-
>  .gitlab-ci.d/cirrus/macos-12.vars             |  8 +-
>  scripts/ci/setup/build-environment.yml        |  2 +-
>  tests/docker/dockerfiles/alpine.docker        |  7 +-
>  tests/docker/dockerfiles/centos8.docker       | 29 +++---
>  .../dockerfiles/debian-amd64-cross.docker     |  7 +-
>  tests/docker/dockerfiles/debian-amd64.docker  |  7 +-
>  .../dockerfiles/debian-arm64-cross.docker     |  7 +-
>  .../dockerfiles/debian-armel-cross.docker     |  7 +-
>  .../dockerfiles/debian-armhf-cross.docker     |  7 +-
>  .../dockerfiles/debian-mips64el-cross.docker  |  7 +-
>  .../dockerfiles/debian-mipsel-cross.docker    |  7 +-
>  .../dockerfiles/debian-ppc64el-cross.docker   |  7 +-
>  .../dockerfiles/debian-s390x-cross.docker     |  7 +-
>  .../dockerfiles/fedora-win32-cross.docker     |  7 +-
>  .../dockerfiles/fedora-win64-cross.docker     |  7 +-
>  tests/docker/dockerfiles/fedora.docker        |  7 +-
>  tests/docker/dockerfiles/opensuse-leap.docker | 29 +++---
>  tests/docker/dockerfiles/ubuntu2004.docker    |  9 +-
>  tests/lcitool/libvirt-ci                      |  2 +-
>  tests/lcitool/mappings.yml                    | 80 ++++++++++++++++
>  tests/lcitool/projects/qemu.yml               |  1 +
>  tests/lcitool/refresh                         | 96 ++++++++++++-------
>  tests/lcitool/targets/centos-stream-8.yml     |  3 +
>  tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
>  26 files changed, 215 insertions(+), 154 deletions(-)
>  create mode 100644 tests/lcitool/mappings.yml
>  create mode 100644 tests/lcitool/targets/centos-stream-8.yml
>  create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml
>
> --
> 2.38.1


