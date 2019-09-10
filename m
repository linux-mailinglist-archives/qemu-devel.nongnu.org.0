Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6CAE8D9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 13:07:55 +0200 (CEST)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7e02-0003kk-He
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 07:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1i7duB-000858-Ps
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1i7duA-0004eU-M9
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:01:51 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51524 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>) id 1i7du9-0004cl-1L
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:01:49 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2EFE53F170FA29A0E8BB;
 Tue, 10 Sep 2019 19:01:41 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 10 Sep 2019
 19:01:23 +0800
To: <qemu-devel@nongnu.org>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <95584103-950c-2870-b0a1-1108d54190f2@huawei.com>
Date: Tue, 10 Sep 2019 19:01:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] hw/vfio/pci: duplicated invocation of
 vfio_msix_vector_release() in vfio_msix_disable()
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
Cc: wanghaibin 00208455 <wanghaibin.wang@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

Recently we found there are 2 invocations of vfio_msix_vector_release() 
in vfio_msix_disable(). The 1st one is in msix_unset_vector_notifiers(), 
for we set device's msix_vector_release_notifier to 
vfio_msix_vector_release() in vfio_msix_enable(), while the 2nd is the 
explicit one in vfio_msix_disable(). Both invocations switch VFIO to use 
the non-bypass eventfd.

Is there any special reason for doing this? Or can we remove one of them?

Thanks,

Heyi



