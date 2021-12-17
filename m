Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D14E4785CD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 08:59:14 +0100 (CET)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my892-0006cO-Sw
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 02:59:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1my87P-0005L0-1N
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 02:57:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1my87L-0007HR-13
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 02:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639727845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lfMlVdufmdfnxSqm8tWvhwVrrEoiUPF+GG17XvIHTw=;
 b=H2wk8CP83FkCdLdv6oflvhyOgCXP45ohS7hpyWbQ8FvIR2rP/B/ItesLBVR4yppanb0oGc
 lunfLPErgKfxvV/PtTKAvtB37eK2TNH+wd151Z6Emy34NnTnNUhdL5bsZ30h3C5VQrJxSI
 DGUXt5Pwz4ojlCUE+FmhqeA+wugL/o4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-xiNfFejRMiSItKva9vrQzQ-1; Fri, 17 Dec 2021 02:57:22 -0500
X-MC-Unique: xiNfFejRMiSItKva9vrQzQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso334912wrh.20
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 23:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6lfMlVdufmdfnxSqm8tWvhwVrrEoiUPF+GG17XvIHTw=;
 b=GOSbVM4VjYtMSon/2Hs85egGaZdYAJkKKPJHig5XKZWsqAbIwfyuQZsTK+vEvCxsEz
 QaZF0MYs/pHpx0D3gFf7o+5mjlRUAYnU9Ttp3jprMbZG9O1zaW4AZnpHleQgKy/ZHbsd
 SzFqKdgAysLrVHFMYn0n44EJv10OH3Wmvbrr5+cASevROXpbIhxwswqsscl90nCcQ0cy
 B2TDXdoHNNy1GaPfJIYPiP1iVJEAiiFgXEEq5SgdHmzA7O9rtjSWBXy8xIY6Y3RBM4AT
 x8d/yWM5LqcMiTQdN/DZ7PaNsMdoFSmDOVBdNOEE3lTuiWWQYzjLEcejf6MgPHvWCGqN
 nyVg==
X-Gm-Message-State: AOAM531/1FivE6lNSRxANa6805dxQMpS7lIprvz4cR69GpPMlYytev9B
 4Ckb2PTAH7QFjCkryr19h2eGtsGSYSTA/aoiOISuVTMk2cIAtZ78x9wzBhSgPo7IUHN5CqOYruQ
 kmnJ/RACPPpV1p2M=
X-Received: by 2002:adf:e291:: with SMTP id v17mr1348829wri.479.1639727841345; 
 Thu, 16 Dec 2021 23:57:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqb5YkIJ4Pyu46kmJjP5mSO6P85K/majBi7KHrvm1ZtMk7T815ROpvu5S3v/MxUu0TLgvezA==
X-Received: by 2002:adf:e291:: with SMTP id v17mr1348816wri.479.1639727841080; 
 Thu, 16 Dec 2021 23:57:21 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id k7sm6765524wri.110.2021.12.16.23.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 23:57:20 -0800 (PST)
Message-ID: <aa22b9c9-77f6-6dce-d852-57e1926cf9c1@redhat.com>
Date: Fri, 17 Dec 2021 08:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 0/8] s390x patches (and one gitlab-CI fix)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211216094447.58496-1-thuth@redhat.com>
 <76b05ebe-6c6e-7bdc-016b-dc36aaadb2d4@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <76b05ebe-6c6e-7bdc-016b-dc36aaadb2d4@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2021 17.38, Richard Henderson wrote:
> On 12/16/21 1:44 AM, Thomas Huth wrote:
>>   Hi!
>>
>> The following changes since commit e630bc7ec9dda656a452ed28cac4d1e9ed605d71:
>>
>>    Merge tag 'pull-block-2021-12-15' of git://repo.or.cz/qemu/armbru into 
>> staging (2021-12-15 12:14:44 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/s390x-2021-12-16
>>
>> for you to fetch changes up to 79e42726050b7be6c2104a9af678ce911897dfaa:
>>
>>    gitlab-ci: Speed up the msys2-64bit job by using 
>> --without-default-devices (2021-12-16 10:22:39 +0100)
>>
>> ----------------------------------------------------------------
>> * Small fixes for the s390x PCI code
>> * Fix reset handling of the diag318 data
>> * Add compat machines for 7.0 (all architectures)
>> * Ease timeout problem of the new msys2-64bit job
>>
>> ----------------------------------------------------------------
>> Christian Borntraeger (1):
>>        MAINTAINERS: update email address of Christian Borntraeger
>>
>> Collin L. Walling (1):
>>        s390: kvm: adjust diag318 resets to retain data
>>
>> Cornelia Huck (1):
>>        hw: Add compat machines for 7.0
>>
>> Matthew Rosato (4):
>>        s390x/pci: use a reserved ID for the default PCI group
>>        s390x/pci: don't use hard-coded dma range in reg_ioat
>>        s390x/pci: use the passthrough measurement update interval
>>        s390x/pci: add supported DT information to clp response
>>
>> Thomas Huth (1):
>>        gitlab-ci: Speed up the msys2-64bit job by using 
>> --without-default-devices
>>
>>   .gitlab-ci.d/windows.yml        |  2 +-
>>   .mailmap                        |  1 +
>>   MAINTAINERS                     |  6 +++---
>>   hw/arm/virt.c                   |  9 ++++++++-
>>   hw/core/machine.c               |  3 +++
>>   hw/i386/pc.c                    |  3 +++
>>   hw/i386/pc_piix.c               | 14 +++++++++++++-
>>   hw/i386/pc_q35.c                | 13 ++++++++++++-
>>   hw/ppc/spapr.c                  | 15 +++++++++++++--
>>   hw/s390x/s390-pci-bus.c         |  1 +
>>   hw/s390x/s390-pci-inst.c        | 15 +++++++++------
>>   hw/s390x/s390-pci-vfio.c        |  1 +
>>   hw/s390x/s390-virtio-ccw.c      | 14 +++++++++++++-
>>   include/hw/boards.h             |  3 +++
>>   include/hw/i386/pc.h            |  3 +++
>>   include/hw/s390x/s390-pci-bus.h |  3 ++-
>>   include/hw/s390x/s390-pci-clp.h |  3 ++-
>>   target/s390x/cpu.h              |  4 ++--
>>   target/s390x/kvm/kvm.c          |  4 ++++
>>   19 files changed, 97 insertions(+), 20 deletions(-)
> 
> Fails like so:
> 
>   (162/171) 
> tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias: 
> FAIL: None != 'Cascadelake-Server-v1' : Cascadelake-Server must be an alias 
> of Cascadelake-Server-v1 (0.14 s)
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1893456217
> 
> Which is presumably the compat machines in patch 7.

Drat ... that's what you get if some jobs are not run by default on private 
repos :-/

Ok, I'll unqueue that patch for now. Cornelia, could you please have a look?

  Thomas


