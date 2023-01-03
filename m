Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81665BE0E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 11:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCeYK-0001vr-DG; Tue, 03 Jan 2023 05:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCeYI-0001vi-9Z
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 05:29:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCeYG-0006qd-7N
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 05:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672741786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EXvEA+hvtzpZm0x8QHEqT6HwFVlwrDvPHIhXRu1Rmk=;
 b=KelpQYBWBVbluoRwBF3gM73Bfs9kOq8XKxtQ4tDMnEZGrCtVMaOAUcpyoQ9NdQUuxrmQo0
 acMnVCd4oIgqBzCRtMD76+PnBsEmQbZP4SvrKYzICV9syRRteggMjtsoPgo917diRuxU2D
 5gxBx21lZ30xJusB2yK36FZdHVv2WqQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-ft2YQ3PTMza2ckTjDFkw1g-1; Tue, 03 Jan 2023 05:29:45 -0500
X-MC-Unique: ft2YQ3PTMza2ckTjDFkw1g-1
Received: by mail-wr1-f69.google.com with SMTP id
 u15-20020adfa18f000000b00286c5df5f35so1748326wru.22
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 02:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1EXvEA+hvtzpZm0x8QHEqT6HwFVlwrDvPHIhXRu1Rmk=;
 b=EzPkhkKzVyuypVf7JxM8zTEZM0ydu2hzX2RiM2sn6A/TNlgQpmZHVz0zqWbZwMoAnR
 pM8pxGocDqqXNG6wSd2aA/N2ILoAGxxLZmK3AnzA4JH6Ccy13I62lXAvHT/pDZKDbZ8+
 r5SyWye4YyHrG7MvqO/6eUKQzKuEsATZjL9DMqfDoK3/rJ4yOtAkoyB8CzZPJ22BvK3r
 dEtLvvqLKi8NQrY5u2M2wCvawbZZ2L1YgacPgX7IYelCWn1eBFg0atBsEvJzSJCGrX8N
 NYK69MHGBu6C0bkKsdXKbyiwrHPBUIEaH7TkMkphenL2IQQlzittyp/iPbdnK87BbAu5
 maAg==
X-Gm-Message-State: AFqh2krLPFrikdvtlG2OKaM6cLtxvvPAoAj+xYh7QtJjIBQv16AAa4go
 /EgoK8Z04v/1iSRQHwHNnnuCJZpk2ZAJto5msyMPPsVhGIAjEqUtlupKNDlUzSr+GEJShWdu7Ie
 ktS89V2oAdEjCtck=
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr34173885wmq.5.1672741784438; 
 Tue, 03 Jan 2023 02:29:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfzg/ihwwXpapJK7QKxhH4jrwcclFYmgAn5USS/d55qyH9bG6kbkTSFDl+OGzzVO538IOwgg==
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr34173878wmq.5.1672741784240; 
 Tue, 03 Jan 2023 02:29:44 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003d358beab9dsm45919113wms.47.2023.01.03.02.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 02:29:41 -0800 (PST)
Message-ID: <35f6af53-3071-6f26-9038-218a2aae1728@redhat.com>
Date: Tue, 3 Jan 2023 11:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
References: <CAFEAcA_FuURPMDso7+ws0fe33mm+9aAHGByc65YbbN6dEuZWMA@mail.gmail.com>
 <ae141ea8-8bfa-b941-b4aa-80bf1b5150b9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: can we reduce the time taken for the msys2 jobs?
In-Reply-To: <ae141ea8-8bfa-b941-b4aa-80bf1b5150b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/12/2022 17.23, Philippe Mathieu-Daudé wrote:
> On 16/12/22 15:55, Peter Maydell wrote:
>> The msys2-32bit job currently seems to run into the 70 minute CI timeout
>> quite frequently. This successful pass took 61 minutes:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3479763757
>> so I don't think it's a "time limit is fine but job has intermittent
>> hang" situation.
>>
>> msys2-64bit also is quite close to the timeout, eg this job
>> https://gitlab.com/qemu-project/qemu/-/jobs/3482192864
>> took 61 minutes.
> 
> The 64-bit variant is building WHPX.
> 
>> Can we cut down or split up these CI jobs?

The Windows jobs are terribly slow, yes, and we've discussed that a couple 
of times before with no satisfying solution, e.g.:

 
https://lore.kernel.org/qemu-devel/e80726cc-633d-435c-7a2a-5cae43624282@redhat.com/

... so we currently settled on not running the qtests in the 64-bit job 
since that would take too long.

I also don't have a real good idea how to improve the situation ... we could 
switch to even simpler targets (e.g. s390x-softmmu should compile faster and 
run less tests than ppc64-softmmu, I think), or would it be still OK to bump 
the timeout to 80 minutes here? (90 minutes, like it has been discussed last 
year is already very borderline, but I think 80 minutes might still be OK, 
especially since those jobs don't wait for another job from the container 
stage?)

> We can add --disable-tools to the slower.

For the 32-bit job, this would further decrease the test scope ... should be 
OK as a last resort, I guess.

> What I don't understand is why the docker image is rebuilt, it should
> be pulled from the registry.

I think those Windows jobs are still quite a bit special ... e.g. until some 
months ago, the "timeout" setting was also not working at all IIRC.

  Thomas


