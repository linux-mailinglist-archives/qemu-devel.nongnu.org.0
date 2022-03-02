Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C04CA212
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:23:08 +0100 (CET)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPM8R-0004Tu-DW
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nPM5o-0003bz-N5
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nPM5i-0008Tp-Ae
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646216416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiU4Aeoge2thHHdtegItpkWu2nYJ5rwzyjVfS0V3vzs=;
 b=DieNvUK6U4g4ptKuE3/8S36/yVHJN7iKuuPHu4/dMmGvfvq03VLfjGMJu2Cxxb5bHYVgK9
 BsN2P++YqRaBIivDUQkFPcftjqu0wJB9PxsVWu1UpmlAnRNQKtukPtiUZzjPl0Dyj1/vMA
 v0mYa4feCLXGOrV7UIoxNQJF7uEebjA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-5VrP2FG4PJysvcevF_GDZA-1; Wed, 02 Mar 2022 05:20:15 -0500
X-MC-Unique: 5VrP2FG4PJysvcevF_GDZA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2dbcdbdbaceso9553027b3.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fiU4Aeoge2thHHdtegItpkWu2nYJ5rwzyjVfS0V3vzs=;
 b=eH8KkzULiPbSCu3qZ5Sm9pSfVKSYlCe0o8IecDoPr9VwRgUqwiaXrQE7l5XHXfancc
 Dkigm8mu17rnPtbMz9cW1XANq9gaxFuDQoWqoBobVHAg3jvZCr9PlBTJ+zKZITuXA7Gf
 C19XQni6oYt9pyAS2VjaN1kCzm2tU4t+IjAL91ailkk+PZ84s8v6WbkeLLjLCWP8daw7
 W4yHPXU3j2ygfC33f1nmjD0bL2pUpIL8bxzQ4//GQ0yoKc90dQBA+8W48y3jUGkwZSaR
 zR0dmKjkXJMD9pk2je7xfd35H6Jiwo+Rh7jwBkOHaOyEKBxs7IrZJCKKCalSCGanjesy
 P7JQ==
X-Gm-Message-State: AOAM533e9jQpxtZC2WoBwR7UFGeySdfSM/rtV23tvtxO6He29IxlOGD4
 Om0FFTgXhGYk0XyKxw8ykHfqGF0N6iVyWMk7kHRiSbIl3wYDpzKh9ntdB2ptBCQwdQ0LAO6NGBq
 s+eRQrog+ihVuIB6ugWumG6wDqlNeRcY=
X-Received: by 2002:a25:e057:0:b0:624:2ade:2a8f with SMTP id
 x84-20020a25e057000000b006242ade2a8fmr27991532ybg.87.1646216415348; 
 Wed, 02 Mar 2022 02:20:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl6GzJ1/7svk7LPiqpZAc1BNHAW6rQjrOuZ4iCFGxwwmvKdXHxCUsegfK0VK+imavFOXhE8IKXqSAVMPsvcmA=
X-Received: by 2002:a25:e057:0:b0:624:2ade:2a8f with SMTP id
 x84-20020a25e057000000b006242ade2a8fmr27991524ybg.87.1646216415104; Wed, 02
 Mar 2022 02:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-4-frankja@linux.ibm.com>
