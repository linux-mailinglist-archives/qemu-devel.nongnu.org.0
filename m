Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9E6884DF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcqw-0002pz-8F; Thu, 02 Feb 2023 11:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNcqt-0002p3-IX
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:54:23 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNcqr-0006pQ-OV
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:54:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so1804682pjp.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 08:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kJ0f+4Iwz0HTx72kqcZhrtmrN9bqGK8Yuq0L/qHX1RY=;
 b=GLI9HOIIiGV2fz7Lz2VE0L33ilmcX5dUj/q2VCLqWJNf7qOOrTlbzJ/4YWvYplyE6P
 v+ln41+zoFGdFbTKo6OQjPVe2SGLwLpanKAp4asNAJ44vuVKts7tXEjOI+fYpbO//onz
 uksE9/6Co2grJR0k5p6gKF9/O6TS0nBbqf81sYuS2dIq7517aU4AAQbp+Lb1Gu3LmknT
 ljnp5A9VdumEESA3wLC0QuahI/FPLQHE/b7w0Unk65zS6UpKgImxGAkws67XDfvC8x1i
 C5lIqVTJJyH4mTyo8XU2C/yH+bEx1cZAbaxgDmoWfnOODNFCraOvofnGNnF/PUd20FWW
 k8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kJ0f+4Iwz0HTx72kqcZhrtmrN9bqGK8Yuq0L/qHX1RY=;
 b=h46nrIThEfBfcOj74atmvj5BU0yvWna6dhmZwJNRmi1sSmm8ZOz7ndZw7ViGCtb0OS
 e9tVfQHgF67DM1ztauAtPq1jy+v7ylOTKRTf7vtuq8ViSX3ImG2i3kU9aXQD8M4h9uJn
 sw5M8r2Vk/pnhR0A59b7Ms46jGRrPMgSuaw4Z7g++/PVPop2zyrB4ZkK6cY0Sq9d19I9
 dttHtySBHSqj0qIw1Z5RfuFxoVAbQYRuNBjiPNXqZwc/U/jvnt0Oi6m2OQDbulL0ZAJj
 2Iz28Wj0T8AimfZVavt0naBc7AHJ0DPnpEKckVSVwD3aOfDyaqyfEFRYoieQOPG4s8ey
 SWRA==
X-Gm-Message-State: AO0yUKXye8XzkizJr5NKSNXwPb4MXpkg88XMMuPXXlZ7/ddF4HZtKU5I
 8/2drVU2rbc4AiPZ0oH1Ud6yWw==
X-Google-Smtp-Source: AK7set+M0Z80ydD51nFkK20U+pZI6GsENTemYMjeMn4MHSx4d6nk7oBuRjJJBaqXGuxuTCwycUMpPA==
X-Received: by 2002:a17:902:e84c:b0:198:9f0c:a8f with SMTP id
 t12-20020a170902e84c00b001989f0c0a8fmr9541662plg.21.1675356859642; 
 Thu, 02 Feb 2023 08:54:19 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 jd13-20020a170903260d00b0019893d572bfsm6101413plb.211.2023.02.02.08.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 08:54:19 -0800 (PST)
Message-ID: <3df923b9-ff6b-c378-2416-1a215709db72@linaro.org>
Date: Thu, 2 Feb 2023 06:54:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/39] target/riscv: Add vclmulh.vv decoding, translation
 and execution support
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-5-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230202124230.295997-5-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 02:41, Lawrence Hunter wrote:
> +static void do_vclmulh_vv(void *vd, void *vs1, void *vs2, int i)
> +{
> +    __uint128_t result = 0;

In passing, you may not use __uint128_t directly, as it is not supported on all hosts. 
Philipp has given you good advice on adjusting the computation.


r~

