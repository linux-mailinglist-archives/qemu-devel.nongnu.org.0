Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30831885A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:42:28 +0100 (CET)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9QX-0004wy-6Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA9NM-0003V6-3t
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:39:08 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA9NK-00085V-Dd
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:39:07 -0500
Received: by mail-wr1-x431.google.com with SMTP id v1so78994wrd.6
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HCpD3+2rYytgIZh7OHwXMN3fQ4UjNU6c3wva37J5L1M=;
 b=Vg78VWfyaWczG/6rYLr7FYPKRGznqLG6yvoM2VJ2pP/fSfphPnRaPMaf2cHIxusfxK
 seuiKgucNH/1zhXFU1YTsfsOtnSn3VvbjhzKw6LLhVpDg4sFj4YL8PoRgBgazARdb8fL
 c+lxYHJU8O6D5J5OhcSrpjSrT8qVwpczDQ8dtzQQaXBY4UNm9WxZfrzb/JKeB09xBroV
 SFBZG926w7SWVRvgJqSIdYZ8j2RsYkdNlBBxUdHDILWt277V8Cy7RlhNHZZ9J8cxltNf
 Z46j83IFxyw+ua4YZMXVgxBx8d69YLOnOvY8U/LxIiwQFiOI4KSY/J/OY+9BhH4JIc18
 zA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCpD3+2rYytgIZh7OHwXMN3fQ4UjNU6c3wva37J5L1M=;
 b=WW+wH3uFTcQjmSCodckgFyNIzUe+ItCqEfjKJeS6kv7vyPuq4lPZGmhsMbutM45tFs
 UstD8EqWQvGKV1vwXDo7f/IdZN+DjoNXuR3gvOT4+U4VmpZ3/SyUcXzp5Bn7H6JkvTUC
 KHoF+p60/o0gf92qFt1P+ZXl+T2Sgn3m++0g7ifwJ/Gh7hETFo6pRTLD3o+ONCvoTkH/
 f5fkrxmpWQE6EIHkpGDsW5vSUgx5Ig84v3k9u9IrOumiLWjaHUBRWHBu8z41cjoAFK59
 xapFtRIurvrit3ir05v1setZTqzbpWT6hqhDcDw9PBL/4Zc5EgTK3h52UZcJUmtBvj+V
 +Rag==
X-Gm-Message-State: AOAM531EEUBkR67PBihSHLYREaIBTvWYT1qQhnWKYJss/GpNinoCtLHN
 71PVLGiHKP8BqUT5hvhxYL0=
X-Google-Smtp-Source: ABdhPJwRYedNUXoDt50yzfc3QCp09uFNwo3cXeJYDkAgCCUMV8lIGwBfwoYimyOiIo0UhxVxE8Hv0w==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr3094074wru.377.1613039944777; 
 Thu, 11 Feb 2021 02:39:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x10sm1872840wmg.6.2021.02.11.02.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:39:04 -0800 (PST)
Subject: Re: [RFC v17 10/14] i386: split tcg btp_helper into softmmu and user
 parts
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210210152859.25920-1-cfontana@suse.de>
 <20210210152859.25920-11-cfontana@suse.de> <87blcrx4t3.fsf@linaro.org>
 <bffb363e-6141-9969-0c4b-f3ea31d09a28@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <79bbf2f3-1345-8102-eab2-b5e8c2528c68@amsat.org>
Date: Thu, 11 Feb 2021 11:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bffb363e-6141-9969-0c4b-f3ea31d09a28@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 11:07 AM, Claudio Fontana wrote:
> On 2/10/21 5:28 PM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>> s/btp/bpt/ in subject line...
>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  target/i386/tcg/helper-tcg.h                 |   3 +
>>>  target/i386/tcg/bpt_helper.c                 | 275 -----------------
>>>  target/i386/tcg/softmmu/bpt_helper_softmmu.c | 293 +++++++++++++++++++
>>>  target/i386/tcg/user/bpt_helper_user.c       |  33 +++
>>
>> So I'm not sure about totally mirroring the file names in softmmu/user
>> subdirs. I can see it makes sense in some cases where there are genuine
>> functional differences between the two. However for everything that
>> exists only for one mode we might as well throw the stubs into one file.
>> Maybe target/tcg/user/stubs.c in this case?
> 
> 
> Hi Alex, I think you are right, repeating the _softmmu , _user seems too much.
> 
> On similar things in the past Paolo mentioned that he favours simpler naming.
> 
> In this case I could do for example:
> 
> target/i386/tcg/seg_helper.c          - seg helper common parts
> target/i386/tcg/softmmu/seg_helper.c  - seg helper softmmu-only code
> target/i386/tcg/user/seg_helper.c     - seg helper user-only code

What about:

  target/i386/tcg/seg_helper.c          - seg helper common parts
  target/i386/tcg/seg_helper_softmmu.c  - seg helper softmmu-only code
  target/i386/tcg/seg_helper_user.c     - seg helper user-only code

> For the parts that are just stubs really (like here bpt for user), I would like to see if I can remove them completely if possible..

It is probably worth spend time on this first. If the helpers are not
needed, why do we generate the code in the first place?

> 
> Overall though, I am wondering whether this kind of change (extended more to the rest of the target/ code) is an interesting approach,
> or does it make harder to work with the *_helper code, as people have to chase down more files?
> 
> 
> Thank you!
> 
> Claudio

