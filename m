Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFA562A36
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 06:14:55 +0200 (CEST)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o783S-0004yb-Vb
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 00:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o781J-00030P-Bj
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 00:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o781G-0000Au-S9
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 00:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656648739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBB+sXlG1Mm9kGSDa9yqWSy6F/jsZ8sHLYapep/p9jg=;
 b=JcgpaCeF10oF59SC0Fbi7kuSnMfSyrZZ4Q9cH6A3c9BXnbKbL55DniXHqLbbDO/FlZRY71
 UfrIGtnr7WXRJvQEuBUdLJ2cHqjOp7Lt18m352Lhnu8N4FM3rWPgoQ1U9eKbB/BrOp8qU9
 Fze168muf2iyhBaCraXyVnR5ueviDmY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-cHXLmiEvPSqcO7gP0yUi9A-1; Fri, 01 Jul 2022 00:12:17 -0400
X-MC-Unique: cHXLmiEvPSqcO7gP0yUi9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso773835wms.2
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 21:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=FBB+sXlG1Mm9kGSDa9yqWSy6F/jsZ8sHLYapep/p9jg=;
 b=ZrksD1Ub+PUdQ0LjscmyCQ8eIqLCDCcKi2YoEfQ2fKKmP2Hdf/TxCebJSFhCWkReEw
 HCNCuLvmzOC9s4yMx8mEU4eGnRlSo31IATOOuE/c9rA/NFnSelko6tzG05cmVa9m/nhF
 R4evYuRrEeK2tOysSDvkV1RLkipHPDf8i4v2MWPdNo8TSF+XvBHvpDvh7PINDtm5NG+E
 ujVzVPz4B/pjUJBv3U5tLXgrhYrAMPlqOi3wMtrEzi0symdGNh3UUQIg6IlerGWLOch6
 WBlIQEttvEGmUTwD+Jeaf5NJ7i2NYYmp9vxoKgsEQS4fVZUl/h5PnR11WJtUUZCrtDgx
 mx1w==
X-Gm-Message-State: AJIora+deY1AWifL09IqE4YmLOpEwHg35oa48qq2L+21rWj6D6DisHYv
 YopMxybm8frNU9M97CYtdn0PwEOB66vKA1ftiXOo/z/YnnJmo4RgJcRWTsmJf65TEmtA9T1II7G
 B20x0Tlv/CkhQyOc=
X-Received: by 2002:a05:6000:104f:b0:21a:3d3a:4d3d with SMTP id
 c15-20020a056000104f00b0021a3d3a4d3dmr11079728wrx.528.1656648736643; 
 Thu, 30 Jun 2022 21:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGIbqtDW4BPxgPwnl+nnit7hyCfByy5WGw1GEaapfBvmnWufWgSl+ofJwt1yZXrVEqwde8pA==
X-Received: by 2002:a05:6000:104f:b0:21a:3d3a:4d3d with SMTP id
 c15-20020a056000104f00b0021a3d3a4d3dmr11079710wrx.528.1656648736376; 
 Thu, 30 Jun 2022 21:12:16 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-162.web.vodafone.de.
 [109.43.179.162]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d420c000000b0021b8d1b0568sm21553415wrq.52.2022.06.30.21.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 21:12:15 -0700 (PDT)
Message-ID: <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
Date: Fri, 1 Jul 2022 06:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
In-Reply-To: <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 15.53, Ani Sinha wrote:
> 
> 
> On Tue, Jun 28, 2022 at 19:15 Peter Maydell <peter.maydell@linaro.org 
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Tue, 28 Jun 2022 at 14:23, Ani Sinha <ani@anisinha.ca
>     <mailto:ani@anisinha.ca>> wrote:
>      > On Tue, Jun 28, 2022 at 6:25 PM Daniel P. Berrangé
>     <berrange@redhat.com <mailto:berrange@redhat.com>> wrote:
>      > > This proposed biosbits test also involves a considerable download.
>      >
>      > I do not think 50 MB is "considerable" . Last time I tried to run
>      > avocado tests, my laptop ran out of disk space!
> 
>     I think 50MB is pretty big. It might be smaller than some other
>     avocado tests, but it's not exactly the "no binary involved"
>     that most qtests are.
> 
> 
> Well bios-tables-test uses the binary blobs of the acpi tables. Only 
> difference is that in this case, we could maintain them within  the qemu 
> tree. In this case the blob in slightly larger and comes from a third party. 
> That is the difference.

"slightly larger" ... it apparently contains already a complete grub and 
python 2.7 interpreter ... I'd consider that as *much* larger than the ~ 2k 
loc bios-tables-test ;-)

>     Very few 'make check' tests even run code in the guest.
> 
> So bits test is similar here. It runs code in the guest vm.

The qtests that run some TCG code only use some few lines of code. The tests 
that run third party firmware images are the avocado tests.

>     There are definitely some awkwardnesses with 'check-avocado',
>     but we should work on fixing those, not use them as a reason
>     to refuse to put tests into the avocado tests if that's where
>     they fit best.
> 
> I think this test fits best in the qtrst not with the integration test 
> framework.

I disagree. Third party binary blob tests are certainly nothing for the 
qtest directory.

> Very few path developers will ever run it and wrote new tests for 
> it if we have it there. I would be terribly discouraged if that’s where this 
> test landed.

I see your point - I'm also hardly ever running whole "make check-avocado" 
since it's too slow/fat/broken. But using this as a reason to stick your 
test into the qtest framework also does not work/scale: Being one of the 
s390x maintainers - What if I now also want my s390x related tests to be 
executed by everybody? The kernel + initrd images from 
tests/avocado/machine_s390_ccw_virtio.py are also not that big, ca. 50 MiB 
each. Should I now move that out of the avocade directory, too, and force 
everybody to consume it via a submodule? Then who's next? QEMU has 21 target 
architectures, if every maintainers adds a 50 MiB test to the tree, we're at 
more than a gigabyte of data already that you'd have to download before you 
were able to run "make check". This simply does not scale.

So the avocado framework is currently still the best place that we have for 
such tests. You just have to get used to consume it via "tags" instead of 
running the whole "make check-avocado" suite. For example, being a s390x 
maintainer, I'm only running:

  make check-venv
  ./tests/venv/bin/avocado run -t arch:s390x tests/avocado/

and that finishes within some few minutes and only downloads some few 
hundreds of megabytes. You could do something similar with acpi. You could 
even wrap it in a "make check-avocado-acpi" target if you don't like to 
execute avocado directly.

I even wouldn't mind if you put your python stuff in a new directory like 
tests/pytests/ for example, as long as it downloads your binaries separately 
- as I wrote in another mail, the avocado framework rather looks like an 
oddball in our test framework nowadays since it uses a separate test runner 
and not the meson test harness, so having a new approach for python-based 
tests is maybe even a good idea. I just really want to avoid that this goes 
into tests/qtest (since it really does not belong there), and please don't 
add more external stuff via git submodules, that's really the wrong approach 
for this.

  Thomas


