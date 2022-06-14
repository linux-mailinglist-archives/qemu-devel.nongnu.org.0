Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F554ACAA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:02:14 +0200 (CEST)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12R9-0001dp-So
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o12JU-0005Xj-Rb
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o12JR-0000nE-Ov
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655196852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpTATOEl51QpV/ywBY1ZDJHCX5iAffmrazeyrSnsa8Y=;
 b=NHOb2aH6RjcuuCGz3sLiiZRRvOhi9nCPeA75iFM8UGEvVP2QIBFDHdPNpneRBLyx9PBhD2
 ir/PfHQoPgP6bUZhL34ZmoqOUc0irH990vxsSUEc0srVWWEcOJojN/5F3uuAmuNuL6cY0j
 TwLyUfx0RHZZud2yfhhgw1Wndv9W6gk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-QWme4d0gM4CI9Jxio3M7UA-1; Tue, 14 Jun 2022 04:54:11 -0400
X-MC-Unique: QWme4d0gM4CI9Jxio3M7UA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so4502621wms.6
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 01:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tpTATOEl51QpV/ywBY1ZDJHCX5iAffmrazeyrSnsa8Y=;
 b=D3Bf3vxy6IHP2pLPk1VV+JWOqDxlu8uWzcAmnEhIwfMJUhGDdQ2vJUMvyBW+m0jJ9+
 qfXouKqtMuBjPnGpQ+gwtZlmPPCmpT0xUOJ8rmp2Vs3dc1UCuZSlsHgLe5F12zBTMWn7
 TvTnDW3toWaLvvAMYbxV8nEZJqfin13X1cZ8ozFXYLY+zgWBTW+JPkjn13adVTJ7Trpw
 uBGszYpTj1jPPDOl572q8HGIWVpcDPeuYd0mfq7anWkJ7MAlEZfg6PfI7+H75vq9qW2j
 leTkjkI2a89CKOqax/GaujovAvyigFm6+9wP3tiSzYB+BVnLj2alXGAgZ/xkZXgOYFdB
 twzQ==
X-Gm-Message-State: AJIora/Fr2Y61EMHlBRjlJSsNdKLR3oaR73GG/cgC8Q8w0XzXAetpsa2
 mQeIeRZD0Az8WoROoYjWMZOWTtiyQChvQSttSajnXM0OBfUFpDBp41jyHks0wByUAo32ugnBzsP
 tWd75cn3mrMMmFTY=
X-Received: by 2002:a05:6000:1acf:b0:218:5a30:9067 with SMTP id
 i15-20020a0560001acf00b002185a309067mr3848885wry.48.1655196850466; 
 Tue, 14 Jun 2022 01:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLjJPVk1NptUsTcxMQSdZP31Mm/qtstrxVSXUS16xVZXG8m3gyQFc+bDVci5P17Lds/f9HRQ==
X-Received: by 2002:a05:6000:1acf:b0:218:5a30:9067 with SMTP id
 i15-20020a0560001acf00b002185a309067mr3848862wry.48.1655196850225; 
 Tue, 14 Jun 2022 01:54:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c129100b0039754d1d327sm12211765wmd.13.2022.06.14.01.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 01:54:09 -0700 (PDT)
Date: Tue, 14 Jun 2022 10:54:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Message-ID: <20220614105408.235f0f41@redhat.com>
In-Reply-To: <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, 13 Jun 2022 16:09:53 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Jun 13, 2022 at 05:01:10PM +0200, Julia Suvorova wrote:
> > On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:  
> > >
> > > On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:  
> > > > In the ACPI specification [1], the 'unarmed' bit is set when a device
> > > > cannot accept a persistent write. This means that when a memdev is
> > > > read-only, the 'unarmed' flag must be turned on. The logic is correct,
> > > > just changing the error message.
> > > >
> > > > [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> > > >
> > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > ---
> > > >  hw/mem/nvdimm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)  
> > >
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>  
> > 
> > It seems like Xiao is not active, whose tree should this patch go to?  

Perhaps David can add himself as maintainer (i.e. put it
under memory mantanership umbrella) and merge it 

> 
> Michael or Igor can merge it:
> 
>   $ scripts/get_maintainer.pl -f hw/mem/nvdimm.c
>   Xiao Guangrong <xiaoguangrong.eric@gmail.com> (maintainer:NVDIMM)
>   "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
>   Igor Mammedov <imammedo@redhat.com> (supporter:ACPI/SMBIOS)
>   Ani Sinha <ani@anisinha.ca> (reviewer:ACPI/SMBIOS)
>   qemu-devel@nongnu.org (open list:All patches CC here)
> 
> Stefan


