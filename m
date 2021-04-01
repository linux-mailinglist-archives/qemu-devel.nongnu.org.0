Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7CD351091
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:06:37 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsLc-0007I5-Lc
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsIc-0004LL-O9; Thu, 01 Apr 2021 04:03:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsIa-00015n-Gf; Thu, 01 Apr 2021 04:03:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso436870wmi.0; 
 Thu, 01 Apr 2021 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XYB0+Zh72AFKnNJPJ3qEYeedDoTJ5raLhm8zVFcQZ70=;
 b=qrEQLyqQ/lh5bLTG6HiJFMjC4rLfgFqx6RKDzXfAcx29Kd23vFLvsYNJK8XFAKAimY
 i64bbJwF3o6GAZv1/juNHJY850s0OF8bl62QYknA+nxiGbvvlLWPpR4qNVmEtvJcWBD2
 UJq2HsRQkXjDgDIvVW0QT6xO/+Frwy23ifrrTPeiPMWhXN+qzWfyuKfJNcKKFhGAfzxz
 B8g/9jaGmpXbMQrl2jamRgSL3eA+VjzckmQ1N2H2GbVAdKDP50wO3yFDE2GBPfWhO0Bc
 HA5u+CWXMUO8aKwIQNsHjvkS/nMfCkCErYCPChzY3iuykIVzH869wkQ9BTt0FHTbjMhL
 lUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XYB0+Zh72AFKnNJPJ3qEYeedDoTJ5raLhm8zVFcQZ70=;
 b=s0Qvl5fkrkD9BApA+uirR9SA7wLKkfSOKPyoGRyUY73ZboWIWqLgaApfWLZXkOVHr2
 jNRQeB8qTSRUvuFfvIk7Zvx44HnRmzPjpBHcajnyJ7XSPXy7pW7mrzN0cuYTxorf4jfp
 2nu1407nUbfmQeVB40TH2fs9275mH/nGDK72VgmYx6GawpCAtEDgoLKa+Mjxb0uzPzyn
 aWTtDMHZgH0lVOQQg2I4Pdn918AKJOx4oRuhUJWk5l4GjLqKmbo07cp5S/YDqeTrfCtE
 r60CP+mpESMSAKLvoBjkPu9Y0iPb3NCjNdcIGFCwy7qRoGKRy7IP6XdERco5T4sSEbhh
 DN3A==
X-Gm-Message-State: AOAM5303dlkIA+fuS515Tlx1ZGCRdxmPIw9bhGpk9/389CEUh0NAfHt9
 6T30U5+cRSbiuEHj/n/zgUph3zCygH3Lcw==
X-Google-Smtp-Source: ABdhPJw7ZUiuHS9YQjuZdxsm5r3SmYVZodpeiVuST9DE58e4I5l6SpLJ/CxH//yf9ZI340VX+X/ZWg==
X-Received: by 2002:a1c:4e07:: with SMTP id g7mr6874939wmh.29.1617264206196;
 Thu, 01 Apr 2021 01:03:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 91sm9133078wrl.20.2021.04.01.01.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:03:25 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] block: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210315180341.31638-1-j@getutm.app>
 <20210315180341.31638-3-j@getutm.app>
 <CA+E+eSAc7mvmxfrafgL4RYoSpj-M2T7WCXYXgFw3YOwxwWx+Rw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9181c138-d39e-7d28-d19a-8a46b118fb23@amsat.org>
Date: Thu, 1 Apr 2021 10:03:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAc7mvmxfrafgL4RYoSpj-M2T7WCXYXgFw3YOwxwWx+Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 7:08 AM, Joelle van Dyne wrote:
> On Mon, Mar 15, 2021 at 11:03 AM Joelle van Dyne <j@getutm.app> wrote:
>>
>> Some BSD platforms do not have this header.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Joelle van Dyne <j@getutm.app>
> 
> Please bear with me as I am still new to this, but what happens to the
> three patches that are reviewed if the last patch does not get
> reviewed? Do the reviewed patches still get to make it into 6.0? I am
> willing to drop the unreviewed patch if there are issues. Thanks.

I guess this is bad timing, as this time in year various maintainers
are on vacations. Cc'ing Paolo as he sometimes take generic/block
patches.

Regards,

Phil.

