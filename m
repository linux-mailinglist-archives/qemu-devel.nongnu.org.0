Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B152B7D2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:45:21 +0200 (CEST)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHBA-0001IT-4F
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrH4R-0005vz-He; Wed, 18 May 2022 06:38:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrH4P-00023H-W9; Wed, 18 May 2022 06:38:23 -0400
Received: by mail-ej1-x634.google.com with SMTP id ch13so2881215ejb.12;
 Wed, 18 May 2022 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EgUIRBA3snSBiO15RxZVBJU4rLx4NVECk1IqvMmZQww=;
 b=RD3AdYHTJiX6sK+RyLQN+BM6nuONol86Mq72Ui16q+KzlxNkHm8/Qs8OLUUMusLcjF
 3psEbCUEXiE5pGBPH12+vHVn71StTbr9hoUBDRo79/FOJ/FSjHPSShMRgzYoIPzf0Wh6
 c/yYd1nkJgzHSQ2XxLO5/KcFj9wa76leAYdX1Q+yyzqFo4R/C8IgobdsR2BjPW39JcM1
 2EKzPjZMawC/DdHLNnnxKAV2pO8zrYAusuxEpzYm2aFH3bw8tMgfw1mJNmt+5IGP2mqn
 uPui0CHu8HPHm9bpn2evm5QvI+FY8epHXm6o7s1pDR+eVyj8RI6oum1QVZLxZQDaa+P3
 upJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EgUIRBA3snSBiO15RxZVBJU4rLx4NVECk1IqvMmZQww=;
 b=Utl0WMemBuyMbyQhXSxSi8sTND0VkEImguRgRJmRvSFS3eyeHMywv3Npk7BZnxftaA
 X6jzoQwHVFE0ADbSo53uAZOHIRnO87XIu3gg/4AqsOqxJoiWs1/sv6FmTb/1UhsxDV9A
 G74+o9gLoSTSeYhHVs3AsN3SKhS0cBW1BWt/z6CdnJPLGZ68z4sjaE5gjsBND/DN4Wg8
 3z6iPejW7OBWV4aIX2meO6NiIGTdW5SW5t+4Dhos76dqwm0pGv39VCsDEq9xOmcIEWYQ
 mKYazmV22vDxeKkQ+uJgfXA5X+yRUdQOA30jvDc7lK5Fq4Bkptxn9KX97UYAoAfZ74aM
 FWHg==
X-Gm-Message-State: AOAM531FOneQvtmXTz/n4XtONC6pukecqcBriEcaO0gkrv9z0DEvrn5h
 WM4q9snH7fa7AlC1iC4Bf3Q=
X-Google-Smtp-Source: ABdhPJzCNDOiBOF3mmWSYknUxwx+OX+ugBdItIkumYLGKlqDU4i3gjdMdwKFFRTyzUXSDu4uiyC4Ng==
X-Received: by 2002:a17:907:3e04:b0:6f5:1132:59de with SMTP id
 hp4-20020a1709073e0400b006f5113259demr24869454ejc.755.1652870299860; 
 Wed, 18 May 2022 03:38:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 yl15-20020a17090693ef00b006f3ef214e69sm784321ejb.207.2022.05.18.03.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 03:38:19 -0700 (PDT)
Message-ID: <528dd5d2-f454-2ada-6b06-ed5b511060bb@redhat.com>
Date: Wed, 18 May 2022 12:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-10-jsnow@redhat.com>
 <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
 <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
 <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
 <CAFn=p-bqbcXBLLmT3Fqu1b7Y0Hu=M6B5oKT7J9idXn=tmrt4UA@mail.gmail.com>
 <15a9d6cb-e7c6-98f0-4b6f-766600b36274@redhat.com>
 <CAFn=p-bNo3-6zunCSb1dCKjjGR0JJX65BEbWS_WmbcrANe3PSw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-bNo3-6zunCSb1dCKjjGR0JJX65BEbWS_WmbcrANe3PSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/22 01:51, John Snow wrote:
>>> pkg install python3 on fbsd 13.0-R gives you /usr/bin/python3 fwiw. do
>>> you know in what circumstances you get only a point release binary?
>> Aha, tests/vm/freebsd installs python37, not python3.  But I guess it's
>> still a plausible configuration for this packaging setup.
>>
> Just confirming here that if you do 'pkg install python37' and you
> have no 'python3' link, the venv package will still make 'python' and
> 'python3' links. I think it's likely best to use the 'python3' one.

Ok, another good reason to always go through a venv.

Paolo


