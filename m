Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961595A127F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:40:57 +0200 (CEST)
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRD6O-00088C-Fb
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oRD3u-0005Kn-LE
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oRD3p-00044O-St
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661434696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAeZVbxv5z6d5WqfZtgr1Bb5t/edXOP/NTIaStD4gXU=;
 b=Gc/wTbbT4HUC8JQW8W8LFPHHip7E7ytVcj09h3Mr0RrOtpiG7iNdzr7c4VCghVB/EV2DSR
 gdj29eqIXNmUFwnEC/KEFEDm8P0zUirDbiaW/wpXwBqQt598g2OBwgf2sy8APgrSIIjkv8
 nW91AinvhvHDzQ6PqoWH8PvShPPiv7k=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-5Y55PreROQaCiBMhjID-0w-1; Thu, 25 Aug 2022 09:38:15 -0400
X-MC-Unique: 5Y55PreROQaCiBMhjID-0w-1
Received: by mail-oi1-f199.google.com with SMTP id
 bb10-20020a056808168a00b00342d91dd857so6583519oib.21
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 06:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=RAeZVbxv5z6d5WqfZtgr1Bb5t/edXOP/NTIaStD4gXU=;
 b=5ELDe7N12ygg3LCUlQsiwOTHRrXb0L9sIOpWfyCg8eacRpOVH/Ccna5sOUrLW7HftF
 COJUY4UCdzp7CFV2W4cGorThmc9mgDrszDS8pXT6ODK+Au7Tl5pMtLPHKIqEKoEsgc9z
 0K86/iNt6jFZX+vkvs22upSCqifTpriAXj9fI7c1HjpCKeovbPpAnrpyZUhkPTDO/ax9
 dyO13tX3zPAF6IT6BFCBZyviEzErCTOwG8YM5PUSOYld8YVzyKZUV5iGbTMTX0mTwY3P
 6/fNvn4inqg0u9/yZ4AQAly7YBxhrYCxKjwGPYwcU6SSIqASWt2pIvUY9hhYd82uHWVU
 rhwg==
X-Gm-Message-State: ACgBeo3hUlt7bhvvKYUUvutDiS5R/RUxD6gWMAfYrbxd8S1J0TOm3BGF
 U9lAOKCagpcjNOTOhYK/QvGqtwKItGqKNVMgiZr5dm0WDZSgFHw+NTo44KpYK8W17TFI654XNv2
 4k9OUJ+b+RdgbSYiUIVpCsCPc8cp5lKI=
X-Received: by 2002:a9d:6294:0:b0:638:b817:7c87 with SMTP id
 x20-20020a9d6294000000b00638b8177c87mr1408011otk.378.1661434694478; 
 Thu, 25 Aug 2022 06:38:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6BusZhWxR+Cm595D98toC+9jovIXPXqKQN+pYKCeaCf0FPLS2vKZD18hH3O7cQzDB3HqZakExahL0TWNxPfh8=
X-Received: by 2002:a9d:6294:0:b0:638:b817:7c87 with SMTP id
 x20-20020a9d6294000000b00638b8177c87mr1408005otk.378.1661434694245; Thu, 25
 Aug 2022 06:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-3-marcandre.lureau@redhat.com>
 <CAFEAcA-ZNFka26CDoPEvUROkt9UpFvmZXN5rTSt7MYJjtzdhHg@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZNFka26CDoPEvUROkt9UpFvmZXN5rTSt7MYJjtzdhHg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 25 Aug 2022 17:38:03 +0400
Message-ID: <CAMxuvax0bKKBE8hwDrO+8sPFsnq=4vAKAgvia3uFeP4JEn8pZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, David Hildenbrand <david@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Aug 25, 2022 at 5:35 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 25 Aug 2022 at 14:21, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Rewrite get_next_page() to work over non-aligned blocks. When it
> > encounters non aligned addresses, it will allocate a zero-page and try
> > to fill it.
> >
> > This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
> > qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
> > uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
> > ~target_page_mask) =3D=3D 0' failed.
> >
> > because:
> > guest_phys_block_add_section: target_start=3D00000000fed40080 target_en=
d=3D00000000fed41000: added (count: 4)
> >
> > Fixes:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2120480
>
>
> >  static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
> > -                          uint8_t **bufptr, DumpState *s)
> > +                          uint8_t **bufptr, bool *allocptr, DumpState =
*s)
> >  {
> >      GuestPhysBlock *block =3D *blockptr;
> > -    hwaddr addr, target_page_mask =3D ~((hwaddr)s->dump_info.page_size=
 - 1);
>
> In the old code, we treated the dump_info.page size as an indication
> of the target's page size...
>
> > -    uint8_t *buf;
> > +    uint32_t page_size =3D s->dump_info.page_size;
> > +    bool alloced =3D false;
> > +    uint8_t *buf =3D NULL, *hbuf;
> > +    hwaddr addr;
> >
> >      /* block =3D=3D NULL means the start of the iteration */
> >      if (block =3D=3D NULL) {
> >          *blockptr =3D block =3D QTAILQ_FIRST(&s->guest_phys_blocks.hea=
d);
> >          addr =3D block->target_start;
> > +        *pfnptr =3D dump_paddr_to_pfn(s, addr);
> >      } else {
> > -        addr =3D dump_pfn_to_paddr(s, *pfnptr + 1);
> > +        assert(block !=3D NULL);
> > +        *pfnptr +=3D 1;
> > +        addr =3D dump_pfn_to_paddr(s, *pfnptr);
> >      }
> >      assert(block !=3D NULL);
> >
> > -    if ((addr >=3D block->target_start) &&
> > -        (addr + s->dump_info.page_size <=3D block->target_end)) {
> > -        buf =3D block->host_addr + (addr - block->target_start);
> > -    } else {
> > -        /* the next page is in the next block */
> > -        *blockptr =3D block =3D QTAILQ_NEXT(block, next);
> > -        if (!block) {
> > -            return false;
> > +    while (1) {
> > +        if (addr >=3D block->target_start && addr < block->target_end)=
 {
> > +            size_t n =3D MIN(block->target_end - addr, page_size - add=
r % page_size);
> > +            hbuf =3D block->host_addr + (addr - block->target_start);
> > +            if (!alloced) {
> > +                if (n =3D=3D page_size) {
> > +                    /* this is a whole host page, go for it */
> > +                    assert(addr % page_size =3D=3D 0);
>
> ...but here we're claiming in this comment that it is the host's
> page size.

+    uint32_t page_size =3D s->dump_info.page_size;

bad comment, will be fixed, thanks

>
> Which is it ?
>
> thanks
> -- PMM
>


