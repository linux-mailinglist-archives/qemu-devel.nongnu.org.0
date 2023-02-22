Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5569EF31
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 08:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUjNG-0007Dv-O5; Wed, 22 Feb 2023 02:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUjN2-0007CT-EZ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:16:57 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUjN0-0003vU-TY
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:16:56 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso7792861pjb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 23:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rn815O29ZBEp2fDP1WMiwno7X1zOO2q5kkn2p9PsOtE=;
 b=Z1Y6dZRZ35YmEzl4L9sE2rGOq5tXXSGlU/wDyZt80RAfeLEBQMnAVoA9XdTlmkjUpW
 2dihFgqvRJpKqubCzunt1Vep85lSk4uqObusUKGt0dB8f45d81Qv20aImjHlkAbxPA8s
 uWLUkLZhAjY3/5v9MLuvp/AiFCrnD0L3TdfN2FpUvKgt9a6VEKBk7SHcvb/uXepLcy0b
 y0Zx/1jCCzpdJn9JvbzihlYcWDQ0WZzhZiC9lUOgg8whGx+D0F06hgC4nWXFnbfcBwg5
 ca4Nkue7Gy6EGnLXuf8+D6T2a1sTkvcYDQxqMkz47zZ8IYb/SeBo4ME9bFzKpgiCMN+h
 a+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rn815O29ZBEp2fDP1WMiwno7X1zOO2q5kkn2p9PsOtE=;
 b=IP4UuFS3PTaGw/wg4/4GaoSYztWYeE1sMGnCAXFKR5w9oNcpQ6QV4YJjTEK/hB/tn2
 m63woM/u3BV4d8V+Ex3AvOJnypNUdRmkF80+Z9wa13VYNYsEmmzP1NZHXvYNyctXjAI3
 AHYv4zONAellW9zTni95mFDBqIyfC23/pgPig7jYShBQRvpFS+9PhTh0eU7zAJ/HNjun
 jMpsT2lMxy4RIi4jg8lr/x7VCQqmpF/7RJm8ESaZwRWBq2DmvjagQsCuCBS4cYhY9YYB
 7TeesIq/X2Rb06HovfMm7ou/bfUUeWpkSgfBTylgcMOGFFnMJLdKdtnbCgWRcNZ8C2bM
 D8ng==
X-Gm-Message-State: AO0yUKUdzHrMyl0I4mmILZwA3V7yYcm9XBjFmhHO5Jrcap5mwU54sQYK
 z1jfdQjw+jL73zwwuNEQoaEHaA==
X-Google-Smtp-Source: AK7set+vO3Q5bVeRg3arn4TH1/DU0BWdn+rZuke8HelX+ZVwHf2or0bE+8qN9/dU1V9wvhgzCmltPQ==
X-Received: by 2002:a05:6a20:a5a8:b0:af:7233:5bfc with SMTP id
 bc40-20020a056a20a5a800b000af72335bfcmr6502984pzb.8.1677050213211; 
 Tue, 21 Feb 2023 23:16:53 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 v8-20020a63bf08000000b004fbb6200482sm2276602pgf.41.2023.02.21.23.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 23:16:52 -0800 (PST)
Message-ID: <d0346b90-4a90-981b-9757-4bbf9a3343ff@linaro.org>
Date: Tue, 21 Feb 2023 21:16:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 10/24] gdbstub: move chunks of user code into own files
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-11-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/21/23 12:52, Alex Bennée wrote:
> +# and BSD?
> +specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))

Certainly and bsd.  It had been compiled before you moved it.


r~

