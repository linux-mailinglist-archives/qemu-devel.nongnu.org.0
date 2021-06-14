Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73753A5F95
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:58:28 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjMR-0005km-Sv
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsjKv-0004Nw-D4; Mon, 14 Jun 2021 05:56:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsjKt-0002i3-Tv; Mon, 14 Jun 2021 05:56:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12590104wmh.4; 
 Mon, 14 Jun 2021 02:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WU/e8/K4fyzCovXf+QgZidWnrB2safIidAdRAtVMyTo=;
 b=EEbkLtYJj9/hTNo2gG0IWjsIik1wOn6Q6Xe1hONaM49otS/SPOsX6m8KO37bsoyrZ9
 hwEdX7jTGYWo4YMB+4n1XH8HvW4ge94Dbj8lMrMLXc/Fs+4Muu1nAbrOzDFHLNRUllkp
 hq8JjjG3mdjE2eS6jnCea0qdkyiMddsgkfDDhUcIvJH+8cpPwKe++Xd0JfZzLx1pDNSX
 UNuNtPWsp872/MpT6LBwYRp/LXn/aPea/bMloydnApHlDx3l8BmtSTdKhHroBshZFCh5
 c1g7OPWr3r8ZFJNaZt2pXop/4DQqGUgTFeN1Yy+UCw1Lj2Xpp+Ycuxa4G5lcgUJC7tVZ
 698A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WU/e8/K4fyzCovXf+QgZidWnrB2safIidAdRAtVMyTo=;
 b=lbwteRAwLj5XFfVAZot8J7BQOfs6MtbDWxoVKkTNmipuibAIpp1Zd12OFcgmdpq9uu
 VPEo2Js+HOWKlsGNH3IfbMZMg+42KgAEwUolaNcJQsH+1GbaR+/80kbpsnBem3gUvB9H
 xGQ2onXubKCxY4813GpBNFYjUBjf7AacLp7sIrPtw/u+abA/myaN44VDi6GYLqg41hYa
 ry7WVZP0uGmvnumpE8mF1C1IslBfLMOCZPQlhfgsqnEYKBf/53XXAuLZKAnwZI9LIeUN
 cIw5sH1vs8RFt512bfiOIZ24Bvl56D2wM1oqFoh1mMoJ5ot7OYScaeUNMoSHrFxNpFZD
 x0ZQ==
X-Gm-Message-State: AOAM532Acg1yvw3e4qqfMnXqy6q59S0geQCHWbCTBni9dmiMZVlSHJq1
 /PZ10Y2TSdfpsHOOXZgYIxg=
X-Google-Smtp-Source: ABdhPJyLna0CUXjTa10i7hbMuaJZtemu9YENWKshSXqVlEUHITHIvqTUbcoe38sfcw6GkDQWmVIG8g==
X-Received: by 2002:a05:600c:3b10:: with SMTP id
 m16mr31427431wms.55.1623664609839; 
 Mon, 14 Jun 2021 02:56:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s1sm19598202wmj.8.2021.06.14.02.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:56:48 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] i2c: Match parameters of i2c_start_transfer and
 i2c_send_recv
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200623063123.20776-1-f4bug@amsat.org>
 <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8230aaa5-73b4-4bf6-6567-38bb5cde3883@amsat.org>
Date: Mon, 14 Jun 2021 11:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/21 9:33 PM, BALATON Zoltan wrote:
> Hello,
> 
> On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
>> This is v2 of Zoltan's patch:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
>>
>> - rebased
>> - added docstring
>> - include hw/misc/auxbus.c fix
>>
>> Supersedes: <20200621145235.9E241745712@zero.eik.bme.hu>
> 
> What happened to this series? I did not find it in patchew, only my
> original patch:
> 
> https://patchew.org/QEMU/20200621145235.9E241745712@zero.eik.bme.hu/
> 
> I still have this in one of my branches so I think it was not merged at
> the end. Could this be resurrected or should I forget about it and live
> with the inconsistency in parameters instead?

I suppose it was not queued because you asked to remove the
"Reported-by" tag :/ I agree with you it would be nice to get this in
the tree
for good. However 1 year passed, so it might need adjustment.

