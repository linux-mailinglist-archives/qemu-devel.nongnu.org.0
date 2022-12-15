Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32964DEFD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 17:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5rSd-0001d4-Sx; Thu, 15 Dec 2022 11:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5rSZ-0001cQ-Eh
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:51:51 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5rSX-0007SH-EA
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:51:50 -0500
Received: by mail-pg1-x530.google.com with SMTP id f3so5897pgc.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 08:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2H97ILkvgoMgr2Z2i1AQhw0MihABUqtyp0El7sS0Vp4=;
 b=fXxvrr2Ilp1WTcol3fyf7OhWi6aRHmxVdZZliYQScdwopFwriGf7wl9A68Dx2QMCOe
 ypFYVxsHGyPedzLACLPJdoQxkQFqEdO2myn0o5criq9EB3bgQGPLYH+Qk0e7WLtGadpt
 U3jwuaAB6/8+NNcYMSGfTZTL4OA7iZ9wba823oEYHXvEcu71qy86VBRw6mDuPxWzjlfE
 /dzTQTHhu+r4LzwCUq9kv4jTDc+b/5imDtr9apRSAPhvI0Ymw7LOY2UFmtJXyL5tdKL+
 T3FHxG85CwQ3nVBriiywfVNLO0TeXUOlyK0Kiu4fcHBN4LONhqoQI5dQJD6TfCSZXW4D
 bhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2H97ILkvgoMgr2Z2i1AQhw0MihABUqtyp0El7sS0Vp4=;
 b=TB/DjQN9AlRF0FFKviNLONof5RsUwxITlcfgbEvWZeSN6Nzu4YIDzzD48hOkZsCHir
 QWrv+a+P9GvGHo1CgNtFnNqipATuLkYSZf3IgztqUffVOehGGx5ZXCkrlC4NFFN7U/wS
 rSXMpN2CXz5VsJL8loCzrPn+Imp3IKac+WEB24ouy9sv1W6kf2NcWNM3R6jIOrssObRj
 Ec6Lk+oxNv8UXUYAyJ47ZevuLfOsQHGMQUSFgFfTCddrcDOqFWmjY86dSLGnIsytTG2x
 uVd4jlMIZvKeB6wh5+42dntqnFRIEh3iSgZ+ql5OSkqDpJTJ2B1DpTsDuIobDPApOuLk
 HATQ==
X-Gm-Message-State: ANoB5plSQOS3PLFxpJrVgM0LuJspgAKhvxhR8UDDtbMCtw9yMt26E5pk
 BL5Q9SXI4Lhhb3BG8We6YcZyZw==
X-Google-Smtp-Source: AA0mqf6uCxcOQfopg/m16K0t0zganNIhYMzHhHOzJzysKDvHEO3ggVfMJNAOu/kgDf0MPZw0nexKVA==
X-Received: by 2002:a62:2905:0:b0:56b:ff19:bad5 with SMTP id
 p5-20020a622905000000b0056bff19bad5mr24575877pfp.0.1671123105316; 
 Thu, 15 Dec 2022 08:51:45 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4?
 ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
 by smtp.gmail.com with ESMTPSA id
 x23-20020aa79ad7000000b005781f4577e0sm1959184pfp.108.2022.12.15.08.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 08:51:44 -0800 (PST)
Message-ID: <b9d44109-dd99-6d74-ac02-f716f001a7b8@linaro.org>
Date: Thu, 15 Dec 2022 08:51:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] includes: move tb_flush into its own header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221215140933.2337853-1-alex.bennee@linaro.org>
 <f0ae5daf-ec43-aede-12d1-a6dd4406c28b@linaro.org> <87r0x0ipfm.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87r0x0ipfm.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 12/15/22 08:46, Alex Bennée wrote:
> I'll rename and include when I send the gdbstub stuff. I don't know how
> far you want to go to eliminate target specific handling from the rest
> of TB maintenance - indeed I'm not sure anything else is possible?

I can't think that anything else is possible.


r~


