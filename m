Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAB37F606
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:55:46 +0200 (CEST)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh90M-0005wM-27
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh8vR-0005kz-6R
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:50:41 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh8vM-0004Xq-HL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:50:40 -0400
Received: by mail-qk1-x72d.google.com with SMTP id f29so12778762qka.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8AerOAYqcrbaUvzL9mwpOlr8KwyjpN2VoNwDAe+MgFI=;
 b=TVcNWgmg9sXnffmFjKLzUxRDD49zPCfG9Q3LymZF8WGcFwU2Xz+UAmcpS+GKgxr4Y7
 iVOpu9oRnwSdyKxF6BbpQULPXvAEdefjXjZNMJBQXk5hS1lKtNy9QbJyh+TYYuqmejk4
 VWKgpkwoeqdX7Xb0LktZn+deZEgnSFEteYGcciAroyF6uP5AKI2nH9BjJs6c3Y1ChF6R
 V/ZdYtJkyGO3vgnocm3OyQD9YIQ49tslmE1jgXlBl+blRlktjwhPK2IPR7m1kLG2Q9sY
 unGYLs8WMddWtLR0e0y/IGv65xEmxVuyYqfnx13e6YJwbC5xOzco/ZsVRHVqFCYbg+jj
 E8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8AerOAYqcrbaUvzL9mwpOlr8KwyjpN2VoNwDAe+MgFI=;
 b=lcF9UCj1OUBgA1ZMKJ4BLYIqj4c0WAUUA/+XhJPHXTRAOco+XH4vZEoo9lExE8OUCJ
 +Mcoho3e02oqDSH3BhnG0ojDMb1IPw6hNqrQULkap+BH/Fv4aocFnYfq3K5y+N/8PGdg
 GqCfS7fVeeQbfC9v5QXVbwVwZa6ve3imbI+oQw0xtM8UdvjWGGic8zB3Q/OSlHKffTJo
 W9qDjsrU/Vl8flZjsZBO88e55sGLvSJEHGtyrGtg5rPuhzc0sfC5qKq0DbCKuX2/+aBw
 8e6YuO5alQUkcA9w4Qvom6ifk1E9MLFZBq1WtIlxRvwfL+scEbJfGy1/24EXKUxMGcKL
 +mkA==
X-Gm-Message-State: AOAM5334hJWsG5eSU+CaQu6UCjKIgU/q8uy2uXAOSwMxfCyjxxixUlM9
 JxZkG9Vgn9cPQ1UAIqz29uc0pg==
X-Google-Smtp-Source: ABdhPJwah2K7i/fAO5HW04WkrA5Hr3yXYoYwU7Xc9quVMOCB9aUzjFTt//HCpcOYn0iWXIkjSndiCw==
X-Received: by 2002:a05:620a:13ac:: with SMTP id
 m12mr37047211qki.77.1620903035424; 
 Thu, 13 May 2021 03:50:35 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id a19sm2205605qtn.97.2021.05.13.03.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:50:35 -0700 (PDT)
Subject: Re: [PATCH v4 25/31] target/ppc: Implement prefixed integer load
 instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-26-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2bdf1ef1-0d0d-7573-3039-e422e5afe3c7@linaro.org>
Date: Thu, 13 May 2021 05:50:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-26-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> +PLBZ             000001 10 0--.-- .................. \
> +                100010 ..... ..... ................     @PLS_D

Mind the indentation; looks like this got perturbed by prefixing "P".


r~

