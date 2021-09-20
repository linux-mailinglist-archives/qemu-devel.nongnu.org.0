Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700DC411958
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:14:34 +0200 (CEST)
Received: from localhost ([::1]:60956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLw9-00051u-HH
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLvJ-0004Ln-Ml
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:13:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLvI-0004pf-7o
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:13:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id t4so11440257plo.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WppNSfTr/3lEANb4CA3gHO0hLSVKc/A6Ufkl9W/sYR0=;
 b=CsC/ZzwxcRU+xbo3RMWt5eTvKtbWaucPNyBMJYKhqG+oS3ZDc7qxf3q5BUsRjHk2Np
 hihyNfjSZWpahHG6XzdcO+uBfZ9O3QdHNPRGwLpWt8FQN7sX+i2M0X1GYdNJqQgruz3s
 18fYzlF02TCYjHhx/sfUh/nfm0pZ0VCqwIJ+SYDHTfI/Xis2JrFN5MUIaE13P7QEaRN7
 mTNo32cohICGZuE/OHaD4unaD01m4XORPTBW8U+KbAHafJiqlNfm60noLgn1zFujkvxu
 SMK9wIZxzwXvBN2hEHU9xZfkQdWBY/6mNuOuO72o7cmugu6GXVDL/ZGUA4u1oxNdVc8V
 63Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WppNSfTr/3lEANb4CA3gHO0hLSVKc/A6Ufkl9W/sYR0=;
 b=H9lVErvCnaAlBuvKJCq110gdWGIVLtzApelV0e4JLlrCWGCBqge6EzGmyxy60ti7OS
 yX9ZOn8D6q4F6TaYEYTfpAf4M62euVYhTX0PcoRURephAzLcbJSGJERPHXqaSILrhA8K
 IC0sNjW6Wicv5FjxQailzBdpSs4bM8NnypRXckOOyuhzsDge4Iai4P39dMHdwYR0A4vo
 Zl1FWHmbfQqVtP//DE3bXWWlQ1kVkFAbZBzwMAqwarq2xty5uBGuKGbl5emdL9wb68tU
 M8qXUITc0MFrTzU5eBZ3QpY4PeC6mdN0wciIEZGGq8zMradqvHnwN9FiVr+WZi6hIDKM
 SHMg==
X-Gm-Message-State: AOAM531siM60mdakYzhO/DEt62J9dMGHp7UIrZL7zfGLupIGCp77JN+e
 QBBTrRBohCz8/Yz/+PbIBz2ZW/jOI2niRg==
X-Google-Smtp-Source: ABdhPJwfR4gD5RUQWTI7sq0p929LftVtlC0ctZNghoJPTHQsY0J7GqDNuJ01TYcHlKcPmtoSaK8yuQ==
X-Received: by 2002:a17:90a:578e:: with SMTP id
 g14mr39387051pji.184.1632154418453; 
 Mon, 20 Sep 2021 09:13:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q3sm16675557pgf.18.2021.09.20.09.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:13:38 -0700 (PDT)
Subject: Re: [PATCH 16/30] tcg/loongarch: Implement shl/shr/sar/rotl/rotr ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-17-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0175db0-ba7a-699a-8df8-9588359353f4@linaro.org>
Date: Mon, 20 Sep 2021 09:13:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-17-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +    case INDEX_op_rotl_i32:
> +        /* transform into equivalent rotr_i32 */
> +        if (c2) {
> +            a2 = 32 - a2;
> +        } else {
> +            tcg_out_opc_sub_w(s, a2, TCG_REG_ZERO, a2);
> +            tcg_out_opc_addi_w(s, a2, a2, 32);

You can't modify a2 here; need to use TCG_REG_TMP0.
You don't need the addi, because the negation is sufficient, mod 32.

Likewise for INDEX_op_rotl_i64.


r~

