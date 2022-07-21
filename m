Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27457CE07
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:45:42 +0200 (CEST)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXQr-0006yT-Sf
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXOz-0005Rt-Ih
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXOx-000317-V1
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658414623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GT98RB3oUsNtcIl8TCjxvCFgP+bupPP3TKuXWpO1+M=;
 b=NZwd4muMAdPkyQVJJIiB58MTeYWM/CyIb3PjDh9MwOQes7SZuM14sHGjsOxXfsr5+KgtjJ
 2XrdbvEDMePVlBdiJoyuGTrOm4A04e15T2Ylc8GXHLXPMyJs2h3nCtcMwULiTTdNIG/T/w
 9dLS3bjFLws4ii98rUqCD7DF7yuZWzQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-vuktAKgfNzOQW4WsaqMktQ-1; Thu, 21 Jul 2022 10:43:41 -0400
X-MC-Unique: vuktAKgfNzOQW4WsaqMktQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 b205-20020aca34d6000000b0033a33a68361so901312oia.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 07:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0GT98RB3oUsNtcIl8TCjxvCFgP+bupPP3TKuXWpO1+M=;
 b=5ff78FBNDhU3raDGN6nqnjg+wOcS1QsF/48v6wbfbseJXgmTQ8rQ9GsNz9LtpFSNA0
 MBst1srGiX6zqiJX81oeMCjeH1PU6zUigsl6yZ3ewIVSB6Jsfp3HEKKIvycI3Jzoislz
 n/IBx8ZuyUhh+rqzoQD3nEGJfXMSBzwO8qGyYyW+d2pkjqP6pm7jGPoWdZcEtE/0Up2s
 Nwecl2+Ew7uHXbURU7UOw873THolefbCEpOIljXcryOTSGbohP8wNakLkp8pETzOY/9i
 ypDMoKr0a6axwBjhseiPeu31b9+RaEaD4yyOMWAKn3WH4KKl88WaAFheaR1LlVPtjAkQ
 zZ3A==
X-Gm-Message-State: AJIora/qa3uUCZUAhAPyuUkA113EZrsHvd0xON3mfQFcd7OjGE59kX7g
 Ncp1Rk7gutbqH0y9hueCnkqaTQwTu8XSzMsGF0woNYBeTp1SlFmfagTsRWAudNikfDAmnTagHbe
 u9NhBXC7BELDILPToLz+2qxE5tzxO8Eg=
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id
 ch6-20020a0568081c0600b0033a9b3bb3cemr4837057oib.53.1658414620496; 
 Thu, 21 Jul 2022 07:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3wXLwA8zFZ4CFZ9X1tRGmskx4DO38C0sVS3ScbREMxTimbE1XWs765hb6bT22fWQqz4lwS2AgYCIgB0qvTsI=
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id
 ch6-20020a0568081c0600b0033a9b3bb3cemr4837043oib.53.1658414620342; Thu, 21
 Jul 2022 07:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-7-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-7-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 18:43:29 +0400
Message-ID: <CAMxuvawWHmJ_U9gVuTiotydoGMfzG2K1s10funDuCybwMJuoJg@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] dump: Reorder struct DumpState
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 21, 2022 at 5:23 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> Let's move ELF related members into one block and guest memory related
> ones into another to improve readability.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

from v2:

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  include/sysemu/dump.h | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index dad10dee0b..a94d81303d 100644
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
> -    hwaddr note_offset;
>      hwaddr memory_offset;
>      int fd;
>
> @@ -171,6 +164,16 @@ typedef struct DumpState {
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
> +    hwaddr section_offset;
> +
>      void *elf_header;
>      void *elf_section_hdrs;
>      uint64_t elf_section_data_size;
> --
> 2.34.1
>


