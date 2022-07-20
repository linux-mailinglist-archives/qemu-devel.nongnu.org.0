Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272F57B30E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:36:40 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5CB-00066u-MS
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE5A5-0004EM-1W
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE5A1-00058V-Qc
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658306065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AukOT/YjVtvVFPFb47eP2TSvZLE5rN0rBKJ3EOZovZk=;
 b=eE8rg00rxWjcjH8apesmwkMtmhSP46hJc3t3unPMISgFLh74eYzjexaVrdjB69v9ZxU4Lv
 JyK2aNO/WzXB0XJ75AQWmPClGBvv0Q3MC38av0u1QmheWdraxSXcnz+lqbSCWQykjMilnz
 JOF66p1ge8dhKYTNYWVRTsLyQ4M3oo8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-g98-Ga3zMraJN4KWCPOAUQ-1; Wed, 20 Jul 2022 04:34:23 -0400
X-MC-Unique: g98-Ga3zMraJN4KWCPOAUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso8061933wma.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 01:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AukOT/YjVtvVFPFb47eP2TSvZLE5rN0rBKJ3EOZovZk=;
 b=QAS3FfFWL93aCb4tIooetV9tNXB50CbwODyRUZVIRYfqByGaMJ0sv33Ckej4jfjZAt
 zthLusPgBDosCsmF7pQA5oRoy9NC3iontA3u7MOIQVp5r6Qmv8iyb4e0tfQ9WudjDeUs
 L+32jhfz57HT+Vyh6wDBhQWGyP4S0XeBKfeZJjk1nmzlaZ7RKbK0wr/aUECfBevHvAvY
 smrJKJTYeW5vWFOrHRNs3RR+7SOWn6bNxqd8JLjqUPFTrzdAXP7oNKn3sJYMRr1Dntu9
 4+yknRtjWg/TtBX8+QufXn1zxetfQcJPSffvY7eH/uKofWLr6KNFsavvbCDuwuuwfpud
 qiRw==
X-Gm-Message-State: AJIora8VdOkKDixJzeP3t0EAOiuMUd1+6e1Gr3L3F/1SKlr2g0licwhk
 /F4R6kSfcUrCnGhhUN+geHSBSkc6zrnPesf53U2jGDJOjsXbiUUkwQcoOnCDhUWeFLDRQJ9+1oS
 Zqu0njomtHG/obHI=
X-Received: by 2002:a7b:ce0a:0:b0:3a3:1adf:af34 with SMTP id
 m10-20020a7bce0a000000b003a31adfaf34mr2652377wmc.127.1658306062605; 
 Wed, 20 Jul 2022 01:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tiMc8TwgZXj2zj+acskfZFX/WC5T60/FwWRleyxWAzBelzYtUbe+cF7qQT9a9SOts7wqTWZw==
X-Received: by 2002:a7b:ce0a:0:b0:3a3:1adf:af34 with SMTP id
 m10-20020a7bce0a000000b003a31adfaf34mr2652350wmc.127.1658306062316; 
 Wed, 20 Jul 2022 01:34:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0021d73772c87sm3503935wrm.91.2022.07.20.01.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 01:34:21 -0700 (PDT)
Date: Wed, 20 Jul 2022 09:34:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org,
 iii@linux.ibm.com, peter.maydell@linaro.org
Subject: Re: [PATCH] Revert "gitlab: disable accelerated zlib for s390x"
Message-ID: <Yte+DF6Y5BTu5ZRS@work-vm>
References: <20220720082844.6700-1-dgilbert@redhat.com>
 <090d09d2-bca0-5354-e552-66459121ac13@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <090d09d2-bca0-5354-e552-66459121ac13@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> On 20/07/2022 10.28, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > This reverts commit 309df6acb29346f89e1ee542b1986f60cab12b87.
> > With Ilya's 'multifd: Copy pages before compressing them with zlib'
> > in the latest migration series, this shouldn't be a problem any more.
> > 
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ------------
> >   .travis.yml                                        |  6 ++----
> >   2 files changed, 2 insertions(+), 16 deletions(-)
> > 
> > diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> > index 9f1fe9e7dc..03e74c97db 100644
> > --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> > +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> > @@ -8,8 +8,6 @@ ubuntu-20.04-s390x-all-linux-static:
> >    tags:
> >    - ubuntu_20.04
> >    - s390x
> > - variables:
> > -    DFLTCC: 0
> >    rules:
> >    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> >    - if: "$S390X_RUNNER_AVAILABLE"
> > @@ -29,8 +27,6 @@ ubuntu-20.04-s390x-all:
> >    tags:
> >    - ubuntu_20.04
> >    - s390x
> > - variables:
> > -    DFLTCC: 0
> >    timeout: 75m
> >    rules:
> >    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> > @@ -48,8 +44,6 @@ ubuntu-20.04-s390x-alldbg:
> >    tags:
> >    - ubuntu_20.04
> >    - s390x
> > - variables:
> > -    DFLTCC: 0
> >    rules:
> >    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> >      when: manual
> > @@ -71,8 +65,6 @@ ubuntu-20.04-s390x-clang:
> >    tags:
> >    - ubuntu_20.04
> >    - s390x
> > - variables:
> > -    DFLTCC: 0
> >    rules:
> >    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> >      when: manual
> > @@ -93,8 +85,6 @@ ubuntu-20.04-s390x-tci:
> >    tags:
> >    - ubuntu_20.04
> >    - s390x
> > - variables:
> > -    DFLTCC: 0
> >    rules:
> >    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> >      when: manual
> > @@ -114,8 +104,6 @@ ubuntu-20.04-s390x-notcg:
> >    tags:
> >    - ubuntu_20.04
> >    - s390x
> > - variables:
> > -    DFLTCC: 0
> >    rules:
> >    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> >      when: manual
> > diff --git a/.travis.yml b/.travis.yml
> > index 4fdc9a6785..fb3baabca9 100644
> > --- a/.travis.yml
> > +++ b/.travis.yml
> > @@ -218,7 +218,6 @@ jobs:
> >           - TEST_CMD="make check check-tcg V=1"
> >           - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
> >           - UNRELIABLE=true
> > -        - DFLTCC=0
> >         script:
> >           - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
> >           - |
> > @@ -258,7 +257,7 @@ jobs:
> >         env:
> >           - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
> >                     --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
> > -        - DFLTCC=0
> > +
> >       - name: "[s390x] GCC (user)"
> >         arch: s390x
> >         dist: focal
> > @@ -270,7 +269,7 @@ jobs:
> >             - ninja-build
> >         env:
> >           - CONFIG="--disable-containers --disable-system"
> > -        - DFLTCC=0
> > +
> >       - name: "[s390x] Clang (disable-tcg)"
> >         arch: s390x
> >         dist: focal
> > @@ -304,4 +303,3 @@ jobs:
> >           - CONFIG="--disable-containers --disable-tcg --enable-kvm
> >                     --disable-tools --host-cc=clang --cxx=clang++"
> >           - UNRELIABLE=true
> > -        - DFLTCC=0
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, I'll include it in my reworked migration pull.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


