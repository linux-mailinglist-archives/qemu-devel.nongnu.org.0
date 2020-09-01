Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E58259DD6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 20:05:36 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDAf1-0004U3-6q
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 14:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAeC-00044a-3A
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 14:04:44 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAeA-0004JL-KD
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 14:04:43 -0400
Received: by mail-pf1-x443.google.com with SMTP id d22so1258574pfn.5
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R4NgC7Vm6JH1Qb5iAi0jM+XJUlte8bnHVDbh2tm58zU=;
 b=bmKZM+xDuYpvdGv7wW7VTh5ixzBbqR2kZcgiNI2vAA6DgmpSQmWcYx6fkoZKkilSew
 S6dCyNrIb3BojtoXBObEER+S5r0EbSY4Qd3cXUgG6BcwQhwtXVAVXAJ6n8ic3PhVLRS6
 w8DtWhTXhpGwpsUS874U47rpmvTy6VCbMvFl1KzcD/ifd7S52l+aiEb4HncrhLrmAjuR
 EXyoL+O2+WaNrgyk6qS9wvBvCmBO+oG5DEWjAsBu3orQd+qI+NYmIQvz2QVvKceKbvf2
 ZVqLlyuVU2ANWOCUk8J9uzFDYmO3OgiBR7xJbpRAWeN/08UOIQBWWcvS4ivJrRlb5kyY
 GfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R4NgC7Vm6JH1Qb5iAi0jM+XJUlte8bnHVDbh2tm58zU=;
 b=OFmIGm73Tk2rekxV1qPlsLWff9D4BMFEr9wGKCFB1RxC2TeKdoHc4acd8E1GROwV8I
 r1iTS/GpOU75O7uVmU7Eyz99yV1TaSvJWbMiUDLwYKGQqc+dEXAs+Nf2DWCjsV/Kz6b5
 sStwKPMektulTcXSJaHYzcnbezy4x//GVcyYlFc7vCiKE3rIJBPVIF5dlW49qetaiREY
 KJGbbTWXWM54TDXJV3//MzJd//rZ47g0QGVBKH9Lf2hixYyb4ldADztuuTgtfJlrLeDD
 dikroNMx2QMyO/7YnGdqKnGsgLW/0V7p83nXSkIcQ/QIJkCz+oTB5FNYUvRlCQJ1GM8s
 oXUA==
X-Gm-Message-State: AOAM531fG+ZxF9L1wEW40P3C9DrnzTTvHK6AhYOdx7FJijaBsD9mUVr2
 Q/gYLwveJjOAFgQp4dJYSWjBiA==
X-Google-Smtp-Source: ABdhPJx2BVnuEIUcawKXOn9vHqiMSgYiRSWBIB+Uv5/IMNXWkAvHQrf5oXseWaubSVXbiWtX5vYoKQ==
X-Received: by 2002:a63:2a96:: with SMTP id q144mr2576373pgq.447.1598983480788; 
 Tue, 01 Sep 2020 11:04:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v21sm2122715pjn.4.2020.09.01.11.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 11:04:39 -0700 (PDT)
Subject: Re: [PATCH 03/13] oslib-posix: default exec_dir to bindir
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200901062020.26660-1-pbonzini@redhat.com>
 <20200901062020.26660-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b922b8e3-4ba0-f035-014e-c77df254d6de@linaro.org>
Date: Tue, 1 Sep 2020 11:04:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901062020.26660-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/20 11:20 PM, Paolo Bonzini wrote:
> +        exec_dir = g_strdup(CONFIG_BINDIR);

Why the strdup?  The string constant should be fine, IIUC.


r~

