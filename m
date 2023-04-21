Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649C6EA412
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:49:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkYn-00071R-Qo; Fri, 21 Apr 2023 02:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkYl-00070x-Kd
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:47:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkYc-0007cw-6G
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:47:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so9466215e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682059664; x=1684651664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vT1S/8pch9xdES5eAb7wQ5yr/lPPrzTjzaWAz7YaSN4=;
 b=URrXs4xpHok0tqfvtSGPXu6yDmo/J1NiayO7NkfXfPVPilOHWsakVS3Dg+ekb8jG7s
 7oCxNePNu/6jaxt9HGoZQHuDxHwL7+kjWMi5XPjem6D6RuEI9Np2uu9FTcpp/57Z88L1
 TpAdcdeUdWcHiEwdbp44rIciuh1qxaBNk35EOD/mkdQPmO8AyiVGdS86HBjq7IsNTiWy
 kD6tZ0varwutGg/oNBO1GrJmu72PXfjRG6kT+lGs8NQu4+d+ooSC7x/c88HUzXEHQLIB
 LopBZcbc05Jd4RVOxZ6LQMEjtmdii62DQ1574XVmTUMhUakpwWldUVfp0lV99KyPMWBf
 OBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682059664; x=1684651664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vT1S/8pch9xdES5eAb7wQ5yr/lPPrzTjzaWAz7YaSN4=;
 b=ay4PMiFQHEiFXKUmDb0QzZQpHtmf+bmgCJT27VSivY+feESGuKI+uhQOj6G9px73E6
 lL1I7L80i2PWhOpni589V16II1a3T3RqNaTtyDF2hWyxR3eBzfcdYowFooUdXx8L8VP1
 yOWoLHF1AVooY1ATVKHm+Nj8840ZUQQgRyZbGU3pF+x8DAsE4DlkgxdYoXgiBOKCWvuo
 jcdrp7MBrzik3kp4uzhMlXr96b0G/xVJ+APGy/Qismgxh3nALbUIqRUY9XW5qM+y7Cah
 ASUMXC+RylYhLTJsi3+P05VDJ6PegfQEa+Ow4YdCaLR46wiFYjjgV7qJxCWMM4TJErNq
 P5yw==
X-Gm-Message-State: AAQBX9fOgor36DJVNl2UeSuTm8Zl7bFf8rloucHU04V5CDjzKkrmFVe8
 2HRELrhEkdK6zEoKyyg5onx/5Q==
X-Google-Smtp-Source: AKy350ZomRTq4qan3WSd+08ZI6Iwiu/tClIFs0OjYHu1PvIbMmbtCDfazXkR2UUcWdgioOVaUadSUA==
X-Received: by 2002:a05:600c:258:b0:3eb:29fe:f922 with SMTP id
 24-20020a05600c025800b003eb29fef922mr892129wmj.29.1682059664203; 
 Thu, 20 Apr 2023 23:47:44 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm7350561wms.22.2023.04.20.23.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:47:43 -0700 (PDT)
Message-ID: <0b23a90f-c6d3-2ce0-2bf8-9e9f199257b6@linaro.org>
Date: Fri, 21 Apr 2023 08:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 02/10] trace-events: remove the remaining vcpu trace events
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420150009.1675181-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 17:00, Alex Bennée wrote:
> While these are all in helper functions being designated vcpu events
> complicates the removal of the dynamic vcpu state code. TCG plugins
> allow you to instrument vcpu_[init|exit|idle].
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/core/cpu-common.c   |  2 --
>   trace/control-target.c |  1 -
>   trace/control.c        |  2 --
>   trace-events           | 31 -------------------------------
>   4 files changed, 36 deletions(-)
> 
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 5ccc3837b6..8373a500d2 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -112,8 +112,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>   void cpu_reset(CPUState *cpu)
>   {
>       device_cold_reset(DEVICE(cpu));
> -
> -    trace_guest_cpu_reset(cpu);
>   }

Can we convert this one to a "normal" trace event instead of
removing it? I find it helpful in build configured without plugin.

