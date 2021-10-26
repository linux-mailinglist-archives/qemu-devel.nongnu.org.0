Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C343B826
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:27:54 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQEr-0006SY-75
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mfQDT-0004XZ-DQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:26:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mfQDP-0005cd-A0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635269181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNrdlIcWymeH0daG0aSXc0VG8sJYLBEclOlstk6IxEw=;
 b=B3c8UZYlqcNSyAjUelCEUXRK2vlQbAuJqwCposbIB2X1/GMpPNxU527sVGFSjZ8tdy3fzr
 Yeof16MJBmRyVIcKtBnmYrvqCQT6uZWRjPGU5V3Mryy3NkdSXkW+JvDfUh75Fpv2hHcyHZ
 WeEQa/RcOvGroTJ+0a9t92QYuqQwVP4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-2f4t-7_YNm6AHT1TWiDNAg-1; Tue, 26 Oct 2021 13:26:19 -0400
X-MC-Unique: 2f4t-7_YNm6AHT1TWiDNAg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f18-20020a5d58f2000000b001645b92c65bso90257wrd.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aNrdlIcWymeH0daG0aSXc0VG8sJYLBEclOlstk6IxEw=;
 b=eL8+XGT2zw2q7uY+Xs5wDbSAtI2G6BC2PBBFmrr9viHuHJUsO7jdzIk6fdGSJwwGTu
 F14U7tXqONyo0g8yupnX2voMy0gFn2vKZZu4DwmHCdznGdeNf8D27+ryuSCEdI3H4zyj
 XJ83qffeTcsg6vm2JfM4ABw/MGhoXcYycvDaSJ1KDTtm0Q/rWEAfEl2vkKIzFkJ4g2DQ
 q4m/sjrzuKDg+gzAlTpC1fksPgQAalK5ywREcmnEghs+frHfFS+58XwTY8B6/hyyrFt/
 T3K98gVBcj581Fq/tMtnbWAL7Ga4596tWy/yyKgsbqp/SzkEpaFtb3SWnuiSgiOr3T/H
 jyOA==
X-Gm-Message-State: AOAM5305/JdVjWrqRFzuxn1dhCE5QlWPRY1odgVQMae3mnA7jt7IIjTn
 R/IsF8zyt5EISIgc37rAydUXgEYAx3j6gPKfOBtfe1AeRFOJf1sdo/BHKdseh/TDgAXreTa3lqR
 EOZfDgZxExdiJ/tk=
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr33592642wrx.143.1635269178602; 
 Tue, 26 Oct 2021 10:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEnv7N8KJhVqTMyhfvziFwnyxjr+FaHSPKaRxc1yoolWvUklXLTz6W+qccFzSLIjdFnyAmPg==
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr33592608wrx.143.1635269178366; 
 Tue, 26 Oct 2021 10:26:18 -0700 (PDT)
Received: from thuth.remote.csb (tmo-096-150.customers.d1-online.com.
 [80.187.96.150])
 by smtp.gmail.com with ESMTPSA id p21sm1153030wmc.11.2021.10.26.10.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:26:17 -0700 (PDT)
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
 <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
 <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
 <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d1bbc5ee-53ba-dce2-9eb8-9320f03e9734@redhat.com>
Date: Tue, 26 Oct 2021 19:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/10/2021 19.10, Richard Henderson wrote:
> On 10/26/21 9:34 AM, Stefan Hajnoczi wrote:
>> On Tue, Oct 26, 2021 at 08:10:16AM -0700, Richard Henderson wrote:
>>> On 10/26/21 6:22 AM, Stefan Hajnoczi wrote:
>>>> If "safe" TLS variables are opt-in then we'll likely have obscure bugs
>>>> when code changes to access a TLS variable that was previously never
>>>> accessed from a coroutine. There is no compiler error and no way to
>>>> detect this. When it happens debugging it is painful.
>>>
>>> Co-routines are never used in user-only builds.
>>
>> If developers have the choice of using __thread then bugs can slip
>> through.
> 
> Huh?  How.  No, really.
> 
>> Are you concerned about performance, the awkwardness of calling
>> getters/setters, or something else for qemu-user?
> 
> Awkwardness first, performance second.
> 
> I'll also note that coroutines never run on vcpu threads, only io threads.  
> So I'll resist any use of these interfaces in TCG as well.

Would it maybe make sense to tweak check_patch.pl to forbid __thread in 
certain folders only, e.g. block/ and util/ (i.e. where we know that there 
might be code that the iothreads are using)?

  Thomas


