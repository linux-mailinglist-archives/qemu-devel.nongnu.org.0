Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B568D680E8A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:09:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTt4-0005o2-JQ; Mon, 30 Jan 2023 08:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMTsd-0005jB-F2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:07:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMTsb-0003AM-Ac
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNOTL6309ACfMAUKwZ5Hau0ySCaJV8lc+Ofc5K9Adew=;
 b=Qc83LyDE2DVdd08cDvsXabuivAG50GVaSIfRDoC74MCL0pZgtc2nLx4J4dWSEQdydC2Sbu
 VaNimvLrmGpscnoN2fgkmhx33a72R8M2lbjAw1dNOL7l19zo0VYpeW/RhrWSu0w1RcYLRn
 mFdxu7ILR7Zh2gin+iv09RjYLkI/jx4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-ZEty8kbXM4C6o4-XrIaWKQ-1; Mon, 30 Jan 2023 08:07:20 -0500
X-MC-Unique: ZEty8kbXM4C6o4-XrIaWKQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 i17-20020a25bc11000000b007b59a5b74aaso12660972ybh.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DNOTL6309ACfMAUKwZ5Hau0ySCaJV8lc+Ofc5K9Adew=;
 b=BlNPqfZ346XaWnWFhI6MufjqZhcsijIMPjZADqhq/WfoE6bIUIYOD9m2V+JQdLpHmn
 OIzK5c1tzshDetG+YcRA8HfXUiw26F5l962C95OZt64qUG70Lpvcf88670b8Ch52KJJY
 yjPUliVJtb8msF1BJAm/Dez2275QLafZmZEAbVicaZ31ue7ceW1wwKljLwcJzjfcsZES
 /5upeIEZtKBxreDvR/e9WPy0k1RIiHc0LfNmcd3y0w7RuMoLzDKlPzXvwQ/XQv6oTnYy
 M0/n4lS/XfYcfGxFe0KiHm2csUAK8bdyFWyLdgTHuA3zBd0DCtDvYbayaX8may8cdbWd
 oAgg==
X-Gm-Message-State: AO0yUKXuTA1O/IHJC9llsR2q1Dw+zh4jfsVUiacQV7dfTcft6liYc+32
 2l6ikAJXmUxupT2q4oWCC0JzyGUx7YmA3W4v/a31eWihjnCkApnXMyXZkrciY92hGwVaoEkU4s9
 0NjY60PaU6EK9Nno=
X-Received: by 2002:a25:32ca:0:b0:80b:4efe:36bd with SMTP id
 y193-20020a2532ca000000b0080b4efe36bdmr17889104yby.7.1675084039705; 
 Mon, 30 Jan 2023 05:07:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/lwW8LlEuwVqf6tilKMsnU5kziXOcA0WQdSzCHwi4FDGugI5wPTAsVtDtUmfX1dlsl28isNQ==
X-Received: by 2002:a25:32ca:0:b0:80b:4efe:36bd with SMTP id
 y193-20020a2532ca000000b0080b4efe36bdmr17889087yby.7.1675084039461; 
 Mon, 30 Jan 2023 05:07:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-179.web.vodafone.de.
 [109.43.178.179]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05620a0a0700b006fbbdc6c68fsm8011900qka.68.2023.01.30.05.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 05:07:18 -0800 (PST)
Message-ID: <3de9da7c-8c21-1e81-5e49-f54be0c93f90@redhat.com>
Date: Mon, 30 Jan 2023 14:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
 <f94ce115-b962-b19d-269e-4f593da61c6f@redhat.com>
 <Y9e7WeJ5OhkOnba9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <Y9e7WeJ5OhkOnba9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/01/2023 13.43, Daniel P. Berrangé wrote:
> On Mon, Jan 30, 2023 at 01:22:22PM +0100, Thomas Huth wrote:
>> On 30/01/2023 13.01, Daniel P. Berrangé wrote:
>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> Testing 32-bit host OS support takes a lot of precious time during the QEMU
>>>>> contiguous integration tests, and considering that many OS vendors stopped
>>>>> shipping 32-bit variants of their OS distributions and most hardware from
>>>>> the past >10 years is capable of 64-bit
...
>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>> burden ? The boring stuff like compiler errors from mismatched integer
>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>
>> The burden are the CI minutes of the shared CI runners. We've got quite a
>> bunch of 32-bit jobs in the CI:
>>
>> - cross-armel-system
>> - cross-armel-user
>> - cross-armhf-system
>> - cross-armhf-user
>> - cross-i386-system
>> - cross-i386-user
>> - cross-i386-tci
>> - cross-mipsel-system
>> - cross-mipsel-user
>> - cross-win32-system
>>
>> If we could finally drop supporting 32-bit hosts, that would help with our
>> CI minutes problem quite a lot, I think.
> 
> CI is a non-technical constraint, that's more about support level.
 >
> If we want to save CI minutes, we can declare that some or all of the
> 32-bit hosts scenarios are now tier 2, rather than tier 1. So the 32-bit
> host support still exists, but we're not doing gating CI on every
> combination. eg could declare 32-bit for linux-user is tier 1 and fully
> tested but 32-bit machine emul is tier 2 and adhoc tested. Or make it
> more nuanced per arch target

Well, while the burden currently mostly comes from the CI minutes (since it 
catches problems immediately, they don't get committed), you would need 
people's time instead who have to look after the problems once they've been 
committed to the repository (which will surely happen if we don't check 
32-bit host support in the CI anymore).

Who's volunteering in spending his time with analyzing (e.g. bisecting) and 
fixing those problems? At least I don't.

> We only need to deprecate and delete if we have some wins at the code
> level that we can't do with while it exists.

We also would have quite some wins at the code level, I think: At least the 
whole "tcg/arm/" folder would go away, and we could simplify all spots that 
are using HOST_LONG_BITS in the code base.

  Thomas


