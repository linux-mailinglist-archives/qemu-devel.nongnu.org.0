Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA0C3B481A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:18:38 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpTR-0005u9-0q
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpS2-00040r-EG; Fri, 25 Jun 2021 13:17:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpS0-00070c-Qb; Fri, 25 Jun 2021 13:17:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6337254wmj.0; 
 Fri, 25 Jun 2021 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fnFPeLmfQJKo1iFpPVLgEMHCjrh1u2F8qQtkc6k4yFc=;
 b=Mv/bElvA8raSxbvan21KxAKW51CX5jkRE7IF/cNpFxdHIrjAGZ/9TBFOPrcPX8Kg4E
 LkW7xnMIikXFg6Yg24yoSyV1FXKoQ4aGl4++IPs2OGf1Y0MqHOnMArne2SOxX9zIH49s
 OTEZsgdA4Wg8zNTXwDwLZLlPcn95oX/4yXE41VRoYvEv6xqTRGLZUIsw4p2Xsh90d9I+
 bHRzEZq1yUuE4FidCltiRVO8kfGM5KduY/3iMDIa9vMWAFYvkZR/5k8FVW/0uHlagJ03
 vIMp2MpTjpMmNOrqnZI+jdHA98BmX1jUjSUFetEQ0CID2JDLXVPA00zHZMoLGdZa5VfE
 twxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fnFPeLmfQJKo1iFpPVLgEMHCjrh1u2F8qQtkc6k4yFc=;
 b=D38WziKh96s+IoJxKUNYLFPEq0Ar/BqvIWvrCMKZ8nYhDLJZrOEaTjiKS6sXKcpAgo
 6Dlb32aCGEXWmfGDp+j4HktLAw1Mjbpy2rNXuC5zpEdzlZaf5TorqhzRzjA6Mze8Iysd
 XI3laJHDu4Xmwm0bZaUAzOuu5FjdXqT6Hetc8MLjk3nUbBMs0SujG6tZ4YR0uKNNJaBJ
 o8wVS0ioZsGTFujVi16HXldyT51wdkb/jPZEr/+eUcM3SHSFr7so7tJxmkyRGXXfaG/V
 pAjE1gDewoMUaiydYkG2pQ8uYIcOVJFr+AwUJJ+1cNP4gcK8H0ozNUTgow7tXwYbbhTq
 tbAg==
X-Gm-Message-State: AOAM532L/ExBjp0IIveASNhXxqMynSvq/i4xvp/gyCXaYeHX9B9Ox7+K
 07myZyry9eTRiv4N2Olgmmw=
X-Google-Smtp-Source: ABdhPJwdJb4JjTInK6HujNTZdPDcIN16fmWmgSlpqb1N+99HXiKOqKBOLp3A4Mr615EAh5tKfdDqgQ==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr12008550wms.168.1624641426888; 
 Fri, 25 Jun 2021 10:17:06 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n65sm11517023wme.21.2021.06.25.10.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 10:17:05 -0700 (PDT)
Subject: Re: [RFC PATCH 06/10] hw/sd: Add sd_cmd_unimplemented() handler
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-7-f4bug@amsat.org>
 <CAEUhbmW+k+voLnqx8-3Y53-y=OYNPbVeQ8h-6kZ+Y=gfcdjyfA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e0d9a0c0-b8b9-9aae-a556-e7bf25494ef6@amsat.org>
Date: Fri, 25 Jun 2021 19:17:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW+k+voLnqx8-3Y53-y=OYNPbVeQ8h-6kZ+Y=gfcdjyfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 3:49 PM, Bin Meng wrote:
> On Thu, Jun 24, 2021 at 10:28 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/sd.c | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)

>>      qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", req.cmd);
>> @@ -2096,6 +2096,9 @@ static const SDProto sd_proto_spi = {
>>          [26]        = sd_cmd_illegal,
>>          [52 ... 54] = sd_cmd_illegal,
>>      },
>> +    .cmd = {
>> +        [6]         = sd_cmd_unimplemented,
>> +    },
>>  };
> 
> Does this compile?

Yes.

> Or is this another GCC extension to C?

I haven't checked when this was introduced, but QEMU uses it since
quite some time now.

Apparently this is:
https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html

 "In ISO C99 you can give the elements in any order, specifying
  the array indices or structure field names they apply to, and
  GNU C allows this as an extension in C90 mode as well."

> But I think you wanted to say .acmd = ?

Oops!

Thanks for the review,

Phil.

