Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7A62EF539
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:57:12 +0100 (CET)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu8V-00013D-Sv
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxtpC-0005Hy-Jk
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxtp8-00032x-Nl
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610120228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMunyF806nodJ93lsVY0cAXqPuExAaa51TkLDSPWTjs=;
 b=gaPYqaLq+5FdeLCvmSbcwOvYy0jYRPnmtc4w1TlFgTGkGMMdkU/RIX5CRqNrYVe2yGuhVI
 TDXUs01S7itgD33Y7feB8r1iwPzXOmeMsp3YB7KxLMQg+6xPnDvtMFRJQ7Nm0qv4jh9ksr
 4cyPS3pJ1d+dZibahm/sAXEaeu+wBno=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-_U1mt4FtNd6LB56RprNjUA-1; Fri, 08 Jan 2021 10:37:03 -0500
X-MC-Unique: _U1mt4FtNd6LB56RprNjUA-1
Received: by mail-wr1-f72.google.com with SMTP id j5so4304728wro.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FMunyF806nodJ93lsVY0cAXqPuExAaa51TkLDSPWTjs=;
 b=fuF/OXmifFp7JOshYuc59f+Jy16RuczR/Pqnaa3hXCpxEMe1T3Mh2uABW5YAxWtQ27
 0Ht1g+aXHNB1UdzPOWahPW9IUz5eOz2Ffz440viNnTsshHEHJ4p49ReoFNGVKuZjZ1iv
 dwFi9/AK/ECy4ui7qoG26CTv9sGKEFNRmw0sP463TGx1ojGzSrKBow9XejqCb8PmnMXb
 Ko724SfsIg31xZXQQbuNH/DOPMpWjeFTTE32xNLgfEp1o5TYdu7obK2pGjbEHItbDiLm
 jiZ094Ol48fqZe2k7UwTQTRjFWfLNMRJgDr6YFNIZmBXVDbiO/KRqsn7FOQSX6dEd9dJ
 4eaw==
X-Gm-Message-State: AOAM532gr1VSbnRa4Jl/PbDbGOR7TGQ0cc9UnZq7E/7xBIULV5I+1kBE
 xqjgcUjZJbBgNEfyHRjBzzBg5P299j4iI6HEKx459hXLsKDJTh6YXnaxtMko4HAF6/wzRF8C1xK
 n3RKjQnl2tyActnk=
X-Received: by 2002:adf:a2ca:: with SMTP id t10mr4210510wra.370.1610120222097; 
 Fri, 08 Jan 2021 07:37:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf0BICsmlbRdeurWYwey0BEC4+UKT67KLc59lVe/w3bAjtbr5/SIEzbJLGWpO4Hcz9vZyN9A==
X-Received: by 2002:adf:a2ca:: with SMTP id t10mr4210487wra.370.1610120221849; 
 Fri, 08 Jan 2021 07:37:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u205sm13100412wme.42.2021.01.08.07.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 07:37:01 -0800 (PST)
Subject: Re: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210108145103.269353-1-f4bug@amsat.org>
 <28635389-fbe2-89eb-5ec6-5fdc1da98c6a@redhat.com>
 <20210108152121.GK1082385@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c0ecc6b-0f37-2a0b-d4b9-299ba52099d3@redhat.com>
Date: Fri, 8 Jan 2021 16:36:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210108152121.GK1082385@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/21 16:21, Daniel P. Berrangé wrote:
> On Fri, Jan 08, 2021 at 04:14:30PM +0100, Paolo Bonzini wrote:
>> On 08/01/21 15:51, Philippe Mathieu-Daudé wrote:
>>> The following jobs are duplicated on Gitlab-CI since commit
>>> 6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):
>>>
>>> - IMAGE=debian-armel-cross
>>>
>>>     TARGET_LIST=arm-softmmu               -> cross-armel-system
>>>     TARGET_LIST=arm-linux-user            -> cross-armel-user
>>>     TARGET_LIST=armeb-linux-user          -> cross-armel-user
>>>
>>> - IMAGE=debian-armhf-cross
>>>
>>>     TARGET_LIST=arm-softmmu               -> cross-armhf-system
>>>     TARGET_LIST=arm-linux-user            -> cross-armhf-user
>>>     TARGET_LIST=armeb-linux-user          -> cross-armhf-user
>>>
>>> - IMAGE=debian-arm64-cross
>>>
>>>     TARGET_LIST=aarch64-softmmu           -> cross-arm64-system
>>>     TARGET_LIST=aarch64-linux-user        -> cross-arm64-user
>>>
>>> - IMAGE=debian-s390x-cross
>>>
>>>     TARGET_LIST=s390x-softmmu             -> cross-s390x-system
>>>     TARGET_LIST=s390x-linux-user          -> cross-s390x-user
>>>
>>> - IMAGE=debian-mips-cross
>>>
>>>     TARGET_LIST=mipsel-linux-user         -> cross-mips-user
>>>
>>> - IMAGE=debian-mips64el-cross
>>>
>>>     TARGET_LIST=mips64el-softmmu          -> cross-mips64el-system
>>>     TARGET_LIST=mips64el-linux-user       -> cross-mips64el-user
>>>
>>> - IMAGE=debian-ppc64el-cross
>>>
>>>     TARGET_LIST=ppc64-softmmu             -> cross-ppc64el-system
>>>     TARGET_LIST=ppc64-linux-user          -> cross-ppc64el-user
>>>     TARGET_LIST=ppc64abi32-linux-user     -> cross-ppc64el-user
>>>
>>> Remove them from Shippable CI.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    .shippable.yml | 14 +-------------
>>>    1 file changed, 1 insertion(+), 13 deletions(-)
>>>
>>> diff --git a/.shippable.yml b/.shippable.yml
>>> index 14350e6de8a..97bfa2a0f38 100644
>>> --- a/.shippable.yml
>>> +++ b/.shippable.yml
>>> @@ -7,20 +7,8 @@ env:
>>>      matrix:
>>>        - IMAGE=debian-amd64
>>>          TARGET_LIST=x86_64-softmmu,x86_64-linux-user
>>> -    - IMAGE=debian-armel-cross
>>> -      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
>>> -    - IMAGE=debian-armhf-cross
>>> -      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
>>> -    - IMAGE=debian-arm64-cross
>>> -      TARGET_LIST=aarch64-softmmu,aarch64-linux-user
>>> -    - IMAGE=debian-s390x-cross
>>> -      TARGET_LIST=s390x-softmmu,s390x-linux-user
>>>        - IMAGE=debian-mips-cross
>>> -      TARGET_LIST=mips-softmmu,mipsel-linux-user
>>> -    - IMAGE=debian-mips64el-cross
>>> -      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
>>> -    - IMAGE=debian-ppc64el-cross
>>> -      TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
>>> +      TARGET_LIST=mips-softmmu
>>
>> The debian-mips-cross/mips-softmmu pair (and also mipsel-softmmu) is
>> currently excluded by Gitlab's cross-mips-system, is there a reason for
>> that?  If we add it there, we can just remove shippable altogether.
> 
> Some softmmu targets were disable to keep the build time under control.
> 
> We could enable a different subset of targets for each cross host arch,
> so that overall we get representative coverage of the full set.

Right, but at least KVM targets ought to be included in their own cross 
host.

Paolo


