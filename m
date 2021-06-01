Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98F397B3F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:28:36 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loB07-0007IJ-0t
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loAz1-0005gF-6L
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:27:27 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loAyz-0002Im-9X
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:27:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y15so414223pfl.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FZ31macvvAU7ox/dsVC1HJDzINgo8q6nZ82L1RujB90=;
 b=tbhSWs0NZFD0VvAKqZyJBVKzFQjajBQXRkNZXaS29MHhkyJWd7sSXV2dG3ka9HS5qC
 Erx0RG86HZh2M50lDrbGlT58sjTLxF7S5MN4uGK65P/TxzD2AlES5zsyEPaU9pGiARX+
 CbxvvO8jSq3u4TyIblqxbW8hucJHVxFjJiMDrpp7kGIWn1uadFpYX7QQlL+PN/08lr3Q
 5WbwVAbJI1Era/4afcRwEzMcqJxXqR48d9iifPGjDOHrrMXR69BoeaBQenvlh5P8tZPJ
 M72IyKtmh3NEZY41czUGfxHSX1g4serDNwzLW/M8zLSkqXT9XyTgnzvZLfC5ea1ceoYI
 Cykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZ31macvvAU7ox/dsVC1HJDzINgo8q6nZ82L1RujB90=;
 b=ppbOJyLIiYvRfHTj1gtIzGOJfULNjAqhGFdKHnyxShjXB3bDbikTvwh5IBgajo4odR
 /Ag2mrC710xGfKQ3IfgSDUVNKP4Q61Mf7MiJHYEuFq9OSHTCmyL/eAYbYHR/MujZ0yOi
 s9brWazWEVImeKaw+9+2+C/lFmySqTQ1mQ7y4acN85Ozb+rvSD8CVOnK7DH79LNc0CBd
 EEY3ibQB3oPjVpP4AZu6IkFE7j9xulZXYzSphsQmAmJ6SQJGOQi5yBlifT1Eih7g5CzK
 G05M1TL9nU39sWx2n3cqBAZ7gkP6zJmR9JQ2Zs+kbXSJ4yK0/VOTmiICf3I9x7cMldng
 Zu+g==
X-Gm-Message-State: AOAM530QokycamZC34IsyfWljYg/oQquQBeJNR/lK95lRAIh3cmPNEQq
 o8tbKINMUG/K1uSxosA3ZmgOMA==
X-Google-Smtp-Source: ABdhPJyt23U1eqxw8sH90S49YLYG4J1fltYTKF2MsmfFxggYUZrhwzsTvCUT9YxGnyIGpmb7wVQxog==
X-Received: by 2002:aa7:8426:0:b029:2e9:bc0e:5c3f with SMTP id
 q6-20020aa784260000b02902e9bc0e5c3fmr15769251pfn.22.1622579243590; 
 Tue, 01 Jun 2021 13:27:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u12sm13796459pfm.2.2021.06.01.13.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 13:27:23 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: fix single-step exception regression
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210601180237.296402-1-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa0c8f49-38d3-4ca0-89b8-0807cb57558f@linaro.org>
Date: Tue, 1 Jun 2021 13:27:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601180237.296402-1-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: matheus.ferst@eldorado.org.br, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 11:02 AM, Luis Pires wrote:
> +            if (is_jmp == DISAS_EXIT || is_jmp == DISAS_CHAIN) {
> +                /* We have not updated nip yet, so do it now */
> +                gen_update_nip(ctx, nip);
> +            }

This is incorrect.  Both EXIT and CHAIN *have* updated nip, but to something 
that isn't the next instruction.  E.g. return from interrupt.


r~

