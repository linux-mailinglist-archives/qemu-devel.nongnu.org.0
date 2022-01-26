Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290049C584
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 09:50:00 +0100 (CET)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCe06-0000R7-Qm
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 03:49:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCdws-00081h-5e
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCdwo-0003SG-2k
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643186792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhxoRmdTAF+6nln7Wk69B4aXqbBBj2NXD9P+Xp5SDyQ=;
 b=Vf3ouBhLgRNJ6kfSnKwcD76NSWJCy7O9J1Q6EuuH2LupkOgZuij1ovdsTfuQyp7m9W3BHc
 j7V2HO2x6eGHEbw4JGiZNa5W9I5OcQdQIPWrHCA9+7DYWNnBzeFBb7CUmBDdXv/88jpw/M
 PuN8F9lA5rmmmdJ/NSDnw3oZAkUv2FU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-3-tJGWd0MQqaWxZkVCAVaQ-1; Wed, 26 Jan 2022 03:46:29 -0500
X-MC-Unique: 3-tJGWd0MQqaWxZkVCAVaQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j26-20020adfb31a000000b001d8e22f75fbso3993430wrd.20
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 00:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OhxoRmdTAF+6nln7Wk69B4aXqbBBj2NXD9P+Xp5SDyQ=;
 b=kmqOSIAxQ2XYjce4w3itLKAPjeYp6XmnKz0ZX0rfvYUuJHAZF+4wgdg2UAluFD78/z
 pDIYJ7v2pt/Zf3GVYwzSoboiLwtJ2eUUm+J91X3kurQ014vfj6HwBUp3/VLrZomW98r1
 6PnkS9ChF3vpsziNbRUAxt/gckxyBzwT7OEZL38sx+QTmIvS6ZXYby2MgczY0RyeRKCz
 Y6tobtt/829hS8TENAgYaRfim889F2JeJ37SybG7xW+z+LGOMIU3l98oIogCTePsk8Tz
 K4cf5oT0eQ+Cd+HIZaJy1SS2bPNT7tPTOfk2b0JVMHGYnpp16MuslxqgJ7lAb/YPvFLF
 AZdg==
X-Gm-Message-State: AOAM5327PqWwxDAVAJ7Z5vFFAzp+iEbWDTcxcYQzwtCq/0wYdJ47QBhQ
 MMd/jZt4ZdwaJY/QO/c2j5NEX3lycoUnTP1YDI0qoDdfDCSxdraMzLYB4U5PpmMIwldpgBgPrVL
 APjUK9EznoJpxFks=
X-Received: by 2002:adf:fc51:: with SMTP id e17mr14261800wrs.493.1643186788172; 
 Wed, 26 Jan 2022 00:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmwc/MfLLWlotMpx76NYdhsLJzU8dXvFwmwPFZbVd8OjIH5avUaMlUgXDytKnopBZWGbmUpA==
X-Received: by 2002:adf:fc51:: with SMTP id e17mr14261783wrs.493.1643186787902; 
 Wed, 26 Jan 2022 00:46:27 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:2700:cdd8:dcb0:2a69:8783?
 (p200300cbc7092700cdd8dcb02a698783.dip0.t-ipconnect.de.
 [2003:cb:c709:2700:cdd8:dcb0:2a69:8783])
 by smtp.gmail.com with ESMTPSA id x13sm19098962wru.28.2022.01.26.00.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 00:46:27 -0800 (PST)
Message-ID: <44307fea-dd94-96a0-e0b5-59d8c641cf45@redhat.com>
Date: Wed, 26 Jan 2022 09:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu v2] s390x: sck: load into a temporary not into in1
To: Nico Boehr <nrb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220126084201.774457-1-nrb@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220126084201.774457-1-nrb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.01.22 09:42, Nico Boehr wrote:
> We previously loaded into in1, but in1 is not filled during
> disassembly and hence always zero. This leads to an assertion failure:
> 
>   qemu-system-s390x: /home/nrb/qemu/include/tcg/tcg.h:654: temp_idx:
>   Assertion `n >= 0 && n < tcg_ctx->nb_temps' failed.`
> 
> Instead, use in2_la2_m64a to load from storage into in2 and pass that to
> the helper, which matches what we already do for SCKC.
> 
> This fixes the SCK test I sent here under TCG:
> <https://www.spinics.net/lists/kvm/msg265169.html>
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> ---
>  target/s390x/tcg/insn-data.def | 2 +-
>  target/s390x/tcg/translate.c   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 3e5594210c88..848a9c9e622f 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -1317,7 +1317,7 @@
>  /* SET ADDRESS SPACE CONTROL FAST */
>      F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
>  /* SET CLOCK */
> -    F(0xb204, SCK,     S,     Z,   la2, 0, 0, 0, sck, 0, IF_PRIV | IF_IO)
> +    F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
>  /* SET CLOCK COMPARATOR */
>      F(0xb206, SCKC,    S,     Z,   0, m2_64a, 0, 0, sckc, 0, IF_PRIV | IF_IO)
>  /* SET CLOCK PROGRAMMABLE FIELD */
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index dcc249a197ce..7fb87cd9f3b7 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -4295,8 +4295,7 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
>  #ifndef CONFIG_USER_ONLY
>  static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
>  {
> -    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEQ | MO_ALIGN);
> -    gen_helper_sck(cc_op, cpu_env, o->in1);
> +    gen_helper_sck(cc_op, cpu_env, o->in2);
>      set_cc_static(s);
>      return DISAS_NEXT;
>  }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


