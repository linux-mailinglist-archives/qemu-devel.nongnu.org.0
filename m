Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5C296E4E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 14:20:47 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVw3q-0003F7-JX
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 08:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVw1q-0002HE-O7
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 08:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVw1o-0000yG-Bh
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 08:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603455519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgdWKO4hfnCyef4/M02Nqtxlgq14AbMcKO4oW09+KHA=;
 b=gWbtddkL04/HJaxzSX7Bn9jlmen/3f0RHt8rVwL0mPEAXi5TCOt++VwAgKkyyIVTUhskVV
 Poi75ijl8nDE0z+HNa+VdMH3BU3Fdfj7hhzi7NMQAYilpadMLorjZ0Tj75LrQTj8RDF9Of
 +STA1de3X8YJE6kjuMOVzncSa37UhUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-RuhxzDMhMhK3Qj9_UZlZuQ-1; Fri, 23 Oct 2020 08:18:38 -0400
X-MC-Unique: RuhxzDMhMhK3Qj9_UZlZuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B9201087D67;
 Fri, 23 Oct 2020 12:18:35 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C71B360BFA;
 Fri, 23 Oct 2020 12:18:15 +0000 (UTC)
Date: Fri, 23 Oct 2020 14:18:13 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v28 07/17] vfio: Register SaveVMHandlers for VFIO device
Message-ID: <20201023141813.4d8f449c.cohuck@redhat.com>
In-Reply-To: <1603449643-12851-8-git-send-email-kwankhede@nvidia.com>
References: <1603449643-12851-1-git-send-email-kwankhede@nvidia.com>
 <1603449643-12851-8-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com,
 dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Oct 2020 16:10:33 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Define flags to be used as delimiter in migration stream for VFIO devices.
> Added .save_setup and .save_cleanup functions. Map & unmap migration
> region from these functions at source during saving or pre-copy phase.
> 
> Set VFIO device state depending on VM's state. During live migration, VM is
> running when .save_setup is called, _SAVING | _RUNNING state is set for VFIO
> device. During save-restore, VM is paused, _SAVING state is set for VFIO device.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/migration.c  | 102 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events |   2 +
>  2 files changed, 104 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


