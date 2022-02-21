Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A24BD976
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:37:09 +0100 (CET)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM708-00056r-I6
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM6uM-0000g0-I6
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:31:10 -0500
Received: from [2a00:1450:4864:20::630] (port=39745
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM6uG-0003sJ-Nh
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:31:08 -0500
Received: by mail-ej1-x630.google.com with SMTP id p9so32457198ejd.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7p879WtIiK4ggTgfFAsqu+pe/+3MYgMM2CK/mhcmWNQ=;
 b=dmW/h5ofXiifrDHhST9Pc8LB6G7z+dAON00BaTenqhk9REbofxSwsn3ivvgpB7Fuwm
 MY/XBFi8kWEQTApkTnW4LrNvIXnsaWWVf6k393YUBWT/r/t8ZtKhhh3WJ1hNpaHtZ/Ih
 ScChzLriGwAXbHcLN5AESGh3BSBHFiiwsHblaBRX+3CJOzcyTcG8a5a+tLFIz0prSUHN
 8IZnfA2THneiJ/5FNjSne5YhXS5EkohmeTU5EM3p90EnF1DdUD6QWl3WTIfAKWPA778X
 QcpW154Zyo1KqCC+FNNH1+JDMdNePLRfaR+PUZaQ/zFS1kXC46JN/CHHAiPoG0lGxJxA
 BjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7p879WtIiK4ggTgfFAsqu+pe/+3MYgMM2CK/mhcmWNQ=;
 b=CY2Ujb9fLT2x7RHSko53Vwi3Iy6v7ab7syVCeXHQUpy0g0katIVxzk3wT0qQnpUU/Y
 KN5u4aVbFHaeskE/69/WVgXS9RdckNQG47XEDZteVGIGmEFtYoQBstzxxneAxa468CRC
 /OgJCTVLypS0+bRxnxu65OR09TkX2fxqzL9aApLhIH9848+vYcu8x7rWlMryxaQscZbG
 Z7WimclWSE/T/0m6y+psrmwlab6ajXXx8oW3Qip8K2u4/TUvsk9AmfKPBm2YBp7ceJwC
 Ullgu9JVaHZ129S9BofpdFDUjctm6C5r8vxu6cBx9crsmTZKrLmzm8Yw47EplhVO9iPV
 MMeQ==
X-Gm-Message-State: AOAM531IDiwDmDNm2ETcMaUbXQXvYgQd9D1DaRQmyeQGSPQwwHFpKlSq
 SSAPzoAm9CJfxmEPunWQVZxm7sasPew=
X-Google-Smtp-Source: ABdhPJwp9QyS6tWBx9HapxYAaqge504gx6TjKwYYm1Ek5w4+cEx9Duc1uyYFxU9tygSaThuP64I6ZQ==
X-Received: by 2002:a17:906:278f:b0:6d0:432:2bbb with SMTP id
 j15-20020a170906278f00b006d004322bbbmr15502356ejc.160.1645443063495; 
 Mon, 21 Feb 2022 03:31:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m17sm5053264ejq.22.2022.02.21.03.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 03:31:03 -0800 (PST)
Message-ID: <038604a0-13cd-58da-d39d-84ed8c68a6a2@redhat.com>
Date: Mon, 21 Feb 2022 12:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 0/2] qemu-sem-posix: use monotonic clock instead
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, berrange@redhat.com,
 mst@redhat.com
References: <20220221095617.1974-1-longpeng2@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220221095617.1974-1-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 10:56, Longpeng(Mike) via wrote:
> The qemu_sem_timedwait() uses system time as default, it would be affected by
> changes to the system time. In the real scenario, the time that goes faster or
> slower is a common case and the NTP service could help us to sync time
> periodically.
> 
> This patchset uses monotonic clock instead of the realtime clock, this could
> make sure we would not be affected by the system time anymore.

This looks good, I don't think there are cases where a more optimized 
semaphore is necessary (if there were, we could introduce a futex 
fallback on Linux).

However, pthread_condattr_t need not be in the struct.  The attributes 
can be allocated on the stack, because they do not have to remain alive 
after pthread_cond_init.

Thanks,

Paolo

> Longpeng (Mike) (2):
>    sem-posix: remove the posix semaphore support
>    sem-posix: use monotonic clock instead
> 
>   include/qemu/thread-posix.h |  5 +--
>   meson.build                 | 12 ++++++-
>   util/qemu-thread-posix.c    | 82 +++++++++++++++------------------------------
>   3 files changed, 39 insertions(+), 60 deletions(-)
> 


