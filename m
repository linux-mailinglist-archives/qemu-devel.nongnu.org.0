Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDA5BA78D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 09:40:39 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ5xk-0001nK-3n
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 03:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oZ5vP-0008IS-4M
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 03:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oZ5vL-00029H-L5
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 03:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663313884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giqZ+nOaCPJGxmZRrt1bk9EwMFSuMdXodZETVExOc/c=;
 b=eAFv1uxa7ACC7iYtn0dzGetsmIoJIcEJraxgDaMp6Fd9xU6EW5WNh+ByjMoCWN0d+DP1eT
 18bBthm3+iH0lIkwAJSVATl6TvuM+9GaXcmbPC3ZwrweNWuvGWjbuDN/yLD/PzboHSWkAY
 4cBokBZlG6YaprsqnQ0X4P0ECeWzC9I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-jd0otG3iPrmqAqXtwL5ZBQ-1; Fri, 16 Sep 2022 03:38:01 -0400
X-MC-Unique: jd0otG3iPrmqAqXtwL5ZBQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f10-20020a0564021e8a00b00451be6582d5so10594544edf.15
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 00:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=giqZ+nOaCPJGxmZRrt1bk9EwMFSuMdXodZETVExOc/c=;
 b=68Vpx3R8aM+hiAIh9DTj7Gqam22so131PHo3mXkMw4mHNb0elI5Z7KvKJ1bDLAg4QS
 I/XMoERW7aBYFp4eLT3GLDrykTMYT2/LxFMCHXaiDXiz8o8uNGXk6l7OhIXYQOmpak2x
 1BFzkc61JVsm/hglpjQpThYVMaVjQNWF0uld0kIxwBqMUjylYwKfnLViEoASrNPcn9R3
 Boicmqvu4JKamvei27orF24FObNhpqSWHJMmC3ZADMH7Drah8neXAIcPKYw5ropO0yJc
 YxLrld25rPAsyWKCyjF6OYuX14toQRWPe/buEGq9MQAclIaLpO3FQRKWYo3Sj3JnEHfi
 QzNg==
X-Gm-Message-State: ACrzQf14XxFPNLZwsoxOmBF2gkBPwHeG+IEf8YWWC1l2mcVnOiOCBsYl
 G+cTsdrinu84jujDxzlvj9shARohS2/zEZHMPxu03FL+oBmVfO/Hh49kkU4MY77wXXsf75up1Qh
 Io1vekxKyQTM1CDw=
X-Received: by 2002:aa7:c415:0:b0:44d:f432:3e84 with SMTP id
 j21-20020aa7c415000000b0044df4323e84mr2916432edq.56.1663313880030; 
 Fri, 16 Sep 2022 00:38:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4B0yhstDCXa9ODWCqrlHB9d/naznXMO1x8mpX3nbvZ46fRc471Usf7V2MAYRK6CLyLMuykig==
X-Received: by 2002:aa7:c415:0:b0:44d:f432:3e84 with SMTP id
 j21-20020aa7c415000000b0044df4323e84mr2916418edq.56.1663313879769; 
 Fri, 16 Sep 2022 00:37:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 16-20020a170906301000b007306a4ecc9dsm10208666ejz.18.2022.09.16.00.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 00:37:59 -0700 (PDT)
Date: Fri, 16 Sep 2022 09:37:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220916093757.689a939f@redhat.com>
In-Reply-To: <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
 <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Sep 2022 10:27:08 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Fri, 2022-09-09 at 15:39 +0200, Igor Mammedov wrote:
> ...
> > looks more or less fine except of excessive use of named variables
> > which creates global scope variables.
> > 
> > I'd suggest to store temporary buffers/packages in LocalX variales,
> > you should be able to do that for everything modulo
> > aml_create_dword_field().
> > 
> > see an example below
> >   
> ...
> > >  
> > > +        /*
> > > +         * ACPI v6.4: Section 6.5.10 NVDIMM Label Methods
> > > +         */
> > > +        /* _LSI */
> > > +        method = aml_method("_LSI", 0, AML_SERIALIZED);
> > > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > > +                            aml_int(1), aml_int(4), aml_int(0),
> > > +                            aml_int(handle));
> > > +        aml_append(method, aml_store(com_call, aml_local(0)));
> > > +
> > > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > > +                                                  aml_int(0),
> > > "STTS"));
> > > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > > aml_int(4),
> > > +                                                  "SLSA"));
> > > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > > aml_int(8),
> > > +                                                  "MAXT"));
> > > +
> > > +        pkg = aml_package(3);
> > > +        aml_append(pkg, aml_name("STTS"));
> > > +        aml_append(pkg, aml_name("SLSA"));
> > > +        aml_append(pkg, aml_name("MAXT"));
> > > +        aml_append(method, aml_name_decl("RET", pkg));  
> > 
> > ex: put it in local instead of named variable and return that
> > the same applies to other named temporary named variables.
> >   
> Fine, get your point now.
> In ASL it will look like this:
>                     Local1 = Package (0x3) {STTS, SLSA, MAXT}
>                     Return (Local1)


> 
> But as for 
>                     CreateDWordField (Local0, Zero, STTS)  // Status
>                     CreateDWordField (Local0, 0x04, SLSA)  // SizeofLSA
>                     CreateDWordField (Local0, 0x08, MAXT)  // Max Trans
> 
> I cannot figure out how to substitute with LocalX. Can you shed more
> light?

Leave this as is, there is no way to make it anonymous/local with FooField.

(well one might try to use Index and copy field's bytes into a buffer and
then explicitly convert to Integer, but that's a rather convoluted way
around limitation so I'd not go this route)

> 
> CreateQWordFieldTerm :=
> CreateQWordField (
> SourceBuffer, // TermArg => Buffer
> ByteIndex, // TermArg => Integer
> QWordFieldName // NameString
> )
> NameString :=
> <RootChar NamePath> | <ParentPrefixChar PrefixPath NamePath> |
> NonEmptyNamePath
> 
> > > +        aml_append(method, aml_return(aml_name("RET")));
> > > +  
> ...
> > > +        field = aml_create_dword_field(aml_local(3), aml_int(0),
> > > "STTS");
> > > +        aml_append(method, field);
> > > +        aml_append(method,
> > > aml_return(aml_to_integer(aml_name("STTS"))));  
> > 
> > why do you need explicitly convert DWORD field to integer?
> > it should be fine to return STTS directly (implicit conversion should
> > take care of the rest)  
> 
> Explicit convert eases my anxiety on uncertainty. ;)
> 
> >   
> > > +        aml_append(nvdimm_dev, method);
> > > +  
> ...
> 


