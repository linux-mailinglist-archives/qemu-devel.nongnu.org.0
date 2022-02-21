Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5F4BD977
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:37:23 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM70M-0005Zs-0D
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:37:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM6v2-0001W1-Am; Mon, 21 Feb 2022 06:31:52 -0500
Received: from [2a00:1450:4864:20::62b] (port=33476
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM6v0-0003w3-Rj; Mon, 21 Feb 2022 06:31:51 -0500
Received: by mail-ej1-x62b.google.com with SMTP id vz16so32563634ejb.0;
 Mon, 21 Feb 2022 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=41FVW70+6E7c273ZQOZ9+/o3XPWyqrnAKRRmffmuJ9E=;
 b=TDaPirEDhLLCQmFesXUtsj4kB4jpObezk4v+ncDemHBe5rcRDyRlp2mDwsFDug53gN
 yaRux+kRSLtqSIIAjNP0mrcwLNh4E4sFgFfRBUbSatdO8x7bj09IEfuIxkarzLBmWIh8
 d+u9JKNEVXaqroGvwU+/vXgFe1R2b2DTmd7VTXytuaZp+DlAUNGIIUzBUizp43942Q9u
 +8JS5IObITSVtsIb+j93Pll83Y+XUts/9g3c0tUKVkpPcyi+P+dbXivBB3t29mBdcXcC
 p3UWA9VWvDL6KXP+dQzPZdBWEQcZNoCOp8m97K/ghmb1bDKi764AHFkCxMw0NO4MU7F2
 APKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=41FVW70+6E7c273ZQOZ9+/o3XPWyqrnAKRRmffmuJ9E=;
 b=WSOkonSUDFPYoHfuiCuexipwxeUgtcX8L0cvOOJy0G38iECKfDRWyUcRGOg6Ikl8v4
 BQG0b/90pyylXwmZu3/PX4GZCynwM7Yl94iGJGSk7nX2XI32iFO7qg/nUo5YSp81lVrW
 SaytpBdaOTFNvsPpwcesf1n/js3jaQYZBUtUwRyyHPI/XqBjSFWXUfQiZ0C+6OcpWxck
 VpxeXnyQzSEhOR7p58ubjyG6f8p9mrhj7DmTAl6s2RKfJmcYPbWqGaoKdlKW/KiXc/Vc
 0ytrweqpNxwjBfG23ZrMqjNF4fSQi0RaYL5jNbRFRMD483acKukxKUdf444GSzeRzbDN
 zytQ==
X-Gm-Message-State: AOAM533/nKPrWmTKij8fA5r0kexopWAlv99mjMW4z5SHlCm8zUZ9p2cH
 jRNR98BrVWIzLPjbTJ4xzws=
X-Google-Smtp-Source: ABdhPJwXwZd0kEH28VwD1njPNBF44VVywJyl00N6qyh2BvykHp7yrbgMwPG0VfCS9tVwR9wydJbSJw==
X-Received: by 2002:a17:906:11da:b0:6ce:71f1:5fe3 with SMTP id
 o26-20020a17090611da00b006ce71f15fe3mr14948757eja.181.1645443109194; 
 Mon, 21 Feb 2022 03:31:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id j18sm634608ejm.102.2022.02.21.03.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 03:31:48 -0800 (PST)
Message-ID: <d5c90dde-43e0-4932-f7b5-a2e3da3bb8e7@redhat.com>
Date: Mon, 21 Feb 2022 12:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] configure: Disable capstone and slirp in the
 --without-default-features mode
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220221090647.150184-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220221090647.150184-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 10:06, Thomas Huth wrote:
> For the users, it looks a little bit weird that capstone and slirp are
> not disabled automatically if they run the configure script with the
> "--without-default-features" option, so let's do that now.
> Note: fdt is*not*  changed accordingly since this affects the targets
> that we can build, so disabling fdt automatically here might have
> unexpected side-effects for the users.

I suppose that's why it wasn't done for any of the submodules, but your 
way makes sense as well (possibly _more_ sense).

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

