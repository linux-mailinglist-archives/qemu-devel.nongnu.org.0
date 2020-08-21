Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6624D745
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 16:23:43 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k97xG-00021P-G5
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 10:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k97uv-0007rc-9T; Fri, 21 Aug 2020 10:21:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k97ut-0006Kl-JY; Fri, 21 Aug 2020 10:21:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id p14so2076064wmg.1;
 Fri, 21 Aug 2020 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dvSiyK6fygr4LDAlrXrJ4RgLgWus7AtcNBXJOEXjUhg=;
 b=H1etFk6/RQZ699ENzRTl8qcqrMSlU2qgNCyVz0D44y0nPthzA0g6e1Uh7Y+oFXNq2X
 rivkVDkOXhD0cfGSKgAo/BzKaDmAHXryRf/2kML8OWlzShmZtrrgCOQ5Mb7q4WjTwDP3
 9k18JHBGVh43Z++RSLC9v8cu9/Q8B8qgS9Mmu6c6jzIb8URU7YX0gPKOeCfBl38EKIjs
 c1eCxb9laC+m5jwqREuIhUqtOw0zp+/m4cXvSspCBvcz8oXPjAt6nmQM2paeltxisK43
 y0qVf7Wv/XoxHo9pkTIs2MRDmzUjvzs/o9C2PgrGgplLUA6B5gITNx4rmX5mZRLnHyW5
 4fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dvSiyK6fygr4LDAlrXrJ4RgLgWus7AtcNBXJOEXjUhg=;
 b=f6uHKqRaqTGTV+bfU1E0L4CrfQ9M8wtCpVkYuWO2YLxK82PFPSGLxR3dyh0Ftwuo6c
 YeE5su2DlF5FSSrPN58y++5USl5hFxjOruqhVC8rkVuclzfW8rAYFDAFOpDyPS9YmQJH
 oZP7G7T6p0HhIm6g+cPAFdUHSDJJFSpL+DT8iU5/ovRJYaWPy/cNzV1kAw0nvLR2GMUw
 PhjL0EBdGSUxVU2P9uNyqwBGHwXYnPl8o1O+Trgfo0w41cUuyYgNAw4pWrgn5DnbhyzM
 +uHmQ9yV9FNkxafn+arERxccX+BVPI7+Hu8j9/ngupm6oQFQfC+c05swmQpcRfybFB2F
 ++qg==
X-Gm-Message-State: AOAM530/GD+JI7qRZpoKdUxPdzDu86hU+lt0bWLuNkYfIHeZS+3/QbCe
 jcmETR/nX2/EUYYlOmytjGYU6FJdCm8=
X-Google-Smtp-Source: ABdhPJyiVTsK0GqG/3aRvKA1vQTRrFiLnQS4dHg0OvMJiAuCnpjV9YE3xOxyEYt0W/aUgp2WvSm8Lw==
X-Received: by 2002:a7b:c219:: with SMTP id x25mr4062124wmi.101.1598019673557; 
 Fri, 21 Aug 2020 07:21:13 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id g7sm4762391wrv.82.2020.08.21.07.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 07:21:12 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] hw/sd: Add Cadence SDHCI emulation
To: Bin Meng <bmeng.cn@gmail.com>
References: <1597658633-12802-1-git-send-email-bin.meng@windriver.com>
 <d57faf7d-3cfa-55ac-649b-59ca06dd11a8@amsat.org>
 <CAEUhbmW02-fc=+ccWSn5bXGN+d7cCZNg1m2Z7wx3smN_YubWiw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <81ae05ed-a91f-9303-91fe-d6d5d29b3174@amsat.org>
Date: Fri, 21 Aug 2020 16:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW02-fc=+ccWSn5bXGN+d7cCZNg1m2Z7wx3smN_YubWiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On 8/21/20 2:54 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Fri, Aug 21, 2020 at 2:04 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Sai Pavan, you said you were interested to test the first 2
>> patches. FYI I plan to queue them and send the pull request tomorrow
>> or Saturday the latest.
> 
> Have you got a chance to review the v2 of 3rd patch?
> 
> "hw/sd: Add Cadence SDHCI emulation"

I'll have a look at it, but it makes sense to merge it via the
tree using it (so the RISCV tree).

Meanwhile I'm queueing patches 1 and 2 to my sd-next tree,
adding the Tested-by from Sai Pavan from:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg732027.html

Thanks,

Phil.

> 
> Regards,
> Bin
> 

