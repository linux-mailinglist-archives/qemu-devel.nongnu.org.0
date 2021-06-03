Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B039A145
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:41:31 +0200 (CEST)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomfC-0007gV-RD
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lomdW-0006W9-Bf
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lomdO-0001x4-KV
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622723976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdqHVmVflfqyxt27O1b6+VXH2djfui6Z/YNcJOL9zrU=;
 b=dtEfB4UmoCuZZp+zho8irxyKRoOzHTK62Ob0E1xnLauI4ipC9a97l1mFpcGLiikAbDmJTZ
 s9UlNS8H7exwrwCEtOv637yLSWhghvEKnvx9qkDIkdpGwXb24bUUVZRTj7eOi9lVOPODCj
 bVQkIMH2QG9e3KNr0GOXJgKZNvUYnBc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-T-cpWVAcPRiJl9aGr8WMSA-1; Thu, 03 Jun 2021 08:39:34 -0400
X-MC-Unique: T-cpWVAcPRiJl9aGr8WMSA-1
Received: by mail-ed1-f71.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so3197794edu.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 05:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdqHVmVflfqyxt27O1b6+VXH2djfui6Z/YNcJOL9zrU=;
 b=LCE1bUXP2YNj2QcdL48NOLgYPo4oz3RWM1f2hOY1k8UTTGUHYEuDkFID7eD2vnSlu5
 JBzRkPJ5znDrnJAJ2WpAYYzzEoSUxCdhwpXnPK9wwVtRlmAS0ts4Umb2PkMPh0sv+K2I
 4Pa5E5kbMQ590+vUlo1ZwMxBFxBAJ5MuHQEz2nnZJhJKB35aJx9WDgGqoj8ICHg2Mltc
 R2yiQmspHaMRG1toEr/rr9txqjBz0ozteHdv05PypQsH7ibr3PvLROTgoAfqsK80q6ec
 sY2QvIkE1xyRuAZ7Pyko9jP88qmBOfAmEzQtB/rAq3C1t/CVNNpNoO4aN27y+hYntAN0
 f1HA==
X-Gm-Message-State: AOAM531yokas8yISovD7cxMWvGK8l42NIBNjzlpqTxVliZcyzk62QuLP
 +zdxrzOsS0ojxOAT97/eqtgH9miyIHdNLfGweLVADiNvSUWGpoX+NHeRoa0aDa7LtP1sRNzUNw6
 G23eWY1LJEZQpaFVKSSrerde4Q24Jj2UwynNCMS9Zp9RnRoWVvoJmMRcWLrT2EVxe
X-Received: by 2002:a17:907:1ca9:: with SMTP id
 nb41mr39071022ejc.279.1622723973128; 
 Thu, 03 Jun 2021 05:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1499tuZqGhA4ARasMjhZ9QjVToLdv5A5mwFZXTvdh7tzuvbGtML4+jbLrwYvV1GSzWNZlDw==
X-Received: by 2002:a17:907:1ca9:: with SMTP id
 nb41mr39071011ejc.279.1622723972852; 
 Thu, 03 Jun 2021 05:39:32 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a97sm1763578edf.72.2021.06.03.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 05:39:32 -0700 (PDT)
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
References: <20210603110012.1182530-1-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <31c4e422-5451-3c0a-f5e6-df75559c9a9b@redhat.com>
Date: Thu, 3 Jun 2021 14:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603110012.1182530-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean-Philippe,

On 6/3/21 1:00 PM, Jean-Philippe Brucker wrote:
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
> 
> It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
> unconditionally write EOIR for all interrupts that it manages. This now
> causes QEMU to abort when running UEFI on a VM with GICv3. Although it
> is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
> seems a little harsh, especially since icc_eoir_write() already
> tolerates writes of nonexistent interrupt numbers. Simply ignore
> spurious EOIR writes.
> 
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 81f94c7f4a..1d0964c9bf 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          }
>          break;
>      default:
> -        g_assert_not_reached();
> +        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */

A qemu_log_mask(LOG_GUEST_ERROR, ...) call here could be useful,
do you mind adding it?

> +        return;
>      }
>  
>      icc_drop_prio(cs, grp);
> 