In-Reply-To: <20220301142213.28568-4-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 2 Mar 2022 14:20:04 +0400
Message-ID: <CAMxuvawNm-Y3fVG2B9zPV+EGsjf-4DZP643U5UNY9FE4KHVetQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] dump: Add more offset variables
To: Janosch Frank <frankja@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 1, 2022 at 6:22 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> Offset calculations are easy enough to get wrong. Let's add a few
> variables to make moving around elf headers and data sections easier.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c           | 34 ++++++++++++++--------------------
>  include/sysemu/dump.h |  4 ++++
>  2 files changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index ce3a5e7003..242f83db95 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -137,13 +137,11 @@ static void write_elf64_header(DumpState *s, Error =
**errp)
>      elf_header.e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
>      elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);
>      elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> -    elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Ehdr));
> +    elf_header.e_phoff =3D cpu_to_dump64(s, s->phdr_offset);
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
>      elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->shdr_num) {
> -        uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->=
phdr_num;
> -
> -        elf_header.e_shoff =3D cpu_to_dump64(s, shoff);
> +        elf_header.e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
>          elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
> @@ -169,13 +167,11 @@ static void write_elf32_header(DumpState *s, Error =
**errp)
>      elf_header.e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
>      elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);
>      elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> -    elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Ehdr));
> +    elf_header.e_phoff =3D cpu_to_dump32(s, s->phdr_offset);
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
>      elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->shdr_num) {
> -        uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->=
phdr_num;
> -
> -        elf_header.e_shoff =3D cpu_to_dump32(s, shoff);
> +        elf_header.e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
>          elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
> @@ -238,12 +234,11 @@ static void write_elf32_load(DumpState *s, MemoryMa=
pping *memory_mapping,
>  static void write_elf64_note(DumpState *s, Error **errp)
>  {
>      Elf64_Phdr phdr;
> -    hwaddr begin =3D s->memory_offset - s->note_size;
>      int ret;
>
>      memset(&phdr, 0, sizeof(Elf64_Phdr));
>      phdr.p_type =3D cpu_to_dump32(s, PT_NOTE);
> -    phdr.p_offset =3D cpu_to_dump64(s, begin);
> +    phdr.p_offset =3D cpu_to_dump64(s, s->note_offset);
>      phdr.p_paddr =3D 0;
>      phdr.p_filesz =3D cpu_to_dump64(s, s->note_size);
>      phdr.p_memsz =3D cpu_to_dump64(s, s->note_size);
> @@ -303,13 +298,12 @@ static void write_elf64_notes(WriteCoreDumpFunction=
 f, DumpState *s,
>
>  static void write_elf32_note(DumpState *s, Error **errp)
>  {
> -    hwaddr begin =3D s->memory_offset - s->note_size;
>      Elf32_Phdr phdr;
>      int ret;
>
>      memset(&phdr, 0, sizeof(Elf32_Phdr));
>      phdr.p_type =3D cpu_to_dump32(s, PT_NOTE);
> -    phdr.p_offset =3D cpu_to_dump32(s, begin);
> +    phdr.p_offset =3D cpu_to_dump32(s, s->note_offset);
>      phdr.p_paddr =3D 0;
>      phdr.p_filesz =3D cpu_to_dump32(s, s->note_size);
>      phdr.p_memsz =3D cpu_to_dump32(s, s->note_size);
> @@ -1828,15 +1822,15 @@ static void dump_init(DumpState *s, int fd, bool =
has_format,
>      }
>
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> -        s->memory_offset =3D sizeof(Elf64_Ehdr) +
> -                           sizeof(Elf64_Phdr) * s->phdr_num +
> -                           sizeof(Elf64_Shdr) * s->shdr_num +
> -                           s->note_size;
> +        s->phdr_offset =3D sizeof(Elf64_Ehdr);
> +        s->shdr_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr=
_num;
> +        s->note_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr=
_num;
> +        s->memory_offset =3D s->note_offset + s->note_size;
>      } else {
> -        s->memory_offset =3D sizeof(Elf32_Ehdr) +
> -                           sizeof(Elf32_Phdr) * s->phdr_num +
> -                           sizeof(Elf32_Shdr) * s->shdr_num +
> -                           s->note_size;
> +        s->phdr_offset =3D sizeof(Elf32_Ehdr);
> +        s->shdr_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr=
_num;
> +        s->note_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr=
_num;
> +        s->memory_offset =3D s->note_offset + s->note_size;
>      }
>
>      return;
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 19458bffbd..ffc2ea1072 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -159,6 +159,10 @@ typedef struct DumpState {
>      bool resume;
>      bool detached;
>      ssize_t note_size;
> +    hwaddr shdr_offset;
> +    hwaddr phdr_offset;
> +    hwaddr section_offset;
> +    hwaddr note_offset;
>      hwaddr memory_offset;
>      int fd;
>
> --
> 2.32.0
>


