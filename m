Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8C43800D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:59:26 +0200 (CEST)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2ZR-0007Ta-TK
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2Y0-00069n-E6
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:57:56 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2Xy-000475-2m
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:57:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id om14so3840599pjb.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dH1MUHNJJYZ4ciYokCnXVB4/D0In4JrANc0ZkRYfwVc=;
 b=v0M+0LdSjJi8vIG1PUyRNMdkoB2E/jp8CTwXBVLV6gKmxAcYlphbeTCHr8ifA+gSN0
 B2QXF/pSlxnpemvDhtWXB3sYIQXaJNQ6QN7OUXD/H4jsUPOUa67wxSYs+eu78sd+Hy0O
 3bRdD9wNt4BIfF0/BwBUJX5gitOmcVaa7ZDkK8tnoSBzsG+z9/pst137Pa2MSOTzKoyX
 6LaoLlmWsR+WiAhXpdPfr5BJurQHCMeRU5ZqDusgHVesX/wHk6f0wQvu3SnYI5MqoOh/
 TFi2Idsp9Nqm8rK/ai3p6mY4qnTLStAjIg2GCVRQLKjy4lWpLQ5iI414V+VFmK3N3ejK
 Nbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dH1MUHNJJYZ4ciYokCnXVB4/D0In4JrANc0ZkRYfwVc=;
 b=WfzX57cs8Tbpihcp8DEjiFI5VFdWXN3uw4i/CPZtPg/aF0pr/djSRF2GTLMMC9VOsh
 t8EONEnLTn8OOibTzkhhTMyHvfyHaRubcBzheyV+yMQXG2diQBdq9ZCs3RKpKQWLR6CS
 odUEhPoxEP+jj5NaoEp+YIkskDMl2o8qSnfWEMPY+Ul7F7DmKLOL4n2q0Wa5fhSeza0T
 hmaU4lymDv6ZIM0l/CmDA1ObMKmLVgJ4+LsuzDP9nl/d7XTZeBGCAHrc8vSF7MCoVxWr
 M/WzVn463y2BZyq2SWQOToAL6p9DpVRMIk5SflxORI29TOX7WYtP0XX0tIfTVSMcviVy
 VUFw==
X-Gm-Message-State: AOAM532cIeZiIm3NsRwah5u/L24TGXV4F83CDA/oqcKvImd/S038GXfa
 fFSUkQ1dr6nZ3n5Gu65wuN7+jw==
X-Google-Smtp-Source: ABdhPJwIk9YQCHfp1uRwUliJnuBAVURp4BvDNJAXQhdz1/iFWzffLMWr1RIfWOf7dt6sFw6ZmMxxrQ==
X-Received: by 2002:a17:90a:a609:: with SMTP id
 c9mr17953778pjq.134.1634939872621; 
 Fri, 22 Oct 2021 14:57:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id lp9sm11776630pjb.35.2021.10.22.14.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 14:57:52 -0700 (PDT)
Subject: Re: [PATCH 01/33] target/ppc: introduce do_ea_calc
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23bcc387-4b1e-983c-4478-928fad545b12@linaro.org>
Date: Fri, 22 Oct 2021 14:57:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br,
 pherde <phervalle@gmail.com>, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: pherde<phervalle@gmail.com>
> 
> The do_ea_calc function will calculate the effective address(EA)
> according to PowerIsa 3.1. With that, it was replaced part of
> do_ldst() that calculates the EA by this new function.
> 
> Signed-off-by: Fernando Eckhardt Valle (pherde)<phervalle@gmail.com>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---

Oh, and please fix the commit author to Fernando's complete name.

r~

