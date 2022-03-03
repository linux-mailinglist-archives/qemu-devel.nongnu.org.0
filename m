Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DA4CC610
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:36:18 +0100 (CET)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrFJ-0008PL-J0
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:36:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPr9P-0003ht-Hs
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:30:11 -0500
Received: from [2607:f8b0:4864:20::1029] (port=38442
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPr9N-0002Ie-IE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:30:11 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so8639565pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ch3gBUJpkWWlHXkQq4MWF2F9Y02zYUF5nJI0N7LQAEo=;
 b=G8MvBWg9OkAXDk0WYfR+dPy/k3bMBURhGzIZxLaaJMf8KClKLgAt6Jtxuccy+tYOOb
 vH3TZ/mQmGGXY5ptU+PHFUKEPMSQYTLb9TsAeypgi+LL29ZuegxDmRPQFzpAV+hYN2rM
 gUxbJfQhjLjUJsctXig/XYn6Fa1G1jXDsph9fQIdZaQaiPTTunU9sYg8388Sopa2Gv8F
 9MkDFWYINV2pA3bhjMGMWHd30scDnI4N3+MZl2VVmGpoPX9NI3YygtieJhnZkMUi0Y+H
 xGxILtGzwfuUA/ABstqAYtirSTMd+7QLIXkxRDlWs2qdfcq745HR4pNFzyehXnEBsSKV
 vDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ch3gBUJpkWWlHXkQq4MWF2F9Y02zYUF5nJI0N7LQAEo=;
 b=FBfxJawKqkPQc+hp/WK9Qf/1Gc0AVOSR4yU1hqptqjATeERBTqeFc156wifsU+Rhzm
 G6RcX/yqME8UUgXsFTip/Ub15oyTE2CJ7hHd5ILIlUr3YFKxrpiK4pkzXoqWju/POiWv
 l96mEQSmY24mfcR/fJp0w2wFCNQ5AMWPrxBgSqpsTAkg3exgvh13b2elmcE7OW77M2w0
 1E6vajisRRWCuXk0It2meX6CVVfMJOEiDHoBYBWfYNOLx03wBEXIeXJP9Hf2FSInYdsc
 PTLdKnjk7JOzJ8JpJN10XrXBue7neL7Yg6ORHvvSvQLMzqu1jM5LMoqSxXoI5BKA+60/
 PQ9g==
X-Gm-Message-State: AOAM531tB/03XhiuO/7dNIoFTNrC5DYzO2Kb28xBYp/wTfE+kgHmxnqD
 jvvOnoep/uYGjnBdXbMIBKZd6w==
X-Google-Smtp-Source: ABdhPJyUfkPKf81oIqezi6v9yvsw+Mzlg7AneGIWRbT09kUmGg5Fyif8fBxZWoHiBkxcC4e6UeglgA==
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr37650446pll.132.1646335808106; 
 Thu, 03 Mar 2022 11:30:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a654006000000b00346193b405fsm2665810pgp.44.2022.03.03.11.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 11:30:07 -0800 (PST)
Message-ID: <31ce0473-0706-65c1-c54b-4e572defebe7@linaro.org>
Date: Thu, 3 Mar 2022 09:30:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/5] tests/tcg/ppc64le: Use Altivec register names in
 clobbler list
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303172041.1915037-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 07:20, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> LLVM/Clang doesn't know the VSX registers when compiling with
> -mabi=elfv1. Use only registers >= 32 and list them with their Altivec
> name.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

This description isn't quite right.  The change to the m[tf]vsr insns is a generic bug 
fix, and not related to Clang.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

