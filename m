Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E55BA498
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 04:28:32 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ15j-0004EJ-Ac
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 22:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oZ14X-0002kn-CQ
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 22:27:17 -0400
Received: from mga11.intel.com ([192.55.52.93]:9985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oZ14U-0003UQ-RH
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 22:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663295234; x=1694831234;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S6pCSWzlf9au2cBWzaB1iqqejZ312DlDuXnupUrP6sg=;
 b=Xh0fleFJqp7U0syn1sjkp9uzu32NQgDXGeIT4M9g2RaRENdRHgJhUgGb
 HXyLSgS97FPYIusoeTyICqEetc2lULfVkLqXeNZ7625NmWzH0wa1E6hY4
 GqtnnqEoNDTpiD4YPwl7es+9fkSfUAbsijQUrrVV+hjLpHbs8QpEjU/n2
 R4tBQxNCPc86xwx/VL3NB4Uk0yiGzn+Tm15wxWB/BlS/NX7q3dLNRUW7k
 zABDBInfEHGaDpa+jH4vtnFs3hbC8D/UR1K2wh0SAk3LpWnGZ+I2gYEZY
 a8YoAjYWFDsocRHecNGCDN/4nUBaB7itdDZnr0jv1kh4S56mzO3fxxpkZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="296481747"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="296481747"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 19:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="743178354"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 15 Sep 2022 19:27:08 -0700
Message-ID: <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Fri, 16 Sep 2022 10:27:08 +0800
In-Reply-To: <20220909153910.557fdbe7@redhat.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=robert.hu@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
...
> looks more or less fine except of excessive use of named variables
> which creates global scope variables.
> 
> I'd suggest to store temporary buffers/packages in LocalX variales,
> you should be able to do that for everything modulo
> aml_create_dword_field().
> 
> see an example below
> 
...
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
> 
Fine, get your point now.
In ASL it will look like this:
                    Local1 = Package (0x3) {STTS, SLSA, MAXT}
                    Return (Local1)

But as for 
                    CreateDWordField (Local0, Zero, STTS)  // Status
                    CreateDWordField (Local0, 0x04, SLSA)  // SizeofLSA
                    CreateDWordField (Local0, 0x08, MAXT)  // Max Trans

I cannot figure out how to substitute with LocalX. Can you shed more
light?

CreateQWordFieldTerm :=
CreateQWordField (
SourceBuffer, // TermArg => Buffer
ByteIndex, // TermArg => Integer
QWordFieldName // NameString
)
NameString :=
<RootChar NamePath> | <ParentPrefixChar PrefixPath NamePath> |
NonEmptyNamePath

> > +        aml_append(method, aml_return(aml_name("RET")));
> > +
...
> > +        field = aml_create_dword_field(aml_local(3), aml_int(0),
> > "STTS");
> > +        aml_append(method, field);
> > +        aml_append(method,
> > aml_return(aml_to_integer(aml_name("STTS"))));
> 
> why do you need explicitly convert DWORD field to integer?
> it should be fine to return STTS directly (implicit conversion should
> take care of the rest)

Explicit convert eases my anxiety on uncertainty. ;)

> 
> > +        aml_append(nvdimm_dev, method);
> > +
...


