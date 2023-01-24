Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE427679CB0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 15:56:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKha-0006av-7e; Tue, 24 Jan 2023 09:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKKhX-0006Zs-9v
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:55:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKKhU-0007fx-MX
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:55:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so11128312wmc.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 06:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9tJ5JqSX0qY23kZm7822PG8DEOOssIxzNJ11h7Nj8Q=;
 b=gDgSN1KuZ2EP0ID0sy62FJzTZ9w3tiovATlx6QC98FWjrkAuR3YYc+nC9wHXiaMqS8
 08jsPx3HcPvUbW4FmSsSVKPEG5ycS5kwruX4Ds2H5e/VB+qdnXlS0CBxO/D++Zq2Bgkq
 2Ox3e6k/0WnAxavgI0PHan8V+j6Yyy9uCHOKfV0atQgsHnwClpMBXNzRlgEkcRo5k3mA
 4DoQBbkft+T2DGXzD/UCE589gMhQIA0Biz/v+XLx+yBr3JtAKHyAk9TuNsJ0F9q+PEdV
 6pEoQ7uKLUmcuy6a8o1uCI/sirxN4yubN5PWq9EB6El8UwKluQ1ceoO9Mhrz8+9P8Vwp
 3lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9tJ5JqSX0qY23kZm7822PG8DEOOssIxzNJ11h7Nj8Q=;
 b=O0csWIG7Olo/TmLXjgj8l1sKDhD+subnXidvj9cYzxTGEKx4Weq2hUGZV9Ogh97JFq
 WkrhJ11er64cUxZ6KoErlDBysrqlledyTwhTjB8geiBNO3+N9TXK+yq831rjrQ0hmzsq
 dEEA7oTrYJAjgN35ytpdbndD87kcnPK7qnXS+btYFAuhHRsunAJDkDPdEpM4BMC75SqX
 G1hQNuXARWaLKBtbINzV03Y31x+NQMPuKr0WyWQPd1T4sbHfhD/v/nscsqMYV8aAHmDH
 auEHo5li9JPBf3dBeIY7g0GuOzDbqBO4v1Ywynag4fgSXoPM51ZZjo6pO4YKiJ23C1L4
 jjDw==
X-Gm-Message-State: AFqh2kpGFviwskPqGtlUR22/jdCL5eoJTweuQS/zFnkhAujxRELk8RDR
 IOcjoJYNSl4DKX3PfQEurJo/GA==
X-Google-Smtp-Source: AMrXdXuIuaW7jcDZTFYLMlFgNbLLzBoXzB29KdBD8r2B/WHnOqj/EC2sogJF72obuejnfZeKjK1aVA==
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id
 d8-20020a05600c3ac800b003da270bba6bmr29392804wms.41.1674572103182; 
 Tue, 24 Jan 2023 06:55:03 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003db06493ee7sm14107586wmn.47.2023.01.24.06.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 06:55:02 -0800 (PST)
Message-ID: <28c8fbd7-a85b-6c0e-7da2-411d438d81ab@linaro.org>
Date: Tue, 24 Jan 2023 15:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/docker/dockerfiles: Add libfdt to the i386 and to
 the riscv64 container
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20230124143824.844040-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124143824.844040-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 24/1/23 15:38, Thomas Huth wrote:
> No need to recompile the dtc submodule here again and again, we can
> use the pre-built binary from the distribution instead.
> (And this will also help in case we finally get rid of the dtc submodule
> in QEMU one day)
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/docker/dockerfiles/debian-riscv64-cross.docker | 1 +
>   tests/docker/dockerfiles/fedora-i386-cross.docker    | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



