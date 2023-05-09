Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153976FC606
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:13:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMDQ-0000if-FR; Tue, 09 May 2023 08:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pwMDN-0000eN-JO
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pwMDL-0000Ae-8c
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683634368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgrJCwIHZrTDIzT2nevEbjtqD1oXGX9E6nKEzACdZqs=;
 b=hi6o5y5aKJf4gF3Fd17VLrbPSTT+67L/NkGV4nS1Uzuxezwuxc2imMPCqWnwmEoMRYnEHs
 W5r6B/s0e/tekqY+034hnIOLbsP7QWq0cmATq0T2YndAlD8Voa1g4NhvJ5PP2i8tYoElT1
 0HuF+3Z2mtivAskrz/797YyJCemjVaA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-8U8WZj_uN9m49iZb50iM0w-1; Tue, 09 May 2023 08:12:46 -0400
X-MC-Unique: 8U8WZj_uN9m49iZb50iM0w-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso6089885a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683634365; x=1686226365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgrJCwIHZrTDIzT2nevEbjtqD1oXGX9E6nKEzACdZqs=;
 b=Yj/RlSACv52Sw/OZQNd75PJxcOf4/Qxr6oS/LHVguZvgH9teHhGEyaUpzEBO1pxJmU
 Bcg9ewh0kBdDWXtAWWCi4gpF3WN7b7god5SPnkB7Y9BldsrhJzCCS+JdvQs0IXQ1pMCY
 AdgD3JuEdEy429fXRbi0PxO6lhBtlsgcHlPw6yPaXJIcC4hdS63+zMdNt1xIjZgWrO29
 24zzurQvB90b+1kSWJNI+kV7yZD3M7aJ4D1aL8rIumaLc1xG+ufVjzzX0qmZmY+YO+Z0
 66zBefVvfTftSG82iuDPAdPv5sgvQsTwz0eEccd7eTscjvfF0UCGU6f5JuEcPTI1qd9A
 fmsA==
X-Gm-Message-State: AC+VfDyq8lhsYzSU7RSRGxvTFKf9NntMYn+ZEd4SgeqBnLEH7lM3nKXy
 T8m/UwjejaAlPWNd2x10cP7ji0YsRhJ9UVs6rloRclGp5gOsoDJ/qaAYwizEnd0piesa7u7K1M5
 +poeg+2KL2xMa00M=
X-Received: by 2002:a17:907:6d22:b0:965:d7c7:24db with SMTP id
 sa34-20020a1709076d2200b00965d7c724dbmr12273469ejc.32.1683634365727; 
 Tue, 09 May 2023 05:12:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Cxp97HNfBIrCnx0QXvfraAdhYJucZD0Jke0/GtV7rBTB9CyegWeMO9+bfk/o9vYInb21EbA==
X-Received: by 2002:a17:907:6d22:b0:965:d7c7:24db with SMTP id
 sa34-20020a1709076d2200b00965d7c724dbmr12273442ejc.32.1683634365294; 
 Tue, 09 May 2023 05:12:45 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 w13-20020a170907270d00b0095fbb1b72c2sm1268862ejk.63.2023.05.09.05.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 05:12:44 -0700 (PDT)
Date: Tue, 9 May 2023 14:12:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Yin Wang <yin.wang@intel.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: Re: [PATCH] Fix QEMU crash caused when NUMA nodes exceed available
 CPUs
Message-ID: <20230509141243.7ce34dd0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230509064452.759834-1-yin.wang@intel.com>
References: <20230509064452.759834-1-yin.wang@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue,  9 May 2023 14:44:52 +0800
Yin Wang <yin.wang@intel.com> wrote:

> command "qemu-system-riscv64 -machine virt
> -m 2G -smp 1 -numa node,mem=1G -numa node,mem=1G"
> would trigger this problem.
> This commit fixes the issue by adding parameter checks.

It seems wrong to apply this to all targets (that
potentially excludes CPU-less nodes in some cases).

PS:
Crash backtrace should be mentioned in commit message.

> 
> Signed-off-by: Yin Wang <yin.wang@intel.com>
> ---
>  hw/core/numa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index d8d36b16d8..ff249369be 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -168,6 +168,13 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>      numa_info[nodenr].present = true;
>      max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
>      ms->numa_state->num_nodes++;
> +    if (ms->smp.max_cpus < ms->numa_state->num_nodes) {
> +        error_setg(errp,
> +                   "Number of NUMA nodes:(%d)"
> +                   " is larger than number of CPUs:(%d)",
> +                   ms->numa_state->num_nodes, ms->smp.max_cpus);
> +        return;
> +    }
>  }
>  
>  static


