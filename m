Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BA25FA5C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 14:20:00 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFG7r-0007Uc-9l
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 08:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kFG6Z-0006bp-VF
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kFG6Y-0008UI-4D
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599481116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTNFSD+JsTjV/OhJY8IRQdfAB70klCWaPYFvsmkMAqU=;
 b=Cw3KUG4Z9bmWStC94G5Zr/ZeCdIXGt/bg4cZcWK8ioZciFtCuCLsHZ0RigopqrLmRJK6ue
 IacttEPXr0+AH2Q1g+qS9g6kxn8SLna7Wmh0whJYyrwTiZKXn1Ug0MQlvvIpY1LQekPgU8
 /4XkFWMHV1qYNLsoCPZTU1JoAwxyt/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-DDjtGIIUMnC_vh0AgDLNKQ-1; Mon, 07 Sep 2020 08:18:34 -0400
X-MC-Unique: DDjtGIIUMnC_vh0AgDLNKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA45618BE163;
 Mon,  7 Sep 2020 12:18:32 +0000 (UTC)
Received: from gondolin (ovpn-112-249.ams2.redhat.com [10.36.112.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11BE178380;
 Mon,  7 Sep 2020 12:18:27 +0000 (UTC)
Date: Mon, 7 Sep 2020 14:18:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH 66/77] virtio: verify that legacy support is not
 accidentally on
Message-ID: <20200907141825.4a16650a.cohuck@redhat.com>
In-Reply-To: <20200903205935.27832-67-mdroth@linux.vnet.ibm.com>
References: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
 <20200903205935.27832-67-mdroth@linux.vnet.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:52:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  3 Sep 2020 15:59:24 -0500
Michael Roth <mdroth@linux.vnet.ibm.com> wrote:

> From: Cornelia Huck <cohuck@redhat.com>
> 
> If a virtio device does not have legacy support, make sure that
> it is actually off, and bail out if not.
> 
> For virtio-pci, this means that any device without legacy support
> that has been specified to modern-only (or that has been forced
> to it) will work.
> 
> For virtio-ccw, this duplicates the check that is currently done
> prior to realization for any device that explicitly specified no
> support for legacy.
> 
> This catches devices that have not been fenced properly.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Message-Id: <20200707105446.677966-3-cohuck@redhat.com>
> Cc: qemu-stable@nongnu.org
> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> (cherry picked from commit 9b3a35ec8236933ab958a4c3ad883163f1ca66e7)
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  hw/s390x/virtio-ccw.c  | 6 ++++++
>  hw/virtio/virtio-pci.c | 4 ++++
>  2 files changed, 10 insertions(+)

I don't think we want to backport this (and the previous patch) to
stable. (Actually, my original patch didn't have the stable tag.)

This has flushed out several devices (mem, vsock, iommu) that should be
modern only, but weren't; unfortunately, this also breaks existing
command line invocations. We *might* consider including this together
with patches that force those devices to modern only, but I see only
the patch for virtio-mem has reached master yet.


