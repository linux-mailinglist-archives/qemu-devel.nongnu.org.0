Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A172ACB7E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 04:08:26 +0100 (CET)
Received: from localhost ([::1]:44124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcK1B-0007e9-VO
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 22:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcJzf-00078Y-L5
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:06:51 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcJzd-00031Y-VV
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:06:51 -0500
Received: by mail-pg1-x543.google.com with SMTP id h6so8916609pgk.4
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 19:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XOWQXqrkV2eyppsgDNDKT86NdDfJvK9Rx+Fm1mimeqQ=;
 b=B7fKfqd9LTDeg+VaognuW5+jPkkNkYInR3jTEV0dmXJmXxPr79shR3GoWuP2PjYS5b
 FZ+fB2AdUSV6dz9dYeDXkHDbgvj4Gpr9NwdxRolxv/LCBJIpXf6CNexvOS+vVgi2pUFw
 fbdXf+UtdLPKVtlDumns6cAwpWr8a6mr7YjkjM35KYF82F7pmXvoVBCsYH5t8ZBKXrR1
 JeR0PIJtIrQ54Sqda5Y21CxV+aQit3nOwtBj8ilFgeIr4lvG+wn626miinqRjnBPa3tq
 cT8N7zWfJO4we5k/PnMCkPGkfpTi2Ez7u7pCLgpJYH8uwETP+3fZlXalhtJ8cnw8msWu
 0KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOWQXqrkV2eyppsgDNDKT86NdDfJvK9Rx+Fm1mimeqQ=;
 b=CN/Ya4AwFhrbaXlN0Evep82IvudtpJvVHfeuZ270t/oLKXGiEcWUACQKXhT4yJ3tkY
 b7P5w4objzib2otmuXdkT9KEshXbSJQyjbfiF7w4Z0nI1Ht2UIR/wA+9Q4yIzjFM571S
 XeaZA9M7uPaHNVZ44ZySlUcLoXHBqk3QqZgz1nlIO4geW2Udwp4gBYsQFFBOzWO4EWuf
 lL+89QAXVUk3bNQZJ8IHN5tLX6iUgFq4xtqP9zD1oWhtqvuGCV+AQUZCce0qYEbzIlHI
 tq1DTVTW7Uhof/j67l4u9PckjYvnH6sthGTP2EMMYVw8BEK6YLkU2zDH4ZwKCddXA4yL
 gG/w==
X-Gm-Message-State: AOAM532pX45iHLIirNZdvGrjj8/g21Sm01ogP+fWs4XbU8EQMAmuxo9j
 5PX2XGvvDFqcpYh/ppBXe6wOEQS0dp+0iw==
X-Google-Smtp-Source: ABdhPJwB1srocCnB7XV8nG0uALfvQG7yImj/cWUg8nS8ccVJJK81wM8njvCuwnQDBbXaHmrlnZAMpQ==
X-Received: by 2002:a17:90a:87:: with SMTP id a7mr2532374pja.95.1604977608069; 
 Mon, 09 Nov 2020 19:06:48 -0800 (PST)
Received: from [192.168.3.43] (068-185-011-182.biz.spectrum.com.
 [68.185.11.182])
 by smtp.gmail.com with ESMTPSA id b7sm918093pjp.13.2020.11.09.19.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 19:06:47 -0800 (PST)
Subject: Re: [PATCH v3 0/3] tcg-cpus: split into 3 tcg variants
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201015143217.29337-1-cfontana@suse.de>
 <87ba7ac2-9859-74a6-54d7-b17d0560de98@linaro.org>
 <96ec9a68-8dd5-8dc9-e3a1-bad3242809d1@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4b72ab6-e7b3-1209-c779-ca6ecb89e62d@linaro.org>
Date: Mon, 9 Nov 2020 19:06:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <96ec9a68-8dd5-8dc9-e3a1-bad3242809d1@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 8:02 AM, Claudio Fontana wrote:
> On 10/19/20 5:00 PM, Richard Henderson wrote:
>> On 10/15/20 7:32 AM, Claudio Fontana wrote:
>>> Claudio Fontana (3):
>>>   accel/tcg: split CpusAccel into three TCG variants
>>>   accel/tcg: split tcg_start_vcpu_thread
>>>   accel/tcg: rename tcg-cpus functions to match module name
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> r~
>>
>>
> 
> Hi all, just pinging about the status of this series, is it already in someone's queue?
> 
> Otherwise it's fine of course to delay it if there are concerns about tightening up the upcoming release.

Oof da.  It has been a month.  Since Paolo picked up the first part, I assumed
he'd get the second too.

Since it's not critical, I'll queue it for 6.0.
But at least it'll be queued somewhere...


r~

