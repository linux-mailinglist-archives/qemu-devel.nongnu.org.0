Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C060FA46
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:18:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3gf-0008Db-Lw; Thu, 27 Oct 2022 10:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oo3g0-0005v9-N6
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oo3fz-0007Yn-4o
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666880165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZZnrReyOpudpzzXL+2Lr2I8xbla+0Zvkw3u85Aq8nQ=;
 b=GjypV4qq7ehW7tBgB3cF55q8d04m6MSpoEzyjxNbMAqdIQhlRmvb+Adima8ovNp88MlB4j
 I6Y9Nk4N7ESLE1ArSuegkQNJHkgP3brD2ybl7RYoryq/4cyi/AdjDEYNWQ7iQkxLwdtk6X
 Fti2QAiwPYNhBK+QiRpa3ZFIbjr0SHE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-FCtzHFboPg2S4zTFzKo80Q-1; Thu, 27 Oct 2022 10:16:03 -0400
X-MC-Unique: FCtzHFboPg2S4zTFzKo80Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so434018wru.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZZnrReyOpudpzzXL+2Lr2I8xbla+0Zvkw3u85Aq8nQ=;
 b=EOpxCSh2xdaDvd2cxpEkI+CfbuCwBVInisJp692djTaZtGWTVsfTK5bItQl8X7N/BO
 QmF/O1PtK+E3+ruz/OqcruNXtPOOqirFSeO1O5N/ARModV8FCqlZSwrrftVQArYL7tuz
 68i9a5A51teG7NxDJsMtWoaa4lsLiKLm259j+NrHABLPRvg/5i+TQXlny8Zt47eBzNUu
 n87o3Wgvffum6RD0WvKkUwVCaaqvKXlZVvAflVnuWA5AcOnJRDAfBbozFxwfqWX0PgoZ
 rW3KYwS6r+duaB9Uigo8JfWU3t4cGmaPQDPQYu+Pc5fMfD4RAVVoPMf10mSeqcJ5GQ02
 ekGw==
X-Gm-Message-State: ACrzQf37GwCTh2anZstvrA9L8vVaXm1M5cM8QEx2ZNF4wvFDMzJpb+X6
 uPVBtBrO7Grj7H+prs2Qxk7VunT9kq851SQo11PenDrm6YlJGWxBASvAUNiL1Z0+Iu+r/uYNjq6
 A4dzWzKyn4cso/jY=
X-Received: by 2002:a05:600c:255:b0:3c6:e58d:354e with SMTP id
 21-20020a05600c025500b003c6e58d354emr6135040wmj.168.1666880161710; 
 Thu, 27 Oct 2022 07:16:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5koh+moGW+i1QevcfdxBeH4SjjtOhCNNpxcqVl4A3Ke4SwxJXOn8RkQtp6dBINvcvcY93zZw==
X-Received: by 2002:a05:600c:255:b0:3c6:e58d:354e with SMTP id
 21-20020a05600c025500b003c6e58d354emr6135013wmj.168.1666880161397; 
 Thu, 27 Oct 2022 07:16:01 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 y16-20020adfd090000000b0022ae401e9e0sm1192592wrh.78.2022.10.27.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:16:00 -0700 (PDT)
Date: Thu, 27 Oct 2022 10:15:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: type mismatch in SSDT
Message-ID: <20221027101531-mutt-send-email-mst@kernel.org>
References: <20221027015833-mutt-send-email-mst@kernel.org>
 <20221027155253.0d81989c@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027155253.0d81989c@fedora>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Thu, Oct 27, 2022 at 03:52:53PM +0200, Igor Mammedov wrote:
> On Thu, 27 Oct 2022 01:59:22 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > Just noticed this when disassembling:
> > 
> > Parsing completed
> > ACPI Warning: NsLookup: Type mismatch on ODAT (RegionField), searching for (Buffer) (20210604/nsaccess-760)
> > Disassembly completed
> > ASL Output:    /tmp/old-asl2/tests/data/acpi/virt/SSDT.memhp.dsl - 14945 bytes
> > 
> > Did not look into this yet but it seems new.
> It was there practically 'forever'.
> 
> ODAT should be treated as Buffer according to implicit Field/data conversion rules,
> that's probably the reason why it works. So warning looks a bit bogus to me.
> 
> however:
>   DefCreateByteField := CreateByteFieldOp SourceBuff ByteIndex NameString
>   SourceBuff := TermArg => Buffer
>   TermArg := ExpressionOpcode | DataObject | ArgObj | LocalObj
> 
> and none of that explicitly leads to 
> 
>   TermObj := Object | StatementOpcode | ExpressionOpcode
>   Object := NameSpaceModifierObj | NamedObj
> 
> So if we are to be as pedantic as IASL, we need to supply
> field to CreateByteField not by name but via one of TermArg.
> We could copy/assign whole buffer to a LocalObj
> or summarily use ExpressionOpcode => ToBuffer() // this one has a bit controversial definition in 6.4 spec
> or to avoid any copying add 'useless' DerefOf(RefOf())
> wrapper around name to make argument of ExpressionOpcode kind.
> 
> following should silence warning.
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 31e46df0bd..7488007540 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1127,7 +1127,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
>      /* If RLEN >= Integer size, just use CreateField() operator */
>      aml_append(method, aml_store(aml_shiftleft(dsm_out_buf_size, aml_int(3)),
>                                   dsm_out_buf_size));
> -    aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
> +    aml_append(method, aml_create_field(aml_derefof(aml_refof(aml_name(NVDIMM_DSM_OUT_BUF))),
>                 aml_int(0), dsm_out_buf_size, "OBUF"));
>      aml_append(method, aml_return(aml_name("OBUF")));


Thanks! Let's try to raise this with ACPI committee?

-- 
MST


