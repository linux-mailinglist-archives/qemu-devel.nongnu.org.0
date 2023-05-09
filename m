Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEC6FCB01
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:17:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQ0j-00078C-I4; Tue, 09 May 2023 12:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwQ0d-00077Z-HD
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwQ0c-00045a-0s
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683648972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlKJm2iMMUwgTmFrvhLDc76oWES8vqz7c7+DLuVUYQo=;
 b=jL6IN9+UfItXNWJSi06V8ZVtp/+fuYWgMS8L/1LI3scTgV7F5Fvva5obKj/xCSANVnTeXS
 nGeFYGwsy4/S9BiuXP9tB3iEaLO39rWapGSH86tZg5byTIJtyV42TBTX+diTylrbaMjMZ9
 31RVQ06bcyxB1XINiHRVo/xxxyIV2dY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-nGmIfApMM56pUBatXRoSNQ-1; Tue, 09 May 2023 12:16:09 -0400
X-MC-Unique: nGmIfApMM56pUBatXRoSNQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a34d3e5ebso550388866b.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683648968; x=1686240968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlKJm2iMMUwgTmFrvhLDc76oWES8vqz7c7+DLuVUYQo=;
 b=Ddpo1oos17scaKRfT1ecTogVEKO3tZu7YZvxfQF/8bpagSIm64YOEjkfJ8RiXLYuzz
 lWs1goNLZdrTCnJyt1DB6qdOT1S9ezbIOSnPoc3u6HtLLOlF14tzVFfsXt/CC6N7Om2T
 Jshj0JMef5ZWXpJdugKCp1U75/c6Bm57VImI27Cy1obQg+IsXm0UZDo+JHn3SrZpp4wv
 DNFKlHTow9V27wjyEoKBWQObkAAMUDzm+SbvjFkYmCKAgY8qX3hyebCl2jc3bKTRgwDF
 l6yqXHlC8x3pyZex2Sn1ySHz9gv90F1k5rWQeM0O6ApWJJ3EiOJIWsYCRlwHeF6aCMav
 OvVQ==
X-Gm-Message-State: AC+VfDyTIRj1xcKHz9Bw93DxUIYrO+dDvmHgzTutSZTnmnlr4o8c3kyu
 ibTzp3O4CvA2haS4NqZOMWNlVqvQVWq9aT+lpvFmLECKAY6rGKZPuxTzXUOYiS/8FUS04oCMpkM
 FzpchJbUYuEYdPZA=
X-Received: by 2002:a17:907:c1f:b0:961:ba6c:e949 with SMTP id
 ga31-20020a1709070c1f00b00961ba6ce949mr15182780ejc.68.1683648968254; 
 Tue, 09 May 2023 09:16:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44mc/V2CTiO93b+linKWP3bY2tWRaHNriHGNUQlcZDc5qsENaUgFw7Akc9buW1eu1WwjwFJw==
X-Received: by 2002:a17:907:c1f:b0:961:ba6c:e949 with SMTP id
 ga31-20020a1709070c1f00b00961ba6ce949mr15182744ejc.68.1683648967873; 
 Tue, 09 May 2023 09:16:07 -0700 (PDT)
Received: from redhat.com ([82.180.150.238]) by smtp.gmail.com with ESMTPSA id
 la17-20020a170907781100b00957dad777c1sm1496379ejc.107.2023.05.09.09.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:16:07 -0700 (PDT)
Date: Tue, 9 May 2023 12:16:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, alex.bennee@linaro.org,
 philmd@linaro.org, wainersm@redhat.com, bleal@redhat.com, thuth@redhat.com
Subject: Re: [PATCH v2 0/2] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
Message-ID: <20230509121552-mutt-send-email-mst@kernel.org>
References: <20230504154611.85854-1-anisinha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504154611.85854-1-anisinha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, May 04, 2023 at 09:16:09PM +0530, Ani Sinha wrote:
> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
> adds those two tools in the docker container images.
> xorriso package conflicts with genisoimage package on some distributions.
> Therefore, it is not possible to have both the packages at the same time
> in the container image uniformly for all distribution flavors. Further,
> on some distributions like RHEL, both xorriso and genisoimage
> packages provide /usr/bin/genisoimage and on some other distributions like
> Fedora, only genisoimage package provides the same utility.
> Therefore, this change removes the dependency on geninsoimage for building
> container images altogether keeping only xorriso package. At the same time,
> cdrom-test.c is updated to use and check for existence of only xorrisofs.
> 
> Patch 1 pulls in the latest changes in lcitool in order to add mappings
> for these packages in various distros.
> Patch 2 updates all Dockerfiles in QEMU repository to add these two
> tools. It also removed genisoimage package and updated cdrom-test to not
> use genisoimage but xorrisofs.
> 
> CC: mst@redhat.com
> CC: berrange@redhat.com
> CC: alex.bennee@linaro.org
> CC: philmd@linaro.org
> CC: wainersm@redhat.com
> CC: bleal@redhat.com
> CC: thuth@redhat.com
> TO: qemu-devel@nongnu.org
> 
> Changelog:
> v2: remove genisoimage package and update Dockerfile. Also update cdrom-test.c
> so that it uses xorrisofs and not genisoimage. I have tested patch #2 on both
> Fedora 37 and RHEL 9.1. cdrom-test passed on both.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this?

> Ani Sinha (2):
>   tests: libvirt-ci: Update to commit 'c8971e90ac' to pull in mformat
>     and xorriso
>   tests/lcitool: Add mtools and xorriso and remove genisoimage as
>     dependencies
> 
>  .gitlab-ci.d/cirrus/freebsd-13.vars                |  2 +-
>  .gitlab-ci.d/cirrus/macos-12.vars                  |  2 +-
>  tests/docker/dockerfiles/alpine.docker             |  3 ++-
>  tests/docker/dockerfiles/centos8.docker            |  3 ++-
>  tests/docker/dockerfiles/debian-amd64-cross.docker |  3 ++-
>  tests/docker/dockerfiles/debian-amd64.docker       |  3 ++-
>  tests/docker/dockerfiles/debian-arm64-cross.docker |  3 ++-
>  tests/docker/dockerfiles/debian-armel-cross.docker |  3 ++-
>  tests/docker/dockerfiles/debian-armhf-cross.docker |  3 ++-
>  .../dockerfiles/debian-mips64el-cross.docker       |  3 ++-
>  .../docker/dockerfiles/debian-mipsel-cross.docker  |  3 ++-
>  .../docker/dockerfiles/debian-ppc64el-cross.docker |  3 ++-
>  tests/docker/dockerfiles/debian-s390x-cross.docker |  3 ++-
>  tests/docker/dockerfiles/fedora-win32-cross.docker |  3 ++-
>  tests/docker/dockerfiles/fedora-win64-cross.docker |  3 ++-
>  tests/docker/dockerfiles/fedora.docker             |  3 ++-
>  tests/docker/dockerfiles/opensuse-leap.docker      |  3 ++-
>  tests/docker/dockerfiles/ubuntu2004.docker         |  3 ++-
>  tests/docker/dockerfiles/ubuntu2204.docker         |  3 ++-
>  tests/lcitool/libvirt-ci                           |  2 +-
>  tests/lcitool/projects/qemu.yml                    |  3 ++-
>  tests/qtest/cdrom-test.c                           | 14 +++++++-------
>  22 files changed, 46 insertions(+), 28 deletions(-)
> 
> -- 
> 2.31.1


