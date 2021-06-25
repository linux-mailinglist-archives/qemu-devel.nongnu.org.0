Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DACD3B44E5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:57:31 +0200 (CEST)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmKo-0001Gg-Ch
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lwmK1-0000Zg-Om
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 09:56:41 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lwmK0-0000gl-7A
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 09:56:41 -0400
Received: by mail-oi1-x22e.google.com with SMTP id h9so11398883oih.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=bGRuEcffTgE/DjASXbKPlM9Ls/015j5CDcmhD+fyQ/k=;
 b=mQkfVrXwwIR8/eLdPgBXPqp4HYTT9oUfql8XMA1YiITybCQBjpr92zgVSIGMzRRfI9
 UfnPReevigitvUpfZJwfN/SXlVJ6NFtobmva2jZXLz6uazz/TNq0mEb9f24NxPdYfieI
 7t/rwBY5W6C5mcTu4qwjTnb4XRQQadKlfg9C21VhRSo56/dGcvUAxM6yhdMRrNsRqDiq
 qF0LS2+yNUXlOP9S1j41rrZOuL/++xFVc5fcX6Jpl6zT4uOoDQcIZU3GY9hdYikAYTqy
 k+/Hvk2GKaWMlxHWboVGwe+yPHdD/EcRKKIKjePR0p41OhNLwexE3XXHv2QmUjCQbWhg
 5iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=bGRuEcffTgE/DjASXbKPlM9Ls/015j5CDcmhD+fyQ/k=;
 b=ahmLTGOaf4sPZZxsl94wcMqVnaprrwUOG6NS1ztomLmtqqt7t8EFTThaQO7IpYPbe9
 XiEiW66Sz9D3IgFMDDvIJWjIGppBsYtbBQne+vxnzqjrTQNnIn0Ro+4T9uZCdVEgJMA4
 aegPmSYybQkYuJWQJroc0xh5XrRnubHlnumW3t+8FejdWtgHSjPdjpN3j9d8K6+wp3Ng
 DEkYSbqDwkdCi2imms9zvaGTQzVDONDtP4XiaY8IuJB8Ho9yaYPO1trl5wRZIihLwNvs
 wQ95u2HA0z6a/oZKjmdR5/34FvHKT7KdeYUbZtE6cdHZXyOh4kmvB7QOceyGe36OAMuL
 jLhw==
X-Gm-Message-State: AOAM531FbNeFuYDMsLCKhJCQjWJS+XrOiwuAP/AcjSYReaVUOta8jGmk
 pxNmJYgGbEdAL2Z5Y4pGZw==
X-Google-Smtp-Source: ABdhPJzb/NES7R4hnbjCspgobJP0W483Z9L2mt4zZiEDudjjpb4l4Ui/F8VSywJNmtB+uGNN18e1YA==
X-Received: by 2002:aca:3bc3:: with SMTP id
 i186mr11247991oia.102.1624629398465; 
 Fri, 25 Jun 2021 06:56:38 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id r1sm1413275oth.19.2021.06.25.06.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 06:56:37 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:a9c6:c9ec:83f8:5644])
 by serve.minyard.net (Postfix) with ESMTPSA id 49C7618022B;
 Fri, 25 Jun 2021 13:56:36 +0000 (UTC)
Date: Fri, 25 Jun 2021 08:56:35 -0500
From: Corey Minyard <minyard@acm.org>
To: Jinhua Cao <caojinhua1@huawei.com>
Subject: Re: [PATCH] ipmi/sim: fix watchdog_expired data type error in
 IPMIBmcSim struct
Message-ID: <20210625135635.GL2921206@minyard.net>
References: <20210625021232.73614-1-caojinhua1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625021232.73614-1-caojinhua1@huawei.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: qemu-devel@nongnu.org, eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 10:12:32AM +0800, Jinhua Cao wrote:
> 1) watchdog_expired is set bool which value could only be 0 or 1,
> but watchdog_expired every bit mean different Timer Use.
> 
> 2) Use the command  -ipmitool mc get watchdog-  to query
> ipmi-watchdog status in guest.
> ...
> [root@localhost ~]# ipmitool mc watchdog get
> Watchdog Timer Use:     SMS/OS (0x44)
> Watchdog Timer Is:      Started/Running
> Watchdog Timer Actions: Hard Reset (0x01)
> Pre-timeout interval:   0 seconds
> Timer Expiration Flags: 0x00
> Initial Countdown:      60 sec
> Present Countdown:      57 sec
> ...
> bool for watchdog_expired results -Timer Expiration Flags- always
> be 0x00 or 0x01, but the -Timer Expiration Flags- indicts the Timer Use
> after timeout. So change watchdog_expired data type from bool to uint8_t
> to fix this problem.

Yes, you are right.  This is queued.

I checked, a bool is sent as a byte, just like a uint8_t, so the vmstate
transfer should be ok with this change.

Thanks,

-corey

> 
> Signed-off-by: Jinhua Cao <caojinhua1@huawei.com>
> ---
>  hw/ipmi/ipmi_bmc_sim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
> index 55fb81fa5a..905e091094 100644
> --- a/hw/ipmi/ipmi_bmc_sim.c
> +++ b/hw/ipmi/ipmi_bmc_sim.c
> @@ -189,7 +189,7 @@ struct IPMIBmcSim {
>      uint8_t  watchdog_use;
>      uint8_t  watchdog_action;
>      uint8_t  watchdog_pretimeout; /* In seconds */
> -    bool     watchdog_expired;
> +    uint8_t  watchdog_expired;
>      uint16_t watchdog_timeout; /* in 100's of milliseconds */
>  
>      bool     watchdog_running;
> @@ -2110,7 +2110,7 @@ static const VMStateDescription vmstate_ipmi_sim = {
>          VMSTATE_UINT8(watchdog_use, IPMIBmcSim),
>          VMSTATE_UINT8(watchdog_action, IPMIBmcSim),
>          VMSTATE_UINT8(watchdog_pretimeout, IPMIBmcSim),
> -        VMSTATE_BOOL(watchdog_expired, IPMIBmcSim),
> +        VMSTATE_UINT8(watchdog_expired, IPMIBmcSim),
>          VMSTATE_UINT16(watchdog_timeout, IPMIBmcSim),
>          VMSTATE_BOOL(watchdog_running, IPMIBmcSim),
>          VMSTATE_BOOL(watchdog_preaction_ran, IPMIBmcSim),
> -- 
> 2.27.0
> 

