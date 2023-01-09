Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547806633DB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:22:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0Vu-0007aS-IC; Mon, 09 Jan 2023 17:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0Vq-0007a1-ET
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:21:02 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0Vn-0005Ss-OU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:21:01 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so10332163fac.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bJN40hzeGiad1yDldorjo9e4/7TcmgzS71gm3lvNcz4=;
 b=0VtnHkAIZgj/BzGP6QPDq9J1dfTzsk7r44mv/EQUj1yUOw7iC0giIZHLdHHbB1Yihy
 uE2nbHsJ0OS6itKjxEQ1mJ6OO+mGUMK+14rtcncaEC0Z1S0tDU91ftcrvP4j9Y0p1ecx
 QHh2+ag7Apn8gQJN+qo5ksG+2UnXvH2nHttUVGhGiaduJ3zfDEia+BfwTh0/cGzC5T0q
 PPX8Cgff5WmEmJV3Ak2OOAy3JHERzSugFuPkp8wCK4d/rABgUvIJf6E00HtrBsL6zBEx
 VNlZ5zB86U3SnGnmddfXOg5o+Pq41L318HmV4wwryZ+qewQZZh8q+0gacbq3+LNETjeK
 ZrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJN40hzeGiad1yDldorjo9e4/7TcmgzS71gm3lvNcz4=;
 b=ezpeu5e+XMGVp9o356FHrDw2Y+4xvnqTXUyav3i9ar30BD83r/7s/DxBFCNntQ1DTq
 Aul248uNKDF3ze8tt5hkZrYS/bUnyI6siZ4mZlyG2CGWyVEOY+ZMVlNLqEv8VKHkSFLe
 YHc6W+dSWUSIHsTuPGCLdcBkQDQDgGBkf9ONz0khTlMNWn1TLecp3TarBHUSMXLLUjlo
 WGpIgDuuKUW7T9pskl0XJ9jo+tXUsykU0CSNoWZoIPqq5RWH3GjkH4kKLiiMcFfcYu1x
 GZ01HNVcyhAkPe87dQjN4uXsk+R+noIKvZb3ioyLt6fmKcfmoxyleB1IFO4q33skpQyC
 Mmww==
X-Gm-Message-State: AFqh2krp8sQrwKDyEl8DjBoH9Xs3WU1O33J3enM9/gbo388xhGQvwdfE
 3ISUnUYDVdSg442vqROqgN+6mA==
X-Google-Smtp-Source: AMrXdXt39sw+969lFE1xglbk3zUa48u4thMDJO6dLvfy3giWaNnJ8jm3ijL2f8IHSr/LJ4LlQR+2ZQ==
X-Received: by 2002:a05:6870:4d1b:b0:14c:96fc:d400 with SMTP id
 pn27-20020a0568704d1b00b0014c96fcd400mr33749339oab.49.1673302856804; 
 Mon, 09 Jan 2023 14:20:56 -0800 (PST)
Received: from localhost ([37.19.221.172]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056870818c00b0013b0b19100fsm4948701oae.32.2023.01.09.14.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:20:56 -0800 (PST)
Date: Mon, 9 Jan 2023 16:52:42 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/4] cpu: free cpu->tb_jmp_cache with RCU
Message-ID: <Y7yMqvnshw822/01@cota-l14>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-2-cota@braap.org>
 <676d74ed-cce8-8b0e-69c7-44ec25a68a4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <676d74ed-cce8-8b0e-69c7-44ec25a68a4b@linaro.org>
Received-SPF: softfail client-ip=2001:4860:4864:20::32;
 envelope-from=cota@braap.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Sun, Jan 08, 2023 at 11:19:53 -0800, Richard Henderson wrote:
> On 1/8/23 08:39, Emilio Cota wrote:
(snip)
> > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > index 356fe348de..ca95d21528 100644
> > --- a/accel/tcg/cpu-exec.c
> > +++ b/accel/tcg/cpu-exec.c
> > @@ -1070,7 +1070,6 @@ void tcg_exec_unrealizefn(CPUState *cpu)
> >   #endif /* !CONFIG_USER_ONLY */
> >       tlb_destroy(cpu);
> > -    g_free(cpu->tb_jmp_cache);
> 
> Can you simply use g_free_rcu here?

Yes, although we must have removed the CPU from the RCU list
before doing so.

> > diff --git a/cpu.c b/cpu.c
> > index 4a7d865427..564200559f 100644
> > --- a/cpu.c
> > +++ b/cpu.c
> > @@ -164,6 +164,12 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
> >   #endif /* CONFIG_USER_ONLY */
> >   }
> > +static void cpu_free_rcu(CPUState *cpu)
> > +{
> > +    /* .tb_jmp_cache is NULL except under TCG */
> > +    g_free(cpu->tb_jmp_cache);
> > +}
> > +
> >   void cpu_exec_unrealizefn(CPUState *cpu)
> >   {
> >   #ifndef CONFIG_USER_ONLY
> > @@ -181,6 +187,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
> >       }
> >       cpu_list_remove(cpu);
> > +    call_rcu(cpu, cpu_free_rcu, rcu);
> 
> Certainly this seems wrong, exposing tb_jmp_cache beyond tcg.

I've changed this in v2 to call tcg_exec_unrealizefn after
cpu_list_remove.

An alternative would be to call the whole cpu_exec_unrealizefn
after an RCU grace period, but I think that might be more trouble
than it's worth.

Thanks,
		Emilio

