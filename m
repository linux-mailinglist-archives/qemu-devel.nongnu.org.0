Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B606567EECC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 20:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLUkS-0005tM-OS; Fri, 27 Jan 2023 14:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLUkR-0005t2-1W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 14:50:55 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLUkP-0002K0-Go
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 14:50:54 -0500
Received: by mail-pl1-x630.google.com with SMTP id be8so6058106plb.7
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 11:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rLQtvAJmyr/gx5Q7DrUJnzijgRegKpEcegPNG7FtvUg=;
 b=scrqAZ3OQb8s+LndQOv/80aY6edi1KOEF1xakWWk2P7SdsV0d3f4BMgojLzUM4svoy
 1AJaGZAu1EUEQR68+CFZcXWVgn016uGxc8WACldSOOIAQdp7UHVQZp0MopLmLXpBUxRK
 AAysYvFEWDmEso/WRj2/dhaXoWYNaEhA1tH//7HHY0FqPsP9ZmoJtbmlcMLnBf+nirsz
 oprhjo/Ar+Jlrg6ClXcuIhV4da0PyCIdMhsWDk1w8vpTXw2DmR1Gp/fY2zUEL8Nj7v3K
 kRfac8Xo77ToBu2WwTqH1Bqkb3O4iyajxLb3E5pNI2kPGIf8EVe2w16uTt/WgYTjpp55
 QTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLQtvAJmyr/gx5Q7DrUJnzijgRegKpEcegPNG7FtvUg=;
 b=uoFLMusmSWrcHHMuM73NRo3dy5z3BaLPYKdpCW7YfFfZ1oTuCaL958dBoNeZ96BoZU
 cCiaZmFoN7Cl9CbIKYjTJ7S60M2HiRdOJP9Yf9UAzp743s77BY11g5hBDSyp5VN3RlpB
 6mvXAxl0DqpeBjOJcvSEMVqe3QES6jbodrTpFoIYW/PI2YxRwaa6buXHaqkH1eRUqX0Y
 UKCgN0Rnxu4apak2WlEYEzgOojZnYX7wc+lEBmN+1wgILyn5RYk41ony0yGUVMxFXWNl
 YiybJU87XJU68uWbuGRJ1MaS4LQrlIUOvmlMshP7HQ4UOPIRvUH+K2iIzJLFLlm3jcHv
 7xXg==
X-Gm-Message-State: AO0yUKU+AAS1qjXhpY7LutqGX9dmiFuwHs7kxpF8CrlVxjfaTZXjPdu1
 17gZjfTfjys1AGBzRwUfj1X52A==
X-Google-Smtp-Source: AK7set+moD3dE5fNEqCPFxLjaD/ubMJ/eQd6cnxx5hbcxP37cmZTnJktA5yDLwgYyU+wnzMMyKZ8nw==
X-Received: by 2002:a17:902:db04:b0:196:5640:b081 with SMTP id
 m4-20020a170902db0400b001965640b081mr4433495plx.7.1674849051682; 
 Fri, 27 Jan 2023 11:50:51 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 12-20020a170902c20c00b001963232f49dsm3220411pll.233.2023.01.27.11.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 11:50:51 -0800 (PST)
Message-ID: <f6f17e0e-ead1-9209-8f8f-070f796cb582@linaro.org>
Date: Fri, 27 Jan 2023 09:50:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 02/16] target/arm: Add confidential guest support
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-3-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> support the Arm Realm Management Extension (RME). It is instantiated by
> passing on the command-line:
> 
>    -M virt,confidential-guest-support=<id>
>    -object guest-rme,id=<id>[,options...]
> 
> This is only the skeleton. Support will be added in following patches.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   docs/system/confidential-guest-support.rst |  1 +
>   qapi/qom.json                              |  3 +-
>   target/arm/kvm-rme.c                       | 48 ++++++++++++++++++++++
>   target/arm/meson.build                     |  7 +++-
>   4 files changed, 57 insertions(+), 2 deletions(-)
>   create mode 100644 target/arm/kvm-rme.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

