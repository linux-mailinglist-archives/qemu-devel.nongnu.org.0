Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C2521072
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:16:52 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noLz8-0005Hi-Cj
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noLQ0-00051f-Bp
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noLPy-0001OC-1W
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652172029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20gG+O79Y14Si2RxqRF+9964xD9MPIFsEcjEhEBMiaY=;
 b=SqxBfAessNakhFVjIZZ2Ejngxg/ms/m0QGN6X0M4uQJ64XGcvV+N4T1GOJWXz+GOaUEE8W
 9JZPdJkS//2ExrPnXobsCyKCfwxv/fiBkyt9aSZap1Uijab3EqJL599fbB60fO/XWosD/Y
 DFh6Imkp51UK5pvGS0OVo1BzAjSUMXE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-UFzWygFVMmCAc5EqeincnA-1; Tue, 10 May 2022 04:40:28 -0400
X-MC-Unique: UFzWygFVMmCAc5EqeincnA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so503212wmi.8
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 01:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=20gG+O79Y14Si2RxqRF+9964xD9MPIFsEcjEhEBMiaY=;
 b=14CkJTDDFOliUtZUhIdrY1FpDMeShDHCsXVYv+UU25dUUUbuddidDa18KYvX2ofyWD
 UbFh2er1yOEWKtfIJSse8pz/ssLR94OASdwWYUd1jKfS5h/Rj/pYWEN/d7LGGDseokNW
 qmaIlX9Khsz+ftl62OM4sCS3TFHnZKnEgXWb6jQbOpMwIQbc+GoffCezMJtT3TbnrrgA
 tOOw1Eij/5puQOR2nxjFyTQSOgZamtGnnFJtpLKvtM2RiSpYJPOiJwKyx2xwg5glhPPu
 xrZlYZLuVwAEp7m9pwDZXh9w39JSoXvX1JxtHWLc4LLpRSbhOAm0S5moFglPVVr9Awd+
 7HfQ==
X-Gm-Message-State: AOAM531vLojPoBiotcEbQ+/I08G2/B6t/IXGftPfCYRpaH7a5WF0OjfC
 tXUiaiTDPxhT7RlFIagiSyF50Z2/+DGvCW+j54xFB9Z31f8YxkHyXsPEFe7qTR5BjKk8lpGRArG
 pG/yjmbRVfNer4Is=
X-Received: by 2002:a05:600c:2210:b0:393:ffb8:2985 with SMTP id
 z16-20020a05600c221000b00393ffb82985mr26373981wml.167.1652172026944; 
 Tue, 10 May 2022 01:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYhtHruCUPrsxXhehZXavMN0Q4d4EIXntvrufAGY8c/ZdH7TrDIcwLCEgbuPOKn4ik610RdQ==
X-Received: by 2002:a05:600c:2210:b0:393:ffb8:2985 with SMTP id
 z16-20020a05600c221000b00393ffb82985mr26373937wml.167.1652172026531; 
 Tue, 10 May 2022 01:40:26 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 d6-20020adfa346000000b0020c5253d8d5sm13436586wrb.33.2022.05.10.01.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 01:40:26 -0700 (PDT)
Message-ID: <a61ed836-2d31-677c-235d-9fc491e483ac@redhat.com>
Date: Tue, 10 May 2022 10:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, muriloo@linux.ibm.com,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Miroslav Rezanina <mrezanin@redhat.com>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <0cc7cfdb-db80-f05b-49d8-d5db8baa6bfd@ilande.co.uk>
 <6b41eea4-687e-11cf-392f-75fa6f5d2e34@linux.ibm.com>
 <9f68b28d-62e8-2a96-4f92-cc8f5bfd473f@ilande.co.uk>
 <aefec76d-a3a7-0312-6925-a35d9b2cec18@linux.ibm.com>
 <0664ffae-9037-3096-ea0d-6d6732ac0214@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU with reduced amount of machines in the config (was: [PATCH]
 mos6522: fix linking error when CONFIG_MOS6522 is not set)
