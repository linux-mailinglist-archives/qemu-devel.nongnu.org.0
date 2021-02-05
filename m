Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92536310F39
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:57:30 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85MH-00032R-Ht
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84cJ-00011Q-N8
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84cD-000824-Mz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612544991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKZ9sZmrFdHUii9FC+I/0Z4Bq9xh7JxpLFtIFUbiz9k=;
 b=L7+/K6zNEb0RBPwZGU9J8bHzgH5otb6TA7nbXrsdMQmZd52JTj0YO8We+D4rB2ytKKxGML
 uYy29FxN06A7/k0kVuBUhr5t+7K/juZ0o37yu5iTj8apIMxkgH3l0brhP4Wgw0lEb4pI2j
 am/P03I/EPypVORHK688B2BJY8BAfXI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-avjgQ6IYNFmzlmowc2AVZw-1; Fri, 05 Feb 2021 12:09:50 -0500
X-MC-Unique: avjgQ6IYNFmzlmowc2AVZw-1
Received: by mail-ed1-f71.google.com with SMTP id w23so7209268edr.15
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MKZ9sZmrFdHUii9FC+I/0Z4Bq9xh7JxpLFtIFUbiz9k=;
 b=h6juBNdmBI/HSzkAklB5otvuR6H00p7zu+QQmGFyoNfzGfFJ+OLP8u6M4+EUeNc6++
 xKJNWCj2U7MfTvegKVCca+AfHYgP2fuAFznMYUnzXMvEvb75kW4xTz0XRwSHnwpwtc+a
 AiVbtTdPPaLAg9kvOiAXSs3nJd4h5tab2OTyM+E11oHSab+utZeCt1GXGKinFrPm3IUJ
 zbUuPb7rI28gwjuUnp/udVjG9al+ngeojZyw9QG+2Hhck+9ahmBVjCl1Pr4/3QGDA7rZ
 fI6WJgZtCA0ulXmSQm92XptWswN2x3BPt44NcDbcKMDmCCENdIeg4C4kwGR/AI8xzMcz
 HgMQ==
X-Gm-Message-State: AOAM531VrRiHs15QAmZrLmNbuwJIGH7ig9P4cRCHiExic8i40SmycTEO
 NMvCcrxxPdIW4xMnWefRpSu7KUixdcKM23Sb2JuPwp/EI7DiWjK8srlfWwdtp16CYMeXwBnTExm
 vCxw8XnE+yueBfC4=
X-Received: by 2002:a17:906:a149:: with SMTP id
 bu9mr5035671ejb.185.1612544988209; 
 Fri, 05 Feb 2021 09:09:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze70pG7KTZjOo6d5DBxDBUYzH1SR4Bz+ITm1jaMtUFBUGozi1hsSaVBQKY2r2ClxOWkJFMLA==
X-Received: by 2002:a17:906:a149:: with SMTP id
 bu9mr5035640ejb.185.1612544988010; 
 Fri, 05 Feb 2021 09:09:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i21sm4275997edy.9.2021.02.05.09.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 09:09:47 -0800 (PST)
Subject: Re: acceptance-system-fedora and acceptance-system-centos failing
 sporadically with timeout?
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 avocado-devel <avocado-devel@redhat.com>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
 <68c85b98-6a4b-13a7-ae86-8a63013549a7@redhat.com>
 <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
 <dee3488c-ca1d-24bc-5900-117992d30013@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <30cab296-77ae-a76d-b450-a507c967413e@redhat.com>
Date: Fri, 5 Feb 2021 18:09:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dee3488c-ca1d-24bc-5900-117992d30013@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:49 PM, Thomas Huth wrote:
> On 05/02/2021 17.43, Philippe Mathieu-Daudé wrote:
>> Cc'ing Avocado team & John (Python inferior exit delay?).
>>
>> On 1/28/21 11:10 AM, Thomas Huth wrote:
>>> On 28/01/2021 10.45, Claudio Fontana wrote:
>>>>
>>>> is it just me, or is the CI sometimes failing with timeout?
>>>>
>>>> Fedora:
>>>> https://gitlab.com/hw-claudio/qemu/-/jobs/986936506
>>>
>>> I've sent a patch for that issue just yesterday:
>>>
>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06852.html
>>>
>>>> CentOS:
>>>> https://gitlab.com/hw-claudio/qemu/-/jobs/980769080
>>>
>>> Never seen that one before - if you hit it again, could you please save
>>> the artifacts and have a look at the log file in there to see what's
>>> exactly the problem?
>>
>> https://gitlab.com/philmd/qemu/-/jobs/1008007125
>>
>>   (28/36)
>> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_ppc_mac99:
>> ERROR: Test reported status but did not finish (90.09 s)
>>
>> Attached debug.log.
> 
> That's again the failing test on the mac99 machine where I've already
> sent a patch for. I'm looking for a log of the failing or1k machine that
> Claudio has experienced in the CentOS pipeline.

Oh sorry I should have started a new thread instead :/

There is still a problem that "Test reported status but did
not finish" and make the CI red, while the debug.log show the
test succeeded. This is where I'd like Avocado guys and John
feedback.


