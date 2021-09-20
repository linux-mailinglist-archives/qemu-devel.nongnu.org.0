Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C204F412359
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:22:07 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNva-00074d-9f
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSNuO-00064k-KY
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:20:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSNuM-0000ZK-OH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:20:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y8so17020329pfa.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kKqwldJ/J7C1tt96/3n3NakIALEPUrTsWYVUrqJr7Ys=;
 b=jlthby38K70PuEr4rOe1ZER5NuOJj1LiTr/vKizV+GWVvfK2WrYFIxkLXYPC5SZQXe
 Q8ZXZepZDsddMTqhXsxKGAUT4Ql+eCKzM3uUGCD7XVhthX5LiucJ8w4ODEaaIzog7wuL
 I4ZhfS/V5hsfIHYhfqkuiB77LvFh2TtmXm2lDdMVH7Z64nIHTgFnQezWFDNs8TVDi+oS
 6sF30IdT6XcELKQQw0YnQmVh+p7f/dXn09j7+pIBsmcMcT4J8wuBSOaiMcQ9TFMbGXqg
 C3LI4gu40or5BE7dnsxszKvKN60axxfu19Iqs+y+xmLyrlIQgeDT6kGDSmXLixtGkN94
 UqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kKqwldJ/J7C1tt96/3n3NakIALEPUrTsWYVUrqJr7Ys=;
 b=3Eri/noXmz4rUzenaRRsydUWQmjAMtIpNv6ExIDJJr0yXddDQ6beVylHxuABvdGbkL
 j9GwySmQtpA0oqTQP8f6TDOT3KBfZULl6RN1N5pdxoN+iEuOWp605mSbPsE8T0LZf3R1
 nlI2kZFhBpKpzUNPHrUXPDsdsUx1o2OQATZervrmhBkVS1yDTJksKAzNxu/O6F3qPNbS
 dsefiblfZ6gKCesPGLscA5a/hqyWdE07fuZD66l2hFSDI0+jNsZasmTfFzvAnmkFiS19
 xDtELbEuuWxt5dfKw17ueIxhHvcXTB3+pih9u2WADP4OjWAlSXPXowK4jxj9TRpuZfIy
 hqtQ==
X-Gm-Message-State: AOAM5331UFaFp6fR+mgq7xNNIs8by5C0oHiGfwIw9w7nCaOaD5HMUdiv
 IASh98pNDLQfknWCYfzpZzQGIoWHw0oR0Q==
X-Google-Smtp-Source: ABdhPJwyrS5g+jSAVTViAvjc/cyXj5Y2YjMsFD6itMAeeUmOQ3W/dd8NxX15TdMXq38M7DM8psY8PQ==
X-Received: by 2002:a63:5663:: with SMTP id g35mr24534971pgm.368.1632162048336; 
 Mon, 20 Sep 2021 11:20:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u12sm136305pjx.31.2021.09.20.11.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:20:47 -0700 (PDT)
Subject: Re: [PATCH 14/30] tcg/loongarch: Implement bswap32_i32/bswap64_i64
From: Richard Henderson <richard.henderson@linaro.org>
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-15-git@xen0n.name>
 <7e8ae810-fd12-a62e-2039-3b1cc4c824cb@linaro.org>
Message-ID: <9e6234c0-26a1-009a-c69b-043a4d3d46a9@linaro.org>
Date: Mon, 20 Sep 2021 11:20:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7e8ae810-fd12-a62e-2039-3b1cc4c824cb@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 8:11 AM, Richard Henderson wrote:
>          } else if (a2 & TCG_BSWAP_OZ) {
>              tcg_out_ext32u(s, a0, a0);
>          }

Actually,

   if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ)

If the input is zero-extended, the output of revb_2w will also be zero-extended already.


r~

