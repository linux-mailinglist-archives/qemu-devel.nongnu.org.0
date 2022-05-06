Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14551D44D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 11:25:17 +0200 (CEST)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmuD5-0002dN-Mp
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 05:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmuBN-0001th-Oq
 for qemu-devel@nongnu.org; Fri, 06 May 2022 05:23:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:31666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmuBK-0001Nz-6S
 for qemu-devel@nongnu.org; Fri, 06 May 2022 05:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651829003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EZ2dLr1ewINm4fL4YsSXN+FddN9iZC3QLFneCF6xhE=;
 b=NH+ljDZ31q89C1IQ21k5r5c2HPcpQ7eivVPuXuaauMvssAez+zqJLd1lhjp6mYuQR3w0Fv
 m+L4bXGYIZM7NDDwd91DhvLX7pUSXXXqVvCD1ziWr35J8VkNzN7O2CQ/s4fP2Sztx4EqjE
 sh/IygwX3UJPYS1VHSiOdh0xXCvIOhI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-6senzEkIP_O1Ev4FvvYscg-1; Fri, 06 May 2022 05:23:22 -0400
X-MC-Unique: 6senzEkIP_O1Ev4FvvYscg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ec44-20020a0564020d6c00b00425b136662eso3713931edb.12
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 02:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EZ2dLr1ewINm4fL4YsSXN+FddN9iZC3QLFneCF6xhE=;
 b=bgKiqlvW/79hQdFK3MnvRwUt+xsdmWpynAm1FrZkvl+UkhYiNsnGU47jKUQiiJkSQe
 e6PLGWzo61xuZv+rQzfVpqWLzAlRlrGTD8EIpncRTfqm17ojz60op4L4rebDjae3P6Qm
 R2+51hXDwUDK3l1NbpB9DnriV/IV2Y55ozjWjs382bT2sYTXx/50rWMLMtxDEg1tTxOF
 qs7OxzaKaqa5zrbZs5vOTsDmt+mCogiVlB1qDc8tlRQrhZAsEr1DsvdWqED+q+dY7ZDX
 gjV6L7YnomM/srh2eQ0bjbcjSlET53HckPjh8u2tGTAWm3MrXtsAg+gtELbeYSZJHgXA
 e8Vg==
X-Gm-Message-State: AOAM533NsLm6LpsTOPvJY9RtrK65xlLOoMGYaNTrY4xOsKi7RM7/1z63
 00Q74e2i3ZupVv+3Fx60TeoR6h4lFhr75GM/N1J8kEs6m2cFrxSoCHfMYir63SEmIVE0zpoX70x
 MjOo3LvtY60NxtdE=
X-Received: by 2002:a05:6402:d0a:b0:425:d455:452 with SMTP id
 eb10-20020a0564020d0a00b00425d4550452mr2466893edb.259.1651829001295; 
 Fri, 06 May 2022 02:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJZBW8kECwnuHLcsuT1fLpJs/951+jtk4LcPTk0RNfbjtcimW3PAF2AOWA4N11oN17KoMtAA==
X-Received: by 2002:a05:6402:d0a:b0:425:d455:452 with SMTP id
 eb10-20020a0564020d0a00b00425d4550452mr2466766edb.259.1651829000887; 
 Fri, 06 May 2022 02:23:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a05640204d800b0042617ba63bcsm2019133edw.70.2022.05.06.02.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 02:23:20 -0700 (PDT)
Date: Fri, 6 May 2022 11:23:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, ani@anisinha.ca,
 qemu-devel@nongnu.org, dan.j.williams@intel.com, jingqi.liu@intel.com,
 robert.hu@intel.com
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
Message-ID: <20220506112319.175028c6@redhat.com>
In-Reply-To: <e0f2a0ff9c2a35beb5c2ad06b522d8f6c1aaee31.camel@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
 <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
 <20220503102742.0d5bab41@redhat.com>
 <dc177dd8eb6051ab9ab2752d657188fba83f0773.camel@linux.intel.com>
 <20220505105006.7c1e78cc@redhat.com>
 <e0f2a0ff9c2a35beb5c2ad06b522d8f6c1aaee31.camel@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.74; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

