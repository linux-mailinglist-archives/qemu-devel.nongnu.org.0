Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ABE6A8B43
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:52:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqqW-0003JP-6V; Thu, 02 Mar 2023 16:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXqqT-0003IQ-Vc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:52:13 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXqqS-0005sE-I6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:52:13 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so399280pjz.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677793931;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieSoJcaOWqu1+gzVsbAHyB5cR/JO2pjPPIVHBooisJs=;
 b=HYb/jjj3lJylRQd1yalo/eIS3XJ8Pr6O5vk09pzL9XCGR5AHcojCltS4P6KRnO4TDQ
 tsNtP73+rFp3D21DL/xFkVDR+zEGG+rbkm2UHTFWIFMgo2Pfz7Uqe/Nm9ymEH+y0xyU7
 aKg+iOJXchOqByt4tvBX4YxLMjXRc0bRSdQjIFOoJm4O+vI2ltRR8FaK5c/q5Nd5Nq+A
 qyScBhyqqLRgyK2Ev/+buw95qutMJaZL7vJdLbCHJSlUOV+pDR5UAmhv1gcP7FbtRtBo
 uawzyXOSj/ToOZxtAUWnpRFiIYpgz7D4SqbMARKnmBr0/eQZEuQnLLdh4YOPr82VnpUX
 duQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677793931;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieSoJcaOWqu1+gzVsbAHyB5cR/JO2pjPPIVHBooisJs=;
 b=IBu1BxUdWAwnptsTHyH+TZxZjgoXjKOm/ZtbdC9XAoiFcn4VlYpC7wn4q/41fpujIj
 Bi9WS1T6+L/B0x+pWNvMICJzD6nF2IlWMtLUq4/qHL3VPcdrmlBj3rEbioVgIEHy32w6
 Cdu+0lL4jNoBdew1HaLVKMH0P/YroPtrnl1wRhFkiYFwWSZp12RXRSpeDvRbADC2bQ0b
 K4Ny/mdtAmKmDPdsaPZHoeMj1/q8W8vOEkmSBNMiSUO/iT+JKZbpwCVVAVD5cf9vCrgT
 S23tGUrWJPe11nt3mqpyTs1SHAfXXgJWHxtdhrlsq955xwLN5bV4S0ToGbOUga8ES/rc
 iV7w==
X-Gm-Message-State: AO0yUKVKVk5lnpTyVn7w23IpU1QE/v+QzJeT4tMZpSDq4F76lg+1/ZxE
 o3MIpb6Zb1qep+VpH9SNCC7Cag==
X-Google-Smtp-Source: AK7set8psUHohQhUv6Vf3hJltzFUfMwzRVLX1dS5EhNaL0ztWjMFqAGljfX9upJldRRJ4TkSQR8v7Q==
X-Received: by 2002:a05:6a20:428b:b0:cc:9010:9ed with SMTP id
 o11-20020a056a20428b00b000cc901009edmr12116028pzj.31.1677793930989; 
 Thu, 02 Mar 2023 13:52:10 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 w3-20020aa78583000000b005abc30d9445sm142436pfn.180.2023.03.02.13.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:52:10 -0800 (PST)
Message-ID: <15d60ffb-e2e1-0912-3a75-fbae55261804@linaro.org>
Date: Thu, 2 Mar 2023 13:52:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 23/26] testing: probe gdb for supported architectures
 ahead of time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302190846.2593720-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/2/23 09:08, Alex Bennée wrote:
> +    "powerpc:common64" : "ppc64",

[ "ppc64", "ppc64le" ]


r~

