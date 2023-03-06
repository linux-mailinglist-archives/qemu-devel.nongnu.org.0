Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF31A6AC2F2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:19:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBg8-0001uM-UU; Mon, 06 Mar 2023 09:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZBfc-0001aU-1b
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZBfa-0001sx-ET
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678112308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
 b=cUvCgz/1TOpzETe9v9/qhb1vtRanSRVtiwRKMOx5m3cAMGtnbIs0Wfcz5QpzV+VCSL5zUk
 nMfb+zDYgRppITaBxRUeNQUwc9v8/ZJis+j7cuCXNklMqvRzMjHtL1b1L5N3APpS6CZST2
 lNcuoeeB75NnrLoQs59Wrwr/UGvvr1U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-Aa-P101xPhSa1HHTTZInPQ-1; Mon, 06 Mar 2023 09:18:27 -0500
X-MC-Unique: Aa-P101xPhSa1HHTTZInPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso6808473wmc.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
 b=F4RYr/G2WTsHuJ6scWgHxBaluiZmw6NFbjjbg78Hs0JKv4U/Uo7COsW5Bc6jOECmlp
 yNNlb8uzarYwUp98lSzE4yOQHyXeVa3XfmlmxuBKhlDg6RaKS310i8T8MQ43Yka5g1Fk
 skcZTGbAFgGywlw8g6dlC42RwQELRgOSS2AQuGj8wTf5Q2IgbUmmVA2O+Vf1CQY9pk6E
 csgYrQl3I5iFU9dBeJjuKwSJqgxMbHo5DIPLWx8cv3dH0mO5g7vmDN3aGgvj1IsTUs91
 g4Rhr9vHtFLAFPyU1lNwP+V4a+1Z9GQ6/rjiCV/EcoKHJC37zbgRFQeTs8X7oNbr7Nl9
 yZvg==
X-Gm-Message-State: AO0yUKVCYJ+MjejgQYhXfvCrpCsb3s4ZnkMmwrMtbZaFyq0YF4xgEahX
 HynrtqQtle547EzxBQMZTekAcgReUY3EUXinZrxl39G2zNZRnKmTHYDrrow2TxrAXYIl5XasNUb
 jF0NeEdsb1Q4QiOU=
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id
 t14-20020a05600c198e00b003eb36fab78dmr9109231wmq.23.1678112305981; 
 Mon, 06 Mar 2023 06:18:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/MR21FgoX8RyVFXUFY4MzV72bl/PWGUpJmW46y4RO7kLsnJJfonvCikk1sHoHsw2wpQdbBPg==
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id
 t14-20020a05600c198e00b003eb36fab78dmr9109217wmq.23.1678112305735; 
 Mon, 06 Mar 2023 06:18:25 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm10076844wmp.46.2023.03.06.06.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:18:25 -0800 (PST)
Message-ID: <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
Date: Mon, 6 Mar 2023 15:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAXzUIs6wODe7/hf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/03/2023 15.06, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
>> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
>>> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>>>> [...] If a 32-bit CPU guest
>>>> +environment should be enforced, you can switch off the "long mode" CPU
>>>> +flag, e.g. with ``-cpu max,lm=off``.
>>>
>>> I had the idea to check this today and this is not quite sufficient,
>> [...]
>>> A further difference is that qemy-system-i686 does not appear to enable
>>> the 'syscall' flag, but I've not figured out where that difference is
>>> coming from in the code.
>>
>> I think I just spotted this by accident in target/i386/cpu.c
>> around line 637:
>>
>> #ifdef TARGET_X86_64
>> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
>> #else
>> #define TCG_EXT2_X86_64_FEATURES 0
>> #endif
> 
> Hmm, so right now the difference between qemu-system-i386 and
> qemu-system-x86_64 is based on compile time conditionals. So we
> have the burden of building everything twice and also a burden
> of testing everything twice.
> 
> If we eliminate qemu-system-i386 we get rid of our own burden,
> but users/mgmt apps need to adapt to force qemu-system-x86_64
> to present a 32-bit system.
> 
> What about if we had qemu-system-i386 be a hardlink to
> qemu-system-x86_64, and then changed behaviour based off the
> executed binary name ?

We could also simply provide a shell script that runs:

  qemu-system-x86_64 -cpu qemu32 $*

... that'd sounds like the simplest solution to me.

  Thomas


