Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE82204A87
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 09:08:46 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnd2y-0008Iw-NB
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 03:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnd2A-0007uE-TD
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 03:07:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23026
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnd28-0005Y9-JO
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 03:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592896071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jtGPmAt8u4tHbZGCBr+Q9d0l5Fjp94Q5e3JLj6J1HIc=;
 b=cRiUwEtxdWWpEByAp9FhczMBjLr2dO7c+QnCrxX6AmyOmGG3UajPLt5ueLNUo+GNW0D1/8
 y8jabCoBmhqaHHmbE0aW8wSYekr+HPol58z1BRnJhy4vDmE2EgRNlfORUfCg3ImdfUdx4a
 XpHNqWP1cZtEAib9Oq1iEXJfeDY+pnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-Wk0J8qWMPcuWle4zedTpYg-1; Tue, 23 Jun 2020 03:07:49 -0400
X-MC-Unique: Wk0J8qWMPcuWle4zedTpYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 993928005AD;
 Tue, 23 Jun 2020 07:07:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EBAB19D61;
 Tue, 23 Jun 2020 07:07:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D039B113846D; Tue, 23 Jun 2020 09:07:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v1 00/10] vDPA support in qemu
References: <20200622153756.19189-1-lulu@redhat.com>
Date: Tue, 23 Jun 2020 09:07:36 +0200
In-Reply-To: <20200622153756.19189-1-lulu@redhat.com> (Cindy Lu's message of
 "Mon, 22 Jun 2020 23:37:46 +0800")
Message-ID: <877dvy45vr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:55:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: rdunlap@infradead.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, rob.miller@broadcom.com, saugatm@xilinx.com,
 maxime.coquelin@redhat.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, mhabets@solarflare.com, shahafs@mellanox.com,
 kevin.tian@intel.com, parav@mellanox.com, vmireyno@marvell.com,
 cunming.liang@intel.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 aadam@redhat.com, cohuck@redhat.com, hanand@xilinx.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cindy Lu <lulu@redhat.com> writes:

> vDPA device is a device that uses a datapath which complies with the
> virtio specifications with vendor specific control path. vDPA devices
> can be both physically located on the hardware or emulated by software.
> This RFC introduce the vDPA support in qemu
> TODO 
> 1) vIOMMU support
> 2) live migration support

This gives me the foggiest of ideas on what vDPA is.  Could we use
docs/interop/vhost-vdpa.rst?


