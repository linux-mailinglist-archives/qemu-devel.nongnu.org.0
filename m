Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0401467CE8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 18:58:46 +0100 (CET)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtCpZ-0005hZ-Jl
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 12:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mtCoZ-00051X-3s
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 12:57:43 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mtCoW-0000Ht-LH
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 12:57:42 -0500
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J5L9h2rRrz67mYB;
 Sat,  4 Dec 2021 01:56:40 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 3 Dec 2021 18:57:36 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 17:57:35 +0000
Date: Fri, 3 Dec 2021 17:57:34 +0000
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Ben Widawsky <ben.widawsky@intel.com>,
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: RFC: x86 memory map, where to put CXL ranges?
Message-ID: <20211203175734.00002212@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml711-chm.china.huawei.com (10.201.108.62) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Hi All,

For CXL emulation we require a couple of types of memory range that
are then provided to the OS via the CEDT ACPI table.

1) CXL Host Bridge Structures point to CXL Host Bridge Component Registers.
Small regions for each CXL Host bridge that are mapped into the memory space.
64k each.  In theory we may have a huge number of these but in reality I
think 16 will do for any reasonable system.

2) CXL Fixed Memory Window Structures (CFMWS)
Large PA space ranges (multiple TB) to which various CXL devices can be assigned
and their address decoders appropriately programmed.
Each such CFMWS will have particular characteristics such as interleaving across
multiple host bridges.  The can potentially be huge but are a system
characteristic.  For emulation purposes it won't matter if they move around
dependent on what else is the machine has configured. So I'd like to
just configure their size rather than fully specify them at the command line
and possibly clash on PA space with something else.  Alternatively could
leave them as fully specified at the command line (address and size) and just
error out if the hit memory already in use for something else.

Now unfortunately there are no systems out there yet that we can just
copy the memory map from...

Coming form an Arm background I have only a vague idea of how this should be
done for x86 so apologies if it is a stupid question.

My current approach is to put these above device_memory and moving
the pci hole up appropriately.

Is that the right choice?

On Arm I currently have the Host Bridge Structures low down in the MemMap and the CFMWS
can go above the device memory.  Comments on that also welcome.

In Ben's RFC the host bridge component register location was marked as a TODO
and a arbitrary address used in the meantime so time to figure out how to clean
that up.

Thanks,

Jonathan



