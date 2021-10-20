Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62643566A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 01:19:46 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKs5-0007Sr-FP
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 19:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKqT-0005qp-Ta
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:18:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKqS-0005ua-5Z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:18:05 -0400
Received: by mail-pf1-x434.google.com with SMTP id m14so4235500pfc.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T+QfIHwgF1KDzpoIiQq86ew/xoGOwXhBcGtonVDtt1U=;
 b=Wbz6nExhyrx8zAKYwrmMVHz02j1JzORc/1gqF8H/2A9Q4H2bZfAI4F3Jg9pTZyIKiC
 +XndU87m9GetbvfIFFQTsTpnV2Gq9VGj73odhV445P5Sm7CWOcD7fenT+jXtofbSoTFJ
 M+X6arMTfv1AEG4G3I61rbVuWP08SjChiJCuX7Cx7MTHiAXqzV3TNmepz0/epfVL9mn5
 3t/edMTml+zNNd1YLNdPAm/q7GjrpnnOBt1FZfqbqLmqLULY/8yMmZrirH8q5A6lwqD2
 4+Mt78btJh3mAG2aGtUDNMekRG26a6fwQkgmY0/mK10jlSLnVmi1Zt2sTeU4rIuCPj7/
 d59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T+QfIHwgF1KDzpoIiQq86ew/xoGOwXhBcGtonVDtt1U=;
 b=JlN/65kuqiLP9v7U6u/HithrlsZ60B3/ZvKNxOreEzkJ4I6tx1C+v+NbFopziu9c+J
 au7o93YHK3jHn8U2NAOjvahaDota8N+V7NjtFVJUGhrKbIZUIOgigXT3DPZ3/3myLolO
 OtxbgZa8b+A4bI2+YV2u5g/0uBda8Ol/nhhLcBqJaJDh/23inPR8Ju+tFBgmWkNsFTjy
 nAwJotBaOvFUL64oxxxxSGNSdQKEmUuOKT1HPKywbMtEHHU2KCNXG3q4MOj3kXa7CQiY
 xQ5bTDJIIGksA2s0QpnP1C5xYUFuzTkKCmEhImYXrV91tLUHoMlJJjtFm902RfDO2pnA
 I59g==
X-Gm-Message-State: AOAM532uA5i6hhDklIFvYcXjFPFeSrPGt0O37UvajS+uqbjSJ87tJgZG
 AfWaAOBWWZD5hpKsGsYRPQHE9Q==
X-Google-Smtp-Source: ABdhPJyn1kLeXX0ZOp5zKmSycVcok0g1vqfHFz+HbTqMt08BgOaBQZYmNhHm0CwFz3nisrtUwAnLfg==
X-Received: by 2002:a65:6389:: with SMTP id h9mr1653075pgv.83.1634771882531;
 Wed, 20 Oct 2021 16:18:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d60sm6857584pjk.49.2021.10.20.16.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:18:02 -0700 (PDT)
Subject: Re: [PATCH v3 20/21] target/riscv: adding 128-bit access functions
 for some csrs
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-21-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31202e87-7456-cf0e-4107-06d6f063801f@linaro.org>
Date: Wed, 20 Oct 2021 16:18:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-21-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> +static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
> +                                   Int128 *val)
> +{
> +    *val = int128_make128(env->mstatus, env->mstatush);
> +    return RISCV_EXCP_NONE;
> +}

Needs updating from split SD bit.  I suggest

     uint64_t val64;
     read_mstatus(env, CSR_MSTATUS, &val64);
     *val = int128_make128(val64 & MSTATUS64_SD, val64 & MSTATUS64_SD);

> +static RISCVException write_mstatus_i128(CPURISCVState *env, int csrno,
> +                                        Int128 val)
> +{
...
> +    dirty = ((int128_getlo(mstatus) & MSTATUS_FS) == MSTATUS_FS) |
> +            ((int128_getlo(mstatus) & MSTATUS_XS) == MSTATUS_XS);
> +    if (dirty) {
> +        if (riscv_cpu_is_32bit(env)) {
> +            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS32_SD);
> +        } else if (riscv_cpu_is_64bit(env)) {
> +            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS64_SD);
> +        } else {
> +            mstatus = int128_or(mstatus, int128_make128(0, MSTATUSH128_SD));
> +        }
> +    }

Needs updating for change to SD.
Now you can defer everything to the 64-bit write_mstatus.


r~

