Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985655BF5D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:16:11 +0200 (CEST)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66OI-00041S-Md
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o65bX-0000vi-QJ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o65bU-0003WV-00
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656401143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGMLIa6Z8O+7EGEwy8nawR03jqzlduZtm+wxH/AyPtM=;
 b=aHcO1/QlIA/xyOGjsXKl0oMEAvgh09Fsrh3yqyi3fCGiFJePB27Pmc1APakZM3dr9bGvkQ
 XZauFht1iPF+6FPRxZ2Bpn0Id+5lSdRqjaL1EppCsLPUE4qe+qY/4V6Teqv0fed5RZ2QHM
 qpgdpNg1OSfdl8fo9SdzvJ2XXlQz5mk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-0u3BEpwiMkiyZrKw3iCaIA-1; Tue, 28 Jun 2022 03:25:37 -0400
X-MC-Unique: 0u3BEpwiMkiyZrKw3iCaIA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r20-20020adfb1d4000000b0021b8507563eso1554559wra.16
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DGMLIa6Z8O+7EGEwy8nawR03jqzlduZtm+wxH/AyPtM=;
 b=Q3GR272CyRAsxTZQm4+SF+Iaesc6UcSVhvPunwV+drqJTThOojO4ISBRfRxX1myW44
 cjiBh7IbDhfgkhIJVMkfn0drB4DMYI+oFAIV/6hTe2SGOLlj/ype+MEyj6NtomcH/PkC
 +XRZKUYlJg8Ii6RiUNeW7A7UxpMh7iUHp1DZWz3LDFwXuFNYBPx2PnxNtXUZ67ulM+XG
 Wk9xuqiWkBkBWQw7yp0Ix8MO/zVPsWyHN1YrVuClItfR6+VXT3pv3ki1ui4EAbjg2Zcg
 D2C0Kp70xTShf/KA2T2mPCAG9IYcoEBfPJzsE0HCSCYWeWI5u8Lf+fuTPcmXOhWtg6Zi
 7fmQ==
X-Gm-Message-State: AJIora8ybFm9lHZ3q5rL07WHzpkMf4f1vlU5kXZs/sS6oj7pr40OnE3B
 iyZ5MR16MMh9j6ULUDIJ6EYZzOWrYyHn9bYoLARpWrw53+gpGdl6n0xxTQnuvUpRHJfirW7Gux1
 ZMjpzgDYDL2cmCMw=
X-Received: by 2002:a5d:5405:0:b0:21b:b8a4:2482 with SMTP id
 g5-20020a5d5405000000b0021bb8a42482mr16572482wrv.452.1656401136779; 
 Tue, 28 Jun 2022 00:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s26pt/tPjXEKk3cvIzAQzVWN/LNn8MniGA75/uStXNNTEvlYY5NpGD9C6WJITqWEMsrSeUAw==
X-Received: by 2002:a5d:5405:0:b0:21b:b8a4:2482 with SMTP id
 g5-20020a5d5405000000b0021bb8a42482mr16572471wrv.452.1656401136592; 
 Tue, 28 Jun 2022 00:25:36 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfe70c000000b0021b84ac7a05sm15331312wrm.0.2022.06.28.00.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:25:36 -0700 (PDT)
Message-ID: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
Date: Tue, 28 Jun 2022 09:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>
References: <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220628030749-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
>>>>>>>> No problem with that. So that's venv. But do we need pip and pulling
>>>>>>>> packages from the net during testing?
>>>>>>>
>>>>>>> We do that too. See requirements.txt in tests/
>>>>>>> Following two are downloaded:
>>>>>>> avocado-framework==88.1
>>>>>>> pycdlib==1.11.0
>>>>>>>
>>>>>>> Also see this line in Makefie.include:
>>>>>>>
>>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>>>>>>
>>>>>> Right but that's avocado since it pulls lots of stuff from
>>>>>> the net anyway.
>>>>>> Are the libraries in question not packaged on major distros?
>>>>>
>>>>> Currently I only need this:
>>>>> https://github.com/python-tap/tappy
>>>>> which is the basic TAP processing library for python.
>>>>>
>>>>> It seems its only installed through pip:
>>>>> https://tappy.readthedocs.io/en/latest/
>>>>>
>>>>> I do not think this is packaged by default. It's such a basic library
>>>>> for parsing test output that maybe we can keep this somewhere within
>>>>> the python src tree? Not sure ...
>>>>
>>>> It's pretty small for sure. Another submodule?
>>>
>>> Unlike BITS, this one is likely going to be maintained for a while and
>>> will receive new releases through
>>> https://pypi.org/project/tap.py/
>>> so forking is OK but someone has to keep this updated.
>>>
>>> I am open to anything. Whatever feels right is fine to me.
>>
>> John Snow is currently working on the "Pythonification" of various QEMU
>> bits, I think you should loop him into this discussion, too.
>>
>>   Thomas
> 
> submodule does not mean we fork necessarily. We could have
> all options: check for the module and use it if there, if not
> use one from system if not there install with pip ..
> But yea, I'm not sure what's best either.

submodules create a dependency on an internet connection, too. So before you 
add yet another submodule (which have a couple of other disadvantages), I 
think you could also directly use the venv here.

  Thomas


