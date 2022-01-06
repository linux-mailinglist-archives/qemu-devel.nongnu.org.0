Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6E4867B0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 17:30:56 +0100 (CET)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5VfD-0007E9-83
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 11:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Vdi-0006ZE-I6
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:29:22 -0500
Received: from [2607:f8b0:4864:20::52d] (port=36591
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Vdh-0000Iw-42
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:29:22 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 200so3033133pgg.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=33eljgW+O0ihDkcegRRiQOnccB10RmZ0yKCTw5ArSg8=;
 b=GFMq6m94Smj9CxFekv/jhgP3HuwUdOH7jBInuZPbJJmZHesnRi6tajlg3tz/3a99+Y
 le7Bvzi4BvAehcNcjyCzuhbqUbT5uRuXyvt7mET2NIU0vBeueGG+phy0nAGwnzo0r6jQ
 WvsLV5/3THTU1GmC9j0wBVeRtOm/tjsS4My7NHuRgrjyRuOhlbR0ZDWVzDfh7Eit7sAp
 LBFyZfThGN6eEIkFNHtz6SXBdid/Ksu8WsJzqZySTLYyKkgg4zD1SkSYrOtl5UIVR6Q3
 rWRKQh4eR2fmLYRVH1shNT0FjeqcZM+J2SrZ/ndVUjfnP9eubY902W6y9AYtBXAJuOzY
 byUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=33eljgW+O0ihDkcegRRiQOnccB10RmZ0yKCTw5ArSg8=;
 b=j/8egD6Ff43VOnUOHS5IFmB/7JZvDdl8oR+c5iMJUBMSGz39R3HXt7h9TmQudQcCAR
 WY3kkUhesbBrlzDDyjTylcXaCnNc7O0TnFGRFMnKs6BsjftSMxuX2cLFMkNsHPSl32lS
 0dZlc2EBS+IfbjaenSBt5b5zKgkmr6s5UFPD7jNBsCKoO67PdF026RkMWsYLefTdkjm8
 QIdcoWeev68I4jGfswSi83+KYk0vNO5ajx7h6DNpBX7vIVcN41I/d70om/w7ZaYPM+Jc
 vrASqTZFJEkH95kWuWkXRm8n0HMqW+QIk7rkZ1zqj79EgCIx0ZSHeQNMRg3IUtv643DL
 LcwA==
X-Gm-Message-State: AOAM531gaQsAGQ1CTCv1eQoCbcCMDqSVLofy2dFw2mEWIpnRBrm0ufXx
 nRxlL1JKqxaRqMLb2uvZiubOokth4EH7Iw==
X-Google-Smtp-Source: ABdhPJyd5ahO3JTmELB7pdMRNIjI4R+EZTjCJ3Kd8dfN1Ag4au/sbJ/QLdVPYq+SfzcIdsDl8vyWVA==
X-Received: by 2002:a63:8c5:: with SMTP id 188mr52607688pgi.13.1641486559578; 
 Thu, 06 Jan 2022 08:29:19 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k141sm2806662pfd.144.2022.01.06.08.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 08:29:19 -0800 (PST)
Subject: Re: Rational behind partial AVX support in Qemu
To: Stevie Lavern <stevie.lavern@gmail.com>
References: <CADV2EAtTPjHP=H7AMAdva7UjydjM5DwK=NDAm3HYM-MHeD9wyg@mail.gmail.com>
 <49a5b6c6-8618-a9fc-2cec-ef60b8b59d62@linaro.org>
 <CADV2EAvZ_=AJbQNr4vnFFY5W9HmZjDw8kVm3ubaQ=mvsG37=Vw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bfc479e-5929-20eb-2e94-8e0818c7f6fd@linaro.org>
Date: Thu, 6 Jan 2022 08:29:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADV2EAvZ_=AJbQNr4vnFFY5W9HmZjDw8kVm3ubaQ=mvsG37=Vw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 1:14 AM, Stevie Lavern wrote:
> Do you think it qualifies as "trivial patch" or should i go on with the full patch 
> submission process?

There is no "short" patch submission process.


r~

