Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07223661889
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 20:33:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEbOe-0004sH-9z; Sun, 08 Jan 2023 14:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbOa-0004s8-IH
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:31:53 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbOY-000787-OU
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:31:52 -0500
Received: by mail-pl1-x630.google.com with SMTP id c6so7263921pls.4
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 11:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g1azPZJKPkQJkGASuqmlNxttI1hAxrP39ClTKO2aHKE=;
 b=MyaPTpo43yUJV/cqJQlB19PdJX4lTY6NbsqXpAjyXlLbK+0uLHsmMSfVzw05oF/5cf
 1MtKKWKmE0GtgQTVkPjqD9miyE7M3U8s3x0UgQxTpImIdvOJSdP1qUjZO3p14O7JGsuI
 Kg2+UsfYexLN8KHUbdYgp8Zc7W5sxp9H2nl1+W1yKeoCypb2Xd/O7AQs5qI2IFIJE39u
 FRMWUgKPz38MdbJpjuBTxzPkAYd5S7P+lSpQWr+XQXmjUD5q31sEx//66wW3DjjBavbd
 aVWoIidMVieCYK+5H/gtyJd+51vwhr7lw/EymLdjzetBl3EoOxEFJDqvA4KF1f23aiCh
 yeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g1azPZJKPkQJkGASuqmlNxttI1hAxrP39ClTKO2aHKE=;
 b=5wEI9C+UwjX9Qfv9FeAFf5DEJ2oFtMDwdeEiGo4fPtzs96razVHqvjt9jojbkbEqlL
 Ux7MMLI3UJAqtzmIkf121Iazb0ZnynnMyiyuQm4SJzYE93zdQKj/QaDeY27gW0i47L2d
 micLHKosmjy1WWJbOjUatUXyer0BU4P2ExFWvfPMroLbE0kYvKCW/uyvdUIPXJB3fonw
 yVxuanVK2gjNexkzKqfo4Sr/kLzBupc8Lc4nK+/mUYYB993+r6+zXNsSN4bxnbMbp64B
 5+2BVeatYdzEU01vUjY/fd+mSJlvfTQfoCUyo1ZsWEpaFA9fjWNCIz6XbjrIptK1z0nn
 U3RA==
X-Gm-Message-State: AFqh2kri5sITrczWrEVUSHMoR6KSk73XA46dKXhyVr+KIj0WKpCKUwDw
 Nzj0qNlPZL2Jk0wfQyV2g0j7QQ==
X-Google-Smtp-Source: AMrXdXuISJeKnm+XAq99ciD9V/AFLwR+/nAE6AupPXZ2hYnuFV0lt/JtW/xXULbN/AtShBCQ3aZdMA==
X-Received: by 2002:a17:902:a582:b0:192:52d7:b574 with SMTP id
 az2-20020a170902a58200b0019252d7b574mr57424927plb.63.1673206308137; 
 Sun, 08 Jan 2023 11:31:48 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a63fd11000000b004a0127e8ca5sm3908764pgh.86.2023.01.08.11.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:31:47 -0800 (PST)
Message-ID: <20928300-7e40-e45d-3bb7-41d026d7b66b@linaro.org>
Date: Sun, 8 Jan 2023 11:31:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-5-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230108163905.59601-5-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 1/8/23 08:39, Emilio Cota wrote:
> To fix potential deadlocks as reported by tsan.
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> ---
>   plugins/core.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

