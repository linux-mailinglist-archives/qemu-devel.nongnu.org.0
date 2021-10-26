Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220C43BB68
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:11:15 +0200 (CEST)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSmw-0001IF-7w
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSlO-0000be-8B
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:09:38 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSlM-0005UR-A7
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:09:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id t11so327167plq.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ux+iVbVvea3TcbH+lKKNOy1anZ3DE+cdf3+UQcUP+UQ=;
 b=q6L9TtCQJhqjS1vhWWFfZDvZ+B8MxAn2eZjUPeKPnD263N1CVrvqCzrl9unoSt0UXV
 t5oG55FKXo3h+GLrwLjkoe9vNZpEalM4Y7DjkpmncYEFzqm+lSTzbfwR/U73/JqSqc65
 vyaZGYUrfxJft1x7yY/leGXkeEBYi8sSIZxA6V9RJCO1Hsrg21dQ9tcDL/xfJc9fuBWo
 C0SozrQt3ZuYw4FG4lSx6GZ2t35inSuoyJk5WRS86laRlxP8PCHEU6xxJ0f90BEs+JIz
 SB10P426+tdbxEEq7LsWmp5fpv8oQE2hUEwW4jDxvyJPLt1D/RMpXlyJwUayLsveDrxs
 fdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ux+iVbVvea3TcbH+lKKNOy1anZ3DE+cdf3+UQcUP+UQ=;
 b=uGY82S4HsU0yGgfBio0PC/3q7f83Wra4Epe7L9Qf470rYYNMb885E/rnZdlbgeCSZG
 N89tv3TfAXNdmoeYexhFUIzLmvNLkJ/FqmSf3YlMJQRkqQ5+IsHNXZG39FEK5aL9mVFt
 DwGxDzWpHiRPKQ2XQK+PtLX8kgM5NlvSEudtY3ECB7Z4OaCDftau6KONh1D7MeC4nFck
 Oiv9C0BxkR4Yj80U6kdMe5WTDkHPEGwjhnfqyk74qWHXPJOhyHetdRvznTcqem6NT8yG
 5hek8UUE2cRIL6JdtKNlA1Fchvvg2QsL9hvXmOeTe4NZh7HEfJY4MrabTi5JQ3zcCB29
 9H5w==
X-Gm-Message-State: AOAM531nrnWcsIEO0+odlmMBpM8IOAkO0Ejq0Mf14suFkLlFwV8t9Hz7
 E5yl2w615k8owivyVD6YQc7Zqg==
X-Google-Smtp-Source: ABdhPJxYilYZxblBP1Xt3E+uImBCR2rzjZQKvNCtASZ83O3U1txBqMYnqxhWsrujjF6OzuFIZjX0MA==
X-Received: by 2002:a17:90a:4d44:: with SMTP id
 l4mr1019214pjh.64.1635278974704; 
 Tue, 26 Oct 2021 13:09:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id gq15sm1677149pjb.42.2021.10.26.13.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:09:34 -0700 (PDT)
Subject: Re: [PATCH v1 20/28] plugins: try and make plugin_insn_append more
 ergonomic
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00a8320c-3295-2627-d0cc-cddddc59d63a@linaro.org>
Date: Tue, 26 Oct 2021 13:09:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> Currently we make the assumption that the guest frontend loads all
> op code bytes sequentially. This mostly holds up for regular fixed
> encodings but some architectures like s390x like to re-read the
> instruction which causes weirdness to occur. Rather than changing the
> frontends make the plugin API a little more ergonomic and able to
> handle the re-read case.
> 
> Stuff will still get strange if we read ahead of the opcode but so far
> no front ends have done that and this patch asserts the case so we can
> catch it early if they do.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   include/exec/plugin-gen.h | 12 ++++++++++--
>   include/qemu/plugin.h     |  7 +++++--
>   accel/tcg/plugin-gen.c    |  3 +--
>   accel/tcg/translator.c    |  2 +-
>   4 files changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

