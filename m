Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A65EB188
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:48:21 +0200 (CEST)
Received: from localhost ([::1]:60788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocu5T-000684-54
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ocu1d-00021x-1H
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ocu1Z-0004ho-Lh
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664221456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRGbgV7CewtnPo9ajuvUSujXQ8mMIdCVqygf/ajaJSM=;
 b=JiiagrbzCyqrMZnbAf2fXwuvAUODUQNArVuWcC6JPO5MOaTuFk5bCqNtQFDkX+Nmj73Gpc
 yddxI+538/vz/rd3glXEUTKHrJXh8q9ITpsGzLtoeLmu1qMYU50ldPRdLgVWrHvTZ2MPiO
 fCsm6t1lCpPtLzw+2dyD2pqiq57R6N8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-208iP_VsOAabdOXarBaNRg-1; Mon, 26 Sep 2022 15:44:15 -0400
X-MC-Unique: 208iP_VsOAabdOXarBaNRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so6081811edb.5
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 12:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eRGbgV7CewtnPo9ajuvUSujXQ8mMIdCVqygf/ajaJSM=;
 b=F+5+HGoUht7X7euPWs9nH5umxoSb9iSVNLvzFd0+gifFYXPq1CryBwpO7RsqEbAJli
 AK81EIFc+l9F0M2P1Cbgv+ah4kSbLkjpUId76aWdw+1Y/YE+fjwHPzL7al/N/2ZUiZoB
 Fz4zlsKn2ErUU9QQ0+5iuleQ9bu9bHL/5MghMDZWHIieOkdWaJUDg0hrGFevCSvblI5i
 XPYeOqQ6HX9EqI6Iu7Ff5tawpDzv6yq1+esvPrsixOgUqC7dfblixwN+03/Q3IwMKYEM
 WfiNfxD0uShKv5WX5/GGMi/SmqOfBqXh0qBaXiz6c/NBee6Yg/yXnsr1XPBe7/rhQ6Yq
 SxZQ==
X-Gm-Message-State: ACrzQf1TPT6ISLZvXDSH7crKE5DO06qCV6IidmIH5YJFjEcSGM7ZWy/Q
 utd532xuH40+smSa49yb3LM8B4iy7MTEpK7hWrphoQLDqxcHgrzt5sCqv400A5RBfS65o5kT8CT
 e1E9GDlphsqA84ww=
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id
 o23-20020aa7dd57000000b004532d3570bbmr24973534edw.26.1664221454634; 
 Mon, 26 Sep 2022 12:44:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5U1C0u0GwFOFSNdfzUXClZX5Po3pP3QANqxpV4A0u+uWWDrPfv8PW8Oss8dtRjiBWnTkzbSw==
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id
 o23-20020aa7dd57000000b004532d3570bbmr24973435edw.26.1664221453298; 
 Mon, 26 Sep 2022 12:44:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b00731803d4d04sm8562479ejo.82.2022.09.26.12.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 12:44:12 -0700 (PDT)
Message-ID: <e8ac651a-8736-7455-8945-34f680404f5b@redhat.com>
Date: Mon, 26 Sep 2022 21:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dmitry V. Levin" <ldv@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
 <20220926180812.oojocmldqsf7kl2o@altlinux.org>
 <CAFEAcA8tfam1tENE+O9Ae=69mbb=k=XOuJ0AsM9ErqURSnsuXQ@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CAFEAcA8tfam1tENE+O9Ae=69mbb=k=XOuJ0AsM9ErqURSnsuXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 9/26/22 21:07, Peter Maydell wrote:
> On Mon, 26 Sept 2022 at 19:08, Vitaly Chikunov <vt@altlinux.org> wrote:
>>
>> Peter,
>>
>> On Mon, Sep 26, 2022 at 02:36:44PM +0100, Peter Maydell wrote:
>>> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
>>> there is no pending signal to be taken. In commit 94ccff13382055
>>> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
>>> generic KVM code. Adopt the same approach for the use of the
>>> ioctl in the Arm-specific KVM code (where we use it to create a
>>> scratch VM for probing for various things).
>>>
>>> For more information, see the mailing list thread:
>>> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
>>>
>>> Reported-by: Vitaly Chikunov <vt@altlinux.org>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> The view in the thread seems to be that this is a kernel bug (because
>>> in QEMU's case there shouldn't be a signal to be delivered at this
>>> point because of our signal handling strategy); so I've adopted the
>>> same "just retry-on-EINTR for this specific ioctl" approach that
>>> commit 94ccff13 did, rather than, for instance, something wider like
>>> "make kvm_ioctl() and friends always retry on EINTR".
>>> ---
>>>  target/arm/kvm.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>> index e5c1bd50d29..2982d216176 100644
>>> --- a/target/arm/kvm.c
>>> +++ b/target/arm/kvm.c
>>> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>>>      if (max_vm_pa_size < 0) {
>>>          max_vm_pa_size = 0;
>>>      }
>>> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>>> +    do {
>>> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>>> +    } while (vmfd == -EINTR);
>>
>> This does not seem correct. ioctl(2) returns -1 on error and will set errno
>> to EINTR (in this case).
> 
> Oops, thanks for the catch. I was copying the pattern from kvm-all.c,
> but there we are calling kvm_ioctl(), which does "if ioctl
> returns -1, return -errno", and here we are calling ioctl() directly.
> (We can't use kvm_ioctl() here because this stunt VM doesn't have
> a KVMState.) I'll respin the patch with the obvious fix.
Damned, I did not notice either, sorry.

Thank you Vitaly for the catch.

Eric
> 
> thanks
> -- PMM
> 


