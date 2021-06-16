Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2323A8EA2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:59:13 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKpk-0003Mf-Q3
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKok-0002eF-0F
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:58:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKoi-0000SC-8u
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:58:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id g24so763669pji.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8xmyJsOVHHSHJOeyxz8iimbYfQGLOxlp/O3BdJ+U8Ys=;
 b=W73+OKWvTjtd4/3rBcjQFEjVeSlrbzgCp4Bjls3stxaSN2GMg7TEBuGjuMyw1HoAxp
 z40l9AfR1z+1s4UdCRGOZjNZxaHQF2iqGrshT+2clsI16Ogb2VbTvYkfBsGNFUy+Td2P
 0ShIRqA7iT4mPQG1IcSi+sn5H38Nq2DOvb9UvA51LHUlud+tybQagTRWuwMOty49rfNX
 OH2bhyF+PGNwmWA4HlVOEkejubfuN3mTYOONfljjBaGEVb78w/QMoLa3va8Bex8At6AZ
 OhaBMR7Japdf5aysVUC0RyGPM9ZLFqC4PME6qRfC6DLKvrU18YvNt6pvPYL5sqN1IudQ
 BWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8xmyJsOVHHSHJOeyxz8iimbYfQGLOxlp/O3BdJ+U8Ys=;
 b=rs25yyp04H5gH9d99Kg4p6PtLOQrQFnpoi+jnsdS2H1gfAvldvuIty8iDDIk+6ITTn
 pIXMOtTxtVgfUUve7UyYxy4U64bNcjAEIjBZjxqBa9KgaaR8XE247T4J4PVDolmGYq0v
 X0QcWoTDEOYXKrQ058Yj0kNYyqZOX46vM46Bwg/v7AbCcWFh5O7vZ1GR3G2iO+BPgqZq
 v0Ytd4S+WwQmYf1ZJhF6/5rDkTc4d4c8E9QGKcxa97RgD0yBeJ700B0/bOeEW4e3/+X+
 NY4LRYBIMMaJzbZx9gMltmsPtkFDCM7HwSqjo9U3eYEBBkte95qnMy7dcPtvnDjwFu6K
 ECQQ==
X-Gm-Message-State: AOAM533RUOPtlS6IwUS80b2GaWxOYaX6olJzI4Ux/uZfMKndxRMbiyGb
 CcJKbja5LWz5VcIsyluRvwEEnQ==
X-Google-Smtp-Source: ABdhPJx/juFUii7mvmWm9gOejJFs5PsrcybaHmwlSPK+k4qQfbiwcgqZfyjcmwdrb3YV9t3YRyCAdQ==
X-Received: by 2002:a17:903:2289:b029:109:8cf1:7d9a with SMTP id
 b9-20020a1709032289b02901098cf17d9amr6934055plh.53.1623808686287; 
 Tue, 15 Jun 2021 18:58:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q4sm379622pfh.18.2021.06.15.18.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 18:58:05 -0700 (PDT)
Subject: Re: tb_flush() calls causing long Windows XP boot times
To: Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org> <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com> <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org> <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
Date: Tue, 15 Jun 2021 18:58:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 6:58 AM, Programmingkid wrote:
>> Ahh I misread - so those are the addresses of the routines and not where
>> it's sticking the breakpoint?
>>
>> I notice from a bit of googling that there is a boot debugger. I wonder
>> if /nodebug in boot.ini stops this behaviour?
>>
>>   https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/switch-options-for-boot-files
>>
>> -- 
>> Alex Bennée
> 
> Hi Alex,
> 
> I tried your suggestion of using /nodebug. It did not stop the tb_flush() function from being called.

We are not expecting zero calls to tb_flush (it is used for other things, including buffer 
full), but we are hoping that it reduces the frequency of the calls.

I'm guessing you didn't immediately see the slowdown vanish, and so there was no change to 
the frequency of the calls.

FWIW, if you switch to the qemu console, you can see how many flushes have occurred with 
"info jit".


r~

