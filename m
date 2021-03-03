Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772032B9EC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:36:18 +0100 (CET)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWM5-0000ZH-K9
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWGy-0001Kz-Jy
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWGs-00038D-MA
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614796253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/NJPHQvhGYg5eS/Fp+HZMOkZgSzQJopOw0Gpglrll4=;
 b=XNIraMns4RQeK5dtsjX0EX6FY1+91vuNf01HjyGDGHtMqf4lAqSu+V2SUz5f4goaNVd3c6
 FVYnVwuEiawWdei/fbYEpC0vjpvXVGh37Hror+Z7U4jUR+X8bHnhclXjVta607CnOeGguk
 GYiMGWBJJAb3dnIB71LDUEKs+Go1YYE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-fBeSjwU-NZqNXK9qdKwzQA-1; Wed, 03 Mar 2021 13:30:52 -0500
X-MC-Unique: fBeSjwU-NZqNXK9qdKwzQA-1
Received: by mail-wm1-f69.google.com with SMTP id w20so2132234wmc.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/NJPHQvhGYg5eS/Fp+HZMOkZgSzQJopOw0Gpglrll4=;
 b=Hz9SUEGTQSN5C0zV9Y0h/kOJLen4jSZDSzO5kuRpu5bj40/hHhTmS/5PohPTJgWxhH
 WFExXrGFcs6FbdbYfdUp0klg9RDBzFBc4pAKjoS6z2wR4TZGd7V1G4ucWmwFgOZpLECa
 09hUAZCH8xIiRHwufM4p+182i9gudcQZzSRD8GFbt/m3L/ougucrt7qkaDMwYntxmBET
 ZL35pFk2WLvrS49LsEP4NlljKcd3ASlD71OXshwvZZQcBeOsnQlCKrK7vr5im/T1PaW0
 N7ThO9eamHpwIPhpnkflAE7pB2hzHuXOjhwAT1l1HPNrJEnwE+5jmptcaKebBNFTdZaI
 Iudw==
X-Gm-Message-State: AOAM531ij/SQHgCU8KuwmcFDWcHhZY2Mcja5dPfkLu7sYp/Zh2vv/r+E
 NfUrBmtDaFyMjHGIj8RjjOukJnZRX1d6aCJBbjPmPxPQTZk6hOLGEXodm20LxTF2LE1AIbm9rbi
 EZH6OOfqF3x7wuU8=
X-Received: by 2002:a5d:4904:: with SMTP id x4mr28499146wrq.69.1614796251232; 
 Wed, 03 Mar 2021 10:30:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMSo2j0J333HzYIpuOcCEv3S6ixowP4N6zlgRQeSYe/HLIBm+9MirYCt174yI11oVN4988oQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr28499121wrq.69.1614796251029; 
 Wed, 03 Mar 2021 10:30:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm6693309wmo.41.2021.03.03.10.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:30:50 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ca4ac8eb-2f0d-c6e4-c4f3-e933cffcaf9e@redhat.com>
Date: Wed, 3 Mar 2021 19:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 7:20 PM, Claudio Fontana wrote:
> On 3/3/21 7:17 PM, Claudio Fontana wrote:
>> On 3/3/21 7:09 PM, Peter Maydell wrote:
>>> On Wed, 3 Mar 2021 at 17:57, Claudio Fontana <cfontana@suse.de> wrote:
>>>> One thing I noticed is that tests try to run qemu-system-aarch64 with accel "qtest" and machine "virt",
>>>> and the thing tries to create a cortex-a15 cpu model for some unknown reason.
>>>
>>> That is expected. The default CPU type for 'virt' is cortex-a15; if you want
>>> something else then you need to specify the -cpu option.
>>>
>>> -- PMM
>>>
>>
>> I see, I'll experiment a bit thanks.
>>
>> I assume changing the default to "max" is out of the question,
>> and we should instead feed the -cpu option from the tests?
>>
> 
> And since we are on topic, should the qemu-system-aarch64 still contain the cortex-a15 cpu model for some reason?

If it is available, certainly. Else no :)


