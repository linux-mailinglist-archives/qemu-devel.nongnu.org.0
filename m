Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5515811A2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:09:50 +0200 (CEST)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIRh-0003ur-6m
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIMM-0000K4-Ia
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIMJ-0007qH-Jh
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658833455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VC1im2pP8gWCpSTYRUuagtgNC9EPb5DiLkuBKOpg9Js=;
 b=Rt5tWCtbDqxBNKOrBKcHp+wsPQtUIvXxv95XBIemC6qVU7cGgftQ8U8MT6xiOgJpzsX5ev
 87dID+2Gt49vPKWhDSUbfo+OtfVr/p/NaSxu5j/R1VcMdYDMCfcUkkwWssHwX8Cv7eBwFv
 YPfaX1YMB53w+qLsW8U5DNyjn44HTTM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-xE9NEH0ENYiQxIrvkTDu3g-1; Tue, 26 Jul 2022 07:04:14 -0400
X-MC-Unique: xE9NEH0ENYiQxIrvkTDu3g-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-10d6ce04410so7620967fac.23
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VC1im2pP8gWCpSTYRUuagtgNC9EPb5DiLkuBKOpg9Js=;
 b=l686EIFSy+EM1ICc7xp4QnX9wUzWle747eI9Nq+poaD6LdAyoSIMAjk2snyZaVLw0Y
 cdF3QV808fIOZMvlr50I7Ro37t2Szt8lqdmfP26RbWkaemD2Mx5B9IfMIt1oEJ/n3FWf
 n8AN7yxPBikswtuDBSsTkemh27OVYeG3DbT3PndMH1rzIX2MZGtGsDrRWYn8RKEBjrmL
 vj7KnBn/fQVu4/60NXeyqh6vB7A2CGLoyOcRB/XbA0XvhZ30aS2Za0mMlsSgiRKN4Ag+
 iAQnZxYdCtNlVvUm+KnyWXOIdu0hwmVnKMUipKucdcvbzKBJ3HFUezvrvN4jjv5xdi6s
 vCZg==
X-Gm-Message-State: AJIora95ghWmn6W9dFq3D7k+YlJcmfmkOaXZCzIL0S0UUiM05MPDUzZc
 oT7cjES+wrng9+oMAPbQaqU/+2P1TB/+UU9KtQpENqds9CRqzlOorX3cLL+D1ngwnUYJXgnnTX/
 xuS1YDie4pYGDx2YJeN46vLBsnTYzyQ0=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7808546oib.205.1658833453110; 
 Tue, 26 Jul 2022 04:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNv/TprAHkYs7MSXkJIMvm8Qg1n41XLPN9s81OdwCXGnCp7ZSF8dHlPyGLuHoYvSXO74OFgsywH5gPs92OSV8=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7808535oib.205.1658833452891; Tue, 26
 Jul 2022 04:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-10-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-10-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:04:02 +0400
Message-ID: <CAMxuvazgGth=+_bd_GaT4pQncVuM9vxUY=YLyjA+ZA5cXJY6RA@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] dump: Reorder struct DumpState
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> Let's move ELF related members into one block and guest memory related
> ones into another to improve readability.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/sysemu/dump.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 686555f908..3937afe0f9 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -154,15 +154,8 @@ typedef struct DumpState {
>      GuestPhysBlockList guest_phys_blocks;
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
> -    uint32_t phdr_num;
> -    uint32_t shdr_num;
>      bool resume;
>      bool detached;
> -    ssize_t note_size;
> -    hwaddr shdr_offset;
> -    hwaddr phdr_offset;
> -    hwaddr section_offset;

There is a bit of churn because you remove this field and add it back
later. Worth to explain in the commit message imho.

> -    hwaddr note_offset;
>      hwaddr memory_offset;
>      int fd;
>
> @@ -171,6 +164,15 @@ typedef struct DumpState {
>      int64_t begin;             /* Start address of the chunk we want to =
dump */
>      int64_t length;            /* Length of the dump we want to dump */
>
> +    /* Elf dump related data */
> +    uint32_t phdr_num;
> +    uint32_t shdr_num;
> +    uint32_t sh_info;
> +    ssize_t note_size;
> +    hwaddr shdr_offset;
> +    hwaddr phdr_offset;
> +    hwaddr note_offset;
> +
>      void *elf_header;
>      void *elf_section_hdrs;
>      uint64_t elf_section_data_size;
> --
> 2.34.1
>


