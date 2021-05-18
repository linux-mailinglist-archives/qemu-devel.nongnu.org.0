Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62068387623
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:10:04 +0200 (CEST)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwfr-00029j-Ey
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwL0-0003el-Cx
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:48:30 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:43634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwKy-0003rC-G2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:48:30 -0400
Received: by mail-vk1-xa33.google.com with SMTP id u205so1921753vke.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FGaogW1hAtDAhq/6CYOUSguhQLSFzgJuNW776ulHIhw=;
 b=D/HsUg8z4bqauCwVFykhLvN/WT1K5l6XaXHcVSYModV3qyrH+Jqj2+Hfleod2gG/Be
 J5ytaGPn4RDM/LpmYWCSXeFq6zlLb7yKyFY73bSUo/sWmuUagA6kG/GMJZlgMnUkVAii
 nUTUz73dqCzXfEVLxJrHvSWkAoyeukIQlE9Vw6N31qsBv7UuqoXiNxEXxUw/iNA432J3
 qUGkIdodmEF9xwYvxVWmjC5J4t3rXOUO2nNCSp1PjzM2y4wER76XFGQAfUPacFgDO+pq
 4Z9Y/8Wsp8q/eXIjnmGZ5u1JlrsyAhcLFZ39VagMaSpZIJTKu984YcsNZQLD+yibaMJe
 z+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FGaogW1hAtDAhq/6CYOUSguhQLSFzgJuNW776ulHIhw=;
 b=iqsGevabk3f+pvrJebXAbCLfNG00lNbm3ym1esdQgG28fsL/wiJ2vN7u6Fec1FA9Yw
 afAmmAH7vC7E582vPbTzGLwymAOJHr3pHGjhK60xoNuJ9uQUCy3s5RbELyohdGjbydei
 WmTggjuCYCabX4kKDMWGZVwif+tvltEBnkacsq9Itxags7OnkYuA8UITACasmDxyTHbN
 c5m77EjQE+27SH7opsLO9DBCDl/4dD/qmBv1ZWVpPhpGYIh8ymh0U9Mxoal5/WdkEW+L
 2oh89XpLCKF0cbL4wqmI6OlhLCCdWu9VnoV73f+63vlDbpweybaMmNIaNqMsHhc0WtPP
 AEww==
X-Gm-Message-State: AOAM532+kZjTKpnUtYxvbqgS/HMpIK0cgwLYIVqht5LWwZ/nrB0tk8HP
 AfxA1530Lfmz/YuAzK/PpCI9Aw==
X-Google-Smtp-Source: ABdhPJxSwK8043uixlPFPbFJ6rIcah7sZheTrt6lUwI+zySiDo6PKXljQBbEzqfaTsQZBS9PNYO6FQ==
X-Received: by 2002:a1f:df07:: with SMTP id w7mr5015189vkg.10.1621331307207;
 Tue, 18 May 2021 02:48:27 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x24sm873850vkn.40.2021.05.18.02.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:48:26 -0700 (PDT)
Subject: Re: [PATCH v5 19/23] target/ppc: Implement setbc/setbcr/stnbc/setnbcr
 instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-20-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4170981d-fce9-183e-2d58-8c419a844da9@linaro.org>
Date: Tue, 18 May 2021 04:48:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517205025.3777947-20-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa33.google.com
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

On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
> +    if(neg) {

Missing space.


r~

