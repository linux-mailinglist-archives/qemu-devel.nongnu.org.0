Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BA475281
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 07:06:58 +0100 (CET)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxNRI-0001pr-Ht
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 01:06:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mxNPo-00013I-Cy
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 01:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mxNPk-00077D-3z
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 01:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639548318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ynK755N2zCbgvgMP+YjH8S9BHXDMDoiP1KeoZC16nCw=;
 b=agQGihRRzGeiLUq7Mj4ug75/VGUNh3bzIaWgqrY6wn+VanKGQeeJKUlgECQeX73qqMuKWO
 j5nrgoMzb+Fo0/jqFgf/CvDQ0j7yMFk94eIu/ftAaqFa/rZCFUsqjIuqQwTrdoAjxIcHuV
 pQaNOZSNOC58+W2wRYkoDyaM5Wz5fg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-25mmPcn6OKWHqSxb5SFeGg-1; Wed, 15 Dec 2021 01:05:16 -0500
X-MC-Unique: 25mmPcn6OKWHqSxb5SFeGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9617381CCB4;
 Wed, 15 Dec 2021 06:05:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B84374E8E;
 Wed, 15 Dec 2021 06:05:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D046180039F; Wed, 15 Dec 2021 07:05:13 +0100 (CET)
Date: Wed, 15 Dec 2021 07:05:13 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Annie Li <annie.li@oracle.com>
Subject: Re: [PATCH 1/1] pcie: Do not set power state for some hot-plugged
 devices
Message-ID: <20211215060513.kugy3y32nj2te7ui@sirius.home.kraxel.org>
References: <20211214215312.944-1-annie.li@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20211214215312.944-1-annie.li@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 09:53:12PM +0000, Annie Li wrote:
> After the PCIe device is hot-plugged, the device's power state is
> initialized as ON. However, the device isn't powered on yet, i.e.
> the PCI_EXP_SYSCTL_PCC bit isn't set to PCI_EXP_SLTCTL_PWR_ON.
> Later on, its power state will set back to OFF due to the non
> PCI_EXP_SLTCTL_PWR_ON state. The device is invisible until
> PCI_EXP_SLTCTL_PWR_ON is set.
> 
> This may be appropriate for general PCIe hot-plug cases. However,
> if the device is hot-plugged when the VM is in VM_STATE_PRELAUNCH
> state, especially the system disk device, the firmware will fail
> to find the system disk. As a result, the guest fails to boot.

Maybe we should just not set DeviceState->hotplugged = true for devices
added in VM_STATE_PRELAUNCH?  It's not actual hotplug (i.e. device added
while the system is running) after all ...

There are lots of places checking DeviceState->hotplugged, and I suspect
we have similar issues elsewhere.

take care,
  Gerd


