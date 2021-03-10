Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DD333C9F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:31:15 +0100 (CET)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxze-00077o-05
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxyC-0006Yc-Rb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxyA-00066I-8A
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615379380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCoPIhTooj2/WoCTVm8TnFdOSS8ZDIAdwE34b0WcpXo=;
 b=O9RV6HIpHBobqTprv8NgQth46qUPC5ugQO/XrOSyz+8W1FEe8fGLXD+luDY+HemwPaRjlC
 CNGVasdFyMZ44RfjulHOf/mxDjucfQqT54zYgU5GDEy4+jpCf9C9/DMaqHAVWrJBBgBUxM
 p8EyrjtQ2fuTIe1vv7jFu+1BtLQMAGM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-N1sCPCwOMQa-4rOxWZEQUQ-1; Wed, 10 Mar 2021 07:29:38 -0500
X-MC-Unique: N1sCPCwOMQa-4rOxWZEQUQ-1
Received: by mail-ed1-f71.google.com with SMTP id q2so8234957edt.16
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 04:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RCoPIhTooj2/WoCTVm8TnFdOSS8ZDIAdwE34b0WcpXo=;
 b=UWUZJ0AZ3Yzg3JmHAne1CgZiy4Vj873L83HjMMLSL4hdz93VdVgzSND1xFSHpkccdE
 4QuBa2KzRTysnfVzfrU8nzcAxtmB7TwgbX4fLKkBVsD/u/xbnl6LCbf8gp7ZTgcN+AwZ
 wneiwrwGnoYv2K7myrFSHI5uksZ9OV/yeFLPu5Jd7m1E6VjyywpZu6VEoUNzrcoSn9na
 xZ7hB+tSaXsEqZHMSgG7R9/e5Y0EwQ/2vExCvTYcjsXrKIV2GZ/NtiPoso9LTZ+Ig7h9
 /0pYcQOi7zfoMmlMoe25myWipKXon9Etl6+KV04Ab/ULr9D/VsfKZL93bdOIpcSIr0sf
 apOw==
X-Gm-Message-State: AOAM5324NSHsyDTPuYVXaRabrST/JXRUzAXv2MAFKZ8YUI7lap3Oqs2s
 nPW7JBCJQpqZgA3R3wl+Q8sjup9p8zYctZt8FdvRbGX9o5ZoZSk7wARikgBegxQ3FAhalAbaWeZ
 nRH/QyonbYg01Alc=
X-Received: by 2002:a05:6402:1283:: with SMTP id
 w3mr2957956edv.340.1615379377166; 
 Wed, 10 Mar 2021 04:29:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdO5o6S26EWcX8egoljTCas19YIXxmxolRDORqGhbaNviorDq7PwoV578KIbTa8KuhQtLYRA==
X-Received: by 2002:a05:6402:1283:: with SMTP id
 w3mr2957920edv.340.1615379376954; 
 Wed, 10 Mar 2021 04:29:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b6sm9539848ejb.8.2021.03.10.04.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 04:29:36 -0800 (PST)
Subject: Re: [PATCH 0/3] block: Introduce the 'zeroes-co' driver to help
 security reports
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210310114314.1068957-1-philmd@redhat.com>
 <YEizo2E9CB36wSUS@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <69ac819a-2e16-de72-780b-1cd6edadf5b3@redhat.com>
Date: Wed, 10 Mar 2021 13:29:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEizo2E9CB36wSUS@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 12:55 PM, Daniel P. Berrangé wrote:
> On Wed, Mar 10, 2021 at 12:43:11PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This is an alternative approach to changing null-co driver
>> default 'read-zeroes' option to true:
>> https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html
>>
>> Instead we introduce yet another block driver with an explicit
>> name: 'zeroes-co'. We then clarify in secure-coding-practices.rst
>> that security reports have to be sent using this new driver.
> 
> IMHO introducing a new block driver, when this can be solved by
> simply adding a property to the existing driver, just feels mad
> Your previous series made much more sense, and despite the long
> thread, I didn't see anyone suggest a real world blocker with
> making it read zeros by default.
> 
> I think Max's last mail sums it up pretty well
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg07173.html
> 
> [quote]
> In cases where we have a test that just wants a simple block node that
> doesn’t use disk space, the memset() can’t be noticeable. But it’s just
> a test, so do we even need the memset()? Strictly speaking, perhaps not,
> but if someone is to run it via Valgrind or something, they may get
> false positives, so just doing the memset() is the right thing to do.
> 
> For performance tests, it must be possible to set read-zeroes=off,
> because even though “that memset() isn’t noticeable in a functional
> test”, in a hard-core performance test, it will be.
> 
> So we need a switch. It should default to memset(), because (1) making
> tools like Valgrind happy seems like a reasonable objective to me, and
> (2) in the majority of cases, the memset() cannot have a noticeable
> impact.
> [/quote]

Yes I totally agree with Max, but Fam is the maintainer.

I'll keep looking for alternatives. Maybe simply documentation.

Thanks,

Phil.


