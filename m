Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5874CAB39
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:11:43 +0100 (CET)
Received: from localhost ([::1]:57980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSVq-0005SD-KE
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPSU1-0004C5-7a; Wed, 02 Mar 2022 12:09:49 -0500
Received: from [2a00:1450:4864:20::42a] (port=36666
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPSTz-0003w7-HL; Wed, 02 Mar 2022 12:09:48 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r10so3848016wrp.3;
 Wed, 02 Mar 2022 09:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QnhPHAEwKEep6fi2qjTPWjK7k2b0OUJeNp7TyqfWmlo=;
 b=cv3rLCKOI9yrY9jCCytYCSnWHCqjS82TZRdZcBNToTvc8qHjAihsufWLmRX+5midRV
 wYSIFsII/zB3kpii5CKY5ZgNApFNgtDsztw/TBDgUGOJe3ELIoEGNOJT5XDlVSEKp553
 WPOufDUeQTX12If1BQSTfmN1B0SGP1ZZFtUBArjjWI3NTvkAPOKHcyGrmS4gPwGeHuXP
 qSR4z+QDxdqLdiFeh87YGOk7Zj6L4eI9peSDSGqaX0qr4VIbFy20eycRjwmjdvRriRsS
 1r6G9fWrXPFX6W/+BxI8Q1HiFjBjXoh6HW4fTM5CUk5JatD0egaDZnrDyxbgQ9LyT6OC
 9c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QnhPHAEwKEep6fi2qjTPWjK7k2b0OUJeNp7TyqfWmlo=;
 b=1LEHf4vw5LW48P1a5ngHhnTU6tM2+KShwUkJghCp/P3wY/b1lyxL/k1dXx4YR0itq8
 Ofeww2rvDvQ/PUm7yy131rrAVrPjBvGkIkkbRTf/JmnHJUrtlQ5GSvGFbb6Rw2zWDJPY
 1JEWadCDcbBvlPg14aD+32LXZtYUYmWriE6SQAaZ7vQphogkLkgL11/Dr3UDfagGu4rB
 HW0J88mK5mrTgk3AUNgAfyiLNBidfBHGuZNgcjTriqkSQn4SrnPOQMTAN9WTp1Z7NYGu
 JplA8yjapdpTsiBiAv+UcQbW5hngx8myyaaw3MwvZe6V1YRzsWz9kmfcuxfc1TalJRiR
 6ehA==
X-Gm-Message-State: AOAM533WKcyduYRexR4p+qC15PttLI9DPWqT6a+kwokcrFoei6PtUKlz
 r1+7ExCyTBPmlYaa8KGg7Sc=
X-Google-Smtp-Source: ABdhPJwwylKky8bpc1hAINxWZAxor2k/30WpWOvo+TxMMpNYaCQn0rmUzylWFa3jb9g7yAXjVEHgzw==
X-Received: by 2002:a05:6000:2a5:b0:1f0:2e57:82ab with SMTP id
 l5-20020a05600002a500b001f02e5782abmr3142605wry.515.1646240984956; 
 Wed, 02 Mar 2022 09:09:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 c4-20020adfef44000000b001ef93c7bbb8sm12830070wrp.30.2022.03.02.09.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 09:09:44 -0800 (PST)
Message-ID: <d75f1eee-cf69-9783-1cde-14427e680360@redhat.com>
Date: Wed, 2 Mar 2022 18:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] Allow returning EventNotifier's wfd
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Sergio Lopez <slp@redhat.com>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-2-slp@redhat.com>
 <20220302081234.2378ef33.alex.williamson@redhat.com>
 <20220302152342.3hlzw3ih2agqqu6c@mhamilton>
 <Yh+WESUBI9spkHvd@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yh+WESUBI9spkHvd@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 17:06, Stefan Hajnoczi wrote:
>> I agree. In fact, that's what I implemented in the first place. I
>> changed to this version in which event_notifier_get_fd() is extended
>> because it feels more "correct". But yes, the pragmatic option would
>> be adding a new event_notifier_get_wfd().
>>
>> I'll wait for more reviews, and unless someone voices against it, I'll
>> respin the patches with that strategy (I already have it around here).
> I had the same thought looking through the patch before I read Alex's
> suggestion. A separate get_wfd() function makes sense to me.

And that's four with me. :)  It's not just pragmatic, I cannot imagine a 
case where the caller doesn't know exactly which of the two file 
descriptors they want.

Paolo

