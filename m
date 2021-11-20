Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88891457CB8
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:47:55 +0100 (CET)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMyQ-0003k8-7s
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMxP-0002y3-Ic
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:46:51 -0500
Received: from [2a00:1450:4864:20::42f] (port=33451
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMxN-0001R5-DQ
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:46:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d24so22567045wra.0
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 01:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ty7rrKULpakIE05Cxa57B9Ips7T5fBHVmaWikxPB2d4=;
 b=ztpS82de1WhdnhY3dMhOUYPMXmYwOgQJXeJ/MA5C5CBcBUEqexhC0psd9Abb/Zol8x
 Oh0jN8CiHYldb1LPxxZphBmhvxJ6Bg4VLVUnIvr6GJzP7P2hTVb0YOiRJ7zBEHV74Pyf
 CTjlL7FnZTt0GqARo/O6hNuOxbAVv4JzoGiABgqJG7TijUZJZxnEz0BtfeTZpoIHBhya
 8aKlqhazixlYcWL7cpbZVouo7qaAx6hBowbPTRFGSk4JsWIWsdA0y4JEKSUDFgPqGwQ3
 eE4lbCP/T7EpbGYzz3Zp97fjgv3hCy0oKaKs5q0++kkiMdherk3+7voTU8BiK9GN9yr+
 hODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ty7rrKULpakIE05Cxa57B9Ips7T5fBHVmaWikxPB2d4=;
 b=VeycG3eSvnyMNczGghWNIoqm/1xqN4o6eJuiU8O32aoeoC2fppLwpX6LybBOaQSr73
 U75STZB5xkt6gwKaRMODahhHuiqlNi+BmcHe5c0+w5RA8ufOW5a/o035DJYTd7oZ62kg
 QIIdAClLMUyExkL6wOBUlXI7xb09zdFWnJHACrKnckQYcydKbPTT099/0z+4qc0nseM3
 mVu9w6KaDbOid5gEU5BJGMj/NSMUXTs8PEBpzAQBqUOvmOctJaWVS+27AEB5Yb7c9kdU
 PFCfrZUgQiH5Bjwwqa1z+LVUeWyhGVh899lGsEzAHlzIRpVpkugNNlYBueA6Z96ZHpHW
 LHzw==
X-Gm-Message-State: AOAM530p46i6g2SpAdLlQ0yLj8AlPbGEwFfEo5kDt8FCTFcJ/MzXQEdH
 5fdb3Q0tG7y3ndfOgPZrKpdZHw==
X-Google-Smtp-Source: ABdhPJzZ8wpUSENuuJCwdhUF1PKCddaFwxQRkTJQ6P1KON8H4SVq0PdFna46v2dS1tWmB8WbFHCIHQ==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr15978365wrl.158.1637401606328; 
 Sat, 20 Nov 2021 01:46:46 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id z18sm2285664wrq.11.2021.11.20.01.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 01:46:45 -0800 (PST)
Subject: Re: [PATCH v11 15/26] target/loongarch: Add branch instruction
 translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-16-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5764f674-04d7-57db-ece4-02cc21144fc3@linaro.org>
Date: Sat, 20 Nov 2021 10:46:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-16-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +    tcg_gen_ld8u_tl(src1, cpu_env,
> +                    offsetof(CPULoongArchState, cf[a->cj & 0x7]));

Mask of cj not needed; it's done by decode.

> +&rr_dj_offs   rd rj offs
> +&rr_offs      rj rd offs
...
> +@rr_dj_offs16      .... .. ................ rj:5 rd:5    &rr_dj_offs  offs=%offs16
> +@rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16

These two are the same.


r~

