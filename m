Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA65F6A4F8D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmcl-0005u6-H5; Mon, 27 Feb 2023 18:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmcj-0005tK-Jt
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:09:37 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmci-0002f3-8d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:09:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id x34so7917365pjj.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4KPTbdIYBzUpGRYwy5YxUV9SqClrkc04XskluTXT2o=;
 b=i3o3Zm8jCN7EIXBZRoqZPWWlj7H6b8bHgy1yEsozft+g3QkDdXc1wPw/XVyj1xPu0g
 sXCGTrYheqqj7sgXoMmtrMIiZpvGmM4phbwVMAVPV4VuAfRCuv1IQlCheUoDS20U3Uvu
 DovepDnbrAOyL3qZ3exRWPSexFE28Zzlc2csYCUTgzWSmZgw95baQ0juQAJEDvBsE55A
 g9z84txoHc2PycesN0P0dOc1oxetzX0CxAUpjUVcDyHmjt7lADR1We9lnlcV7NI/8zo7
 frK1kB3MEEFWRpvvRQ/rkge3A02pHy3G5rQp3f3zq28H5CGJyYWGSBjnu9kaZ24TcvnU
 ZMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4KPTbdIYBzUpGRYwy5YxUV9SqClrkc04XskluTXT2o=;
 b=dfQIADoNe/NPJ/dT5CQQZAScqa/GcnezcaD6kDn4s4G961kd2Y19n0dgQd9XghLrYk
 RTPggEP3jHglgj5IkmQf6FVVlqLOqsnxLENC0HG/hJMulWt3Om6yvxXcsD2Jtm+EWGqF
 aUqTdxSCFaZXnds9rhDiN65TlALy4hoqd2+0u8r9q/8HlTHohvkj9NmKJJmT7xRjPMT3
 3bknY84GhhJATKdX9H4k9daEgdpo2s//5eJP3fIFo4tQ7W+T60FR2xOENg1/m2Kbkkou
 DplmTEF8G5wbE9Ueo9WYBU4z+hYdXI+I30Sf+gmQlumE3OxDXlsPbcMqUX+IMXScRT1Q
 VGjQ==
X-Gm-Message-State: AO0yUKWzkxtuTDvT/5eWW/Dxsv7Nlk+sEdlKGQ0qSfuvIwkd6c9ah40h
 sBBxm3lrISLKXUanQn+7dxnytvk0vb4gJKv68o0=
X-Google-Smtp-Source: AK7set/Urxo3+O5sG+BXiIIt/0PAtnENv2a+X5FrnSDUfyRIhOR/+/8F/4j5l8DV2ETV5kgZxDZjDA==
X-Received: by 2002:a17:90b:4c81:b0:233:feb4:895f with SMTP id
 my1-20020a17090b4c8100b00233feb4895fmr830358pjb.44.1677539374605; 
 Mon, 27 Feb 2023 15:09:34 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a0e0800b002312586b5b1sm6601897pje.57.2023.02.27.15.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 15:09:34 -0800 (PST)
Message-ID: <a5b66aee-0c97-96f7-81ca-44fac1289733@linaro.org>
Date: Mon, 27 Feb 2023 13:09:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0 v4 00/21] target/arm: Implement FEAT_RME
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230227230122.816702-1-richard.henderson@linaro.org>
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Gah!  I didn't mean to tag this one with for-8.0.


r~

