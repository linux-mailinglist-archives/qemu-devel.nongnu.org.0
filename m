Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356A51C0A8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:29:08 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbXW-0004r9-Rk
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nmbVg-0004Bz-Iv
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:27:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:44340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nmbVa-0002If-Rs
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651757226; x=1683293226;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9g9AmMwMIGLZvyyNW8G6JtTnMDrVABRf4xobf+Lfvhs=;
 b=U7IXKZktTbg7bHphWX0dezp0ypsXRqRQNU45lQxmYD6kVhN6U5P6N+ce
 G5oU8mIw8t0+DB0LtYXUoTs/jvzbBFaiZpFR3gAR5zB7cxq2OrhTS8kjq
 wEzxTZGvLDqA61qdtFrfCpT46krrTYCNHiPZARkTShrU7ayUKFetPDZbN
 4mn49Vt1t03A86r58OeIpr6ImS1E4YdpWzLkL5FtYUs/rZwQBfBcGSIP8
 OGDgXObFROmelBOdbkB+VXD7h2A5A9zPkefVyRieH08gnU1RriTL0spvg
 sjPdDukLWY3Zkanc+BhIBOZ9knwhP7KMB/KSpJN8D7C4Lms/YDQBwdwuN g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293308001"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="293308001"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="734895101"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga005.jf.intel.com with ESMTP; 05 May 2022 06:26:59 -0700
Message-ID: <e0f2a0ff9c2a35beb5c2ad06b522d8f6c1aaee31.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, ani@anisinha.ca, 
 qemu-devel@nongnu.org, dan.j.williams@intel.com, jingqi.liu@intel.com, 
 robert.hu@intel.com
Date: Thu, 05 May 2022 21:26:59 +0800
In-Reply-To: <20220505105006.7c1e78cc@redhat.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
 <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
 <20220503102742.0d5bab41@redhat.com>
 <dc177dd8eb6051ab9ab2752d657188fba83f0773.camel@linux.intel.com>
 <20220505105006.7c1e78cc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=robert.hu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2022-05-05 at 10:50 +0200, Igor Mammedov wrote:
...
> > > > > > @@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml
> > > > > > *dev)
> > > > > >  static void nvdimm_build_nvdimm_devices(Aml *root_dev,
> > > > > > uint32_t
> > > > > > ram_slots)
> > > > > >  {
> > > > > >      uint32_t slot;
> > > > > > +    Aml *method, *pkg, *buff;
> > > > > > +
> > > > > > +    /* Build common shared buffer for params pass in/out
> > > > > > */
> > > > > > +    buff = aml_buffer(4096, NULL);
> > > > > > +    aml_append(root_dev, aml_name_decl("BUFF", buff));    
> > > > > 
> > > > > is there a reason to use global variable instead of
> > > > > LocalX?    
> > > > 
> > > > Local in root_dev but global to its sub devices? I think it is
> > > > doable.
> > > > 
> > > > But given your below comments on return param _LS{I,R,W}, I now
> > > > think,
> > > > in v2, I'm not going to reuse existing "NCAL" method, but
> > > > implement
> > > > _LS{I,R,W} their own, stringently follow interface spec. Then,
> > > > no
> > > > buff
> > > > required at all. How do you like this?  
> > > > >     
...
> > > > >     
> > > > > > +        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
> > > > > > +        aml_append(method,
> > > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > > +                            aml_touuid("4309AC30-0D11-
> > > > > > 11E4-
> > > > > > 9191-
> > > > > > 0800200C9A66"),
> > > > > > +                            aml_int(2), aml_int(4),
> > > > > > aml_int(0),
> > > > > > +                            aml_int(handle))));
> > > > > > +        aml_append(nvdimm_dev, method);    
> > > > > 
> > > > > _LSI should return Package    
> > > > 
> > > > Right. See above.  
> > > > >     
> > > > > > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > > > > > +        aml_append(method,
> > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > aml_int(0),
> > > > > > "DWD0"));
> > > > > > +        aml_append(method,
> > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > aml_int(4),
> > > > > > "DWD1"));    
> > > > > 
> > > > > theoretically aml_create_dword_field() takes TermArg as
> > > > > source
> > > > > buffer,
> > > > > so it doesn't have to be a global named buffer.
> > > > > Try keep buffer in LocalX variable and check if it works in
> > > > > earliest
> > > > > Windows version that supports NVDIMMs. If it does then drop
> > > > > BUFF
> > > > > and
> > > > > use
> > > > > Local variable, if not then that fact should be mentioned in
> > > > > commit
> > > > > message/patch    
> > > > 
> > > > Thanks Igor. I'm new to asl grammar, I'll take your advice.
> > > >   
> > > > >     
> > > > > > +        pkg = aml_package(1);
> > > > > > +        aml_append(pkg, aml_name("BUFF"));
> > > > > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > > > > +        aml_append(method, aml_store(aml_arg(0),
> > > > > > aml_name("DWD0")));
> > > > > > +        aml_append(method, aml_store(aml_arg(1),
> > > > > > aml_name("DWD1")));    
> > > > > 
> > > > > perhaps use less magical names for fields, something like:
> > > > >   DOFF
> > > > >   TLEN
> > > > > add appropriate comments    
> > > > 
> > > > No problem.  
> > > > > 
> > > > > Also I'd prepare/fill in buffer first and only then declare
> > > > > initialize
> > > > > Package + don't use named object for Package if it can be
> > > > > done
> > > > > with
> > > > > help
> > > > > of Local variables.
> > > > >     
> > > > > > +        aml_append(method,
> > > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > > +                            aml_touuid("4309AC30-0D11-
> > > > > > 11E4-
> > > > > > 9191-
> > > > > > 0800200C9A66"),
> > > > > > +                            aml_int(2), aml_int(5),
> > > > > > aml_name("PKG1"),
> > > > > > +                            aml_int(handle))));    
> > > > > 
> > > > > this shall return Package not a Buffer    
> > > > 
> > > > Right, Going to re-implement these methods rather than wrapper
> > > > NCAL.  
> > > 
> > > wrapper is fine, you just need to repackage content of the Buffer
> > > into a Package
> > >   
> > 
> > I now prefer re-implementation, i.e. make _LS{I,R,W} their own
> > functions, less NACL's burden and don't make it more complex, it's
> > already not neat; and more point, I think by this we can save the
> > 4K
> > Buff at all.
> > Does this sound all right to you?
> 
> On one hand what you propose will be bit simpler (but not mach) than
> repacking (and only on AML guest side), however it will add to host
> side an extra interface/ABI that we will have to maintain, also it
> won't save space as buffer will still be there for legacy interface.

