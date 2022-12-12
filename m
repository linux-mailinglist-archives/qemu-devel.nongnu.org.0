Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6FF649CFF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gSe-0003Vq-Lt; Mon, 12 Dec 2022 05:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p4gSb-0003Uh-Mg
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:55:01 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p4gSY-0002wd-Qv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:55:01 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NVz5C467vz689sn;
 Mon, 12 Dec 2022 18:53:51 +0800 (CST)
Received: from localhost (10.195.246.54) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 10:54:52 +0000
Date: Mon, 12 Dec 2022 10:54:49 +0000
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <ben.widawsky@intel.com>, <philmd@linaro.org>
Subject: Re: [PATCH 6/5] include/hw/cxl: Break inclusion loop
Message-ID: <20221212105449.000009aa@Huawei.com>
In-Reply-To: <874ju3bur1.fsf@pond.sub.org>
References: <20221209134802.3642942-1-armbru@redhat.com>
 <875yekehnx.fsf@pond.sub.org> <874ju3bur1.fsf@pond.sub.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.246.54]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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

On Sat, 10 Dec 2022 08:09:06 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> writes:
> 
> > hw/cxl/cxl_pci.h and hw/cxl/cxl_cdat.h include each other.  Neither
> > header actually needs the other one.  Drop both #include directives.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  include/hw/cxl/cxl_cdat.h | 1 -
> >  include/hw/cxl/cxl_pci.h  | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
> > index 7f67638685..e3fd737f9d 100644
> > --- a/include/hw/cxl/cxl_cdat.h
> > +++ b/include/hw/cxl/cxl_cdat.h
> > @@ -10,7 +10,6 @@
> >  #ifndef CXL_CDAT_H
> >  #define CXL_CDAT_H
> >  
> > -#include "hw/cxl/cxl_pci.h"
> >  #include "hw/pci/pcie_doe.h"

The include was to get to CXL_VENDOR_ID which is in hw/cxl/cxl_pci.h
Can move that elsewhere perhaps, though I don't think we need to
if we break the loop by dropping the other one.


> >  
> >  /*
> > diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> > index aca14845ab..01e15ed5b4 100644
> > --- a/include/hw/cxl/cxl_pci.h
> > +++ b/include/hw/cxl/cxl_pci.h
> > @@ -11,7 +11,6 @@
> >  #define CXL_PCI_H
> >  
> >  #include "qemu/compiler.h"
> > -#include "hw/cxl/cxl_cdat.h"
Guess that's a left over of some earlier refactoring. Good to get rid
of this one.

> >  
> >  #define CXL_VENDOR_ID 0x1e98  
> 
> Friday afternoon post with insufficient testing...  Everything still
> builds fine, but cxl_component.h is no longer self-contained.  I'll
> squash in the appended patch and revise the commit message.

By staring at the code rather than any automation I'm failing to spot
what it needs from cxl_pci.h.  Can you add that info to the commit message?

> 
> 
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
> index 5dca21e95b..78f83ed742 100644
> --- a/include/hw/cxl/cxl_component.h
> +++ b/include/hw/cxl/cxl_component.h
> @@ -19,6 +19,7 @@
>  #include "qemu/range.h"
>  #include "qemu/typedefs.h"
>  #include "hw/cxl/cxl_cdat.h"
> +#include "hw/cxl/cxl_pci.h"
>  #include "hw/register.h"
>  #include "qapi/error.h"
>  
> 


