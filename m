Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715C45D7FC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:10:02 +0100 (CET)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBhY-0002ws-Rg
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:10:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mqBfz-0001Rj-Dr
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:08:24 -0500
Received: from mail.xen0n.name ([115.28.160.31]:52242
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mqBfu-0006gG-S7
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:08:23 -0500
Received: from [100.100.56.238] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 88E8A60184;
 Thu, 25 Nov 2021 18:08:04 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637834885; bh=AditrSudZFn6UhrOMR4HpkUQow81pJVO8Vt//n5FeHs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TfGUD+Mq6Mki0Iv8CJbKH2G5bnYff4Ni2/eVtzkQ0ezYx32b9+2PCQS+B9pSX553c
 Q6eH8cILETpXDTSxKehHHstREAVarKQPl02j0WhuU8Y3d/xbNS8J9gNll9iB6YYlkw
 1qFkC+tGehh2SehHDyJY+udvWcznXGr8yc+Eue0E=
Message-ID: <f53f4fef-2ed9-3e9f-3104-ac4780819115@xen0n.name>
Date: Thu, 25 Nov 2021 18:08:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH] linux-user: move target_signal.h generic definitions to
 generic/signal.h
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637830541-3222-1-git-send-email-gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <1637830541-3222-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, laurent@vivier.eu,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/11/25 16:55, Song Gao wrote:
> diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
> index 943bc1a..ceaf8a8 100644
> --- a/linux-user/generic/signal.h
> +++ b/linux-user/generic/signal.h
> @@ -55,6 +55,22 @@
>  #define TARGET_SIG_UNBLOCK        1    /* for unblocking signals */
>  #define TARGET_SIG_SETMASK        2    /* for setting the signal mask */
>  
> +/* this struct defines a stack used during syscall handling */
> +typedef struct target_sigaltstack {
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
> +} target_stack_t;
> +
> +/*
> + * sigaltstack controls
> + */
> +#define TARGET_SS_ONSTACK 1
> +#define TARGET_SS_DISABLE 2
> +
> +#define TARGET_MINSIGSTKSZ     2048

While all the architectures you de-duplicated here have
TARGET_MINSIGSTACKSZ as 2048, some others specify a different value
(mostly 4096, e.g. alpha), as can be seen in your next patch (which
should belong to this series, btw). Do you mean to change semantics
here? Or you might have to allow arches to override this value.

> +#define TARGET_SIGSTKSZ        8192
> +
>  /* bit-flags */
>  #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
>  /* mask for all SS_xxx flags */

