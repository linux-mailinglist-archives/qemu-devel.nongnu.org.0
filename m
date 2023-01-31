Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390768275F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 09:51:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMmKh-0005Qk-99; Tue, 31 Jan 2023 03:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMmKa-0005QQ-ED
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:49:32 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMmKY-0004KC-2K
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:49:32 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P5dsf3NFwz6J7dj;
 Tue, 31 Jan 2023 16:45:10 +0800 (CST)
Received: from localhost (10.45.154.62) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 08:49:23 +0000
Date: Tue, 31 Jan 2023 08:49:22 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 5/8] hw/i386/acpi: Drop duplicate _UID entry for CXL
 root bridge
Message-ID: <20230131084922.00006e7a@Huawei.com>
In-Reply-To: <20230127213645-mutt-send-email-mst@kernel.org>
References: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
 <20230112102644.27830-6-Jonathan.Cameron@huawei.com>
 <20230127213645-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.154.62]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 27 Jan 2023 21:38:20 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jan 12, 2023 at 10:26:41AM +0000, Jonathan Cameron wrote:
> > Noticed as this prevents iASL disasembling the DSDT table.
> > 
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> This needed but it looks like you did not bother updating
> expected files for the tests. Did you run make check?

Sorry, that was sloppy of me.

v3 with table update dance for q35/DSDT.cxl sent out.

(I failed to send this email yesterday).

> 
> > ---
> >  hw/i386/acpi-build.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 127c4e2d50..a584b62ae2 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1482,7 +1482,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >                  aml_append(pkg, aml_eisaid("PNP0A03"));
> >                  aml_append(dev, aml_name_decl("_CID", pkg));
> >                  aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > -                aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
> >                  build_cxl_osc_method(dev);
> >              } else if (pci_bus_is_express(bus)) {
> >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > -- 
> > 2.37.2  
> 


