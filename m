Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C75118D3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:36:13 +0200 (CEST)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njim4-0008QU-8f
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njik8-0007io-1J
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njik4-0000DT-TG
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651070047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saFEbsoRd7wkBrPPVTewmpVDuBfJSpwIupRP+hMvjeI=;
 b=JLw1wddC//XxCWGunpz/gMeXmT0mbSOMcKHO2Qr5e85sfCBeS/nSbEyNPlRs8mbDxvEQmO
 ZqEUuXwT0a41v4Hat35eDugrADnlcjiBuYH4B/8ojWpmhK2rihS9qtA/ra+Qv24lmjKans
 rM454mLZV1E4QZ2VHco26glcQv8S0wY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-7iu_FjJKMmqJIiY_BOECWA-1; Wed, 27 Apr 2022 10:34:04 -0400
X-MC-Unique: 7iu_FjJKMmqJIiY_BOECWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so2910457wms.3
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 07:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saFEbsoRd7wkBrPPVTewmpVDuBfJSpwIupRP+hMvjeI=;
 b=u4x2VJSCg1hu50eK6Sqq2jmV6DEfCbqCpRnUdo+4iFlgSuAIFc8LWRyWz6EfKMcZPG
 CP2+h5WcDNU9Az6KlIBChAITsddP5XXFQkS0K6Vx911ZnF5DUXRJSdUmojbIvjW51+IW
 WyrqowJzJZ7ka1k5sLenQDr2lOB+84qYvNJAoHBWH0/ALWSK3lo0WfYHjeQ15JslPjKY
 +Z/jtLwcgCFJjFwT3Gm171P4oAK2gYQnwPgRSFLjW5VsoSoiBqS713mDH8xq2nUjn2GZ
 eVlbeNW7SnwXLk8do/5wjzZ15lwu2tjgYTUxRM2daSTfeP/D12CBzD1+WVlpYiFk8KHY
 hD3Q==
X-Gm-Message-State: AOAM530Ujxf3myMXlK+B1KNNQdi164AaVQ+l9d6RiQ65lLtw0hGW2bLk
 ydSApG1F+CjhYaT00OXMBztjiLhu4ygvNmYc6iPs9vDons9iGesIjaPX6iv2vJabUdRTAoxGQuw
 yvRIPMIb1AdLc7e0=
X-Received: by 2002:adf:f0c6:0:b0:20a:d31b:6 with SMTP id
 x6-20020adff0c6000000b0020ad31b0006mr17227757wro.162.1651070042953; 
 Wed, 27 Apr 2022 07:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+FM++ldh/eOTEjArei4MgZz0X5tKScaLaGgvzIdpePt/2L7GZTb3fzL/EHR/hiDVy5Kirsg==
X-Received: by 2002:adf:f0c6:0:b0:20a:d31b:6 with SMTP id
 x6-20020adff0c6000000b0020ad31b0006mr17227734wro.162.1651070042654; 
 Wed, 27 Apr 2022 07:34:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a5d4292000000b0020af2f235absm538008wrq.15.2022.04.27.07.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:34:01 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:34:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
Message-ID: <20220427163401.20c69375@redhat.com>
In-Reply-To: <20220412065753.3216538-2-robert.hu@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Apr 2022 14:57:52 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Since ACPI 6.2, previous NVDIMM/_DSM funcions "Get Namespace Label Data
> Size (function index 4)", "Get Namespace Label Data (function index 5)",
> "Set Namespace Label Data (function index 6)" has been deprecated by ACPI

where it's said that old way was deprecated, should be mentioned here including
pointer to spec where it came into effect.

> standard method _LSI, _LSR, _LSW respectively. Functions semantics are
> almost identical, so my implementation is to reuse existing _DSMs, just
> create _LS{I,R,W} interfaces and constructs parameters and call _DSMs.
> 
> Only child NVDIMM devices has these methods, rather Root device.
> 
> By this patch, new NVDIMM sub device in ACPI namespace will be like this:
> 
> Device (NV00)
> {
> 	Name (_ADR, One)  // _ADR: Address
>         Method (_LSI, 0, NotSerialized)  // _LSI: Label Storage Information
>         {
>              Return (NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), 0x02, 0x04, Zero, One))
>         }
> 
>         Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
>         {
>         	CreateDWordField (BUFF, Zero, DWD0)
>                 CreateDWordField (BUFF, 0x04, DWD1)
>                 Name (PKG1, Package (0x01)
>                 {
>                     BUFF
>                 })
>                 DWD0 = Arg0
>                 DWD1 = Arg1
>                 Return (NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), 0x02, 0x05, PKG1, One))
>         }
> 
>         Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
>         {
>                 CreateDWordField (BUFF, Zero, DWD0)
>                 CreateDWordField (BUFF, 0x04, DWD1)
>                 CreateField (BUFF, 0x40, 0x7FA0, FILD)
>                 Name (PKG1, Package (0x01)
>                 {
>                     BUFF
>                 })
>                 DWD0 = Arg0
>                 DWD1 = Arg1
>                 FILD = Arg2
>                 Return (NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), 0x02, 0x06, PKG1, One))
>          }
> 
>          Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>          {
>                 Return (NCAL (Arg0, Arg1, Arg2, Arg3, One))
>          }
> }
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu<jingqi.liu@intel.com>
> ---
>  hw/acpi/nvdimm.c | 56 ++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 0d43da19ea..7cc419401b 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -848,10 +848,10 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>  
>      nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revision,
>                   in->handle, in->function);
> -
> -    if (in->revision != 0x1 /* Currently we only support DSM Spec Rev1. */) {
> -        nvdimm_debug("Revision 0x%x is not supported, expect 0x%x.\n",
> -                     in->revision, 0x1);
> +    /* Currently we only support DSM Spec Rev1 and Rev2. */

where does revision 2 come from? It would be better to add a pointer to relevant spec.

> +    if (in->revision != 0x1 && in->revision != 0x2) {
> +        nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.\n",
> +                     in->revision);

since you are touching nvdimm_debug(), please replace it with tracing,
see docs/devel/tracing.rst and any commit that adds tracing calls
(functions starting with 'trace_').

>          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_addr);
>          goto exit;
>      }


