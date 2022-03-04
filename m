Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F034CDFB7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:24:43 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFPm-0006A9-0R
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nQFM3-0000cb-7i
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:20:51 -0500
Received: from [2a00:1450:4864:20::536] (port=33684
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nQFM1-00054f-Nl
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:20:50 -0500
Received: by mail-ed1-x536.google.com with SMTP id m21so6831524edc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 13:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j/mDM1TNWtysRK1VP7HIF5c+UM10HkhCbRiKGfJNb1k=;
 b=IJQVbW8+KNVB83v4mQItspWc2Qmt3Zi6Lxb3Y3uu+AEeV+dV5zwm1Q+3FikV09q8r6
 NI9ZQuKFqo+rZw+Z/ilc+aBEA8HytAgggbMv2MDp3nFEzBukXSmmH00jgdtHGLCJZbr2
 r4UhFwBkTP6E2IYeCBHWmcEkqrgwcSLMNP+C8r4IXLl014Ck1jJF8vU4odOS6B3M1off
 lOXUJJMGybgP77S/lYxDNJx8c24Z8GPNZ+bL07HURBgxE4KYlPhGqu9kqLOlVOIW+Ya2
 aZScEz+Qj5/MA+FKNyDUTHEk8FTAF6CiC3nvzN4HI1GkyrL6Wk/ZdegH1kIyjs8w0r7E
 yXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j/mDM1TNWtysRK1VP7HIF5c+UM10HkhCbRiKGfJNb1k=;
 b=tRod6NUjZd1ookzNCaYaGo6IDy8rOPPDgFXZd98SChTkbURO3HnSu0kuBMk5O0fqPd
 ifqeDYQf+HRUbavHOCd6dw7WqJBi13AQ6mXTIp1xTIldrQlWFMTbQzGfxyP9o4/Uw0kF
 7Hm9BCPXr5tpT5jemgcZCR7rqZmV2HG62yMgVD65qNsfesbvej6FigVLiRrO1f60Cku3
 /p58KwhzO/b1JUwmcumS6djAJUcGDGdzBZ6dupbLSpkX5TIm00yha5+5GU5GM7s+EHvx
 x6Ytdwj0XKZL58sB1op7ChKmVfaNeddP+sBuLhML0wrKmx2w0eFGmOyKK5e7qlkL8Yjq
 UVAg==
X-Gm-Message-State: AOAM5327c0xMXgkiyJOj67ev7uH6AyNrha7cEWZ/bv26Iu8trgckjrNW
 QUO0ydf0buVhiIOs2DseEaE=
X-Google-Smtp-Source: ABdhPJx3HIcv5uZTYdwjLOCjSMAjLEG7FMuW+HV44fSqXg0dziFwY0SfnjikhE8G0LlBS5+F9460/Q==
X-Received: by 2002:a50:d504:0:b0:413:7efe:7d4c with SMTP id
 u4-20020a50d504000000b004137efe7d4cmr446986edi.316.1646428848261; 
 Fri, 04 Mar 2022 13:20:48 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 a21-20020a1709062b1500b006da814b08c6sm2113741ejg.94.2022.03.04.13.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 13:20:47 -0800 (PST)
Message-ID: <6b203804-1749-21c0-ac31-1175ddfcd9bf@redhat.com>
Date: Fri, 4 Mar 2022 22:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220302181134.285107-1-pbonzini@redhat.com>
 <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
 <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
 <CAFEAcA--dtmffH4FJUuuE1d6yR-4Mweu481p_y-EsJKEtPRjTw@mail.gmail.com>
 <YiJlSlJube4dOk/m@redhat.com>
 <CAFEAcA9z7bMdRmi8LRuywf8rArAubSk24imPoUgXhz1=roSZWg@mail.gmail.com>
 <YiJo2hX3aICBKmZv@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YiJo2hX3aICBKmZv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 20:30, Daniel P. Berrangé wrote:
> Interesting. I wonder whether that detection is specifically related
> to the fuzzing, or whether it is something we would have seen merely
> by building with 'asan' and running 'make check' as normal.
> 
> IIUC, the oss-fuzz job we run in GitLab CI is mostly just a sanity
> check and the real fuzzing work takes place in Google's fuzz service.

If the intermittent leak is indeed a leak, it's not related to fuzzing 
and it would be found with with asan.

OTOH, if the intermittent leak is not a leak, it probably would be flaky 
even with just asan.

Paolo

