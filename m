Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9147967C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:47:30 +0100 (CET)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myL4a-00066J-Va
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:47:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL3X-0005NC-Pv
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:46:23 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33315
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL3W-0002Ev-8Y
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:46:23 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y7so3000569plp.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TI8f/X5hO1j5sgj3dSVXp7pMaolrwZhsqL9+vYC2w/4=;
 b=U5FVz17QvUhCraAJPHhAN8Tz1MdMXq8bRL0a+AJss/MtHWTH6Ub79O+/C6PWn6kySV
 W+n26yY5GBq8088HBYI0HONZQPp6wwMvghS9l9yKbimhJio+JZinJK0GTfC7EKmZaede
 3lUgJU97dNmiG10nDardv5k2qhW5E3rCI52yh2+3LF3XoZgMW7oHpwPOynJixySKWEpq
 RkUQlhRMuUifMfdswEsmCgTM1v05xeD1c9/2Ql0bdDzfwt5T/6Zlq1E3jFxefXyLlQJ6
 SmA/3DZMoRVz1plzgVMvrovGBDgsQROhcVhH25dQw32evYFxIT6PLfmKN3H69u96Q2fM
 r6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TI8f/X5hO1j5sgj3dSVXp7pMaolrwZhsqL9+vYC2w/4=;
 b=GTQyt5/w4L72Y1qjrLeui43a5Yqw6hRdJPzTilEcqWoY/Zn1TVOzTDuESMwOPehjvh
 9VX0/rFWzhFkx59tfRdfeeiJlfbgcY6rUVW5OG3yR5J1QBIbmGxSUqTWpUVIajRqM/Y0
 xrBUuY+2HRZL9ZpjkTozfHGJuBjyM3yb8n3s7yEkfT/i9TE7jz0qPUP+2s5RcwpYufRC
 VUUbfXefNRjO4/NCDXa7unC5xeP6RtRlFgFmKPT1m7YTxWvBO4Hkm/rG75NeXTTZ1jlP
 FnWjSPqu3dkhFcFC4eviAPn+oxMrlGVw23BK22zai5uX/0Sq0Fh7kXh2REz1fygtxL+Q
 wScw==
X-Gm-Message-State: AOAM531E68ri98qA/DY0EDID3f0MHuITPS0pd3s9tQfKPzhWlPKwZXOr
 mPyM4ygyPRyz7CvrjtsTabCD4przrZNaxg==
X-Google-Smtp-Source: ABdhPJzk62oixSg7xetMyuexh+9jSK+OJ/5GObN2lfsC+DMuLV/zlG1rtjaS+0jre7LCImDYuf7faQ==
X-Received: by 2002:a17:903:244a:b0:148:b5d2:6507 with SMTP id
 l10-20020a170903244a00b00148b5d26507mr5005583pls.145.1639777581044; 
 Fri, 17 Dec 2021 13:46:21 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id v1sm10182805pfg.169.2021.12.17.13.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:46:20 -0800 (PST)
Subject: Re: [PATCH 07/10] configure: unify x86_64 and x32
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44a03821-801a-a4da-49ea-31004bc23b10@linaro.org>
Date: Fri, 17 Dec 2021 13:46:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> The only difference between the two, as far as either configure or
> Meson are concerned, is in the multilib flags passed to the compiler.
> 
> For QEMU, this fixes the handling of TYPE_OLDDEVT in
> include/exec/user/thunk.h and enables testing of dirty ring buffer,
> because both are using HOST_X86_64.
> 
> For tests/tcg, this means that on a hypothetical x32 host the
> cross compiler will not be used to build the tests.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure   | 6 ++----
>   meson.build | 3 +--
>   2 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

