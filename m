Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E0A67D02F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4Aw-0008TR-OC; Thu, 26 Jan 2023 10:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL4Av-0008TJ-F3
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:28:29 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL4At-0003YH-Ip
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:28:29 -0500
Received: by mail-pl1-x629.google.com with SMTP id jm10so2090237plb.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5gs0W4LGYvaiwjzgDeY9Bq0ld1NL1LvSgmqCGFbWcRk=;
 b=GmN8kA+ijZti8wUycSxA5Qv/cvcZOdq3upIatEQnsiMrc0p0AkeZs703WRIfPqiCXP
 6uxUQ5QOlp0QofaDgx6BvF2UHVMVK8GVygnCK4CVk6Ctvp+nAddgFGON8vVRA5CgIRYV
 5MvnyLy/nY7UpiReVmx2ioc7X+sQsdik79VCKxq51AeBwf8ig1GPHIqTd/OXKpuSFlrb
 ttgs+aYka8iJOI8qlfwphgHuEj/aBis2HmxWMymmZ0eIwNv10MS9kGLztaSkqfx44pz+
 BPMASK1Fdl1rC4slo/UHmVu2eo7Jn/4sd+8q04/CP58JRQ7j7iVoofNBOAV0aVe+VSkh
 rFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5gs0W4LGYvaiwjzgDeY9Bq0ld1NL1LvSgmqCGFbWcRk=;
 b=ltUqBKYXO96C07niWCPuEUmIsmfboWnpjKYWKTIUWxAVfmhz8g+4yFyBhrUQT2yGTg
 x9WJFxdnbseZlwIHkzVP4Vt208mpBbfOElNDCI/eQ6IFu4TZ9YVOnF1qdXqu5eHjlaQf
 /NPf2nUBGzHbFj0OV0hhM2ppTBgAf0Q2FhuQHgqXX61MtZIDaOiaVuw8L/boHF5aRDpX
 mXjNriY+clBdgjkq5QpjMs1on/wxYS1rV9xyRS/q5U54xucAmxZphThA/UMSc42IdwYT
 6oyyac2qMEvYMzSXreMInn5YjoqWYMN1DjTJ6/ItVPwRybZyirox4ZpTUbDUWmjxGYYu
 4VVA==
X-Gm-Message-State: AFqh2kooI0dLwWO+TmRy3C3Gb5n+3lON5dl9P+D9YsgiIb4G9Iq9FdGU
 06bSBKUJ5D2inwSW2/dgC1x70g7ogFpJS4VC
X-Google-Smtp-Source: AMrXdXvQBwuiZmGMbdzhAK2kgMEe51XIC7yKdyfVmgXlcN/s/fQpQ4WRYjG9HyoVvg6RSubxpW91Sg==
X-Received: by 2002:a17:902:8a98:b0:194:9c0d:9732 with SMTP id
 p24-20020a1709028a9800b001949c0d9732mr34470810plo.46.1674746905806; 
 Thu, 26 Jan 2023 07:28:25 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 v10-20020a170902e8ca00b001947b3ec2d7sm1094008plg.307.2023.01.26.07.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:28:25 -0800 (PST)
Message-ID: <955dc2f1-eccf-bc08-e4ff-c60ac9f716ec@linaro.org>
Date: Thu, 26 Jan 2023 05:28:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] m68k: fix 'bkpt' instruction in softmmu mode
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230126125234.3186042-1-laurent@vivier.eu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230126125234.3186042-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 1/26/23 02:52, Laurent Vivier wrote:
> In linux-user mode, 'bkpt' generates an EXP_DEBUG exception to allow
> QEMU gdb server to intercept and manage the operation with an external
> debugger.
> 
> In softmmu mode, the instruction must generate an illegal instruction
> exception as it is on real hardware to be managed by the kernel.
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/146
> Signed-off-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

