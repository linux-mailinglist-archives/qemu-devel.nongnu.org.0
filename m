Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9914AC562
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:24:39 +0100 (CET)
Received: from localhost ([::1]:33652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6og-0001VC-4E
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nH6kS-0007xn-86
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nH6kP-0001uR-8E
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644250812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yMKRdzbsgTAdBa/XYwx7y1sZLrsyb0icgR8FGtjsN8=;
 b=MWHgTqh86hPjY4YWMswuw/gDJWV6naZ2huYD4H49ekSVoXbRy0hgAfCWrUCNMrhdJl6xPk
 TA+uJXrZ85UrRnoLYV0Ua6a0GRn03p6UPJJySnqTbgPEuQ92J/0uT5Olu4A5FLtH0gSRTG
 Z6G1Z5nVMwyRnE1bBWhs9MRONXp8Kws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-x2j8lzP3OCutiFGX1V1O5w-1; Mon, 07 Feb 2022 11:20:05 -0500
X-MC-Unique: x2j8lzP3OCutiFGX1V1O5w-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so12483614wmb.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 08:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/yMKRdzbsgTAdBa/XYwx7y1sZLrsyb0icgR8FGtjsN8=;
 b=6NXHHEWCLqHfDzldQgV/ItjA8ubVtCOSKQUeFdhDAfuyjm0Yx89GMqEdoHu4jjE2RV
 jXmm+Ty/DVjPqUHazTtSCkBWEEyM2SrSGm3Gl/Efq7i2KvqHiMBG5W9qBwdHMYg6gm0z
 Xlg/BIYBv5l5Tw/VTge2jfCzHlLqb+8e1KlzpY4pCL4PgS9y5SgicVdp1qJtV2Rc7u4/
 9IPOb/MHWg96wI3UwLol2dk9Yy5ZbqT5bTRuurOlrxMBky8203sOn3g2kERjEx59XSRr
 90CuldJxcNb4i/ylZ1PSN4KDmAddv6WW+bnRrgkO9mBEDFsF+8ErMkxebtAruiWKI2jr
 t5Dw==
X-Gm-Message-State: AOAM5315ujY8HVbg7W1Lb6tNjElcTcmDHCOam4mPWQDnEVMrlD47B5zU
 Jk2ZxC989P4PnEkiQSqX+VH2aDqSxToT5uY7zhLCtitmMR7wXHXjG1yiaJ0D1vuXb/vuJEMaDLr
 mF0L96iB1t7z00/U=
X-Received: by 2002:adf:f9c8:: with SMTP id w8mr146806wrr.575.1644250804754;
 Mon, 07 Feb 2022 08:20:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDvgFTozwMeJFuOVvysMUZ/7laEBQfDLVZr0j5iKhAqsXBlsuCnbx+kzmTfae6WztbppGmZA==
X-Received: by 2002:adf:f9c8:: with SMTP id w8mr146797wrr.575.1644250804545;
 Mon, 07 Feb 2022 08:20:04 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id h10sm4404683wrt.57.2022.02.07.08.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 08:20:03 -0800 (PST)
Message-ID: <6ae31bd1-2890-968c-a9b3-5ad4633d8bfd@redhat.com>
Date: Mon, 7 Feb 2022 17:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
To: Alex Williamson <alex.williamson@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <20220207085045.1de46df1.alex.williamson@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220207085045.1de46df1.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/02/2022 16.50, Alex Williamson wrote:
> On Sat, 5 Feb 2022 10:49:35 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Thu, 3 Feb 2022 at 22:38, Alex Williamson <alex.williamson@redhat.com> wrote:
>>>
>>> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
>>>
>>>    Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0
>>>
>>> for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f732e:
>>>
>>>    hw/vfio/common: Silence ram device offset alignment error traces (2022-02-03 15:05:05 -0700)
>>>
>>> ----------------------------------------------------------------
>>> VFIO fixes 2022-02-03
>>>
>>>   * Fix alignment warnings when using TPM CRB with vfio-pci devices
>>>     (Eric Auger & Philippe Mathieu-Daudé)
>>
>> Hi; this has a format-string issue that means it doesn't build
>> on 32-bit systems:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
>>
>> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
>> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
>> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
>> 'int'} [-Werror=format=]
>> error_report("%s received unaligned region %s iova=0x%"PRIx64
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../hw/vfio/common.c:899:26:
>> qemu_real_host_page_mask);
>> ~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> For intptr_t you want PRIxPTR.
> 
> Darn.  Well, let me use this opportunity to ask, how are folks doing
> 32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for this
> purpose, but I was eventually no longer able to maintain the build
> dependencies.  Looks like this failed on a mipsel cross build, but I
> don't see such a cross compiler in Fedora.  I do mingw32/64 cross
> builds, but they leave a lot to be desired for code coverage.  Thanks,

The easiest way for getting more test coverage is likely to move your qemu 
repository from github to gitlab - then you get most of the CI for free, 
which should catch such issues before sending pull requests.

  Thomas


