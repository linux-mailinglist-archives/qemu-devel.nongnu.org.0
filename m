Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3D5B3A51
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 16:05:10 +0200 (CEST)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWed2-0002gf-Vh
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 10:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oWebH-0000u7-7b
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:03:19 -0400
Received: from mga06b.intel.com ([134.134.136.31]:27846 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oWeb7-0007pb-R4
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662732189; x=1694268189;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fY46WCrjOTZOwGFlaLD7P8XTJGh4zw4x3RSppNQj7uU=;
 b=FXeBef72q+J5r3rQT8x4pVCuxlylQsQspyyfzuF55OmVnG86M374L9Oc
 84hQlnNuW7RfdGmNmi++41qmdUu3scCfQlw4Dn5DHKwymdzf8Lc+35vTT
 meKrRJZ0i4xU3ryeSuzkSf9p8aRVJ/u9D19F7oi1RWEYNY1+pkkbSny8i
 g6o/XTgiDRlMntXVfg5HJgYEfMbBo4whJGjMRrCwt6D7uORoXZr0KiFwm
 vQEvBNk+dvQXO/tb5WggWECx9+HVNaEwqDQquyuk6rKwPgHjKv2VW+SlB
 OwfciIqi1kNy6FyjdYCXTwcEYDDOY5iDn/0gigC6CG75nHOv5pGMlM2NM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359201817"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359201817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 07:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="645542645"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 07:02:34 -0700
Message-ID: <52dd8913d8979efdc229a025e1bd23bb44ebadf3.camel@linux.intel.com>
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Fri, 09 Sep 2022 22:02:34 +0800
In-Reply-To: <20220909153910.557fdbe7@redhat.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=robert.hu@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Fri, 2022-09-09 at 15:39 +0200, Igor Mammedov wrote:
> On Thu,  1 Sep 2022 11:27:20 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W},
> > which
> > deprecates corresponding _DSM Functions defined by PMEM _DSM
> > Interface spec
> > [2].
> > 
> > Since the semantics of the new Label Methods are same as old _DSM
> > methods, the implementations here simply wrapper old ones.
> > 
> > ASL form diff can be found in next patch of updating golden master
> > binaries.
> > 
> > [1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
> > https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
> > [2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
> > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> 
> looks more or less fine except of excessive use of named variables
> which creates global scope variables.
> 
> I'd suggest to store temporary buffers/packages in LocalX variales,
> you should be able to do that for everything modulo
> aml_create_dword_field().
> 
> see an example below
> 
> > ---
> >  hw/acpi/nvdimm.c | 91
> > ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> > 
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > index afff911c1e..516acfe53b 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -1243,6 +1243,7 @@ static void nvdimm_build_fit(Aml *dev)
> >  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t
> > ram_slots)
> >  {
> >      uint32_t slot;
> > +    Aml *method, *pkg, *field, *com_call;
> >  
> >      for (slot = 0; slot < ram_slots; slot++) {
> >          uint32_t handle = nvdimm_slot_to_handle(slot);
> > @@ -1260,6 +1261,96 @@ static void nvdimm_build_nvdimm_devices(Aml
> > *root_dev, uint32_t ram_slots)
> >           */
> >          aml_append(nvdimm_dev, aml_name_decl("_ADR",
> > aml_int(handle)));
> >  
> > +        /*
> > +         * ACPI v6.4: Section 6.5.10 NVDIMM Label Methods
> > +         */
> > +        /* _LSI */
> > +        method = aml_method("_LSI", 0, AML_SERIALIZED);
> > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > +                            aml_int(1), aml_int(4), aml_int(0),
> > +                            aml_int(handle));
> > +        aml_append(method, aml_store(com_call, aml_local(0)));
> > +
> > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > +                                                  aml_int(0),
> > "STTS"));
> > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > aml_int(4),
> > +                                                  "SLSA"));
> > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > aml_int(8),
> > +                                                  "MAXT"));
> > +
> > +        pkg = aml_package(3);
> > +        aml_append(pkg, aml_name("STTS"));
> > +        aml_append(pkg, aml_name("SLSA"));
> > +        aml_append(pkg, aml_name("MAXT"));
> > +        aml_append(method, aml_name_decl("RET", pkg));
> 
> ex: put it in local instead of named variable and return that
> the same applies to other named temporary named variables.

