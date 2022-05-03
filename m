Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC806517FC7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:35:01 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnzo-000538-Go
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nlnss-0002N4-7n
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:27:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nlnsq-0002JE-4v
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651566467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/HzP710ArLpVSAiRS6UqwMskuf/VX/kMrrwN9K1xh0=;
 b=P/tfq5MY0Eigs5E1FgF2LjWZgTBwv4/uOkXhZHQ5tkJnwDFOpQdZeIYa6VuEC/Mke8L7SK
 KTzULZAHVJjUX2R1VwC9MalUO3V8LKXPLGvdaKql1Y0k3SlRWEoEnBBH/PRfEKPJ9IMTKQ
 kd/rTE4bGIgZSz71HdExejxSQZBZI8I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-c6zWtQIyPDO68RmFWn4oXQ-1; Tue, 03 May 2022 04:27:45 -0400
X-MC-Unique: c6zWtQIyPDO68RmFWn4oXQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so465478wmj.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 01:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/HzP710ArLpVSAiRS6UqwMskuf/VX/kMrrwN9K1xh0=;
 b=plwLQJNIosOHxRfGhn19jGku1d9FjURJlyUVAEBjws3t7CHAbwgxaMqLjrsQt+QPhM
 HZcCLQSTfi57W7MeGfEJKJD6Y0OsLE9iwYJF/ocFs3gioeRDumAzdfsZzkxIk7/1L20d
 2mDRf3voX9uJ5uvQQhj5So33xnrt5qUN+NymcVpDg2DsfyTKKXkn6jUkc/+pW0606Fut
 DErCI2fm4Y8KRQrzYOBbDrmfysjnwlE/b5cvqZ8BEuCpXCd/CVdnMJacn97Y8ZGBRuay
 iIyyOOsge5mDNiBqYUUMN6QT8TOlF2fsWflPcHjB6KBypiXssg2Yf4bAjuIz+WiJFqu0
 K1Og==
X-Gm-Message-State: AOAM530k02qDWgKecamUIqySYcHQRZuerP/pb8FUpkY4oDCv8Hyi9C4W
 4nnplvFGRgddTGMrz+Swbpx5DyfnAODS+er708EkGiFKU3okXccJpp+3uyBsiICOTazXvPy5dNN
 xVbmcuyXyGm1S+GM=
X-Received: by 2002:a1c:4e0b:0:b0:393:fd8f:e340 with SMTP id
 g11-20020a1c4e0b000000b00393fd8fe340mr2288490wmh.136.1651566464508; 
 Tue, 03 May 2022 01:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRWZUD2zYhG1syUUJuQ045rN/jfnIG/5PqTrcmyMm3VTxrh07qlhcVfu8qYoCMfLprM6oWBA==
X-Received: by 2002:a1c:4e0b:0:b0:393:fd8f:e340 with SMTP id
 g11-20020a1c4e0b000000b00393fd8fe340mr2288465wmh.136.1651566464272; 
 Tue, 03 May 2022 01:27:44 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e13-20020adf9bcd000000b0020c5253d8basm8920189wrc.6.2022.05.03.01.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:27:43 -0700 (PDT)
Date: Tue, 3 May 2022 10:27:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, ani@anisinha.ca,
 qemu-devel@nongnu.org, dan.j.williams@intel.com, jingqi.liu@intel.com,
 robert.hu@intel.com
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
Message-ID: <20220503102742.0d5bab41@redhat.com>
In-Reply-To: <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
 <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 29 Apr 2022 17:01:47 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Wed, 2022-04-27 at 16:34 +0200, Igor Mammedov wrote:
