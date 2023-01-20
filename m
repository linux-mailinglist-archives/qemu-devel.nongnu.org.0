Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6F67591A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItew-0001a1-N9; Fri, 20 Jan 2023 10:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin.murphy@arm.com>)
 id 1pItev-0001Za-2v
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:50:29 -0500
Received: from foss.arm.com ([217.140.110.172])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robin.murphy@arm.com>) id 1pItet-0005DL-CM
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:50:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32F711515;
 Fri, 20 Jan 2023 07:51:06 -0800 (PST)
Received: from [10.57.89.132] (unknown [10.57.89.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 229353F67D;
 Fri, 20 Jan 2023 07:50:22 -0800 (PST)
Message-ID: <4fead092-1058-198a-b430-3dee0fffcd51@arm.com>
Date: Fri, 20 Jan 2023 15:50:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC] virtio-iommu: Take into account possible aliasing in
 virtio_iommu_mr()
Content-Language: en-GB
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, mst@redhat.com
References: <20230116124709.793084-1-eric.auger@redhat.com>
 <Y8qzOKm6kvhGWG1T@myrica>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Y8qzOKm6kvhGWG1T@myrica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=robin.murphy@arm.com; helo=foss.arm.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023-01-20 15:28, Jean-Philippe Brucker wrote:

For some reason this came through as blank mail with a text attachment, 
so apologies for the lack of quoting, but for reference this is a 
long-standing known issue:

https://lore.kernel.org/linux-iommu/9625faf4-48ef-2dd3-d82f-931d9cf26976@huawei.com/

In summary, yes, hanging {of,acpi}_iommu_configure() off driver probe is 
massively wrong, and pulling that step into iommu_probe_device() in a 
sane and robust manner is one of the next things to start on after 
getting the bus ops out of the way.

Thanks,
Robin.

