Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843B3A07C2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:26:55 +0200 (CEST)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lql7W-0002Z3-Kj
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lql6W-0001Af-1L
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:25:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lql6T-0006pz-KP
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:25:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso265811pjp.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+nCu5tlxQuBz89Y0O00faTfcix9cEU0xotV6vh/KRgs=;
 b=BfoSVhcabrMh7iGwJYe+yO5Gp3ViBtyuYaAJx12E0NjgFnNptHNDfkCRg3YEkbNulr
 fNo904mpbOAL2YpQUbL8MBxhDOEfCksAkaDtdnBGfOefl2+hi6tnbso/mwYROHoNNgz4
 S/RLgwGlp4KL+Lb4TveedkrigAG3QmNsxvz5yuA6OQqye44I5ZobTlTO3QwjguVQ3nCG
 1OimtfZgjMen/9pwIgjTk2F8VSmaviWAfjAVeQSr9Cdz14CVjDmlRVk1Am4ZRTFJWURM
 6ni6NRQAtvkvb1/TYgMB/YZdNrp6oQTr7JJgdxfc3ofkDj9vDubDgNSXOvJ5FfEa9l57
 dwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+nCu5tlxQuBz89Y0O00faTfcix9cEU0xotV6vh/KRgs=;
 b=aM5gsGEsobrfYJmNFgjg10BXBGocp3fce8AIpaC2v24JET4xM6zJQ0evZl8MJyJDZe
 hauITx1SaWQo3lXzRBruZqZcImSCkxwrDNP+wxR4ETqRrg6mQu4EBkfPGMn5D/73t935
 nTGlwaBtqbXPQMwYvnH6hv/oLtykWin49hw1kYnuEn5TXzrCuPthjJiBZkAo/SviC7kZ
 JSrUjdkZGJLhOnV3S/y+v6UMsAExfbD2qJOf8MgIZO9ntF/7BdJyVyJTQLuQnjbjLnCP
 4LgkE7Ir5llCNIJn0hma04pnZKQ/o6XXQVEVCCB2M+6R4VIw5I3uAJU1/disPXrlkWB1
 LGvQ==
X-Gm-Message-State: AOAM533bawvlrYG4QiaUTsUti70WcssTI/52+8IKhs0Khl7VEwOMnpkX
 T7+49RvBjXCdjdAT8AhXTtTIwVfORMrfdQ==
X-Google-Smtp-Source: ABdhPJwvQNofOBdavI197sj5d73YC+szj4EGQE+2glGWa+FRcfPna5M/iWDN1n6eGKZI94C8ci6tjQ==
X-Received: by 2002:a17:90b:1908:: with SMTP id
 mp8mr2916153pjb.106.1623194748183; 
 Tue, 08 Jun 2021 16:25:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k63sm3247839pjh.13.2021.06.08.16.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:25:47 -0700 (PDT)
Subject: Re: [PATCH 22/55] target/arm: Implement MVE VADD, VSUB, VMUL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4418f9f3-f837-8c63-804f-07c72e84c320@linaro.org>
Date: Tue, 8 Jun 2021 16:25:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_2OP(INSN, FN) \
> +    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
> +    {                                                           \
> +        MVEGenTwoOpFn *fns[] = {                                \

static const, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