> > On Tue, 12 Apr 2022 14:57:52 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >   
> > > Since ACPI 6.2, previous NVDIMM/_DSM funcions "Get Namespace Label
> > > Data
> > > Size (function index 4)", "Get Namespace Label Data (function index
> > > 5)",
> > > "Set Namespace Label Data (function index 6)" has been deprecated
> > > by ACPI  
> > 
> > where it's said that old way was deprecated, should be mentioned here
> > including
> > pointer to spec where it came into effect.  
> 
> OK. https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
> 3.10 Deprecated Functions.
> I put it in cover letter. Will also mention it here.
> >   
> ...
> > > 
> > > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > > index 0d43da19ea..7cc419401b 100644
> > > --- a/hw/acpi/nvdimm.c
> > > +++ b/hw/acpi/nvdimm.c
> > > @@ -848,10 +848,10 @@ nvdimm_dsm_write(void *opaque, hwaddr addr,
> > > uint64_t val, unsigned size)
> > >  
> > >      nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> > > in->revision,
> > >                   in->handle, in->function);
> > > -
> > > -    if (in->revision != 0x1 /* Currently we only support DSM Spec
> > > Rev1. */) {
> > > -        nvdimm_debug("Revision 0x%x is not supported, expect
> > > 0x%x.\n",
> > > -                     in->revision, 0x1);
> > > +    /* Currently we only support DSM Spec Rev1 and Rev2. */  
> > 
> > where does revision 2 come from? It would be better to add a pointer
> > to relevant spec.  
> 
> https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
> Section 3 "_DSM Interface for the NVDIMM Device", table 3-A and 3-B.
> 
> I'll add this in comments in next version.
> >   
> > > +    if (in->revision != 0x1 && in->revision != 0x2) {
> > > +        nvdimm_debug("Revision 0x%x is not supported, expect 0x1
> > > or 0x2.\n",
> > > +                     in->revision);  
> > 
> > since you are touching nvdimm_debug(), please replace it with
> > tracing,
> > see docs/devel/tracing.rst and any commit that adds tracing calls
> > (functions starting with 'trace_').  
> 
> OK I'll have a try.

just make conversion a separate patch

> >   
> > >          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT,
> > > dsm_mem_addr);
> > >          goto exit;
> > >      }  
> > 
> > 
> > this whole hunk should be a separate patch, properly documented
> >   
> OK
> > 
> > also I wonder if DSM  
> 
> It's not in SDM, but above-mentioned _DSM Interface spec by Intel.
> >   
> > > @@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml *dev)
> > >  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t
> > > ram_slots)
> > >  {
> > >      uint32_t slot;
> > > +    Aml *method, *pkg, *buff;
> > > +
> > > +    /* Build common shared buffer for params pass in/out */
> > > +    buff = aml_buffer(4096, NULL);
> > > +    aml_append(root_dev, aml_name_decl("BUFF", buff));  
> > 
> > is there a reason to use global variable instead of LocalX?  
> 
> Local in root_dev but global to its sub devices? I think it is doable.
> 
> But given your below comments on return param _LS{I,R,W}, I now think,
> in v2, I'm not going to reuse existing "NCAL" method, but implement
> _LS{I,R,W} their own, stringently follow interface spec. Then, no buff
> required at all. How do you like this?
> >   
> > >  
> > >      for (slot = 0; slot < ram_slots; slot++) {
> > >          uint32_t handle = nvdimm_slot_to_handle(slot);
> > > @@ -1264,6 +1269,49 @@ static void nvdimm_build_nvdimm_devices(Aml
> > > *root_dev, uint32_t ram_slots)
> > >           */
> > >          aml_append(nvdimm_dev, aml_name_decl("_ADR",
> > > aml_int(handle)));
> > >  
> > > +        /* Build _LSI, _LSR, _LSW */  
> > 
> > should be 1 comment per method with spec/ver and chapter where it's
> > defined  
> 
> OK
> >   
> > > +        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
> > > +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid("4309AC30-0D11-11E4-9191-
> > > 0800200C9A66"),
> > > +                            aml_int(2), aml_int(4), aml_int(0),
> > > +                            aml_int(handle))));
> > > +        aml_append(nvdimm_dev, method);  
> > 
> > _LSI should return Package  
> 
> Right. See above.
> >   
> > > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > > +        aml_append(method,
> > > +            aml_create_dword_field(aml_name("BUFF"), aml_int(0),
> > > "DWD0"));
> > > +        aml_append(method,
> > > +            aml_create_dword_field(aml_name("BUFF"), aml_int(4),
> > > "DWD1"));  
> > 
> > theoretically aml_create_dword_field() takes TermArg as source
> > buffer,
> > so it doesn't have to be a global named buffer.
> > Try keep buffer in LocalX variable and check if it works in earliest
> > Windows version that supports NVDIMMs. If it does then drop BUFF and
> > use
> > Local variable, if not then that fact should be mentioned in commit
> > message/patch  
> 
> Thanks Igor. I'm new to asl grammar, I'll take your advice.
> 
> >   
> > > +        pkg = aml_package(1);
> > > +        aml_append(pkg, aml_name("BUFF"));
> > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > +        aml_append(method, aml_store(aml_arg(0),
> > > aml_name("DWD0")));
> > > +        aml_append(method, aml_store(aml_arg(1),
> > > aml_name("DWD1")));  
> > 
> > perhaps use less magical names for fields, something like:
> >   DOFF
> >   TLEN
> > add appropriate comments  
> 
> No problem.
> > 
> > Also I'd prepare/fill in buffer first and only then declare
> > initialize
> > Package + don't use named object for Package if it can be done with
> > help
> > of Local variables.
> >   
> > > +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid("4309AC30-0D11-11E4-9191-
> > > 0800200C9A66"),
> > > +                            aml_int(2), aml_int(5),
> > > aml_name("PKG1"),
> > > +                            aml_int(handle))));  
> > 
> > this shall return Package not a Buffer  
> 
> Right, Going to re-implement these methods rather than wrapper NCAL.

