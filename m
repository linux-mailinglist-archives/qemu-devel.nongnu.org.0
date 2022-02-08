Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E680F4ADC9A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:27:39 +0100 (CET)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSP4-0003gY-W5
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHPkV-00082b-Re; Tue, 08 Feb 2022 07:37:36 -0500
Received: from [2a00:1450:4864:20::52b] (port=47001
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHPkT-0003zm-KV; Tue, 08 Feb 2022 07:37:35 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m11so37150948edi.13;
 Tue, 08 Feb 2022 04:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6q6fR5qJfFYuPVOhc5PCa3USFSsSu8eu2m+cx4lXQ8U=;
 b=D82Z3NAtUQLvCfEz4pQ2bWxh/TpIJ5WDaumF4fRB98QXmX+lzqZmX0b+K2l4Oq2D2p
 hUJIsMZXwU50AtsGPtoSKSA1BXACBHIr9+Y8FJeIvy9AbRZ9NBmuX8O3queFCM15WZMl
 Tja/ypfr5ssPyjb68dLxPLNz6EalhDk6VhpYKnPFDVbtpEseWJUfY9sZCmFnUmAoshHl
 gz6K3cDpO/hXZKUUgfAG3x4J0kesyhI/mlbls/40dxUTZcdpy2Nw21vHTzvO9WsQ+cl7
 7OZ+N/o8aSccpBircQccS7Do3NOrh1opX4tbuXrc403P8atUBG1H9kRaHM1rAHTs6CQl
 KmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6q6fR5qJfFYuPVOhc5PCa3USFSsSu8eu2m+cx4lXQ8U=;
 b=CAgXPBHBKaYeLX5HpxqDH8dZ8LsM39Al5KFjepFdSnQqxX+sAw0D0efM+JPFtQjqOh
 Tnx9Ue5nfHhleTn4thduKCHdmQa4I+QeHqk7HzRjEkx4wlNcfgwEqKxNycEp6Wp2sbVi
 GRorOGqAJt3sg+6fSudYkjSnTdIa+pGNYioOgvvanvhH3F0q4lTPsdT6fvdTy9ZB2g2f
 VL22zTUukexBB9p9ej/jlBPVxpLtqKy92iCgcsiw0WCjtT1DfNEtBJKEAnCTFHr8vYQi
 HXQYAWQHq+F4qUp0/hW6mwUDMg7kCDnERupxghroxbPY8NkOM44SK9TY/8bND2ZJ18lV
 jnWA==
X-Gm-Message-State: AOAM5330z9Rb0j+8L5ZgUggNnx7V/etw8sdBfzzZ98roLqF7wPIatuc4
 /E4kdCLf0NDPKHBJN6av3tegHzV3/so=
X-Google-Smtp-Source: ABdhPJxiZ5KtTqtOCgyEMrCWB5oqyltD92+HquCfJtIUYfLq0opu1VBItUu5FKTqLsywROf+3n/L1g==
X-Received: by 2002:a05:6402:4248:: with SMTP id
 g8mr4402767edb.158.1644323851813; 
 Tue, 08 Feb 2022 04:37:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id h15sm780690ejz.134.2022.02.08.04.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:37:31 -0800 (PST)
Message-ID: <e7ff3575-d646-e938-16b3-85a405f44bcf@redhat.com>
Date: Tue, 8 Feb 2022 13:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] tests: Do not treat the iotests as separate meson
 test target anymore
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-6-thuth@redhat.com>
 <CAFEAcA_xMXYyMvaC8B=x1N7wX-=8y1XMTJouJvetqFYX87z1dQ@mail.gmail.com>
 <63b891db-ce52-6c57-5c24-723be29df770@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <63b891db-ce52-6c57-5c24-723be29df770@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 12:16, Thomas Huth wrote:
>>
>> This code being deleted claims to be doing something to ensure that
>> the tests get run and output the useful messages on failure.
> 
> No, AFAIK that --verbose switch just influences how meson prints the 
> progress during the test runs (i.e. either a brief or a slightly more 
> verbose output).

I replied to another patch, but anyway here is Peter's report: 
https://patchew.org/QEMU/20220128101513.646792-1-pbonzini@redhat.com/#CAFEAcA_ttmvA0emS-41R5+k3w_KAbFvC30qdAShJfr7U+3q=CA@mail.gmail.com 
(I had not seen it until now).

Paolo

