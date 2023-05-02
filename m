Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D96F43B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:23:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptp0Q-0002zR-S9; Tue, 02 May 2023 08:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptp0I-0002pz-Lj
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptp0G-0006GV-6c
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683030067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3hWRuyvYwWIXslyulCFnUadpzTfyB/rK3FH6i5mHCM=;
 b=BJf0mRHIOtRcOlnoz2tcv03V49RNzFHRhwfU+PAu5I/f8yotwBMr/Pofco7AymGpTIzxvn
 mWsYXwnicKv1n5RoXw/EYZUw3WXfOlEdxZ6+4p91dM4Y+Yjb6hLEGOKSvcwInfUBtuibBc
 T6nz4bGsM6cARCmn01Wd2ELow2YN+gA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-pnIDbZR-M2GHL046x7j62w-1; Tue, 02 May 2023 08:21:03 -0400
X-MC-Unique: pnIDbZR-M2GHL046x7j62w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f625d521abso2194148f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683030062; x=1685622062;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y3hWRuyvYwWIXslyulCFnUadpzTfyB/rK3FH6i5mHCM=;
 b=Kpf2LTCFHiKCrkF3YYdLymWOLa0QCYDbt75Acql+/iqpLmMR8c+w0MdZIzZppd6Fn+
 2s7MmBASmFWOaVCpf7Vvv6FAHkrz8qQXL1hr41BFFUjMtcJZ7esz7TU39BGg4mWJiqMF
 TkND+v5jobeGMTSjdvNEzbg43I8OpHnTbVmGxYUt0KbQ6YhZjbJGazT+7Nd5htGtkUxi
 TvFc83ieNsdC3pfu2p7BNx9qePyWM7n5ewHSIJ3wwNpkbZQxHqWO63dgumBasF40tJo+
 4gHcuV7hYMRo12js18xEwM8ey/mVdEP3PiD4GO6HYyT7jtMxrwLGbVtljzSsAnmr34wG
 mgqg==
X-Gm-Message-State: AC+VfDzJVyoPtUygbbHenLNkKN8sny5rbmNjj2u/Vf7ST7yC7GKQiQK5
 wM8RwoVo+9gEx5BuliS7pjXa8y+2BXa31SCVU4R0q3HQpeNQno0dJUi57iQzCihyZkXAu5Rpk2T
 PxWdHRJYWxIxmYno=
X-Received: by 2002:adf:de0a:0:b0:2f6:fb98:fa62 with SMTP id
 b10-20020adfde0a000000b002f6fb98fa62mr12718451wrm.40.1683030062665; 
 Tue, 02 May 2023 05:21:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+ZjpEHG5UdhIuKmteaeAdfEt3FkHRvv/F+54yxxLJuGRg9B9QV38jqRzylhJW0x1kIb2isA==
X-Received: by 2002:adf:de0a:0:b0:2f6:fb98:fa62 with SMTP id
 b10-20020adfde0a000000b002f6fb98fa62mr12718426wrm.40.1683030062301; 
 Tue, 02 May 2023 05:21:02 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 q11-20020a5d574b000000b003049d7b9f4csm16843064wrw.32.2023.05.02.05.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 05:21:01 -0700 (PDT)
Message-ID: <0afb8e76-8ff5-a4fe-31d8-a7749c25cd07@redhat.com>
Date: Tue, 2 May 2023 14:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
 <CAFEAcA-nvqJtP0Ez+1juneRTsUkUB53CsZV0CfhLUWe83M0GTg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/18] testing and doc updates
In-Reply-To: <CAFEAcA-nvqJtP0Ez+1juneRTsUkUB53CsZV0CfhLUWe83M0GTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/05/2023 13.46, Peter Maydell wrote:
> On Thu, 27 Apr 2023 at 16:47, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> The following changes since commit 1eb95e1baef852d0971a1dd62a3293cd68f1ec35:
>>
>>    Merge tag 'migration-20230426-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-27 10:47:14 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/stsquad/qemu.git tags/pull-testing-docs-270423-1
>>
>> for you to fetch changes up to ef46ae67ba9a785cf0cce58b5fc5a36ed3c6c7b9:
>>
>>    docs/style: call out the use of GUARD macros (2023-04-27 14:58:51 +0100)
>>
>> ----------------------------------------------------------------
>> Testing and documentation updates:
>>
>>    - bump avocado to 101.0
> 
> Did this change the behaviour of 'make check-avocado' ?
> Previously it would continue the whole test run even if one
> test timed out; now it seems to abort the test run when the
> first test times out.
> 
> I don't object to the current behaviour, but is there some
> command line option I can use to force avocado to complete
> the whole test set even if there are failures or timeouts?
> 
> ('make check-avocado' for arm targets has some persistent
> intermittent timeout stuff still, so I generally prefer to
> eyeball the failures and ignore the stuff I know is flaky.)

I think I've seen it in the past, too:

 
https://lore.kernel.org/qemu-devel/7836af42-9969-a01a-3c8c-717987b0b27e@redhat.com/

... but after Cleber said that there is no change in behavior, I did not 
follow up. Anyway, it is likely related to that --failfast switch of 
Avocado, so that's likely the first thing to look for, I guess...

  Thomas



