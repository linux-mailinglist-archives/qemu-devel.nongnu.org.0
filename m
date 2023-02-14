Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76327696F36
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2kL-0007LZ-5c; Tue, 14 Feb 2023 16:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2kJ-0007LR-Ch
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:21:51 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2kH-0002Kc-Mg
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:21:51 -0500
Received: by mail-pl1-x62e.google.com with SMTP id r8so18376178pls.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HdF/6RAxRv5h8705YepBzJoSHSWMJ1wBH9hKtkS8vHc=;
 b=HxMQQgDl8GLC8MzZM3yTYRAQCBunC2drp1BgM62J955zfAR4lUp2I/QC9WioSMepku
 WUXX2ZaI4B/r+LkKhEoJs0c7lC0h+dRGhKFAeqcBLpiZi5y013CvnEZ1fEWHM9qQqJlH
 yKFAIvZWm+AKmwgdO7UWwrI6nW0I+na6Q8fLhJMLJMFH+BGzu8QZlglpTlTOzkvx4b1g
 9+lsRcM9G7yXqUIvINfJTri61o3NlDz26ylz3+h0yHFFDFwn4XKS5H7GWnnMD5UWdRfr
 0ZC9Z413EN7NFF9f4I+Ht/2D/zBfqq8YuBrjKOB0fHYR4s+VGCB4H5ERmxq2FoqET8Nh
 s9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HdF/6RAxRv5h8705YepBzJoSHSWMJ1wBH9hKtkS8vHc=;
 b=bPF5X7xCTY2uXTkz4q7o2IKZTofVC/XpSm3lPwtQk63pVAHhD07GU6/d7Uoe3synon
 kToJDbXFEWrLicHnewwpjCpufI58u0B5vBaE/kx3aAq3FqAsaYrZHBJ9dKg8appUvqqr
 sL/0i6fb+RjRtAaQU2XMuckE3qpOMrAjx3RG/fLvukqqdiXtiF/Kon2cSs9lUjIZdWx+
 lAbDT4h4bzD5zP1mhXGGrxXlCODdVtr+4tU2kRYAotNwQ/7WyNzlxVB7jnZK6EHrG0Yw
 411OaeljEAlQzbMRh6b/V9akX2jTPPp1PEDpKvMpa1JcMNjtRrYCCs8YK/X85tt0YC7h
 9e7Q==
X-Gm-Message-State: AO0yUKUbF12uDJH3UZ7eNvwt0VZ2s2/Esn57hY+/60dgmqnFh4V4FGyn
 GrOhcKcgk1vYReJvMfLygSxsoe6U3SPMGGPW/Z4=
X-Google-Smtp-Source: AK7set+5CJEfZSa/oYP3E5VQpj2My9/2M+nxA4xjdEwBRIacCb0KG/IPclyHX4yqUxv3oHCuz/NpGw==
X-Received: by 2002:a05:6a21:9718:b0:bc:c456:9621 with SMTP id
 ub24-20020a056a21971800b000bcc4569621mr2678427pzb.8.1676409708168; 
 Tue, 14 Feb 2023 13:21:48 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k9-20020a633d09000000b004fbdfdffa40sm291889pga.87.2023.02.14.13.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:21:47 -0800 (PST)
Message-ID: <8e91dc31-d17a-880e-501e-4ae49594e88f@linaro.org>
Date: Tue, 14 Feb 2023 11:21:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 08/12] bsd-user: common routine do_freebsd_sysctl_oid
 for all sysctl variants
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-9-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/13/23 14:27, Warner Losh wrote:
> From: Juergen Lock <nox@jelal.kn-bremen.de>
> 
> do_freebsd_sysctl_oid filters out some of the binary and special sysctls
> where host != target. None of the sysctls that have to be translated from
> host to target are handled here.
> 
> Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
> Co-Authored-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Co-Authored-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 90 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 86 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

