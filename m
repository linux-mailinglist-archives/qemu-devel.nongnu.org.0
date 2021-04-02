Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3753530F0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:59:05 +0200 (CEST)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRom-0002Fo-J3
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRhj-00057N-0U
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:51:47 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRhh-0003P7-9J
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:51:46 -0400
Received: by mail-pf1-x432.google.com with SMTP id c204so573397pfc.4
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmsTq83K6M4GVnjOQ7BGltIcaqTNWttY+O5MLXg88L0=;
 b=YPRFEWv+FT1VB54gMQIOkyuht5YwapDh/BCMxIwB5vn2N5x2NfQKboF4d6kRodvGvQ
 c23HEzkl1ZYRUe44FgJ1zOC/EgdA+CLT+u0X0IxSv4t70nHF+KNUeaGXilG9Ffg112p2
 xt6QwmyfdbS8HuaI1wpyc/OHxjwAmyTGG2QUs5nqrmIfbsxUK9PKoMZA++oY8M9TfrTe
 axLXvqFU/daAdf7cLXkwWMUxFCZc9QrTCXxsJlo1OheQ/BA86foZRZgeAotHTwosMrgg
 jGR69AUv1O6dRx8cIrgFtcYAxdqqVzseCAxtnJPQ7NSEWdS/1eKXbOc17HETijaMm4Rq
 oX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmsTq83K6M4GVnjOQ7BGltIcaqTNWttY+O5MLXg88L0=;
 b=qeL/HOX7LCIPW5m/Ioi5rO2EG1UnVBCKsaGFWLMAkEpugoeM5sQ7hbkl2Y7qAXHfBx
 K/VDFTyM/rciv+Gf80zf92lkNDKeQPqyfoLu2Ia8rwCu21vHK0M0PvnLQR8f9s91sUTl
 BWsnXhbCCX5OXsm8nLDCAJxC+d+wOyDWYYCyDvCth48LWuRaWE/t+iriQbE+bnDdCkLZ
 w9yG44as2aLgFVAxvG31y7hnWo/eyWpqEK8sXbT/dG/CZygDtEUcZMyhjHCSNmBHKMP+
 z5dd3o/VraXFukYF7RSy/RWOaJWrMO6AjVPv9pOZZopeE8IGLNenmPFy954oyA1uQpvd
 Ztjw==
X-Gm-Message-State: AOAM531EcvElh80QPErs5VdcAbT+nSyzW/LXvpUgtb8REd6r4FmQkcC2
 cDlSfeI/40ziWN2HRRzY3lCTVA==
X-Google-Smtp-Source: ABdhPJzS0Ef93Oa3JU+aYE6vVXTlRRK2rFLU6ZwYs2nRtnu97Z14Pz3+T4OuieqMS/getBBhnvxM6Q==
X-Received: by 2002:a63:1921:: with SMTP id z33mr13553423pgl.211.1617400303617; 
 Fri, 02 Apr 2021 14:51:43 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id d13sm9212314pgb.6.2021.04.02.14.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 14:51:43 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] Add NVMM accelerator: x86 CPU support
To: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
References: <20210402202535.11550-1-reinoud@NetBSD.org>
 <20210402202535.11550-3-reinoud@NetBSD.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <604abe90-5eda-bbbd-fd5a-5fb9c5c4cf9e@linaro.org>
Date: Fri, 2 Apr 2021 14:51:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210402202535.11550-3-reinoud@NetBSD.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@NetBSD.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 1:25 PM, Reinoud Zandijk wrote:
> +i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true:
> +  declare_dependency(link_args: ['-lnvmm'])
> +)

You shouldn't be playing with link flags directly.

In patch 1, you found the nvmm library, and assigned it to the variable 'nvmm'. 
  You should just add the library as a dependency and let meson figure out what 
to do.

So I think this should just be

i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true: nvmm)


r~

