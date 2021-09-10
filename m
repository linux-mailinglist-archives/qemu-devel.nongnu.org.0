Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C032406C93
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:58:52 +0200 (CEST)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOg7H-0004pn-6o
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOg4W-0000Xu-5V
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOg4Q-0004Rp-W1
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631278553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoS1alJQJWuSScMgZR7PFPbUfNKJ3tVEysgknaF+1uM=;
 b=iT6ByG6HGimmbtnV9wCROAo7Q1V0QA92u7c3jorvg1ydjLqLbOEcn7+B1BuIBTk5uiRJEU
 LiAssrzuJJXF26g1O3MG/1TLhbE5JlNTSpWKq3QSe4vmalFRmgkQG4xAvY9s/3UKZjRq+f
 TCC7/SJF7ulkjXVBqDkL931u7VA57G8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-HNwMoaLVMsaKg1q5aHc0Fw-1; Fri, 10 Sep 2021 08:55:51 -0400
X-MC-Unique: HNwMoaLVMsaKg1q5aHc0Fw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a27-20020a5d457b000000b0015b11fccc5eso474429wrc.10
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DoS1alJQJWuSScMgZR7PFPbUfNKJ3tVEysgknaF+1uM=;
 b=y+kfBei/mIIlK8/10NKr7sebQpKiiHqwhJX4Fkj3sCIwhQH9RH2rLFEM3fJfAnPSxg
 VmSeBkIKb5dSOvD6BEApTUMix0mAshOvtujlvnEH2FG4xhxI4PptqGm9paw/fCSEFeAO
 XdKXglgoEIdoJBlNtY6S6C5teo1SpNIGFCljE/lYMN5JoGqCAkYZnptKVD5rI5znIwrq
 1amvgnRTCHXjfy5YUdgUl1AcEDuvWkJ4TD6BbCUdwhC+L/VAieXVA8qMwI8cijnBVkne
 IAF4wttC/s5yMd6C9lY+fVSBmVcRmEQZbaxDF1bjkC+Qr91YO0xhIh3s2HIfyD4TQc60
 6Xsg==
X-Gm-Message-State: AOAM533l9B3K/J3sA0dcmpZj/cc+tfjlKAwOGqlU7zeI5ah5nzzxtbxC
 iKQX2d4itHOLers/oN/M+kWehrMRWqQ6aAGUe9/vByigKGP0pDMpGMZaiB95SWGPeLTAtEQKTTk
 c1lBxAbObED1OfEs=
X-Received: by 2002:adf:f612:: with SMTP id t18mr9607018wrp.16.1631278550135; 
 Fri, 10 Sep 2021 05:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQLhoP0gSFgZt/IlgX3YhQwUQmsg/KTvj7u3y1tOKFmfC72PIOnViVCADkiz4SYSJnz79Fcw==
X-Received: by 2002:adf:f612:: with SMTP id t18mr9606984wrp.16.1631278549886; 
 Fri, 10 Sep 2021 05:55:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j2sm4590690wrq.35.2021.09.10.05.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:55:49 -0700 (PDT)
Subject: Re: [PULL 0/7] Migration.next patches
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87fsudn30g.fsf@secure.mitica>
 <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
 <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b5b57f82-4dba-53ca-ba18-51f0f6386c44@redhat.com>
Date: Fri, 10 Sep 2021 14:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 7:27 AM, lizhijian@fujitsu.com wrote:
> On 10/09/2021 13:20, Li Zhijian wrote:
>> On 10/09/2021 00:10, Juan Quintela wrote:
>>> "Li, Zhijian" <lizhijian@cn.fujitsu.com> wrote:
>>>> on 2021/9/9 21:42, Peter Maydell wrote:
>>>>> On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wrote:
>>>>> Fails to build, FreeBSD:
>>>>>
>>>>> ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
>>>>>       int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
>>>>>                         ^
>>>>> ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_ADVICE_PREFETCH'
>>>>>                    IBV_ADVISE_MR_ADVICE_PREFETCH;
>>>>>                    ^
>>>>> ../src/migration/rdma.c:1150:11: warning: implicit declaration of
>>>>> function 'ibv_advise_mr' is invalid in C99
>>>>> [-Wimplicit-function-declaration]
>>>>>       ret = ibv_advise_mr(pd, advice,
>>>>>             ^
>>>>> ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_FLAG_FLUSH'
>>>>>                           IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
>>>>>                           ^
>>>>>
>>>> it's introduced by [PULL 4/7] migration/rdma: advise prefetch write for ODP region
>>>> where it calls a ibv_advise_mr(). i have checked the latest FreeBSD, it didn't ship with this API
>>>> May i know if just FressBSD reports this failure? if so, i just need filtering out FreeBSD only
>>> Second try.  I can't see an example where they search for:
>>> a symbol on the header file
>>>    and
>>> a function in a library
>>>
>>> so I assume that if you have the symbols, you have the function.
>>>
>>> How do you see it?
>>>
>>> Trying to compile it on vm-build-freebsd, but not being very sucessfull
>>> so far.
> 
> BTW: Does QEMU provide any mean to set http(s)_proxy to building vm ? Currently, i have to
> hack the code like:
> 
> -        self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
> +        self.ssh_root_check("setenv HTTP_PROXY http://myproxy; setenv HTTPS_PROXY http://myproxy; pkg install -y %s\n" % " ".join(self.pkgs))

This is supported since commit b08ba163aaa ("tests/vm: send proxy
environment variables over ssh"). Maybe we only pass lower case
variables and should consider upper case too?

> 
> 
> Thanks
> Zhijian


