Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEDD2D0858
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:58:18 +0100 (CET)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3uz-0007Gd-Bs
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1km3i1-0001HD-Fm
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:44:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1km3hx-0000gu-Pn
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607298287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
 b=ZPnoksmjWyUA3DZT73/aj4xJZqJZTpQXTVbtouEC2ek8xONhxzEnp4rLRCXW5qfh0L0JpU
 Z5Y17C5+3GagyFqFzKSBk4q1kR8jGlmzlsDNCOKPDtoiiNP2H8Ns6UEe3M3WjX6gvFZcX/
 nq7tkmt966EupI2DkIK9oXo8fZiwo9A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-6uoWn9b8N7uEFbjXBONSFA-1; Sun, 06 Dec 2020 18:44:43 -0500
X-MC-Unique: 6uoWn9b8N7uEFbjXBONSFA-1
Received: by mail-wm1-f69.google.com with SMTP id z12so4567539wmf.9
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
 b=lKa4n2ymZ1RdgThfhf7mWqu4XAsGlwTbpn/Tun2c2ngjpMubqaghMqfyCtu94dfwkn
 rheFJRfWk8t+Wwyw2Y7M8p3f1gQblq2vRlapSXnMIGSvlqGiHGyttePObqdIrsbQs8KI
 lVPmGyp17Rj8xspiE+KLD9IuFQ1BiTaGqWFqk9U+Jx9C839i+DpDttJmzyxRwko3avyo
 O50Wb+pA6qCPuy4VKWG2QVmY/jSXcZ0v5TdIqGKHXJkA38ti0dwkGHPeMkx4hHk1Uffu
 +OWF7JXbNoOInRdsjkQ26ID17MHvLxK60QiGgIVcNCmOEjoGaojrOMqHb0yRwv7rI2xs
 9w8Q==
X-Gm-Message-State: AOAM530Rkt8WbL0wYfRlqr+lZpm9e8Rt6k/wjU2iuRUs4Mtya55LqG1t
 KZ8CmnclKtsG/wAKQz1hAKOtOYofio4aiFQkzNFvh/0K7DxX0GC5E+uhG0crTzsq8QlvDZTm699
 UsmFqVxxnULZLSMQ=
X-Received: by 2002:a7b:c303:: with SMTP id k3mr15698507wmj.21.1607298282210; 
 Sun, 06 Dec 2020 15:44:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9Ly/Z3VYUD9ldB9eMDBoFXsydwmOnqU35i1cTdXNWpuYJCJR1JajcbqGx6vrhzpycS4B9gw==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr15698481wmj.21.1607298282031; 
 Sun, 06 Dec 2020 15:44:42 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c9sm12697020wrp.73.2020.12.06.15.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 15:44:41 -0800 (PST)
Subject: Re: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
To: Claudio Fontana <cfontana@suse.de>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-3-philmd@redhat.com>
 <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3b42add-6586-8723-ab81-4fdd660277fc@redhat.com>
Date: Mon, 7 Dec 2020 00:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 8:23 PM, Claudio Fontana wrote:
> On 12/6/20 7:55 PM, Philippe Mathieu-Daudé wrote:
>> Introduce a job template to cross-build accelerator specific
>> jobs (enable a specific accelerator, disabling the others).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 099949aaef3..be63b209c5b 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -13,6 +13,18 @@
>>            xtensa-softmmu"
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>> +.cross_accel_build_job:
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>> +  timeout: 30m
>> +  script:
>> +    - mkdir build
>> +    - cd build
>> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
>> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
>> +    - make -j$(expr $(nproc) + 1) all check-build
>> +
>>  .cross_user_build_job:
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>
> 
> Hi Philippe,
> 
> probably I just don't understand how this works, but
> where is the "disabling the others" part?

Sorry I forgot to document $ACCEL_CONFIGURE_OPTS, which
can be used to amend options. See x86 and s390x jobs
(the only one buildable without TCG afaik) use:

    ACCEL_CONFIGURE_OPTS: --disable-tcg

> 
> I see the --enable-${ACCEL:-kvm}, but I would expect some --disable-XXX ?
> 
> I am probably just missing something..

The goal of this series is not to test --disable-tcg, but
to test --enable-kvm when you don't have access to a host
arch. I see testing --disable-tcg as a bonus :)

> 
> Thanks,
> 
> Ciao,
> 
> Claudio
> 


