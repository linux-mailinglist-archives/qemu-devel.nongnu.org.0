Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791083A75B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:21:17 +0200 (CEST)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0Zg-0007MZ-Ir
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0Ys-0006gL-V2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:20:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0Yr-0007w9-CM
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:20:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id x19so7777192pln.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 21:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=U9VBU/ajf92YsJ6iXzPZv6NJg1oXZOrg8FUWEPXGJEc=;
 b=KUMD2z9+NNIFhlWwfy+Aar1aQm5KbrZucaFdkqEUHr8lghivDQph6h7VxKYLhyucRh
 mkr90powb5PxDPWzSKOOgPoPgA/nwh84VBhtit15MfCUA5lT/oIxCsu1pBO4W3MUEZpp
 NdMI9Ge7bVj4HdVpKVWQSkGJ8hTQHBkRBrxZJ1FuUoGQZGqN8uFi0AAEd35GWvYvDdrg
 proOfBKVrGsL8Pc//q3rIxyhxAB8j+Bmh4im7iAkIcTDPAr8SHMsoYMbDqAK8mNeob37
 MhvAWcTUv14MpDQMHNRNVNAFUeXxR8lfBA7I5qBYc8KUvCNwkFgf2SJ5/EfsGSNONobI
 zvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U9VBU/ajf92YsJ6iXzPZv6NJg1oXZOrg8FUWEPXGJEc=;
 b=NIuZFRricvorJWmhRN8k1/1G4ERzz6ln+q8w5rY0fMrNf6XcEbW0bsiVbaTX8iixoL
 ierzq1uBvAq3zzBQzP7H/07AS+0BJBPrZ534jFLWUBU/Rtkh/mTl1sqvnSom4A9CRZLL
 Rvt89JeG06ighy1snlRpqL6tJOLl1nc/nQTUTLyndEIEHNPcnnPLfnc7WfFHwWH7nawX
 4RwNgSfQ4d+XwolqiclZmYM4BkOP4iAj1o/CayxqYCQKgpCtlLFlRy61YSEkTJBkKi+S
 5SjcjHiQgkqqZ/dxt4eyzZn+jj6eq4mf2I9CbjTLrTncF97GXcR8Q/GAvFTegGRLlPj9
 HoNQ==
X-Gm-Message-State: AOAM530FA1HPC60eycFRhCmwBuOGZ4vtsNs8YHLfcmz+9/PZg+YIcTkY
 vdQ1+A73DHpo9JyiUdTrrByZT13mqufIPA==
X-Google-Smtp-Source: ABdhPJzIbPV6F1KAdItA/gjn1ZVtGHsRYXkux3+94dJT5Lk6mQm+oE6EopJ2HAyYG3wjYTAANBo8HA==
X-Received: by 2002:a17:90a:4e0b:: with SMTP id
 n11mr22859202pjh.155.1623730823560; 
 Mon, 14 Jun 2021 21:20:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 mi10sm877781pjb.10.2021.06.14.21.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 21:20:23 -0700 (PDT)
Subject: Re: [PATCH 3/4] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect it
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-4-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8346c497-f432-0d75-bc60-0fcceed3420f@linaro.org>
Date: Mon, 14 Jun 2021 21:20:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210613211549.18094-4-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/13/21 2:15 PM, Jason Thorpe wrote:
> +/* The following was copied from hw/isa/i82378.c and modified to provide
> +   only the minimal PCI device node.  */
> +
> +/*
> + * QEMU Intel i82378 emulation (PCI to ISA bridge)
> + *

Why can't we just use the existing device model?
Certainly duplicating code like this isn't the best way.


r~