No, sorry, I didn't explain it clear.
No extra interface/ABI but these 3 must _LS{I,R,W} nvdimm-sub-device
methods. Of course, I'm going to extract 'SystemIO' and 'SystemMemory'
operation regions out of NACL to be globally available.

The buffer (BUFF in above patch) will be gone. It is added by my this
patch, its mere use is to covert param of _LS{I,R,W} into those of
NACL. If I implemented each _LS{I,R,W} on their own, rather than wrap
the multi-purpose NACL, no buffer needed, at least I now assume so.
And, why declare the 4K buffer global to sub-nvdimm? I now recall that
it is because if not each sub-nvdimm device would contain a 4K buff,
which will make this SSDT enormously large.
> 
> So unless we have to add new host/guest ABI, I'd prefer reusing
> existing one and complicate only new _LS{I,R,W} AML without
> touching NACL or host side.

As mentioned above, I assume no new host/guest ABI, just extract
'SystemIO' and 'SystemMemory' operation regions to a higher level
scope.
> 
> > 
> > > > >     
> > > > > > +        aml_append(nvdimm_dev, method);
> > > > > > +
> > > > > > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > > > > > +        aml_append(method,
> > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > aml_int(0),
> > > > > > "DWD0"));
> > > > > > +        aml_append(method,
> > > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > > aml_int(4),
> > > > > > "DWD1"));
> > > > > > +        aml_append(method,
> > > > > > +            aml_create_field(aml_name("BUFF"),
> > > > > > aml_int(64),
> > > > > > aml_int(32672), "FILD"));
> > > > > > +        pkg = aml_package(1);
> > > > > > +        aml_append(pkg, aml_name("BUFF"));
> > > > > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > > > > +        aml_append(method, aml_store(aml_arg(0),
> > > > > > aml_name("DWD0")));
> > > > > > +        aml_append(method, aml_store(aml_arg(1),
> > > > > > aml_name("DWD1")));
> > > > > > +        aml_append(method, aml_store(aml_arg(2),
> > > > > > aml_name("FILD")));
> > > > > > +        aml_append(method,
> > > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > > +                            aml_touuid("4309AC30-0D11-
> > > > > > 11E4-
> > > > > > 9191-
> > > > > > 0800200C9A66"),
> > > > > > +                            aml_int(2), aml_int(6),
> > > > > > aml_name("PKG1"),
> > > > > > +                            aml_int(handle))));    
> > > > > 
> > > > > should return Integer not Buffer, it looks like implicit
> > > > > conversion
> > > > > will take care of it,
> > > > > but it would be better to explicitly convert it to Integer
> > > > > even
> > > > > if
> > > > > it's only for the sake
> > > > > of documenting expected return value (or add a comment)    
> > > > 
> > > > I observed guest kernel ACPI component complaining this; just
> > > > warning,
> > > > no harm. I'll re-implement it.  
> > > 
> > > try to test it with Windows guest (it usually less tolerable to
> > > errors
> > > than Linux + it's own quirks that you need to carter to)
> > > Also it would e nice if you test and put results in cover letter
> > > not only for Linux but for Windows as well.
> > >   
> > 
> > I'll try to, but have no Windows resource at hand, I'll ask around
> > if
> > any test resource to cover that.
> > > > > 
> > > > > Also returned value in case of error
> > > > > NVDIMM_DSM_RET_STATUS_INVALID,
> > > > > in NVDIMM and ACPI spec differ. So fix the spec or remap
> > > > > returned
> > > > > value.
> > > > > 
> > > > >     
> > > > > > +        aml_append(nvdimm_dev, method);
> > > > > > +
> > > > > >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> > > > > >          aml_append(root_dev, nvdimm_dev);
> > > > > >      }    


