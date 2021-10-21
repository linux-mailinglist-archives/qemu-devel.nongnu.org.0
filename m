Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B833436E4D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 01:24:58 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdhQe-0006YH-HF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 19:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdhPD-0005DA-S2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 19:23:28 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdhPA-00082i-RC
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 19:23:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f5so1633333pgc.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ABBAzwDWNEPQhyADNnZ61hntueylI3OpqU7Y4te1J90=;
 b=RtJAINw+emxufhljiUCxgJ7iu1o+gKxvRW5tewm9+ux/Xs6ZeTMgS6l10Tmdv0pxGz
 5j8B+cRg5LM6osXuVJv63a3fmKnN+nH8RrNHN2mn8Cbwk+zYCHTL/kVyqKc9tWWhZCd1
 6GEbHlg3IbKRwlmT9TbXYa4LCZSKg1ZasvklwCUkp72xw3+lhvMOrnfpn8Z+DAnWUs7h
 leibujWyz1/ZiVs3D6P3FRMgBdLeHSzCYJNAYZhdHtS+KR7yFmXxYBIpujR4ciF0BXzJ
 vafIeK8x8o0bWgYolO5uEVAG111IhnBtVa6amjke+s9hEjScXn/2yiOK5a50KfSbZHNg
 6oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ABBAzwDWNEPQhyADNnZ61hntueylI3OpqU7Y4te1J90=;
 b=IgdkwBQvf5QMKeXBU7UaeHREmXl8YsgoS3W7ns5uCvo6H8MoUsgnxbas056mke4Tff
 pXb7wIzmhhXagH+aDui8W/EBHsqlNDSJRMHj+Rs8vYcIIgNltCSVd8UveDfFKHqe7Uly
 qZcKkaxAYvGrIoAQeoR3Y5YnrmsBh2/dJP+AkyMDel4OOx375n38DL2RQGH3LTIihUfM
 3E2ZrJvgmduHA9eQxnGcbWrQxnmj/pGQBBnEqwCYvCPyom2FrqqaqDEBbCn7RQsp8TNx
 RCcCbB3DOCGiol6Ix7NMxo1SyVY7XfxFEvLKKLVbPXa7F1QJGmopjo4Sid9V2TqR+lK/
 t52A==
X-Gm-Message-State: AOAM533lnx+82DQCMnvF84PYd6Uyyi1G3bbAawTBUBTvcwo5veDhJFKo
 s1zh9NKXog8K/EgKtefrWsDRKw==
X-Google-Smtp-Source: ABdhPJy05sFTqNYdfFoCdhSnRL/F7CcK5BWndzsmA9KQ3l3yTG0OMKwtc+AYzpPaxxi7X5NFCIP4Ug==
X-Received: by 2002:a65:6187:: with SMTP id c7mr6581717pgv.317.1634858603283; 
 Thu, 21 Oct 2021 16:23:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t4sm7794327pfj.13.2021.10.21.16.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 16:23:22 -0700 (PDT)
Subject: Re: [PATCH v3 03/22] host-utils: introduce uabs64()
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-4-luis.pires@eldorado.org.br>
 <e324a9af-daab-273b-e448-33386c79e4e6@linaro.org>
 <CAOpTY_r21YorsZVWyV8D7yOD-wXvNfhj-i9YO2VKgLWjq=_jbg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23bd5922-d11c-3608-557d-4799ddbd404d@linaro.org>
Date: Thu, 21 Oct 2021 16:23:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOpTY_r21YorsZVWyV8D7yOD-wXvNfhj-i9YO2VKgLWjq=_jbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 3:34 PM, Eduardo Habkost wrote:
> On Thu, Oct 21, 2021 at 4:04 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/10/21 4:26 AM, Luis Pires wrote:
>>> Introduce uabs64(), a function that returns the absolute value of
>>> a 64-bit int as an unsigned value. This avoids the undefined behavior
>>> for common abs implementations, where abs of the most negative value is
>>> undefined.
>>
>> I do question the comment there wrt undefined. We compile with -fwrapv, which means that
>> *no* overflow is undefined; we always have properly truncated twos-compliment values.
> 
> Can we really assume that -fwrapv would make llabs(LLONG_MIN) not
> undefined? We would be calling a function compiled by somebody else
> (possibly without -fwrapv).

Fair enough.

r~

