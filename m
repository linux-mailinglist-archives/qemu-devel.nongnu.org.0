Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB9562C11
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 08:56:07 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7AZS-0002ib-I6
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 02:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7AWi-0001ok-8B
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:53:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7AWf-0008Kd-56
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656658391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTB03zwxaOuLUrvbQ3e82GQnxvJijgcM5tbEolIhuMY=;
 b=IwanDAD36XXGxDJOQh3Y422Rncp+4QVDzjuc416UIIzmparzeBtViSQ3Tji/2ij/W8ftUF
 bDX4YoD6KXRbl0F7RyTHazp0GTO7sGkmiFOrvccYNEuPvY/Wzny4hjn2hUgQl/C8xiQxxJ
 FTNw+lZVY5CnH/1p/BsLRqAPqSp2mwE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-MeTNbwAyPbKw264oYtU-IQ-1; Fri, 01 Jul 2022 02:53:10 -0400
X-MC-Unique: MeTNbwAyPbKw264oYtU-IQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 hs18-20020a1709073e9200b0072a3e7eb0beso376156ejc.10
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 23:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RTB03zwxaOuLUrvbQ3e82GQnxvJijgcM5tbEolIhuMY=;
 b=Croec0BCdFY8d56zrb54+IEkZN0KeUKSwGTnG9PCgyRDhQg35T+2ddnO9HKjzrVuam
 kg383/0XJmZi+mC0jSyt2q0RdjKWYb3LRkBxA+HDxpfEcMxQXoi3Zq7lR18ytLlxiTHw
 e+7akAayTveDQMIXmG2a3mNlbR6DjaGTV/fAnWH3ihPY5Luyw0yq1gHk+RZ74/d/Ck6N
 IitKRsy2ecP6DWaE43MXb97krFhj0Oz9SMm9FE8VolkhaX9cSOvfAzJGKLLPo4mRpOUT
 NjDhIaOLGbd4NgaKs+lVf737z26zTslyVZkBQtQx2Tw1lq1ZJ7C9mm4MLmXtRtG0iKVT
 8jEg==
X-Gm-Message-State: AJIora8fr7+N9MAdGawFXafPp6PqcTvYVQWC5ysmD0TqtMicVWDHzDsC
 ZYPipWPmg8GBfmTswsTK8GqvkzfSjQjBfNMEDh9dd4JNUlwKIuPzFjELevFuaQObQ+apiNj85hT
 7M0/2GsDWDf3uLwg=
X-Received: by 2002:a17:907:75c1:b0:72a:430d:b512 with SMTP id
 jl1-20020a17090775c100b0072a430db512mr10865480ejc.146.1656658389431; 
 Thu, 30 Jun 2022 23:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBDeVV9o73aChj1nuSnzN9VIUVLiTvM2QBxtTexaGSS2eaMgXX3en2AZkqAiRWN53VQXjnaA==
X-Received: by 2002:a17:907:75c1:b0:72a:430d:b512 with SMTP id
 jl1-20020a17090775c100b0072a430db512mr10865461ejc.146.1656658389235; 
 Thu, 30 Jun 2022 23:53:09 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 m2-20020a50ef02000000b00435a997303bsm14392243eds.71.2022.06.30.23.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 23:53:08 -0700 (PDT)
Date: Fri, 1 Jul 2022 02:53:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220701024108-mutt-send-email-mst@kernel.org>
References: <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com>
 <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 01, 2022 at 06:12:14AM +0200, Thomas Huth wrote:
> I even wouldn't mind if you put your python stuff in a new directory like
> tests/pytests/ for example, as long as it downloads your binaries separately
> - as I wrote in another mail, the avocado framework rather looks like an
> oddball in our test framework nowadays since it uses a separate test runner
> and not the meson test harness, so having a new approach for python-based
> tests is maybe even a good idea. I just really want to avoid that this goes
> into tests/qtest (since it really does not belong there), and please don't
> add more external stuff via git submodules, that's really the wrong approach
> for this.

I get it, people hate submodules with passion.  I think trying another
approach for testing that is neither avocado nor qtest is
not too bad. As long as this is not user visible, we can
allow ourselves space to experiment.

OK so, how about this:
- put it in a new directory: tests/roms?
- create repo for a fork of biosbits under git.qemu.org
- roll our own analog to git submodules: a script
  that clones the repo
- new target make check-roms, if the clone exists locally -
  run the test, if not - skip it
- as for using pre-generates ISOs as an optimization,
  I'm not sure how important that is, if yes -
  we can add another repo and another make target along the
  same lines



-- 
MST