On Thu, 05 May 2022 21:26:59 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Thu, 2022-05-05 at 10:50 +0200, Igor Mammedov wrote:
> ...
> > > > > > > @@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml
> > > > > > > *dev)
> > > > > > >  static void nvdimm_build_nvdimm_devices(Aml *root_dev,
> > > > > > > uint32_t
> > > > > > > ram_slots)
> > > > > > >  {
> > > > > > >      uint32_t slot;
> > > > > > > +    Aml *method, *pkg, *buff;
> > > > > > > +
> > > > > > > +    /* Build common shared buffer for params pass in/out
> > > > > > > */
> > > > > > > +    buff = aml_buffer(4096, NULL);
> > > > > > > +    aml_append(root_dev, aml_name_decl("BUFF", buff));      
> > > > > > 
> > > > > > is there a reason to use global variable instead of
> > > > > > LocalX?      
> > > > > 
> > > > > Local in root_dev but global to its sub devices? I think it is
> > > > > doable.
> > > > > 
> > > > > But given your below comments on return param _LS{I,R,W}, I now
> > > > > think,
> > > > > in v2, I'm not going to reuse existing "NCAL" method, but
> > > > > implement
> > > > > _LS{I,R,W} their own, stringently follow interface spec. Then,
> > > > > no
> > > > > buff
> > > > > required at all. How do you like this?    
> > > > > >       
> ...
> > > > > >       
> > > > > > > +        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
> > > > > > > +        aml_append(method,
> > > > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > > > +                            aml_touuid("4309AC30-0D11-
> > > > > > > 11E4-
> > > > > > > 9191-
> > > > > > > 0800200C9A66"),
> > > > > > > +                            aml_int(2), aml_int(4),
> > > > > > > aml_int(0),
> > > > > > > +                            aml_int(handle))));
> > > > > > > +        aml_append(nvdimm_dev, method);      
> > > > > > 
> > > > > > _LSI should return Package      
> > > > > 
> > > > > Right. See above.    
> > > > > >       
> > > > > > > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > > > > > > +        aml_append(method,
> > > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > > aml_int(0),
> > > > > > > "DWD0"));
> > > > > > > +        aml_append(method,
> > > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > > aml_int(4),
> > > > > > > "DWD1"));      
> > > > > > 
> > > > > > theoretically aml_create_dword_field() takes TermArg as
> > > > > > source
> > > > > > buffer,
> > > > > > so it doesn't have to be a global named buffer.
> > > > > > Try keep buffer in LocalX variable and check if it works in
> > > > > > earliest
> > > > > > Windows version that supports NVDIMMs. If it does then drop
> > > > > > BUFF
> > > > > > and
> > > > > > use
> > > > > > Local variable, if not then that fact should be mentioned in
> > > > > > commit
> > > > > > message/patch      
> > > > > 
> > > > > Thanks Igor. I'm new to asl grammar, I'll take your advice.
> > > > >     
> > > > > >       
> > > > > > > +        pkg = aml_package(1);
> > > > > > > +        aml_append(pkg, aml_name("BUFF"));
> > > > > > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > > > > > +        aml_append(method, aml_store(aml_arg(0),
> > > > > > > aml_name("DWD0")));
> > > > > > > +        aml_append(method, aml_store(aml_arg(1),
> > > > > > > aml_name("DWD1")));      
> > > > > > 
> > > > > > perhaps use less magical names for fields, something like:
> > > > > >   DOFF
> > > > > >   TLEN
> > > > > > add appropriate comments      
> > > > > 
> > > > > No problem.    
> > > > > > 
> > > > > > Also I'd prepare/fill in buffer first and only then declare
> > > > > > initialize
> > > > > > Package + don't use named object for Package if it can be
> > > > > > done
> > > > > > with
> > > > > > help
> > > > > > of Local variables.
> > > > > >       
> > > > > > > +        aml_append(method,
> > > > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > > > +                            aml_touuid("4309AC30-0D11-
> > > > > > > 11E4-
> > > > > > > 9191-
> > > > > > > 0800200C9A66"),
> > > > > > > +                            aml_int(2), aml_int(5),
> > > > > > > aml_name("PKG1"),
> > > > > > > +                            aml_int(handle))));      
> > > > > > 
> > > > > > this shall return Package not a Buffer      
> > > > > 
> > > > > Right, Going to re-implement these methods rather than wrapper
> > > > > NCAL.    
> > > > 
> > > > wrapper is fine, you just need to repackage content of the Buffer
> > > > into a Package
> > > >     
> > > 
> > > I now prefer re-implementation, i.e. make _LS{I,R,W} their own
> > > functions, less NACL's burden and don't make it more complex, it's
> > > already not neat; and more point, I think by this we can save the
> > > 4K
> > > Buff at all.
> > > Does this sound all right to you?  
> > 
> > On one hand what you propose will be bit simpler (but not mach) than
> > repacking (and only on AML guest side), however it will add to host
> > side an extra interface/ABI that we will have to maintain, also it
> > won't save space as buffer will still be there for legacy interface.  
> 
> No, sorry, I didn't explain it clear.
> No extra interface/ABI but these 3 must _LS{I,R,W} nvdimm-sub-device
> methods. Of course, I'm going to extract 'SystemIO' and 'SystemMemory'
> operation regions out of NACL to be globally available.
> 
> The buffer (BUFF in above patch) will be gone. It is added by my this
> patch, its mere use is to covert param of _LS{I,R,W} into those of
> NACL. If I implemented each _LS{I,R,W} on their own, rather than wrap
> the multi-purpose NACL, no buffer needed, at least I now assume so.
> And, why declare the 4K buffer global to sub-nvdimm? I now recall that
> it is because if not each sub-nvdimm device would contain a 4K buff,
> which will make this SSDT enormously large.

