Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B02C6F5F
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 10:04:10 +0100 (CET)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiw9J-0003kA-EV
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 04:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1kiw7Z-00034y-82; Sat, 28 Nov 2020 04:02:22 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1kiw7V-0001AB-D2; Sat, 28 Nov 2020 04:02:21 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Cjlq63L3pz50H2;
 Sat, 28 Nov 2020 17:01:38 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 28 Nov 2020 17:02:01 +0800
Received: from [10.174.185.137] (10.174.185.137) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 28 Nov 2020 17:02:01 +0800
To: <eric.auger@redhat.com>
References: 
Subject: Re: [RFC v7 09/26] vfio: Force nested if iommu requires it
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <c3d0f094-cffe-16c8-69fc-de7bdefc3680@huawei.com>
Date: Sat, 28 Nov 2020 17:01:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------919F5FABD76D8D04A1C3E21B"
Content-Language: en-US
X-Originating-IP: [10.174.185.137]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org, zhukeqian1@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------919F5FABD76D8D04A1C3E21B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eric,
> @@ -1668,6 +1679,14 @@ static int vfio_connect_container(VFIOGroup *group,
> AddressSpace *as,
>       VFIOContainer *container;
>       int ret, fd;
>       VFIOAddressSpace *space;
> +    IOMMUMemoryRegion *iommu_mr;
> +    bool nested = false;
> +
> +    if (as != &address_space_memory && memory_region_is_iommu(as->root)) {
> +        iommu_mr = IOMMU_MEMORY_REGION(as->root);
> +        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
> +                                     (void *)&nested);
> +    }
>   
>       space = vfio_get_address_space(as);
Is the condition "as != &address_space_memory" needed to determine whether
a vIOMMU is in place? I think "memory_region_is_iommu(as->root)" is enough.

Looking forward to your reply.:)

Thanks,

Kunkun Jiang


--------------919F5FABD76D8D04A1C3E21B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi Eric,
<blockquote type="cite"><pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">@@ -1668,6 +1679,14 @@ static int vfio_connect_container(VFIOGroup *group, 
AddressSpace *as,
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    IOMMUMemoryRegion *iommu_mr;
+    bool nested = false;
+
+    if (as != &amp;address_space_memory &amp;&amp; memory_region_is_iommu(as-&gt;root)) {
+        iommu_mr = IOMMU_MEMORY_REGION(as-&gt;root);
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&amp;nested);
+    }
 
     space = vfio_get_address_space(as);</pre></blockquote>Is the condition "as != &amp;address_space_memory" needed to determine whether
a vIOMMU is in place? I think "memory_region_is_iommu(as-&gt;root)" is enough.

Looking forward to your reply.:)

Thanks,

Kunkun Jiang
</pre>
  </body>
</html>

--------------919F5FABD76D8D04A1C3E21B--

