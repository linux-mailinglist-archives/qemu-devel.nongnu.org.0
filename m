Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A43ED343
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:43:14 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFb1N-0002Wo-B8
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFazG-0001B0-Sx
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFazF-0007Wq-9B
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629114060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qipKyhfb8SLB+CYwB2oTcyo1WMpnq3IIoKL4mped19I=;
 b=S8+HoxZYgMJWRSgwbkEzOVPuvOECUYRnyYyJ+ds+PkVToYhlCHZhlBWB4rIrRv7vcpXG6m
 UlxkWb6JTbu63OQ+ppkW2iWDxEPftCGNhBRsEByhBpyDZNmluvbbo4GyO5tvdfrFIQ23LY
 Mwxa2MX61NhNwMhor/B3gDEF8dpLafQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-wWz2BsUMMpifOpW_ufeOoA-1; Mon, 16 Aug 2021 07:40:59 -0400
X-MC-Unique: wWz2BsUMMpifOpW_ufeOoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so4100934wmc.3
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 04:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qipKyhfb8SLB+CYwB2oTcyo1WMpnq3IIoKL4mped19I=;
 b=ZC3Li4RIM/BTeZ5V3wW6rJbPRbNBBqQhVQTYgSt5izqe8CtUzuMdDL8zHWduymoXL8
 0pYmANVETwUSel8QtTqIPy6WW9RTGMU5gaoIeIWoxscZUcXSEGiE406z1u5nlp4UNN7U
 hLGD3O1ue2rKLL1kgOBuYknjzlr13ufofGf5DO7O+knvTAftVhSJmxidTeOrPoTE72WH
 w86KAzRGE1bNNtDCEwULPF/abIGOIWH+NiYH599DYVHC7e5WC6JySIcR9lUYXyB75U5x
 LxXlPghUvhCGEt+fxkyaLd1aT/3GfmkDHNrIPeD2fy9BkGwX2c4Rr/9FUIhudu38F0m1
 qWOg==
X-Gm-Message-State: AOAM530XyzX19/ZpsGBGhR9Cy61l+bb2UAgNetkCU+iFSSyJeOwszmOs
 +oYdEWlB9ZZyMBSAOUEZ9LULl/s1kyAaUU3hdG2WfdpTTQjAmXCwk3m7rcRi2HrnVLp0HXbFJmt
 eACoUNlSvL8X5Wgrm2E+8UItxKdfVbghgnOnQHIBWhN/dbQXMJwzUuNl+AqPN5tGn
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr17840722wrm.59.1629114057830; 
 Mon, 16 Aug 2021 04:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz22OOa6j/qHm39Yo/OoS198ndY6PIAqT77HMailG/niilorRMnc1mTcMI8xfDlzmpLJEZiEQ==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr17840699wrm.59.1629114057641; 
 Mon, 16 Aug 2021 04:40:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a77sm10898950wmd.31.2021.08.16.04.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 04:40:57 -0700 (PDT)
Subject: Re: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
To: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
 <CAFEAcA9ur-HX4r30QgEAL73VEgA+=XXpWW6v9arKcM=ijEsHvA@mail.gmail.com>
 <20210816102246.z4ybsgpmrn4isdoj@mozz.bu.edu> <YRpHxjyz8+Su4ziA@redhat.com>
 <20210816113059.h2srf2tmvylzhhjp@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d9764a2-a2f1-e33d-8183-a150d738f783@redhat.com>
Date: Mon, 16 Aug 2021 13:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816113059.h2srf2tmvylzhhjp@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 1:30 PM, Alexander Bulekov wrote:
> On 210816 1211, Daniel P. Berrangé wrote:
>> On Mon, Aug 16, 2021 at 06:22:46AM -0400, Alexander Bulekov wrote:

>>> https://gitlab.com/qemu-project/qemu/-/jobs/1505950978
>>> Looks like build-oss-fuzz is still timing out, even without the issue
>>> in the vhost-usr-blk test. At this point the job should essentially just
>>> build + test qemu-system-i386 with some extra time spent on linking
>>> the fuzzer and briefly running through all the fuzzer configs. Maybe the
>>> only way to make this work is to split the job into a build + test
>>> stage?
>>
>> At this point I think we should just disable the job in gitlab entirely.
>> We've spent too long debugging this, while leaving CI red for everyone.
>>
>> Whomever is interested in this can then work to find a way to make it
>> reliable and request it be re-enabled once confident that it will work.
>>
> 
> On my mirror the job succeeded in 41 minutes... I guess you have to get
> lucky with scheduling/ambient load.
> https://gitlab.com/a1xndr/qemu/-/jobs/1506197531

TBH I stopped looking at this job console out because it fails too often
in my pipelines :(