ok, lets see how it will look like when you are done.

> > 
> > So unless we have to add new host/guest ABI, I'd prefer reusing
> > existing one and complicate only new _LS{I,R,W} AML without
> > touching NACL or host side.  
> 
> As mentioned above, I assume no new host/guest ABI, just extract
> 'SystemIO' and 'SystemMemory' operation regions to a higher level
> scope.
> >   
> > >   
> > > > > >       
> > > > > > > +        aml_append(nvdimm_dev, method);
> > > > > > > +
> > > > > > > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > > > > > > +        aml_append(method,
> > > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > > aml_int(0),
> > > > > > > "DWD0"));
> > > > > > > +        aml_append(method,
> > > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > > aml_int(4),
> > > > > > > "DWD1"));
> > > > > > > +        aml_append(method,
> > > > > > > +            aml_create_field(aml_name("BUFF"),
> > > > > > > aml_int(64),
> > > > > > > aml_int(32672), "FILD"));
> > > > > > > +        pkg = aml_package(1);
> > > > > > > +        aml_append(pkg, aml_name("BUFF"));
> > > > > > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > > > > > +        aml_append(method, aml_store(aml_arg(0),
> > > > > > > aml_name("DWD0")));
> > > > > > > +        aml_append(method, aml_store(aml_arg(1),
> > > > > > > aml_name("DWD1")));
> > > > > > > +        aml_append(method, aml_store(aml_arg(2),
> > > > > > > aml_name("FILD")));
> > > > > > > +        aml_append(method,
> > > > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > > > +                            aml_touuid("4309AC30-0D11-
> > > > > > > 11E4-
> > > > > > > 9191-
> > > > > > > 0800200C9A66"),
> > > > > > > +                            aml_int(2), aml_int(6),
> > > > > > > aml_name("PKG1"),
> > > > > > > +                            aml_int(handle))));      
> > > > > > 
> > > > > > should return Integer not Buffer, it looks like implicit
> > > > > > conversion
> > > > > > will take care of it,
> > > > > > but it would be better to explicitly convert it to Integer
> > > > > > even
> > > > > > if
> > > > > > it's only for the sake
> > > > > > of documenting expected return value (or add a comment)      
> > > > > 
> > > > > I observed guest kernel ACPI component complaining this; just
> > > > > warning,
> > > > > no harm. I'll re-implement it.    
> > > > 
> > > > try to test it with Windows guest (it usually less tolerable to
> > > > errors
> > > > than Linux + it's own quirks that you need to carter to)
> > > > Also it would e nice if you test and put results in cover letter
> > > > not only for Linux but for Windows as well.
> > > >     
> > > 
> > > I'll try to, but have no Windows resource at hand, I'll ask around
> > > if
> > > any test resource to cover that.  
> > > > > > 
> > > > > > Also returned value in case of error
> > > > > > NVDIMM_DSM_RET_STATUS_INVALID,
> > > > > > in NVDIMM and ACPI spec differ. So fix the spec or remap
> > > > > > returned
> > > > > > value.
> > > > > > 
> > > > > >       
> > > > > > > +        aml_append(nvdimm_dev, method);
> > > > > > > +
> > > > > > >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> > > > > > >          aml_append(root_dev, nvdimm_dev);
> > > > > > >      }      
> 