In-Reply-To: <0664ffae-9037-3096-ea0d-6d6732ac0214@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 05/05/2022 10.19, Mark Cave-Ayland wrote:
> On 05/05/2022 02:24, Murilo Opsfelder Araújo wrote:
> 
>> Hi, Mark.
>>
>> On 5/4/22 11:32, Mark Cave-Ayland wrote:
>>> On 04/05/2022 14:16, Murilo Opsfelder Araújo wrote:
>>>> Hi, Mark.
>>>>
>>>> On 5/4/22 04:10, Mark Cave-Ayland wrote:
>>>>> On 02/05/2022 14:36, Murilo Opsfelder Araújo wrote:
>>>>>
>>>>>> Hi, Mark.
>>>>>>
>>>>>> Thanks for reviewing.  Comments below.
>>>>>>
>>>>>> On 5/2/22 06:43, Mark Cave-Ayland wrote:
>>>>>>> On 30/04/2022 00:31, Murilo Opsfelder Araujo wrote:
[...]
>>>>> Certainly QEMU could do better here, but then if you are already 
>>>>> patching the build to generate a custom configuration as above, you 
>>>>> might as well just patch out the relevant part of hmp-commands-info.hx 
>>>>> at the same time until proper per-device HMP/QMP support is added.
>>>>
>>>> We are not patching the build.  We are just configuring it.
>>>
>>> That's not true though: the spec file linked above contains 20 patches to 
>>> the vanilla QEMU source, including feeding custom device lists into the 
>>> build system via 
>>> https://gitlab.com/redhat/centos-stream/rpms/qemu-kvm/-/blob/c9s/0005-Enable-disable-devices-for-RHEL.patch. 
>>
>> I'm sorry.  I think I wasn't clear enough.
>>
>> The reproducer I sent in the email was *adapted* from CentOS/RHEL 
>> qemu-kvm.spec.
>> Meaning that we configured the devices in the same way that the 
>> CentOS/RHEL package is configuring but used the unmodified QEMU source 
>> tree from upstream.
>>
>> I did that because I wanted to mimic its configuration (devices and 
>> configure options) against the upstream code to determine if the failure 
>> was a downstream or upstream issue.
>> It turns out it's an upstream regression.
> 
> Ah so that's the problem then - you can't guarantee the configuration from a 
> vendor-customised build will work with upstream, particularly when the build 
> system itself has been patched. More explanation below.
> 
>>> Perhaps CONFIG_MOS6522 is missing from ppc64-rh-devices?
>>
>> I don't think so.  Since the CONFIG_MOS6522 is available, one can build 
>> without it and code should cope with that.
> 
> In an upstream build the default boards for each target are listed in the 
> configs/ directory and Kconfig specifies the dependencies such that for ppc 
> and ppc64 CONFIG_MOS6522 is **always** defined. However what happens in the 
> .spec file you linked to is that the device lists **are being overridden** 
> by the provided ppc64-rh-devices file which **doesn't** contain 
> CONFIG_MOS6522. It seems to me that the .spec file can only work with that 
> vendor-specific ppc64-rh-devices file if it also patches the build system to 
> prevent this error occurring.

Well, yes and no. QEMU was quite monolitic for many years (that's where most 
of these downstream patches have their origin from), but the Kconfig stuff 
that was introduced a while ago (which required quite a lot of patches to 
untangle many parts of the build) was indeed meant for giving more 
flexibility here, so that downstream vendors could build QEMU more easily 
with only a subset of the machines (which is not only a desire by Red Hat, 
by the way - do you remember the "nemu" fork a while ago for example?). We 
still have quite a bit on the TODO list for full flexibility (e.g. mips 
config has not been fully switched to Kconfig yet, I think), but for most 
architectures, it should already work that you only select a subset of the 
available machines.

However, as you already noticed the big downside is still that this is not 
tested automatically in the upstream CI environment, so regressions like 
this one here with the mos6522 are expected. In the long run, I think we 
certainly want to test e.g. this cut-down CentOS-stream configuration in the 
CI, too ... it's just a big bunch of work that nobody started to tangle with 
yet.

  Thomas


