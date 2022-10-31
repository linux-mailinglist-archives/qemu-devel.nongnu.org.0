Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FC6133E3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSJh-0000kC-8N; Mon, 31 Oct 2022 06:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opSJf-0000jq-4Z
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opSJd-00070v-K8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667213208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bT4I60z2yjyhB9cZ2tIESm0NVFEBUC1ZLEnE6Xc4UgI=;
 b=XzMUnJCty7+BGccvzCD6NNW9YfobWprPOhtW4FMD+oKinuMAsAwl9c60/KmrC8Vx3Kki82
 SB7F++SUqqLNhTd/ASM0tgcwDdz5YAShVIwcyxJ1bAyrxn5+TwvJTamURPhyicaRTX41/0
 iEnfAL9LVjUYIcmDG8eIozyO4Ru3C1Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-iySL2La-NFaXdzRGCI2VyA-1; Mon, 31 Oct 2022 06:46:46 -0400
X-MC-Unique: iySL2La-NFaXdzRGCI2VyA-1
Received: by mail-qk1-f197.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso9232420qkp.20
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bT4I60z2yjyhB9cZ2tIESm0NVFEBUC1ZLEnE6Xc4UgI=;
 b=oI3ac8bjQIdr/li+9aRnuAIA2SVkQlmUovh0QP7z9PH8Am9LZ09GDQiNf6lktebcEn
 yA3JyQ0nWP7tYYl3eLGOj4c+q+kDRxiwnKsm2nLaEVOcliov2/7jqtsatxdurPXFur0x
 dxeL8o3WLb2Awv3w8wHFM3FssGIICPW2Gc55NJrpLDspFDgCifjJYd5joVXfRJLIrQit
 gyaxyiV6siHK+MxzCHCQzSnd4fzJVsKGj0a7aywRMwRLttTv1JdLGhnt34UZjA1+exYM
 srpjNAqZxLiOkRBtKYJ6re0mpbf9CmzbIBhsYjuHw3TgJB20ODrAbzPZUjm6hzJmfqDB
 PgOg==
X-Gm-Message-State: ACrzQf3rl6f0G5gQ6hrnoZkfj5+z4BM5TqcghBAvG/MtiVoKMwhC81sy
 7H3D6+T44phmZ745MdvAhjnAuWKS4aczUYhUBQRqpfgJMxhQ+ld28mH1bWGCyh4ByInmr3/ARV7
 iKGxoNjdU0bMJuD8=
X-Received: by 2002:a05:620a:290d:b0:6b5:cecc:1cab with SMTP id
 m13-20020a05620a290d00b006b5cecc1cabmr8329237qkp.465.1667213205981; 
 Mon, 31 Oct 2022 03:46:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4GvVum9gx9LvEJK/CsUtPetdXkufQko0hl9Ck3jPlClvsEZlLia81qdx0+wbY1g0J7DcJnXg==
X-Received: by 2002:a05:620a:290d:b0:6b5:cecc:1cab with SMTP id
 m13-20020a05620a290d00b006b5cecc1cabmr8329230qkp.465.1667213205773; 
 Mon, 31 Oct 2022 03:46:45 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05620a400400b006cdd0939ffbsm4441908qko.86.2022.10.31.03.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 03:46:44 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:46:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: type mismatch in SSDT
Message-ID: <20221031114643.39a95779@fedora>
In-Reply-To: <20221027101531-mutt-send-email-mst@kernel.org>
References: <20221027015833-mutt-send-email-mst@kernel.org>
 <20221027155253.0d81989c@fedora>
 <20221027101531-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 10:15:58 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Oct 27, 2022 at 03:52:53PM +0200, Igor Mammedov wrote:
> > On Thu, 27 Oct 2022 01:59:22 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > Just noticed this when disassembling:
> > > 
> > > Parsing completed
> > > ACPI Warning: NsLookup: Type mismatch on ODAT (RegionField), searching for (Buffer) (20210604/nsaccess-760)
> > > Disassembly completed
> > > ASL Output:    /tmp/old-asl2/tests/data/acpi/virt/SSDT.memhp.dsl - 14945 bytes
> > > 
> > > Did not look into this yet but it seems new.  
> > It was there practically 'forever'.
> > 
> > ODAT should be treated as Buffer according to implicit Field/data conversion rules,
> > that's probably the reason why it works. So warning looks a bit bogus to me.
> > 
> > however:
> >   DefCreateByteField := CreateByteFieldOp SourceBuff ByteIndex NameString
> >   SourceBuff := TermArg => Buffer
> >   TermArg := ExpressionOpcode | DataObject | ArgObj | LocalObj
> > 
> > and none of that explicitly leads to 
> > 
> >   TermObj := Object | StatementOpcode | ExpressionOpcode
> >   Object := NameSpaceModifierObj | NamedObj
> > 
> > So if we are to be as pedantic as IASL, we need to supply
> > field to CreateByteField not by name but via one of TermArg.
> > We could copy/assign whole buffer to a LocalObj
> > or summarily use ExpressionOpcode => ToBuffer() // this one has a bit controversial definition in 6.4 spec
> > or to avoid any copying add 'useless' DerefOf(RefOf())
> > wrapper around name to make argument of ExpressionOpcode kind.
> > 
> > following should silence warning.
> > 
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > index 31e46df0bd..7488007540 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -1127,7 +1127,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
> >      /* If RLEN >= Integer size, just use CreateField() operator */
> >      aml_append(method, aml_store(aml_shiftleft(dsm_out_buf_size, aml_int(3)),
> >                                   dsm_out_buf_size));
> > -    aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
> > +    aml_append(method, aml_create_field(aml_derefof(aml_refof(aml_name(NVDIMM_DSM_OUT_BUF))),
> >                 aml_int(0), dsm_out_buf_size, "OBUF"));
> >      aml_append(method, aml_return(aml_name("OBUF")));  
> 
> 
> Thanks! Let's try to raise this with ACPI committee?

Do you have a contact there or know how to rise the issue?



