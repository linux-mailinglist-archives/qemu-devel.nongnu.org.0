Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0126364F559
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:54:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KVq-0003Fm-2i; Fri, 16 Dec 2022 18:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KVn-0003FT-9y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:53:07 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KVh-0003Id-DN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:53:02 -0500
Received: by mail-pj1-x1029.google.com with SMTP id gt4so3958416pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h6Iz1AvUm84xNhXXYxc+Has9u5k+1iauq7kw/Vcr/D0=;
 b=soChDyooUD/2nxfjujFPjL+GJmVXKcCrvyPP8jf4prpD6w7drLQJdpz/TiFj6fCs7B
 aCXWA9yqDFktra6OAv+zZwNlMjL9Y+Q4UZg9A0of6YebAbdF4bbxKN5lOei8nSPfKCzb
 wICgozws68HgXFsYZxMMR7Fa4N4U9zadVjJuKEN6WZgdqODo5xiGDJHfYHNN9RoXUTlT
 1ZVhIrueFhFSZiclQOjK1qElX2kwx+OVazlw27bul1NvsV7Sk3FSgwjL4Fo9K0o45CAz
 3GtB6RdR2VCn6+mmJd36VxZ4Igujh4jvjO4yHiU8wyZqMVeLy8gSONEf735n00xOQa72
 YB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h6Iz1AvUm84xNhXXYxc+Has9u5k+1iauq7kw/Vcr/D0=;
 b=OV/wcWh02k43iEoQCdTVWcJUk6QhZMlX+iKlHvqKnXZ9+D81TcW5UcSgMWrTkfgTlA
 yIthDpf9fXvwuRNOAFijiXiIwBrBFbOSeE07QsLPaZ8Gom9liEvSUDk6wD2knoqE2/U4
 Y+aI5dzwZjkDOHDLEB9/Mg9o6+ypc++pwcUsQew8ARom3iTmVIbncGqH72Y9+WfJDTG6
 IQF0z+EISqWEYQUH2czug6pnDlekjo3YN+7f9reZbT1oLb2TbMIqfONXYpBU73ka+ukt
 oIED/B80W0RoCwDNZv3t51rIonRqLTdYUa1zeZ68QNBneuIsAHaoVWFYydoJNFP5sCPy
 xiBQ==
X-Gm-Message-State: ANoB5pkKYIzPWmp0qWrILexIo0NKayXxbnoKm5+9tl7VLLwVpMJ8lbai
 2prfYEogLeUwCpoe2woxw/vI9A==
X-Google-Smtp-Source: AA0mqf49iz6EbF5PaghmwPo+HePsw6/Hom1i+KDKiNhoRLotsIhw5XQGdz5XtrtQaNcYCab7XAMk+w==
X-Received: by 2002:a05:6a20:a58e:b0:ac:44ab:be3b with SMTP id
 bc14-20020a056a20a58e00b000ac44abbe3bmr42967372pzb.60.1671234779155; 
 Fri, 16 Dec 2022 15:52:59 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a63b107000000b00478bd458bdfsm1992221pgf.88.2022.12.16.15.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:52:58 -0800 (PST)
Message-ID: <645c9d12-7a54-c4ff-7f79-2b545fef3f03@linaro.org>
Date: Fri, 16 Dec 2022 15:52:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] scripts/git.orderfile: Display MAINTAINERS changes first
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20221216225505.26052-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216225505.26052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 14:55, Philippe Mathieu-Daudé wrote:
> If we get custom to see MAINTAINERS changes first,
> we might catch missing MAINTAINERS updates easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   scripts/git.orderfile | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

