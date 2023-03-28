Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C8F6CC93F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:28:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phD6m-0003Dr-23; Tue, 28 Mar 2023 13:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD6f-0003Cq-1W
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:27:37 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD6d-0001aD-Iv
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:27:36 -0400
Received: by mail-pl1-x631.google.com with SMTP id o2so12394977plg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680024454;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/V8UQ6rpVuBY2evzplYKKubAXeIqFu+J7hBXz/Wmh7Q=;
 b=Da2r5nor8QtbjO7wl6dYrW/vgBDzkrKDiPHDlcTfNbYtmP5HR8LA7StUvbFWA0cOWz
 O6p9DIabMgDjuwd1ZG9pYYUmAaYuPZwuhr+mzahxnHUbSi9a+h4tzW6vEp3+JaWMvwz4
 qcbqtCIH+4Jw1YRErLJEDfnrOK2b4GvTkIvjDb/Dr4YYU85/nBZG6cQjYk4BzdXmASg4
 idkL9YL5BFxdPnyla8VIW5uM2JscnajCjq2p0vk1YA2fZ8odBiQ08g2PGgqyTlTmxIma
 A8hfZtrqxk5UozjEHEDCnzxvx35SQp5eS2DMmZ+b8ejyvKrduxubVI9n0uszz4KHwloy
 1teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024454;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/V8UQ6rpVuBY2evzplYKKubAXeIqFu+J7hBXz/Wmh7Q=;
 b=KmhwUQ8Kh+M2kfilUywWE3s7Cy9U9VLwxM7zKNBPjb1WOU5QR9vBFs90OsCwOvVBsv
 wBtPfVtRN+SfWlCifa0RL0lCbo7dwkebwOS8/02zbm+CoIu/C4MQ7ZAjiSlwDbaHBNck
 cwhvVgdcLpYX9r9A0LY58wTtV1YVyRDk9cPbx+Il7McmlI32dKDqVpcsJApSAKnRp47W
 H59+IeS2C3I9KiTfkVBOWv1FRHTNf5Z3MXVQS2ZXhqxksnsGw3GMgF1Ol3DmEtIUIbwQ
 kRGUtxiSqYxD00X4Te5Y5zbgCyE9qNu7BevNLv423A6yI2NKSZQoo3Yxzo6l7y1XGcyR
 SvmQ==
X-Gm-Message-State: AAQBX9fb14aqf59mGy0gfWbChXM3BDsQ8FHpd2XD5HeIOFTEv4+K5kdx
 uvw/TwcqJyCV6N0goCmnwo874JFBJ0DI0PUwFXo=
X-Google-Smtp-Source: AKy350ZXy2DEBlwtJJde18yar6iFveHpv2y0A6tN0ulUAodc2YtqhgcLhxTpkQIcUEFh6Htm/1OeFA==
X-Received: by 2002:a17:902:d4ca:b0:19d:20a:a219 with SMTP id
 o10-20020a170902d4ca00b0019d020aa219mr20196211plg.66.1680024454210; 
 Tue, 28 Mar 2023 10:27:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 jb9-20020a170903258900b001a20791250esm10163891plb.22.2023.03.28.10.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:27:33 -0700 (PDT)
Message-ID: <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
Date: Tue, 28 Mar 2023 10:27:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328162814.2190220-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/28/23 09:28, Peter Maydell wrote:
> +            /*
> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
> +             * but since we're conditionally branching over it, we want
> +             * to retain the existing value.
> +             */
> +            old_is_jmp = s->base.is_jmp;
>               gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
> +            s->base.is_jmp = old_is_jmp;

A third solution is to simply set is_jmp = DISAS_NEXT here.


r~

