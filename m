Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEA675505
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:52:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqsG-0003pq-MG; Fri, 20 Jan 2023 07:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIqsB-0003pH-Jw
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:51:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIqs7-0004jQ-Tz
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674219115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fjt0717tIU8SMNBPjFzOfxu/Gokm7teZYh1vfMQFi9s=;
 b=AwC9cKes73I7sNgcJJKAi9e6yYK3kVZHcPtZU49aD72Fw0yl1PcM9tLBRH8whDggx7dPNJ
 xq3H/um2IwzhWquGTG8rBnd68jDnQnbnqMV0KSDbF4c2xYRXlPLkWQt7kl1TKJneUOd6sd
 gJIvkQmM2USo/VNs9XZnoc7O/99SrGA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-iK2pWcrCOeOPXSZIAU5BFQ-1; Fri, 20 Jan 2023 07:51:54 -0500
X-MC-Unique: iK2pWcrCOeOPXSZIAU5BFQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so3367893qkl.9
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fjt0717tIU8SMNBPjFzOfxu/Gokm7teZYh1vfMQFi9s=;
 b=VciZAPx1R5bkCHCg+QEsTUW5LMtTYYwTxLvFlnWRqjTE5Lv6MM+YBL24IagjUXolo7
 ZKPGt7AW+H3bo185WW+uqEcCjtjI6jFe7sKWbTpeMeRbXkHosqHAdVKxU7FRjAZ2atZL
 kz2m80v2qrhl/slIJaIGP0b5Nuo1Q3adqV+quR12uVZmzEo3rYs7O/MweQ6uZ9hvpiah
 ZexG1fc9HRJ2/bbaxwqwFMrznGP20FtPEFsNRzg7/sYPD67p4W50oy/s1V1h2oeIIyxb
 tZsOyhbM5p0OSGxFNGQt6QP9EMStkR9WRRiUAjN79IT8aPAhYAVL7PDb4kuO9O9IHnjG
 55Gw==
X-Gm-Message-State: AFqh2krx2CSXNsPq+YQmgH/oTJ/aKozR+B/QH+bObmUhpAbD7tdQ82kC
 87JTHXnyHKBpP495s5hKmsyhUns4RHfh2kly7S9184wGfG7iS6EC2K/KzMmzoaSU+pDZiMPeL/4
 anLkLN899/JbCrro=
X-Received: by 2002:a05:622a:1b0e:b0:3b6:4544:1dfe with SMTP id
 bb14-20020a05622a1b0e00b003b645441dfemr16643108qtb.56.1674219113656; 
 Fri, 20 Jan 2023 04:51:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5GeeOczyj83sOzM/I3PydMjCOGgT88n+6KBa7NSvDu/YW9OxHirnflBDfMYFYh59+DnN0uA==
X-Received: by 2002:a05:622a:1b0e:b0:3b6:4544:1dfe with SMTP id
 bb14-20020a05622a1b0e00b003b645441dfemr16643087qtb.56.1674219113407; 
 Fri, 20 Jan 2023 04:51:53 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05620a444d00b00709041c3206sm2292312qkp.103.2023.01.20.04.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 04:51:52 -0800 (PST)
Message-ID: <32e7aa36-8ce8-1866-e085-2b918c58fd35@redhat.com>
Date: Fri, 20 Jan 2023 13:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 0/5] tcg patch queue
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
 <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
 <fd1b116ac19feaaebbf82f8e41a24883af81f851.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <fd1b116ac19feaaebbf82f8e41a24883af81f851.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 20/01/2023 11.53, Ilya Leoshkevich wrote:
> On Fri, 2023-01-20 at 10:41 +0100, Thomas Huth wrote:
>> On 16/01/2023 23.36, Richard Henderson wrote:
>>> The following changes since commit
>>> fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
>>>
>>>     tests/qtest/qom-test: Do not print tested properties by default
>>> (2023-01-16 15:00:57 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230116
>>>
>>> for you to fetch changes up to
>>> 61710a7e23a63546da0071ea32adb96476fa5d07:
>>>
>>>     accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10:14:12
>>> -1000)
>>>
>>> ----------------------------------------------------------------
>>> - Reorg cpu_tb_exec around setjmp.
>>> - Use __attribute__((target)) for buffer_is_zero.
>>> - Add perfmap and jitdump for perf support.
>>>
>>> ----------------------------------------------------------------
>>> Ilya Leoshkevich (3):
>>>         linux-user: Clean up when exiting due to a signal
>>>         accel/tcg: Add debuginfo support
>>>         tcg: add perfmap and jitdump
>>>
>>> Richard Henderson (2):
>>>         util/bufferiszero: Use __attribute__((target)) for
>>> avx2/avx512
>>>         accel/tcg: Split out cpu_exec_{setjmp,loop}
>>
>>    Hi Richard, hi Ilya,
>>
>> with the recent QEMU master branch (commit 701ed34), I'm now seeing
>> failures
>> in Travis:
>>
>>    https://app.travis-ci.com/github/huth/qemu/jobs/593786529#L14411
>>
>> Everything was still fine a couple of days ago (commit fb7e799):
>>
>>    https://app.travis-ci.com/github/huth/qemu/builds/259755664
>>
>> ... so it seems this is likely related to this pull request. Could
>> you
>> please have a look?
>>
>>    Thanks,
>>     Thomas
>>
> 
> I would expect this to be (temporarily) fixed by [1], but we probably
> don't set GITLAB_CI in Travis. Would it make sense to set it? It looks
> as if this variable is currently used only to skip certain tests.
> 
> If not, then maybe split it into QEMU_CI, GITLAB_CI and TRAVIS_CI?
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04438.html

Ah, ok, so this test has issues in gitlab, too!

For Travis, I think we should either check the CI or TRAVIS environment 
variables:

 
https://docs.travis-ci.com/user/environment-variables/#default-environment-variables

  Thomas



