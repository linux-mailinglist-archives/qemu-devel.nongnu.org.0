Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C12BC771
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 18:18:06 +0100 (CET)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgt01-0004vO-IU
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 12:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgsyu-0004UG-DZ
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:16:56 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgsyt-00083p-0w
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:16:56 -0500
Received: by mail-wr1-x441.google.com with SMTP id g14so969907wrm.13
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 09:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jTECvdHzmyTMPZ3S14ZMLt+/ABMqtzgVKf/KvdaiU7c=;
 b=pzAbdcQqzndvlwB/92mlpp1hdbf9bVwhzNwivCQFDkydAarKhHCRLET0byhS3lIC6j
 dzqIJXzyalRI3v3DD1cJwZSsTG5v1WefUvPPl+vutxBZGs28v6VVwxa2b+d0WC6quMHi
 xrOoc4MQVUiifjY7RSOFZQxsYOZSrPREjPxt9I5UoPkmtBGPlck0X2+NgCbmGgWo4aAE
 njtzBpoFY4URKQFhxxcxDgD95DG0KokszqAyII3jD7T34HAhYwdYSO7xypDtMGI9uG95
 NdrBr+LkM3Ond5I4J/qxdMvxQh7U9i6yD28vjD8D/VKTqpaLjGVtK0i94AZZu/CMF4oH
 C49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jTECvdHzmyTMPZ3S14ZMLt+/ABMqtzgVKf/KvdaiU7c=;
 b=D/CKlF1+lLsNiU2zyNj8Z87+JaGtPX2Ik7x0yJBY9cqYLG0bqQ1A/XurTBVCy9mw1U
 KuH+9NxW7O5IyPuOv+oimWYyvyCR29ZFiYqFtUi0W0lnb/B75c8T0QRxU4GCFe3TjFSS
 Kmfp9tqsNgTka+vEVs2LQRk72pFYDarkVieTNn0f63FPAEY99kbFcK1f9i54W5z33ztk
 8pGr5yyiWM1hTi/htQExehUluZr+eUFW3w6XYyohEA1deQNbYq5bNXPJePoEB0Q+Zcrv
 f5Kj7T1fThVhpcxyPLtIgTYD7Y9dY3Quilh28FbAZ8b+9rLu0hyaLoyvxepD+MXghWDq
 Hzlw==
X-Gm-Message-State: AOAM5338GobE1i0ABU+miJEdqeLJLzI5+5QaWRyi3jC6LuTQqPw+nxCW
 91TxUqTMvRcsFIOaiXTJBBw=
X-Google-Smtp-Source: ABdhPJzx08lcSidkiBuMOVDTShzoeXGWZ2RRkBlf0jFu+chZ7BYnVVI3DqQUPizfa4R4686SQn5kXw==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr26308663wrm.3.1606065412814;
 Sun, 22 Nov 2020 09:16:52 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e3sm14231899wro.90.2020.11.22.09.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 09:16:52 -0800 (PST)
Subject: Re: [PATCH 02/26] target/mips: Extract MSA helpers to
 mod-mips-msa_helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-3-f4bug@amsat.org>
 <7053b4b2-b51c-ab6a-91ba-d019843112d1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b29b0db6-4b61-a1ee-8110-0812d027a210@amsat.org>
Date: Sun, 22 Nov 2020 18:16:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7053b4b2-b51c-ab6a-91ba-d019843112d1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 8:44 PM, Richard Henderson wrote:
> On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
>> MSA means 'MIPS SIMD Architecture' and is defined as a Module by MIPS.
>> Rename msa_helper.c as mod-mips-msa_helper.c, merge other MSA helpers
>> from op_helper.c.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  .../{msa_helper.c => mod-mips-msa_helper.c}   | 392 +++++++++++++++++
>>  target/mips/op_helper.c                       | 393 ------------------
>>  target/mips/meson.build                       |   3 +-
>>  3 files changed, 394 insertions(+), 394 deletions(-)
>>  rename target/mips/{msa_helper.c => mod-mips-msa_helper.c} (94%)
> 
> Do we really need "mips" in the filename, given that it's implied by the directory?

Indeed we don't need it :)

> 
> Maybe perform the rename and the op_helper.c move in different patches?

Sure, will do.

Regards,

Phil.

