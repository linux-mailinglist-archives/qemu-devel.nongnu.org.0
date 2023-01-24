Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726BE6791E0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDgA-0002su-Bp; Tue, 24 Jan 2023 02:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKDg8-0002sB-1R
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKDg6-0004j3-Ao
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674545109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riQke661FjQXN0rr6ja4Bmr9De6fqEfzxTVDzqxL1Po=;
 b=Zi8BAlOXZDM2fAjY+hp9yqzdzo61XNekUZut/NYs/3/P3Dq3pwteEVSDNWAH76eauFPSSp
 tYZPnWAPOy+suNWYbq4baSyntB+d+yqwbW8RqgoD5+pKcMKhIfQSZtBTI0VzFyNJ1FnkVu
 Ebg3UXQj6/Ld74IBTid+NzU7MElpibc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-fZA1d6-4NcCYdSFPhMZvuQ-1; Tue, 24 Jan 2023 02:25:07 -0500
X-MC-Unique: fZA1d6-4NcCYdSFPhMZvuQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 kr11-20020a0562142b8b00b005355b472a65so6490500qvb.7
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 23:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=riQke661FjQXN0rr6ja4Bmr9De6fqEfzxTVDzqxL1Po=;
 b=EK18fdmSQv7i5X3iDEeyOrfxTE3lj9xJrUP1ZYV6rRjooa3A/pjGTh5GF2N4vZ2y1t
 J8ZubnIpxEr7e+jXzQz9gQfdL/S0+ySdzsD9Plb8hE4xKwODAa9bLYYHJLTBQOvcrBm9
 KSkSsI07WBjwWGQk5NGGJ6jwO6CZPuqKWTpOFQU112C1Y8zO1Y9AsWAwNSJ1ETdobiwI
 Y4nhfVX1koAF03LStTiVkCAs4RgUYmi9kwa9PS2/pLNyIk1X/Qq/reONj3vjfzcZXtVj
 j0e69sor90MsD6yRABWSLvMK2NXJa4uX1x8QHzE9PGKcmbW83e3KtCZKH53n76y0/mR4
 X+xw==
X-Gm-Message-State: AFqh2kr2TTzwesvBzE9LAzyihNyUWQ3yFFS0UjdTzOMi6zxbAvbb1UEC
 NmpxI/ARMB8H5GPBBwXzBjEszG9zTR1Iu6dGrcrNQHu9BSeH0/+wFJpPPk2PdBOoXFv7doShyyU
 rAgMjVdivrLVk+rg=
X-Received: by 2002:a0c:b39e:0:b0:532:1d87:d78a with SMTP id
 t30-20020a0cb39e000000b005321d87d78amr41304695qve.2.1674545107059; 
 Mon, 23 Jan 2023 23:25:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuhe0uBPfAf7pkF/8Zql6y1zrSXy91Pzw2HXpy1jXpTPqX7JOdifGf080ESTU65K6hXCB6ERQ==
X-Received: by 2002:a0c:b39e:0:b0:532:1d87:d78a with SMTP id
 t30-20020a0cb39e000000b005321d87d78amr41304674qve.2.1674545106829; 
 Mon, 23 Jan 2023 23:25:06 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-158.web.vodafone.de.
 [109.43.179.158]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a01ee00b006fa9d101775sm970588qkn.33.2023.01.23.23.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:25:06 -0800 (PST)
Message-ID: <de042a7e-f9eb-8fe0-cad6-b3277e79b9c6@redhat.com>
Date: Tue, 24 Jan 2023 08:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230120194435.29796-1-farosas@suse.de>
 <77fcbf0a-0f9a-d3bc-c1cf-0ec3e21399c9@redhat.com> <877cxdcr5l.fsf@suse.de>
 <4dd2d0d8-d2a3-7636-a422-6b99b7e24e07@redhat.com> <87r0vleykh.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87r0vleykh.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23/01/2023 22.22, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 23/01/2023 14.32, Fabiano Rosas wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> On 20/01/2023 20.44, Fabiano Rosas wrote:
>>>>> These leaks can be avoided:
>>>>>
>>>>>     759 bytes in 61 blocks are still reachable in loss record 56 of 60
>>>>>        at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>>        by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>        by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>        by 0x12083E: qtest_get_machines (libqtest.c:1323)
>>>>>        by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>>        by 0x11556C: main (test-hmp.c:160)
>>>>>
>>>>>     992 bytes in 1 blocks are still reachable in loss record 57 of 60
>>>>>        at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>>        by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>        by 0x120725: qtest_get_machines (libqtest.c:1313)
>>>>>        by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>>        by 0x11556C: main (test-hmp.c:160)
...
>> (Also, it's valgrind that you used, isn't it? - I wonder why it's
>> complaining here at all since the pointer to the memory should still be
>> valid at the end?)
> 
> valgrind is complaining about the memory not being explicitly freed at
> any point. I guess "leak" was not the most precise term to use in the
> commit message.

How did you run valgrind? For me, it does not really complain about the 
non-freed memory here since it is still reachable. The only difference that 
I see is in the summary. Without your patch:

     still reachable: 27,471 bytes in 152 blocks

with your patch:

     still reachable: 25,713 bytes in 88 blocks

... but that IMHO doesn't really hurt, since the memory is not really 
leaked, i.e. the memory usage won't increase during runtime here. So I fail 
to see which problem you're really trying to solve here, could you please 
elaborate?

  Thomas



