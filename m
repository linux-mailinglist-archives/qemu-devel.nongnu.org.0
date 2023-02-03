Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880B689E80
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyEr-0000vq-N3; Fri, 03 Feb 2023 10:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNyEp-0000ud-Ma
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNyEn-0002eF-Pu
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675439068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfbW/XyEV6UB5y4nrVIYlxOiybdDrZphz9rZySTmY9w=;
 b=AWUel1vqeI9tCO8ytBbY2hWQA8NxJahTix7xtt/bGq0KYUUc0CtosFCMzgmecKQMijaTKN
 +zfPnRTEMmuzQEtV4HSuW5DtU+UkrMZ6enU7nwcM94xL0qYARCXFl2ptBuFwnNigB++3ZQ
 LWXtLSWS+Bk6bGefw9WTjZFgoITDeWY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-jFDFIUa3Omyp0_qXnocGxA-1; Fri, 03 Feb 2023 10:44:27 -0500
X-MC-Unique: jFDFIUa3Omyp0_qXnocGxA-1
Received: by mail-qt1-f199.google.com with SMTP id
 u11-20020ac8050b000000b003ba115c1b72so290737qtg.23
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 07:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hfbW/XyEV6UB5y4nrVIYlxOiybdDrZphz9rZySTmY9w=;
 b=n4LG8hngNyVaCE1cDHSa18gy/R8zFbkW52KC9XdA3dcUnDfLKUxknGEz41kOuPPUhT
 KKPXBXdH3HJZItyZcq0dkO7pC8ddGAIUf8BITAdPNIvlQPF1WD7XLLi/5r8On7Aw5UV2
 JLrkt5wzkn2BxZ8+GEizXA4wgr0l4htPr4mfMHiyKb16aNOIW2LeAQXAKbBhIyJqKv9l
 aDR6NsTaVrcKcIoNMppfREn82biZg5Lfc6BuWISDpaXmhunz7ojUsMEu8MSKS+4XSb9e
 tchWFw0RtqRI8LmRT1ezJ4n2AAdsR6Ux5RxecDXJJrAZxNX6w1RhXkT2pwYMpHce+UtI
 L3bw==
X-Gm-Message-State: AO0yUKXDonhFJxeE4DANOIrpefX7yXnXt5/NtvU422obVWG5P9G1FFZY
 KO2fJZjDwSlJmt65pLGPTVMoTi16AWSft22z//Bn2R/ERv7Strh/yOwbTYJSiYGDtVUY01d9te/
 gTpqxys7x+SpDlrg=
X-Received: by 2002:a05:6214:564f:b0:537:7566:5098 with SMTP id
 mh15-20020a056214564f00b0053775665098mr15018745qvb.15.1675439066991; 
 Fri, 03 Feb 2023 07:44:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+NdStPFieMHhs7REdG2KnmJ4ifmhIUzYtmhciLf98M376fdEPImn5Ej+347SbHdbomVpyBFw==
X-Received: by 2002:a05:6214:564f:b0:537:7566:5098 with SMTP id
 mh15-20020a056214564f00b0053775665098mr15018721qvb.15.1675439066749; 
 Fri, 03 Feb 2023 07:44:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-132.web.vodafone.de.
 [109.43.176.132]) by smtp.gmail.com with ESMTPSA id
 u21-20020a05620a455500b0071a02d712b0sm2093994qkp.99.2023.02.03.07.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 07:44:25 -0800 (PST)
Message-ID: <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
Date: Fri, 3 Feb 2023 16:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, hreitz@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com> <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y9z5TohXERGuQ6TS@redhat.com>
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

On 03/02/2023 13.08, Kevin Wolf wrote:
> Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
>> On 30/01/2023 11.58, Daniel P. Berrangé wrote:
>>> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>>>> We can get rid of the build-coroutine-sigaltstack job by moving
>>>> the configure flags that should be tested here to other jobs:
>>>> Move --with-coroutine=sigaltstack to the build-without-defaults job
>>>> and --enable-trace-backends=ftrace to the cross-s390x-kvm-only job.
>>>
>>> The biggest user of coroutines is the block layer. So we probably
>>> ought to have coroutines aligned with a job that triggers the
>>> 'make check-block' for iotests.  IIUC,  the without-defaults
>>> job won't do that. How about, arbitrarily, using either the
>>> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
>>> are closely related, so getting sigaltstack vs ucontext coverage
>>> between them is a good win, and they both trigger the block jobs
>>> IIUC.
>>
>> I gave it a try with the ubuntu job, but this apparently trips up the iotests:
>>
>>   https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
>>
>> Does anybody have a clue what could be going wrong here?
> 
> I'm not sure how changing the coroutine backend could cause it, but
> primarily this looks like an assertion failure in migration code.
> 
> Dave, Juan, any ideas what this assertion checks and why it could be
> failing?

Ah, I think it's the bug that will be fixed by:

  https://lore.kernel.org/qemu-devel/20230202160640.2300-2-quintela@redhat.com/

The fix hasn't hit the master branch yet (I think), and I had another patch 
in my CI that disables the aarch64 binary in that runner, so the iotests 
suddenly have been executed with the alpha binary there --> migration fails.

So never mind, it will be fixed as soon as Juan's pull request gets included.

  Thomas



