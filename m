Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB5568012
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:39:11 +0200 (CEST)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zcs-0000Zg-93
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8zYl-0005jX-N7
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8zYj-0000oR-9h
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657092891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me6cEbsDTDm129/ZHeEZnF53VWrZC0u7qlNvPJ2D7x0=;
 b=fwPW9GhH4VhDmK02RiHl8L+wFz0lCJmzThQwDhcssh6ZQ3ftPBbvoiP66uqHSu7eRLG7uP
 QycgFViOjPzIjjZGUPW7P3n9/TZAD1dBoAWppy6Mm2a8B0K1JOKoOcX12JLdlXY6j0223Z
 MFJrliGJzAB5jky6ECgC1LvlNjkrt8E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-SSzMlYWWN3CSmCGzfCLcTw-1; Wed, 06 Jul 2022 03:34:50 -0400
X-MC-Unique: SSzMlYWWN3CSmCGzfCLcTw-1
Received: by mail-wr1-f69.google.com with SMTP id
 l11-20020adfbd8b000000b0021d754b84c5so869974wrh.17
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Me6cEbsDTDm129/ZHeEZnF53VWrZC0u7qlNvPJ2D7x0=;
 b=TRn44z+8P8dEZWiNcC1CKt+CPnpDrf+zjuRMp/ORHyd9kHp6QJm2qwfg4tug1LVgAM
 e4RngRhM+IP8T6/dP+Tvo1hP3oPuIpY+rj+YcrjFjK9BV57Lg+AZmbca1ww0ebcIw371
 KWCkl4nF0RfZyUMbCZA2nzxYTN5dTlERtUBQWWNAECJh4CDnQ5k/vuWVwxaMm0slWIEt
 Ux68wzr8qCrVy9MbWnyrV1NvzQE/1BTIFc50p0LGJYOQld1fFt8Loy1ktptSJ0whUQS5
 fT33d8HLBhdQbNhnexEMnasXCwFnzphua6jwEFDxZJWdL1Wn3y3YH4pUU0HdDm/gCpVN
 Fabg==
X-Gm-Message-State: AJIora/Z3ib6fZLFXhMoxmNLEFmFvAJRnlBCE8jOO5Gx4HPis5h4TPXc
 wh3Q6IK0D0VB+V36JfzSfizx1x3Lzh9sFBqIVzJW15JgS5mOKm/r1wl3l6HCYNQlZ59ONIftdua
 oOqC8sszFJRk3sQk=
X-Received: by 2002:a05:6000:188a:b0:21b:c273:5ebd with SMTP id
 a10-20020a056000188a00b0021bc2735ebdmr37043137wri.72.1657092889238; 
 Wed, 06 Jul 2022 00:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uH809uPXDO3vxIYuleYyUHCPSl8FjDuEZcG5QiOlYYhzAuWlVfjwBh4qbxtE5vQU8QTC3BAg==
X-Received: by 2002:a05:6000:188a:b0:21b:c273:5ebd with SMTP id
 a10-20020a056000188a00b0021bc2735ebdmr37043119wri.72.1657092889042; 
 Wed, 06 Jul 2022 00:34:49 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b0021d7ae38ca2sm1518830wrp.55.2022.07.06.00.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 00:34:48 -0700 (PDT)
Message-ID: <a48bfafe-c8a0-4b8d-1a4f-0872e800dd1c@redhat.com>
Date: Wed, 6 Jul 2022 09:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
 <e5fa4843-31e1-9ce2-fd13-ffa1b6ee6f1e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
In-Reply-To: <e5fa4843-31e1-9ce2-fd13-ffa1b6ee6f1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 05/07/2022 19.22, Richard Henderson wrote:
> On 7/5/22 21:07, Vladimir Sementsov-Ogievskiy wrote:
>> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
>> FreeBSD. Let's support the latter too.
>>
>> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout 
>> option")
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>
>> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
>> Here is a fix. Would be great if someone can test it.
>>
>> I tried to push it by
>>
>>    git push --force  -o ci.variable="QEMU_CI=1"
>>
>> to my block branch, I get a blocked pipeline
>>    https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
>> but it doesn't have neither freebsd nor macos jobs.. How to get them?
> 
> You'd have to have an attached cirrus token.
> Better to just use 'make vm-build-freebsd'.
> 
>>       def test_timeout_break_guest(self):
>>           log = self.do_cbw_timeout('break-guest-write')
>> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
>> +        # "Operation timed out", when Linux prefer
>> +        # "Connection timed out"
>> +        log = log.replace('Operation timed out',
>> +                          'Connection timed out')
> 
> Um, really?  Matching strerror text?  This is ultra-fragile.
> Dare I say broken already.

Many of the iotests rely on output text matching. It's very fragile, always 
has been and always will be (unless we rewrite the whole test suite to not 
use output text matching anymore). For example, the iotests also do not work 
with the libc from Alpine Linux (where one of the error messages is "I/O 
error" instead of "Input/Output error"), so we only run check-unit and 
check-qtest in the CI there. It's a pity, but that's the way it is 
currently. I think it's still better to tweak some of the text strings here 
instead of not running the tests at all.

  Thomas


