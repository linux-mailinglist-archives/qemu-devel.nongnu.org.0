Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EAE3AA3FD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:10:22 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltavd-0005pU-0b
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltatt-0004oJ-37
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:08:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltatr-0004aX-0i
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:08:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso2330277pjb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYfnLa00UI0qukSRvparSJyuImMdHp72nxxOcjpifdY=;
 b=L5Y1KC6OROQP/QLxDI2gugRBekAj4SoeCm+w0LfoIecRhXO+kHHHQ9VuT7iywv5I/V
 2Z6GCazB2jfwHLbtG8BSBZir31Upeeod+CJnNKFL1iuFeaEa1KHdaqFCba2vynGLcFmv
 6SSaYyVdNELKV6ZI4HIsmppPpcpDkF+7vBg86OGpORWBVL9urfcVL/NH0UW/8pzNlbUD
 +AyjBXbu7lqZIzQ25DJeV75ohRiREK0lmmL+LcRUSC8WOAyddkn89IFDQaA8wefqlnY9
 S3TSjOEssTgALDLBcaB7jq2c3NYX6fdgYVYl5XXn7YpOVSPgSrSdF7k5lbeuz+P83IOl
 zZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYfnLa00UI0qukSRvparSJyuImMdHp72nxxOcjpifdY=;
 b=pApallKCPwSyy5yhBRmP9cd99aCmW0QwucYFzGzPFFQbw4ofXXGD6bUdBZXbROKIye
 8lHoBYBagwX1x+RyjTK9QA5w4Elcvc7Riyqzo7VzpU1VxdmhWLuIHAHc35ObWO0j1jFf
 1Qb5wLgfG4zDdOuUnRdIZASYNh7OLMZc11r30LVVoHzsfriik38adekcbYerle/esANb
 g/kWupsuNoRZ/t9g0RnKfRGMQGmQUAp05rSuyF/hJusOKMfL4cbTV80xHkPit2/xZPvG
 sNNlPT0qWqKIhJaeLHYmIP0wnn+P4T9q9GQcTi/XY9qfv4k6WS3jfsMfsseksXFpBbiD
 S3sg==
X-Gm-Message-State: AOAM5320OBX7t0hxsPkUiEO+j7ej+45cJOvBUzNxRFsBSUou5pJRSWMj
 KoPlzZ3xy0Tmq9W5jcE6e55CiA==
X-Google-Smtp-Source: ABdhPJyh+SocPESJzTneQLgq67NNSBIrnzNCRcumj50JIo5t8X9E+ORmpoK8aC5DsHZCWTRoPfnEfQ==
X-Received: by 2002:a17:902:fe03:b029:104:12b5:954f with SMTP id
 g3-20020a170902fe03b029010412b5954fmr994163plj.85.1623870508787; 
 Wed, 16 Jun 2021 12:08:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ei10sm2800231pjb.8.2021.06.16.12.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:08:28 -0700 (PDT)
Subject: Re: [PATCH v4 1/7] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea427ca6-97e8-8e93-d0bc-07e85c98a366@linaro.org>
Date: Wed, 16 Jun 2021 12:08:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616162225.2517463-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> Introduce the qcrypto_tls_creds_check_endpoint() helper
> to access QCryptoTLSCreds internal 'endpoint' field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/crypto/tlscreds.h | 14 ++++++++++++++
>   crypto/tlscreds.c         | 12 ++++++++++++
>   2 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

