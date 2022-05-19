Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8550E52D360
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:59:44 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfkl-0002U0-Lm
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfgt-0007Bm-Hc
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfgr-0000Ig-WA
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652964941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aq4W+VwhZVQoMNitLSstpO9n1bNzN6QPdMvRH0v0ku4=;
 b=Vq84dOQ1wYY/APLx9qKx1Uf29wrUx9eM+aQByFAcDeyJ3MXj0hFknsIfUpviakqfl01IWg
 mHoXNk1h1hcOyPHoCQ6NPIBkd+TZLGO+YafuHR3T9uw9EoDr5YsRWbiK1RHCnk/hmYYGtd
 ZrfmjzDTRnjavxeqxWNPLMXeBCIbyzs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-xpgpmj6wPC-kEcCE0spI3w-1; Thu, 19 May 2022 08:55:40 -0400
X-MC-Unique: xpgpmj6wPC-kEcCE0spI3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so2000967wma.6
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aq4W+VwhZVQoMNitLSstpO9n1bNzN6QPdMvRH0v0ku4=;
 b=Oeyr/BZP2bCglCx5TbaKtLvbs90mP3A8n2S2MUd8F5Un1d0LqTsSe/LvHSgzphDjci
 KiJcVI6+xnc8+MnFNiMaBTLapou+IhtbI0n5WYwWeoVFt3SFf/9OGBkQ2BMxYtqUSePK
 auZkYAuZzxBgQS2x5mm/a1BAFdDRQ8VCq2AkhrxRG/NzbfqNSYrPU66MTIXWzDI1YJ5H
 LQl3MdQciwftTSWhSoxWv+mgup++SyuVqlfUpocLnLV/Xgw5srN9U8YqUps1Rcu+q8e6
 h1xznCG1t3lGfDw5Vh8ObQ3sKA5gp899bxMFrS7gmVkU61k7lAmEiSDRD9uu8RD5CtPL
 5tfw==
X-Gm-Message-State: AOAM533BhmDHbTVsPWWhiv5zv2qP6t6KeQ+mDMeVkzbqVMKdLnxAbL6R
 M4ee/NigmWxxK5VKbgA3NEZHrxg97COcyPOJYpUVGjIvP900QtBlC8kR21tIbeIqk7sakiKRORM
 jkQP3KXs1bBaxnF0=
X-Received: by 2002:a05:600c:4e91:b0:394:89c9:a4bf with SMTP id
 f17-20020a05600c4e9100b0039489c9a4bfmr4271836wmq.81.1652964939081; 
 Thu, 19 May 2022 05:55:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWslYVLP98oc63vPFx/VuN6vlx0ruxPVgvN6KkXwgwVumyJJjTaihg9ueX5U/Q1mQaiK7PqA==
X-Received: by 2002:a05:600c:4e91:b0:394:89c9:a4bf with SMTP id
 f17-20020a05600c4e9100b0039489c9a4bfmr4271820wmq.81.1652964938840; 
 Thu, 19 May 2022 05:55:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d6b8a000000b0020c5253d8dfsm4696618wrx.43.2022.05.19.05.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 05:55:38 -0700 (PDT)
Date: Thu, 19 May 2022 14:55:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 31/35] acpi: pc/q35: tpm-tis: fix TPM device scope
Message-ID: <20220519145537.40ee934c@redhat.com>
In-Reply-To: <CAARzgwxP-JQ3O34oa95mQuJ=q7Pm0jVsqNOpQudvkeU_==oBwQ@mail.gmail.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-32-imammedo@redhat.com>
 <CAARzgwxP-JQ3O34oa95mQuJ=q7Pm0jVsqNOpQudvkeU_==oBwQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 18 May 2022 14:33:12 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, May 16, 2022 at 8:57 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > tpm-tis, is not a PCI device but ISA one, move it
> > under ISA scope to fix incorrect placement.  
> 
> This description is a little misleading. What we fix here is for
> TPM-tis 2.0 only. TPM 1.2 was already previously under ISA scope.

I'll fix it up on respin

> >
> > Fixes: 24cf5413aa0 (acpi: Make TPM 2.0 with TIS available as MSFT0101)
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> modulo that above comment,
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
> > ---
> >  hw/i386/acpi-build.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index a42f41f373..85a7313cad 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1764,15 +1764,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >
> >  #ifdef CONFIG_TPM
> >              if (TPM_IS_TIS_ISA(tpm)) {
> > +                dev = aml_device("ISA.TPM");
> >                  if (misc->tpm_version == TPM_VERSION_2_0) {
> > -                    dev = aml_device("TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> >                                                    aml_string("MSFT0101")));
> >                      aml_append(dev,
> >                                 aml_name_decl("_STR",
> >                                               aml_string("TPM 2.0 Device")));
> >                  } else {
> > -                    dev = aml_device("ISA.TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> >                                                    aml_eisaid("PNP0C31")));
> >                  }
> > --
> > 2.31.1
> >  
> 