this whole hunk should be a separate patch, properly documented


also I wonder if DSM

> @@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml *dev)
>  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>  {
>      uint32_t slot;
> +    Aml *method, *pkg, *buff;
> +
> +    /* Build common shared buffer for params pass in/out */
> +    buff = aml_buffer(4096, NULL);
> +    aml_append(root_dev, aml_name_decl("BUFF", buff));

is there a reason to use global variable instead of LocalX?

>  
>      for (slot = 0; slot < ram_slots; slot++) {
>          uint32_t handle = nvdimm_slot_to_handle(slot);
> @@ -1264,6 +1269,49 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>           */
>          aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
>  
> +        /* Build _LSI, _LSR, _LSW */

should be 1 comment per method with spec/ver and chapter where it's defined

> +        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
> +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> +                            aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66"),
> +                            aml_int(2), aml_int(4), aml_int(0),
> +                            aml_int(handle))));
> +        aml_append(nvdimm_dev, method);

_LSI should return Package

> +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> +        aml_append(method,
> +            aml_create_dword_field(aml_name("BUFF"), aml_int(0), "DWD0"));
> +        aml_append(method,
> +            aml_create_dword_field(aml_name("BUFF"), aml_int(4), "DWD1"));
theoretically aml_create_dword_field() takes TermArg as source buffer,
so it doesn't have to be a global named buffer.
Try keep buffer in LocalX variable and check if it works in earliest
Windows version that supports NVDIMMs. If it does then drop BUFF and use
Local variable, if not then that fact should be mentioned in commit message/patch

> +        pkg = aml_package(1);
> +        aml_append(pkg, aml_name("BUFF"));
> +        aml_append(method, aml_name_decl("PKG1", pkg));
> +        aml_append(method, aml_store(aml_arg(0), aml_name("DWD0")));
> +        aml_append(method, aml_store(aml_arg(1), aml_name("DWD1")));
perhaps use less magical names for fields, something like:
  DOFF
  TLEN
add appropriate comments

Also I'd prepare/fill in buffer first and only then declare initialize
Package + don't use named object for Package if it can be done with help
of Local variables.

> +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> +                            aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66"),
> +                            aml_int(2), aml_int(5), aml_name("PKG1"),
> +                            aml_int(handle))));

this shall return Package not a Buffer

> +        aml_append(nvdimm_dev, method);
> +
> +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> +        aml_append(method,
> +            aml_create_dword_field(aml_name("BUFF"), aml_int(0), "DWD0"));
> +        aml_append(method,
> +            aml_create_dword_field(aml_name("BUFF"), aml_int(4), "DWD1"));
> +        aml_append(method,
> +            aml_create_field(aml_name("BUFF"), aml_int(64), aml_int(32672), "FILD"));
> +        pkg = aml_package(1);
> +        aml_append(pkg, aml_name("BUFF"));
> +        aml_append(method, aml_name_decl("PKG1", pkg));
> +        aml_append(method, aml_store(aml_arg(0), aml_name("DWD0")));
> +        aml_append(method, aml_store(aml_arg(1), aml_name("DWD1")));
> +        aml_append(method, aml_store(aml_arg(2), aml_name("FILD")));
> +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> +                            aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66"),
> +                            aml_int(2), aml_int(6), aml_name("PKG1"),
> +                            aml_int(handle))));

should return Integer not Buffer, it looks like implicit conversion will take care of it,
but it would be better to explicitly convert it to Integer even if it's only for the sake
of documenting expected return value (or add a comment)

Also returned value in case of error NVDIMM_DSM_RET_STATUS_INVALID,
in NVDIMM and ACPI spec differ. So fix the spec or remap returned value.


> +        aml_append(nvdimm_dev, method);
> +
>          nvdimm_build_device_dsm(nvdimm_dev, handle);
>          aml_append(root_dev, nvdimm_dev);
>      }


