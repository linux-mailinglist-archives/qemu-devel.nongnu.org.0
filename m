Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD96C1BA2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:30:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIOn-0006ha-Ec; Mon, 20 Mar 2023 12:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIOi-0006hH-9d
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:30:14 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIOf-0000iS-75
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:30:11 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so2134093pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679329806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VvavSDfwswD1gtqbS65pMa/smOdzIe2mWjvt6MByrmE=;
 b=AnOkd95rW0FxrcwNtUWO2XN0MXyVrGwkVoJsfshoFOP+MTDcFQwcx2h17ZBnc8E4Bn
 pIsp0ZNwOc+HyLBGCup1mA2IzBnVt/1WCE8f2xOplaxKtyZet6emCcfEh8DdSOqkGLR9
 XuqpG8FrTKODdpZ7LiIxnMTtcUVCg9/66aImmdLIHHXPX5ohtgiIcb3yCUplnxsUb9hh
 NJZmNp1o3tLFSsiAhjvDZQDz13duECSZXV0++lGtY/O56B1E2A4bcW/ezn2U87onFKUK
 wvKiGdxp9T8G+ip9JJsP+8GtM4Q7K3e29bZEkt1tmL/zfeya9ObYq52PZvnA+1s9CfjB
 djTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VvavSDfwswD1gtqbS65pMa/smOdzIe2mWjvt6MByrmE=;
 b=IIatueOVXUA85z72afyDR5tDxrKnjRu/asjiSVHaQUSQIe/1Pxe9ZRszoyoSJQWpRx
 oiAyYNgCI+VXFm77szKp3O/BZJR+JoGiXcbcEBOw9B5oNXyFE6nr4QxC5yvm/28ViQJo
 3jngIrwZDCgxdWAAdUlj4yJGEnYH//sC0UDX/+OLkK9Mm3neBJcWUNLbO9DQcdY8FoWo
 /DK4XLpDuXAm4O/CEk7evEuQeLb8HhkEChNf6PNX6N74aMAIkj1gv7DqqRm/z6j3ne2j
 hfHnDD4wCMUOj3SkkctvyOjFqXtsrkB2fCWbqUwc5WYo0z6GAJOdan083aG+OGAZzv+8
 Y8sA==
X-Gm-Message-State: AO0yUKWE9U1pNK8EiPPErayQkx9WnVspT4nMmmKeFbEGdINDp+O0XWWR
 xxFSA5QTrFuYmSwO6VjcDZgANw==
X-Google-Smtp-Source: AK7set8PQ3LhGR+nJ8fPLaP8Zy2M7sTm5qn+3wCavH7cLgv00SPC4EO8rCIDEnl33ImAXA1gbOGHww==
X-Received: by 2002:a05:6a20:1610:b0:d6:184a:e497 with SMTP id
 l16-20020a056a20161000b000d6184ae497mr21546784pzj.28.1679329806612; 
 Mon, 20 Mar 2023 09:30:06 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 r10-20020a63d90a000000b004fbe302b3f6sm6463755pgg.74.2023.03.20.09.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:30:06 -0700 (PDT)
Message-ID: <fb5d5396-abd0-be3b-1a1d-b17cc91ea12d@linaro.org>
Date: Mon, 20 Mar 2023 09:30:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/10] accel/tcg: re-inline the filtering of virtual IRQs
 but data driven
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 3/20/23 03:10, Alex Bennée wrote:
> Although only I386 currently uses it it is not inconceivable that
> other arches might find this facility useful.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  5 +++++
>   accel/tcg/cpu-exec.c          | 29 +++++++++--------------------
>   target/i386/tcg/tcg-cpu.c     |  1 +
>   3 files changed, 15 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