wrapper is fine, you just need to repackage content of the Buffer
into a Package

> >   
> > > +        aml_append(nvdimm_dev, method);
> > > +
> > > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > > +        aml_append(method,
> > > +            aml_create_dword_field(aml_name("BUFF"), aml_int(0),
> > > "DWD0"));
> > > +        aml_append(method,
> > > +            aml_create_dword_field(aml_name("BUFF"), aml_int(4),
> > > "DWD1"));
> > > +        aml_append(method,
> > > +            aml_create_field(aml_name("BUFF"), aml_int(64),
> > > aml_int(32672), "FILD"));
> > > +        pkg = aml_package(1);
> > > +        aml_append(pkg, aml_name("BUFF"));
> > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > +        aml_append(method, aml_store(aml_arg(0),
> > > aml_name("DWD0")));
> > > +        aml_append(method, aml_store(aml_arg(1),
> > > aml_name("DWD1")));
> > > +        aml_append(method, aml_store(aml_arg(2),
> > > aml_name("FILD")));
> > > +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid("4309AC30-0D11-11E4-9191-
> > > 0800200C9A66"),
> > > +                            aml_int(2), aml_int(6),
> > > aml_name("PKG1"),
> > > +                            aml_int(handle))));  
> > 
> > should return Integer not Buffer, it looks like implicit conversion
> > will take care of it,
> > but it would be better to explicitly convert it to Integer even if
> > it's only for the sake
> > of documenting expected return value (or add a comment)  
> 
> I observed guest kernel ACPI component complaining this; just warning,
> no harm. I'll re-implement it.

try to test it with Windows guest (it usually less tolerable to errors
than Linux + it's own quirks that you need to carter to)
Also it would e nice if you test and put results in cover letter
not only for Linux but for Windows as well.

> > 
> > Also returned value in case of error NVDIMM_DSM_RET_STATUS_INVALID,
> > in NVDIMM and ACPI spec differ. So fix the spec or remap returned
> > value.
> > 
> >   
> > > +        aml_append(nvdimm_dev, method);
> > > +
> > >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> > >          aml_append(root_dev, nvdimm_dev);
> > >      }  
> > 
> >   
> 


