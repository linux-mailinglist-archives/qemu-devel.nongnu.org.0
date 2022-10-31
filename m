Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69061405B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:04:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcsy-0001vK-BJ; Mon, 31 Oct 2022 18:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcsu-0001hG-EF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:03:57 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcss-00020f-VC
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:03:56 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1322d768ba7so14978252fac.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UIbkc/YPX63nubCauxvKQLpGZuJ4hyZwEKyMjGH07VU=;
 b=y+FkgdzwjKpfB94EnXa5Xjbn3Ikiy3imZb3sW5PWWX2rhd0QHhbLcGLlxKGdzsrTme
 5P+ixWVbdXc8NMz/fWP2p8labKlGGLIjxdsk/wjFA6V1/EgR4/2wIQ0No86M6ib9+0WE
 xMGmJx7qLwaCGM6uGuapTaOOS4s96c1ZtFiD4/c5/CMQ4bgJNn/9h01/4J+j3oUS6HAA
 HQ7c82Im8k4dswxuZGbWJZukQDjd+ku9aUSMl5ZrPsDNsUh4EHFFGJeTfsP76XVsGxtR
 GP8xrqnop6geFezL05zOLLRM1mOWW1cfjT17ubs7BGLgr6oMGL6WvEbPAwfj6Hujh9db
 Grkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIbkc/YPX63nubCauxvKQLpGZuJ4hyZwEKyMjGH07VU=;
 b=zVYWrxl1g7gYhMHvyERKc3xAychzGX09Kp+Udyt5Vxg0/8PWEZ+RlCRvvPzd/NrxSC
 ZN9WJXHReQpGf6n4JljQ8Aq0KODj2yza05zpYUlzKrRTsXVYHgqLBDb/3y3EWmt2BWN8
 /4K5RBM+j1JrhryhyL6twt9E0LYi+8EN+snLQrmDKh2JBgZrb5/Ol9qeMX6jSouuh21R
 bRt8pWB5HksLz/UKQmr2rOMLA2/xrluCnYCvKAGvpI10sjuoQjXsqk4GKPLEK/GnsiFD
 JjsmhJDa2sczq2wIDaYx2lAjJ7XnWEtuWYa5SbveGfL+EP5QTieSdBgsGA5+YUwddHNO
 vg9g==
X-Gm-Message-State: ACrzQf0jEN9B0JBMOJnYCEUCaGSNruDLX5yXUaIy0ghXq9DS8SP6Y+6F
 QO9eeJwJGeYmDFvU0ozUgHXpCw==
X-Google-Smtp-Source: AMsMyM7yUxY00YUgIMpluww3wPDampKvrEtqG89GRc+YpInFOhMs4xHiLRu1zz4+Qahy8ZI3Cf06qA==
X-Received: by 2002:a05:6870:609c:b0:131:c972:818f with SMTP id
 t28-20020a056870609c00b00131c972818fmr8627578oae.2.1667253833415; 
 Mon, 31 Oct 2022 15:03:53 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.58])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a056808158e00b00349a06c581fsm2793438oiw.3.2022.10.31.15.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 15:03:51 -0700 (PDT)
Message-ID: <a79ec0a6-0260-41da-a561-7253ac50c6d3@linaro.org>
Date: Tue, 1 Nov 2022 09:03:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
 <1792277.8fnDRLUPHX@silver> <4c5f0a3a-18bb-dfca-61f6-28b48538b42c@linaro.org>
 <CAJSP0QUB+6Ttoeo6aDoH3WAdCK3AyXH+=4Oe_U7Lr8GrtNHtoQ@mail.gmail.com>
 <66f22ccc-d83f-2bdd-3628-9e550a3d83f6@ilande.co.uk>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <66f22ccc-d83f-2bdd-3628-9e550a3d83f6@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/22 08:27, Mark Cave-Ayland wrote:
> On 31/10/2022 20:53, Stefan Hajnoczi wrote:
> 
>> On Mon, 31 Oct 2022 at 16:42, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> On 11/1/22 04:56, Christian Schoenebeck wrote:
>>>> On Wednesday, October 26, 2022 4:10:54 AM CET Richard Henderson wrote:
>>>> BTW Richard, could you add a message-id tag to your queued TCG patches?
>>>
>>> Sometimes I remember, but I don't use the same tooling for my own work as I do for queuing
>>> other people's.  I haven't found much value in it.
>>>
>>>
>>>> If you
>>>> are using patchwork client then it suffices to add "msgid=on" to .pwclientrc
>>>
>>> I am not.
>>
>> Tools that boil down to git-am(1) need to add the -m (--message-id) flag.
> 
> FWIW in my local QEMU git checkout I've run "git config am.messageid true" which alters 
> .git/config so that the -m flag is enabled by default for "git am" commands.

This all supposes that one uses git am for ones own patches, which I do not.


r~

