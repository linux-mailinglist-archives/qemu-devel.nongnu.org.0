Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184A42FEED
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 01:32:55 +0200 (CEST)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbWh3-0001My-OY
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 19:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWg5-0000Ns-LX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 19:31:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWg2-0002Uq-Rt
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 19:31:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id i5so1074171pla.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
 b=LGE3BySfYXyWi7ah3iBw3Ddb7IrL25CErAshQVgRYsyTeVF7XgKR+uj02MxFxrjo/x
 2TegCpFWukh5/064OO22WObFlF+fbV5SSpms25CFf+ipifvZfeUOkQ1YwSfroRti6eu6
 RpOjhxhqk5wK7WoDkerMUwtgpADd0uQivgkAjMUIM5sppoSCoespi0ke/WwYr3gBHAfy
 HsAhIw/3G9Xn6BtoPSPQHXxMn3e65R+0mFIDaOK5KtUJFS+GMHlbcbhqplwPpZ48A8Xz
 lncGt9UFYDHabJqJVI223Q+TZtJeUOnA1M4UIae7/GCMc2lhVeKlQgSsK4lWJFQxQcAk
 zD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
 b=IpMaAijChemXrIf7XKC3i6GRUXEWGj39XtNwC2qsjZKG8tXZ0FGf5gb+94jv44aenT
 Jnv0MpyNZKD1tvamSl3n/EGHm9G4bC62W2S8kQGYvmHTf5DeoL2iyHadiXv6wEhwnxhc
 vIq4KA+iEQAaNsIRPFXq4HMih6mJ8go+yYkjkIUbXVzS6XeDIZRMu1CLE5nyYb4htrBP
 i7WAFTSSbBjDR1x3f/RCAgIVnA8Rc4cRzpvUdqlUAGtqjHmSKWEVAsKf6creUg3NYRny
 1E3lNrj1TP42xAIpCknXY4UP4l2WI2oGREzaeB+8tjMuRafVB5go6+t5u0Ya0enDsckH
 NYCQ==
X-Gm-Message-State: AOAM531z+X8tuiI4MDYjlBbO6cH4SfjkGo/DnL6solTUckWsAPM6iHdX
 SPNwUMiXFnVfgt6vzVCGgeu+JA==
X-Google-Smtp-Source: ABdhPJxLVFNwEfBgqFJo7OkrYmP42XVo+gL/OyZqM1LgPhGuXfIpT6XiNj5LJxKEIleE+RtWv1hXKA==
X-Received: by 2002:a17:90b:4f4b:: with SMTP id
 pj11mr17103951pjb.4.1634340708825; 
 Fri, 15 Oct 2021 16:31:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u193sm5419487pgc.34.2021.10.15.16.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 16:31:48 -0700 (PDT)
Subject: Re: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20211015124246.23073-1-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adc064ec-b068-cb91-a883-27e4ed77ee88@linaro.org>
Date: Fri, 15 Oct 2021 16:31:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015124246.23073-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: robh@kernel.org, drjones@redhat.com, qemu-riscv@nongnu.org,
 ehabkost@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 5:42 AM, Gavin Shan wrote:
> The empty NUMA node, where no memory resides, are allowed. For
> example, the following command line specifies two empty NUMA nodes.
> With this, QEMU fails to boot because of the conflicting device-tree
> node names, as the following error message indicates.
> 
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=512M            \
>    -object memory-backend-ram,id=mem1,size=512M            \
>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>    -numa node,nodeid=2                                     \
>    -numa node,nodeid=3
>      :
>    qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
> 
> As specified by linux device-tree binding document, the device-tree
> nodes for these empty NUMA nodes shouldn't be generated. However,
> the corresponding NUMA node IDs should be included in the distance
> map. The memory hotplug through device-tree on ARM64 isn't existing
> so far and it's not necessary to require the user to provide a distance
> map. Furthermore, the default distance map Linux generates may even be
> sufficient. So this simply skips populating the device-tree nodes for
> these empty NUMA nodes to avoid the error, so that QEMU can be started
> successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v5: Improved commit log and comments as Drew suggested.

Queued to target-arm, thanks.


r~

