Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86C4A4950
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:29:26 +0100 (CET)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXgL-0003Qg-Dk
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:29:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEXOl-0000Eu-BF
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEXOh-0008Pb-0F
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643638229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzsMSkY1XluvSsoENoAndPGSeQxA08MiaeLLSNbx0eY=;
 b=Pk8ktL00ZlnhBiiXRBK2N31ny76EzKtCUuhUWWg81PC6+4k/kqlbH4szgMjaI5SXvaLT+f
 Uv7n4ndzBd68obeME+y1OFGLjw+HY5EPHsTImaVO+3zFL7CsObWxt5HE4/yR/polhUufyy
 k8iVTiDMYLYFfo4nTKR9FaDZEblRex0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-hwZ1ieXhN2GEoMlKGF1JqQ-1; Mon, 31 Jan 2022 09:10:27 -0500
X-MC-Unique: hwZ1ieXhN2GEoMlKGF1JqQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 o5-20020a50c905000000b00403bbdcef64so6528201edh.14
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 06:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OzsMSkY1XluvSsoENoAndPGSeQxA08MiaeLLSNbx0eY=;
 b=AhXcDEofYmDljydxmHlu3YOSyx9Xu5+eYVJ/ReDsegvtyqEEjucfVBPZjWw5usTC5m
 NLnNKOpC1FbozeU4rZGPHWk33FW8apWBR2Wz4DIyhNOG/8WNcRPszH+m0yhwDIUVTxWW
 9bVD1fhb8nvqKONxxPWkJLzn7SuS0eoSEGCu1ZsOC+Ghk8d2GZNz4M+W9kPlJ4ZqiMZQ
 YgSmhbT31WGI0kXZHbkVNwz+Qh8boDrSf4xh6RDEDDIBnCQ90OaRjthdMZ5MkGhj8Tra
 c9ZS2lb1Q+H3NAA8wwm6zfsKsH1DfgCEIcc1+CSY4uEv0CfvZdKrAKdWP/q22Ozw32uk
 IWRQ==
X-Gm-Message-State: AOAM5300kvdEQYPuSlow1lrLdcu72ANdnqzugMxGvc9jhrY6UJdrBm0q
 FbxL4r0jRbtjS++LxmgW3XVyfcnxE9GxJjzJ20sSkoSx4BjI9b/W70wy+mF6qH2TNTgz414TSuX
 KTb5J4GiAidCQ1TQ=
X-Received: by 2002:aa7:cd0e:: with SMTP id b14mr20579378edw.414.1643638226167; 
 Mon, 31 Jan 2022 06:10:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV/2h0mI1oHBp7IZDmGZ1Kiaxkx8QMmNuDwJSMuOu9hsTv2CLxJCEGnNkbJrzeGALDNUNCtQ==
X-Received: by 2002:aa7:cd0e:: with SMTP id b14mr20579356edw.414.1643638225903; 
 Mon, 31 Jan 2022 06:10:25 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k20sm13678111eja.14.2022.01.31.06.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 06:10:25 -0800 (PST)
Date: Mon, 31 Jan 2022 15:10:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Message-ID: <20220131151024.15070c15@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2201311854290.1478493@anisinha-lenovo>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
 <20220131142015.5e73ff90@redhat.com>
 <alpine.DEB.2.22.394.2201311854290.1478493@anisinha-lenovo>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: qemu-stable@nongnu.org, "Michael S
 . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 18:58:57 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, 31 Jan 2022, Igor Mammedov wrote:
> 
> > On Mon, 31 Jan 2022 11:47:00 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:  
> > > >
> > > > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > > > fields in headers of ACPI tables. While it doesn't have impact on
> > > > default values since QEMU uses 6 and 8 characters long values
> > > > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > > > It shouldn't affect guest (but may cause licensing verification
> > > > issues in guest OS).
> > > > One of the broken usecases is user supplied SLIC table with IDs
> > > > shorter than max possible length, where [2] mangles IDs with extra
> > > > spaces in RSDT and FADT tables whereas guest OS expects those to
> > > > mirror the respective values of the used SLIC table.
> > > >
> > > > Fix it by replacing whitespace padding with '\0' padding in
> > > > accordance with [1] and expectations of guest OS
> > > >
> > > > 1) ACPI spec, v2.0b
> > > >        17.2 AML Grammar Definition
> > > >        ...
> > > >        //OEM ID of up to 6 characters. If the OEM ID is
> > > >        //shorter than 6 characters, it can be terminated
> > > >        //with a NULL character.  
> > >
> > > On the other hand, from
> > > https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
> > > ,
> > >
> > > "For example, the OEM ID and OEM Table ID in the common ACPI table
> > > header (shown above) are fixed at six and eight characters,
> > > respectively. They are not necessarily null terminated"
> > >
> > > I also checked version 5 and the verbiage is the same. I think not
> > > terminating with a null is not incorrect.  
> >
> > I have a trouble with too much 'not' within the sentence.  
> 
> :-)
> 
> > So what's the point of this comment and how it's related to
> > this patch?  
> 
> My understanding of the spec is that null termination of both those IDs is
> not mandatory. Guests may get confused or expect the strings to be null
> termimated but they should really be open to expecting non-null terminated
> strings as well. What is important is that the number of chars of those
> two strings are fixed and well defined in the spec and qemu
> implementation.
>
> In any case, I think we can leave the patch as is for now and see if the
> change causes trouble with other guests.


these fields have a fixed length so one doesn't need terminating NULL
in case the full length of the field is utilized, otherwise in case of
where the value is shorter than max length it has to be null terminated
to express a shorter value. That way QEMU worked for years until
602b458201 introduced regression.