Could you help provide the example in form of ASL?
Thanks.
> 
> > +        aml_append(method, aml_return(aml_name("RET")));
> > +
> > +        aml_append(nvdimm_dev, method);
> > +
> > +        /* _LSR */
> > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > +        aml_append(method, aml_name_decl("INPT", aml_buffer(8,
> > NULL)));
> > +
> > +        aml_append(method,
> > aml_create_dword_field(aml_name("INPT"),
> > +                                                  aml_int(0),
> > "OFST"));
> > +        aml_append(method,
> > aml_create_dword_field(aml_name("INPT"),
> > +                                                  aml_int(4),
> > "LEN"));
> > +        aml_append(method, aml_store(aml_arg(0),
> > aml_name("OFST")));
> > +        aml_append(method, aml_store(aml_arg(1),
> > aml_name("LEN")));
> > +
> > +        pkg = aml_package(1);
> > +        aml_append(pkg, aml_name("INPT"));
> > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > +
> > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > +                            aml_int(1), aml_int(5),
> > aml_name("PKG1"),
> > +                            aml_int(handle));
> > +        aml_append(method, aml_store(com_call, aml_local(3)));
> > +        field = aml_create_dword_field(aml_local(3), aml_int(0),
> > "STTS");
> > +        aml_append(method, field);
> > +        field = aml_create_field(aml_local(3), aml_int(32),
> > +                                 aml_shiftleft(aml_name("LEN"),
> > aml_int(3)),
> > +                                 "LDAT");
> > +        aml_append(method, field);
> > +        aml_append(method, aml_name_decl("LSA", aml_buffer(0,
> > NULL)));
> > +        aml_append(method, aml_to_buffer(aml_name("LDAT"),
> > aml_name("LSA")));
> > +        pkg = aml_package(2);
> > +        aml_append(pkg, aml_name("STTS"));
> > +        aml_append(pkg, aml_name("LSA"));
> > +        aml_append(method, aml_name_decl("RET", pkg));
> > +        aml_append(method, aml_return(aml_name("RET")));
> > +        aml_append(nvdimm_dev, method);
> > +
> > +        /* _LSW */
> > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > +        aml_append(method, aml_store(aml_arg(2), aml_local(2)));
> > +        aml_append(method, aml_name_decl("INPT", aml_buffer(8,
> > NULL)));
> > +        field = aml_create_dword_field(aml_name("INPT"),
> > +                                                  aml_int(0),
> > "OFST");
> > +        aml_append(method, field);
> > +        field = aml_create_dword_field(aml_name("INPT"),
> > +                                                  aml_int(4),
> > "TLEN");
> > +        aml_append(method, field);
> > +        aml_append(method, aml_store(aml_arg(0),
> > aml_name("OFST")));
> > +        aml_append(method, aml_store(aml_arg(1),
> > aml_name("TLEN")));
> > +
> > +        aml_append(method, aml_concatenate(aml_name("INPT"),
> > aml_local(2),
> > +                                            aml_name("INPT")));
> > +        pkg = aml_package(1);
> > +        aml_append(pkg, aml_name("INPT"));
> > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > +                            aml_int(1), aml_int(6),
> > aml_name("PKG1"),
> > +                            aml_int(handle));
> > +        aml_append(method, aml_store(com_call, aml_local(3)));
> > +        field = aml_create_dword_field(aml_local(3), aml_int(0),
> > "STTS");
> > +        aml_append(method, field);
> > +        aml_append(method,
> > aml_return(aml_to_integer(aml_name("STTS"))));
> 
> why do you need explicitly convert DWORD field to integer?
> it should be fine to return STTS directly (implicit conversion should
> take care of the rest)
> 
> > +        aml_append(nvdimm_dev, method);
> > +
> >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> >          aml_append(root_dev, nvdimm_dev);
> >      }
> 
> 


