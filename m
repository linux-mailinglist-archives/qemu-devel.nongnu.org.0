Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFAF6F855B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:15:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pux8T-0001Tf-Mj; Fri, 05 May 2023 11:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pux8R-0001T8-PT
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:14:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pux8P-0000I9-Ne
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:14:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso12849065e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683299651; x=1685891651;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N3NPH94Yx/QPAffV0bad+mAebajq5nDGGYextPZCJzI=;
 b=PFxgc7wS3mou3oxYaYSGVDmBfkufWROuoQNrXG+QvM2cXI7j/whlwVbYqtLYavSBIp
 6DnC0aLKBBu8/wIcU2I09EFBiz5/wnFWjyJLK7CiT3TYulwRAJuP26BoqKozYl0+k6JH
 ZLHLWNjMLuOzvxVhnHoN3DajX5mndn4nhJyULRKkESUfP8Qo/+57APb+flrC3H/C34t9
 BPtMOQHRROaaJ9qqj04aYjzBNjgLF5uhBeG+2UjZl6XU4JAezWRduqmrCmwqt/5yebVJ
 a9H+alvwgBu2iYP61f3onYbrkrXqDc+XwMnaDC/icxcuU00qt/HcJicJAbNpoXK3wkPN
 ypmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683299651; x=1685891651;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N3NPH94Yx/QPAffV0bad+mAebajq5nDGGYextPZCJzI=;
 b=TMaUVGVX1Bnol+1jOjFtwVOYTHxEnNP4C129vMUBTgE+R87NiZHMvYSANyeA0msEVF
 fRNw5K9GyU8Nt4l0Nyi6P5cpsJAhjkYBqR3nC/QujbfWz9pACFhIgZHIe/IUmmrnO/Yd
 MhWMfDVyDAsJyMvF+EWd91hBAD1fGobDtzmh3E3/kmoGQLHfJIqheaOCv4XtMtkSOqJl
 A+CNb91DYq9PJmQ37RiUkEKcb5Kgdz0fM/zFj72DMFyirvRq/q4CuYnTRXiu5ulZxhRG
 MPXKRVdbUxxwiidzZuyOlkxNiU5MuCjoj6X6RAKk7nhZF31cLxZMYp8FEsv1ihT2rbje
 scsw==
X-Gm-Message-State: AC+VfDwkLzvDx5Xz1UfbtoRp1BKwq2EPriWANBCQ8uj3Uw1MMH4wVLl0
 v1GCNRrKxjRmnfcnSuGU4XizuQ==
X-Google-Smtp-Source: ACHHUZ4YGH1z0rJ5fkXsOhmOw4x5Iw8YJXBi/jPB3DyHWHSgwqO3EAsGAhjgUrFM17WwJIoXcnTBkw==
X-Received: by 2002:a1c:721a:0:b0:3f1:7277:eaa with SMTP id
 n26-20020a1c721a000000b003f172770eaamr1381890wmc.31.1683299650978; 
 Fri, 05 May 2023 08:14:10 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm2645318wrn.93.2023.05.05.08.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 08:14:10 -0700 (PDT)
Message-ID: <c46fdc5b-8145-c87f-5976-d5c7dae79695@linaro.org>
Date: Fri, 5 May 2023 16:14:08 +0100
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
 <2c70f6a6-9e13-3412-8e65-43675fda4d95@linaro.org> <87sfcc16ot.fsf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87sfcc16ot.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/4/23 16:01, Cornelia Huck wrote:
> I'm wondering whether we should block migration with MTE enabled in
> general... OTOH, people probably don't commonly try to migrate with tcg,
> unless they are testing something?

Yes, savevm/loadvm is an extremely useful tcg debugging tool.


r~

