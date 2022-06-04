Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39F53D4E2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 04:32:51 +0200 (CEST)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxJar-0005SJ-NK
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 22:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxJa1-0004m5-Sk
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 22:31:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxJZz-0001re-WD
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 22:31:57 -0400
Received: by mail-pf1-x432.google.com with SMTP id c196so8450161pfb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 19:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Efa2DEa479X/bOcpVHC+dlAOcqS0rNoHJeAOLMDwJ08=;
 b=DLpyhvOqRK3QkQOFnqXT6yzb7OMDqi0GKuGVdBaVdUbL5cGWqTLKoVBctips8Xdg1w
 Wo6QvHz9a6Rh5uyzYVGc8xH9czVYNdmg5cIIHbEE37Up9uQMKxkFFrUBkqFcHOfKdF6y
 JFsUzKOO8nBq5ZiNe3ED1zFX0S0KnD8sgfZdR11m8uZfL5YSbSvBenfQ7EwLHDur8YBs
 /HtxjTkQ1rALE9CBwDIBd5bAuL9oCNI6GSD0HX+uO5E7Ctb1CCL93Fmh9R4C9zAqWXNN
 HYnYWwu3T9U8+XGOMChBfem/SzB9G1kgAoM0kqJ/VINXWiytWpswiRkewO+UCJ7GN9bQ
 hGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Efa2DEa479X/bOcpVHC+dlAOcqS0rNoHJeAOLMDwJ08=;
 b=d1G7oVuuhPM++ISZxbTBbyj3hpqpz4JBJBBHYJRdoMj6F/Q7t/AIRPVc4bMjNw6iD3
 20HzXlxmo2CglWucn7eS4puUj5yNKkxghvoWW6AYDXTkQdBDh2sAr3cUKTZWk7uobO75
 QEjyIz578GNOxyxfa+AmCNMQmMSH9V6TPnXNnjo7EA9AUfyah5n/TyrOAqo8dQc0Awwj
 n7Z+hAuytwVYjR1atSCfIhOzrRGzhrZoRnmFq7S78up3EvzObuPCbtofEpkSImkgEK2U
 0ujZ1vYHXJ8IzN/u17uD1B5vtBVBIbV4v5B4cKwoFLvqyRO68IQqbXLLm5W9BFLYbbMC
 T8cA==
X-Gm-Message-State: AOAM5302VnQhI8QECDffhS3AkJioO/GnrWnZjvQI3SCw0UlibTQsJPFU
 PjQUl+ZFqhR33c15WfVvYE6VA8jGmOIQlA==
X-Google-Smtp-Source: ABdhPJweIzhTNAznsOAxOvYNoxAQP1/Q4yg2GKF/oPnoVaq8Ym1y+flESZAn6CFGhuGDdzOsJQsZuA==
X-Received: by 2002:a63:951b:0:b0:3fc:98c2:4301 with SMTP id
 p27-20020a63951b000000b003fc98c24301mr11537276pgd.515.1654309913707; 
 Fri, 03 Jun 2022 19:31:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 i63-20020a626d42000000b0050dc762813csm6113239pfc.22.2022.06.03.19.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 19:31:52 -0700 (PDT)
Message-ID: <5021fb66-7ae9-30bb-0127-ce6280a90a87@linaro.org>
Date: Fri, 3 Jun 2022 19:31:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/11] hw/nvme updates
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20220603195354.705516-1-its@irrelevant.dk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 12:53, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi Peter,
> 
> The following changes since commit 70e975203f366f2f30daaeb714bb852562b7b72f:
> 
>    Merge tag 'pull-request-2022-06-03' of https://gitlab.com/thuth/qemu into staging (2022-06-03 06:43:38 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> 
> for you to fetch changes up to d7fe639cabf778903f6cab23ff58c905c71375ec:
> 
>    hw/nvme: add new command abort case (2022-06-03 21:48:24 +0200)
> 
> ----------------------------------------------------------------
> hw/nvme updates

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Dmitry Tikhov (4):
>    hw/nvme: fix narrowing conversion
>    hw/nvme: add missing return statement
>    hw/nvme: fix copy cmd for pi enabled namespaces
>    hw/nvme: add new command abort case
> 
> Klaus Jensen (7):
>    hw/nvme: fix smart aen
>    hw/nvme: enforce common serial per subsystem
>    hw/nvme: do not auto-generate eui64
>    hw/nvme: do not auto-generate uuid
>    hw/nvme: do not report null uuid
>    hw/nvme: bump firmware revision
>    hw/nvme: deprecate the use-intel-id compatibility parameter
> 
>   docs/about/deprecated.rst | 15 +++++++++++++++
>   hw/core/machine.c         |  1 +
>   hw/nvme/ctrl.c            | 26 ++++++++++++++------------
>   hw/nvme/dif.c             |  5 +++++
>   hw/nvme/ns.c              |  9 +++++----
>   hw/nvme/nvme.h            |  1 +
>   hw/nvme/subsys.c          |  7 +++++++
>   7 files changed, 48 insertions(+), 16 deletions(-)
> 


