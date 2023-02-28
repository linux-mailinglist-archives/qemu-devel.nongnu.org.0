Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB06A60B5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:50:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6vp-0004Fh-50; Tue, 28 Feb 2023 15:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX6vl-0004EL-3E
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:50:37 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX6vj-000789-6r
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:50:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so358694pjn.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 12:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9tTXMexgD8yr+XUADHp1mgOTel0p6zMRNLFqZycOIKI=;
 b=Vs2aaLAlb+NWKCh19ZRv4tDkHjWbxU19vcr9aeRqMaNqQTr7p3QGmT3zQrlkeN2CXD
 zZxZ2zY50bbahIagJ9QLg20bL+xYCDYvoUrVBYmfFGF3HZkwkvTHJSi0Vpn0BNe5F4yg
 DlB/yXELaR6b6a4aI6VeknHWBiOuhoR6Du9DMw7aD0miz+51DMLWeg8EVAWdpEinxVx8
 1tOs3oa/Qw6KOu1QHA2SKDga4kLN5IuqB6skIRyWyeg524ooCGkyb0eieUl4UWxfpdg2
 q/hfxzMfVq2xneLXJWxPDWpflsNuM4nY1AqDH5TD8jFgIuOyw+vQbWlZ3fqy0f/IX3k1
 RYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9tTXMexgD8yr+XUADHp1mgOTel0p6zMRNLFqZycOIKI=;
 b=yDciuM255iJuMdsoc+kyy+ft1c0MdWzkt6n0O7a0Oz5kQ9C9eqQO9fHW0mBdbzBDrj
 n2xGOrt9I6N8jjZ2zNuEBLRgqnh0fwoIkmDXoKxdG63+2cRBrZV6BsqWuaaWonkintBw
 AKvdOiN4RfrFSKeWa93r6+FJgUjJAq6dl/B9bUoGZ+NyGgivWIH9W2hR5jZaZtkYIK12
 2uKCvkgbaU+Ew4aqQ7JfDcyGX93zCuUsWt0y2J514XHTYyPD46PCUCrqyWgURWLSFaJZ
 72LOiXPaRVUxImV1vlgDfIxZxj0nDakwIC0iay9w4QjVpzW0RkMPDjX7drafcnvQsiuf
 oFzA==
X-Gm-Message-State: AO0yUKVY2ieEeFABWrJvKIRIOXKllQobPKGn7zPQ0MlowDDrkgZSZrQ0
 fF0AMVHPO8WdGq4cITgDBHO4ww==
X-Google-Smtp-Source: AK7set8Xuk93ZJtWorh730uts6QrRR4yS3gShK/jXD6Jb2W7sGnCuUUBHgyTdPNM3CZqNYnW8MFpqg==
X-Received: by 2002:a05:6a20:3947:b0:cd:fe1b:df8 with SMTP id
 r7-20020a056a20394700b000cdfe1b0df8mr2279655pzg.56.1677617431844; 
 Tue, 28 Feb 2023 12:50:31 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i23-20020aa787d7000000b0056d7cc80ea4sm6475810pfo.110.2023.02.28.12.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:50:31 -0800 (PST)
Message-ID: <e1fc5734-2548-eba1-cc14-5f2a6482fba0@linaro.org>
Date: Tue, 28 Feb 2023 10:50:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] plugin: fix clearing of plugin_mem_cbs before TB exit
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Eli G. Boling" <eboling@draper.com>
References: <20230222043204.941336-1-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222043204.941336-1-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 2/21/23 18:32, Emilio Cota wrote:
> Currently we are wrongly accessing plugin_tb->mem_helper at
> translation time from plugin_gen_disable_mem_helpers, which is
> called before generating a TB exit, e.g. with exit_tb.
> 
> Recall that it is only during TB finalisation, i.e. when we go over
> the TB post-translation to inject or remove plugin instrumentation,
> when plugin_tb->mem_helper is set. This means that we never clear
> plugin_mem_cbs when calling plugin_gen_disable_mem_helpers since
> mem_helper is always false. Therefore a guest instruction that uses
> helpers and emits an explicit TB exit results in plugin_mem_cbs being
> set upon exiting, which is caught by an assertion as reported in
> the reopening of issue #1381 and replicated below.
> 
> Fix this by (1) adding an insertion point before exiting a TB
> ("before_exit"), and (2) deciding whether or not to emit the
> clearing of plugin_mem_cbs at this newly-added insertion point
> during TB finalisation.

This is an improvement, but incomplete, because it does not handle the exception exit 
case, via cpu_loop_exit.


r~

