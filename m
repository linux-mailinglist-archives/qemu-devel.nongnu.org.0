Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198502D595D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:39:06 +0100 (CET)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKHo-0007jT-T5
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1knKFz-0007Dr-2c
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:37:11 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1knKFw-0003DN-VS
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:37:10 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BABTmlk076434;
 Thu, 10 Dec 2020 11:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=G9wm202feCXW5oWd+GqvJBlCK9icii+Kki3cxdkEkeU=;
 b=TzxZRhOhSIcVSXJyOnQOhbshVKl9kcl0yk7LrnNdRtFSd/RWbAE2nVuvYIY47I0NQorl
 fD6UOI/ataYCi9zpbFjPJHzBLPQyO9Yu4E6nxiVcemWK++7lDFMNPadnYxkPd13j13Co
 E/M/mQeKFZUJQFjA4oCQAFWabsTNDYCMVx2rZinvPX6PFs0yXYad9ID3i426B9w/tRfC
 cb75iPwnwu0mAdT2w2CPYNc+cbyh9jMJjUfLyhwYiu5CoXR2T/lTRgeR5j0Se6ZT3n04
 cm41pNdIkcQeGou9ol8nOIZB+S0xjMBI6F0mxOjviuG3yHlD1qhP9J25JNQ1X3FeQfc1 qQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35825mcxxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 11:37:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BABOkb9143223;
 Thu, 10 Dec 2020 11:37:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 358kyw7vvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 11:37:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BABb1Al015435;
 Thu, 10 Dec 2020 11:37:01 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 03:37:01 -0800
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id 18EC82621DED; Thu, 10 Dec 2020 11:36:58 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: map all BARs and enable PCI devices
In-Reply-To: <20201209201054.391408-1-alxndr@bu.edu>
References: <20201209201054.391408-1-alxndr@bu.edu>
Date: Thu, 10 Dec 2020 11:36:57 +0000
Message-ID: <m2im99ao4m.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=1 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100077
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=darren.kenny@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Wednesday, 2020-12-09 at 15:10:54 -05, Alexander Bulekov wrote:
> Prior to this patch, the fuzzer found inputs to map PCI device BARs and
> enable the device. While it is nice that the fuzzer can do this, it
> added significant overhead, since the fuzzer needs to map all the
> BARs (regenerating the memory topology), at the start of each input.
> With this patch, we do this once, before fuzzing, mitigating some of
> this overhead.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

In general this looks good, I've a small comment/nit below, but nothing
serious, so:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 07ad690683..d95093ee53 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -16,6 +16,7 @@
>  
>  #include "hw/core/cpu.h"
>  #include "tests/qtest/libqos/libqtest.h"
> +#include "tests/qtest/libqos/pci-pc.h"
>  #include "fuzz.h"
>  #include "fork_fuzz.h"
>  #include "exec/address-spaces.h"
> @@ -762,6 +763,22 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>      return 0;
>  }
>  
> +
> +static void pci_enum(gpointer pcidev, gpointer bus)
> +{
> +    PCIDevice *dev = pcidev;
> +    QPCIDevice *qdev;
> +
> +    qdev = qpci_device_find(bus, dev->devfn);
> +    g_assert(qdev != NULL);
> +    for (int i = 0; i < 6; i++) {
> +        if (dev->io_regions[i].size) {
> +            qpci_iomap(qdev, i, NULL);
> +        }
> +    }
> +    qpci_device_enable(qdev);
> +}
> +
>  static void generic_pre_fuzz(QTestState *s)
>  {
>      GHashTableIter iter;
> @@ -810,6 +827,12 @@ static void generic_pre_fuzz(QTestState *s)
>          exit(1);
>      }
>  
> +    QPCIBus *pcibus;

NIT: I'm not a huge fan of defining variables in the middle of code,
     call me old-fashioned if you will, but I tend to prefer them at the
     top of the function, or block ;)

     It does look good in the diff, but would seem odd in the overall
     code.

Thanks,

Darren.

