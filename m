Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5AA340FAC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 22:16:16 +0100 (CET)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN007-0004Yh-44
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 17:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMzyC-0003we-42
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 17:14:16 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMzy7-0006lP-3U
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 17:14:15 -0400
Received: by mail-oi1-x235.google.com with SMTP id w70so2480896oie.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gVKvW9rSAO0dP3lXSgeqfRbuP0yqwxlRmxb/jqCOt4M=;
 b=q55OKyMG1rL0820gm9Datyd7qhzduf3lapMX9RSOVKKCNOW4qevj8kBhf07hrmzkMi
 kySqgM+cJhBADWSCmpzWrbBKrrQxnbkvMFWqP+XnJoIak9fl9VzzwJSz6BxvE2Sdjf2b
 4D5nIRrp1IrH8AwAhr7nWLF59M3YlFl2gbOVmFnboUE1lsq75uEWWpOWMumFLH/qcwQn
 7JxiRSofCqJjQWHfkXoxaGq75M3O6ZrRiW5Bk98XFj/zJS7HxgEypV9lLuVhdvghKL4f
 TJ0143GcXDHTXxSmhUadM0Seyeb5GdvNMGs9kO2qQjZUa7dMtz8EmCzMP8DsJmV01x/8
 HkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVKvW9rSAO0dP3lXSgeqfRbuP0yqwxlRmxb/jqCOt4M=;
 b=c9MZHDjs4WlGzOmeG3/544Vz1xcA6wR58UYxMPQPtQDCcTIiWNd6230gQsTdJ2afQd
 2REtJQOgNmYQyTIla2e4mXnS8jWuQ1bZQHUiQiFZqClkhv+Du8PkMnybd6sJfyYMCPkq
 udMk+gXl4UUpp8JiTVtLgItLwkeupT/JQ9NF9EYSpMSW8hPnuggoTXvjQUWIWHlpkTb6
 9wQtDAUAKpuAtChqK83/6DOc+YDwBee9JsoazvaDdJLsiO+FA+WQxjzvPwjAi+yEgXoo
 4qJbFpP/cxCn6rz/Wb3U6PB94z5kwNldY8uk+BbPAobw7A1BJ+D8T37h4CZwJE4mJ+gl
 TNeQ==
X-Gm-Message-State: AOAM532FthxAD8QyqiXS69JOWDFh8JyF0utFglbNd73O8qQjE3BH2qxn
 QbFKxR/CGIDvQ46BhpdKv/T9kw==
X-Google-Smtp-Source: ABdhPJzXsKIkmXiyrEUfOvLEtfQOwWCw5NLR8Rmz82tDjVsTPoWHwYqA6MYcYoDSBGfZdfxXLiUwJg==
X-Received: by 2002:aca:3058:: with SMTP id w85mr4516774oiw.19.1616102049429; 
 Thu, 18 Mar 2021 14:14:09 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w11sm800129ooc.35.2021.03.18.14.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 14:14:08 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
 <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
Date: Thu, 18 Mar 2021 15:14:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 1:02 PM, Peter Maydell wrote:
>>> +     * Note that we do not check @as against the 'as' member in the
>>> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
>>> +     * AddressSpace which the rom blob should be written to...
...
>> Should you really have this special case?  Nowhere is this going to verify that
>> @addr is in @as.
> 
> It's the "happens almost all the time" case. Nothing verifies
> that @addr is in @as anyway -- see the "Note that" part of the
> comment above.

The comment explains why we don't examine Rom::as.
But we do check @addr vs @as via @as -> @fv -> flatview_translate.


r~

