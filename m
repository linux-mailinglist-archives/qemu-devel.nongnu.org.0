Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562616F4220
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:59:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnin-00017D-Uz; Tue, 02 May 2023 06:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnil-00016q-8J
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:58:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnij-0001wk-D2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:58:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so22800115e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683025128; x=1685617128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oQOiTj4AsjumRpvb+Q6fw6xwgPGolMz8lN1nlISv9jY=;
 b=XgQgRN6/fG9lEr6dkPvTDU/asHfQYhnqV8zSeoej+OSUOdu/HjQUyyYYqnZNF0XKFX
 H/x158pwVU8YWFzwsnwT/WQtWETGNl6cUvLm2eGwJHdQVQrSKoilncMfYOfFfHjKtP40
 wJsY/7gwhYA8ZgzhvaxwnyaCPQk2Lwj4bTJpb4HzpIe5tpJZOHpKexM8pytQqLbM3I5d
 AkvcqUctT5yse8+pqBYlzg1k4JUOvpzHGJVBOenPbPD0tn4n9fcij+a4DyMIonGQobNm
 7Pz3q96KmwUcPwBRe1xKtMX75Oz19hl6BRnTnGn5kdQok/g3PGy6vdZcXmNHuhTFrU8d
 YuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683025128; x=1685617128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oQOiTj4AsjumRpvb+Q6fw6xwgPGolMz8lN1nlISv9jY=;
 b=hkfn5DuveQmAmXL0lZVkVDm0lyolPvveQEOgyVqYKhETMe880JPHfEijJzC+iVgnDs
 C8edAal4LZPk4KVVbzJJ3elbfjqTTLb04z6v2xKCMwaD9aDA1mOox75g8PwSfc03HjcZ
 cK3iBDGaJb64aaI3fTMln4EJTegUllD6Wr93iC+4T9nmQQsXJDqNhHF6D8mUwyUUlwVt
 X8V0XA4cCsV6vBTxwumkchn92qk7ND17RN2e6CAM/q3wJmRMeqmHBjY8WjXW3t8Xr7Eo
 3uP9Yhegv2N5dU0it7aYDhCUbph6BDfQJR/pjpSodqnTQGiQn2d3ELiQKbBDbZMx5pZr
 EOaA==
X-Gm-Message-State: AC+VfDzrP1sw9uzjYpPqY+H6Woxvoh17+wovSSX1cFOF/phNrfS4IGM5
 lsaVgJ6VuOOl7IqHbV/Xeru+8g==
X-Google-Smtp-Source: ACHHUZ5OiceVNSrZNvgeyEaXoQ0+yhHlMAD2dijJzQCyVae4ROuTp18GBAB/W2IWzMNHip47MIlWbg==
X-Received: by 2002:a1c:4b12:0:b0:3f0:b1c9:25d4 with SMTP id
 y18-20020a1c4b12000000b003f0b1c925d4mr11392673wma.21.1683025128203; 
 Tue, 02 May 2023 03:58:48 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 iv18-20020a05600c549200b003f17b91c3adsm39218710wmb.28.2023.05.02.03.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 03:58:47 -0700 (PDT)
Message-ID: <2c70f6a6-9e13-3412-8e65-43675fda4d95@linaro.org>
Date: Tue, 2 May 2023 11:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>,
 Gavin Shan <gshan@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Andrea Bolognani <abologna@redhat.com>
References: <20230428095533.21747-1-cohuck@redhat.com>
 <20230428095533.21747-2-cohuck@redhat.com> <87sfcj99rn.fsf@secure.mitica>
 <64915da6-4276-1603-1454-9350a44561d8@linaro.org> <871qjzcdgi.fsf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <871qjzcdgi.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 10:03, Cornelia Huck wrote:
> Has anyone been able to access a real system with MTE? (All the systems
> where I had hoped that MTE would be available didn't have MTE in the end
> so far, so I'd be interested to hear if anybody else already got to play
> with one.) Honestly, I don't want to even try to test migration if I only
> have access to MTE on the FVP...

Well there's always MTE on QEMU with TCG.  :-)

But I agree that while it's better than FVP, it's still slow, and difficult to test 
anything at scale.  I have no objection to getting non-migratable MTE on KVM in before 
attempting to solve migration.


r~


