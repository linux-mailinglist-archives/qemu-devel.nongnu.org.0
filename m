Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D544154B043
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:17:18 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15Tx-00064q-Rr
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1o15Qt-0003sN-1f
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1o15Qp-0007BE-Rs
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/jVr66gDkoyUGuOTCemMmPci0OTuEo86qYud1m1g1Dw=;
 b=KhJ1FWVH3LEw9ZcQ1zGvMN8vp2fXkgrpjUlhFutaYtwMHVwXds9yI0ocl03N46ZEIiITLb
 8W39ssssKKSU7mVOZBjxmm+yQlEAVUPbk4I+MrcpaOvKqaTMbkIukLWRRqPYRP2KqNrdLm
 Odayggjh0mgv21n9Yay0u8HyNpZfyss=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-ORS4Cyr0NAapLRHGtfS6Yw-1; Tue, 14 Jun 2022 08:13:59 -0400
X-MC-Unique: ORS4Cyr0NAapLRHGtfS6Yw-1
Received: by mail-oi1-f197.google.com with SMTP id
 x20-20020a056808145400b0032f2b16914cso4102012oiv.2
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 05:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jVr66gDkoyUGuOTCemMmPci0OTuEo86qYud1m1g1Dw=;
 b=FKGnDb7wwJS+nJWY1vTr78erPHoGP5cSQbIVpYQbrveaORCh/LOn7IK8gYY/bRJrTx
 o48LhfIS5NimGIZyX06wi64rvxkw6PVqBxQ0BGYk3SOW7vM+685zhjPRIo+GZKjcREhP
 Rxd6HVasEZWBSEfh30eNozty4tonoqqWNh9HfXOQT3G9mxtfU1nYJOzt3lFa5yBCQJXZ
 8UMzQQIz8tk6ip2LdbP74JLCJrKB6mjqWrtDeRSd3elQLznpN2wBwykjhSgwYHnPn5+W
 8xBupW/vWFyleU5ur2IVY8Ojs0rGKQ6fS5miJ/eYER/pn0tI2YYupIQ79dFpp+IEr+1j
 ILwQ==
X-Gm-Message-State: AOAM533CG+QXFR66fsJrG9fBVs4Q9nHUM203ZxztQCrQfie4VFPuo3l4
 DOwEtLCrIFwN2Wf4vPFk3Fkxgc/Tx3eR/RBRuVXxtF38+lsKg8m9vhcqxDpQ8AJav9ROlAXbTgO
 w2+oCJEVRaK29ESVO4tEIk7K84PerW5o=
X-Received: by 2002:a9d:4d19:0:b0:60c:6707:9a5b with SMTP id
 n25-20020a9d4d19000000b0060c67079a5bmr1936884otf.1.1655208838771; 
 Tue, 14 Jun 2022 05:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1GuWY8VJDgj2m6R7JyxDGRpVUFKpSclcsNSPe1agmSmuD64u8gGpoTFG1UDHPAn0vxNGyLYil1tS3SYdc4Zs=
X-Received: by 2002:a9d:4d19:0:b0:60c:6707:9a5b with SMTP id
 n25-20020a9d4d19000000b0060c67079a5bmr1936879otf.1.1655208838564; Tue, 14 Jun
 2022 05:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
 <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
In-Reply-To: <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Tue, 14 Jun 2022 14:13:46 +0200
Message-ID: <CAMDeoFV3SEWv5gAUd-ZJ=pGw3=JkHR9pOztkytGr1tRhM_uBNw@mail.gmail.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
To: David Hildenbrand <david@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsuvorov@redhat.com;
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

On Tue, Jun 14, 2022 at 11:50 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 14.06.22 10:54, Igor Mammedov wrote:
> > On Mon, 13 Jun 2022 16:09:53 +0100
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> >> On Mon, Jun 13, 2022 at 05:01:10PM +0200, Julia Suvorova wrote:
> >>> On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>>>
> >>>> On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:
> >>>>> In the ACPI specification [1], the 'unarmed' bit is set when a device
> >>>>> cannot accept a persistent write. This means that when a memdev is
> >>>>> read-only, the 'unarmed' flag must be turned on. The logic is correct,
> >>>>> just changing the error message.
> >>>>>
> >>>>> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> >>>>>
> >>>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> >>>>> ---
> >>>>>  hw/mem/nvdimm.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>>
> >>> It seems like Xiao is not active, whose tree should this patch go to?
>
> Is that a temporary or a permanent thing? Do we know?

No idea. But his last signed-off was three years ago.

> >
> > Perhaps David can add himself as maintainer (i.e. put it
> > under memory mantanership umbrella) and merge it
>
> Maybe it makes sense to combine NVDIMM with pc-dimm.c and
> memory-device.c into a "MEMORY DEVICE" section. Then, remove "hw/mem/*"
> from "ACPI/SMBIOS".
>
> cxl_type3.c, npcm7xx_mc.c and sparse-mem.c in /hw/mem/ are a bit
> different. We could add cxl_type3.c to "Compute Express Link".
> npcm7xx_mc.c and sparse-mem.c should be already covered.
>
> --
> Thanks,
>
> David / dhildenb
>


