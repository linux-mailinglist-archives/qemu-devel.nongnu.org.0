Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A62014C3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 18:21:21 +0200 (CEST)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmJlY-0003pu-HZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 12:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jmJke-0003EE-4Z
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 12:20:24 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52119
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jmJkc-0004FJ-I8
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 12:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592583621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=emxUC3NDAznAQVfzo78UfVpFkpwG8HwWc5KpMv9LfCc=;
 b=TQh4XHEf+MGjHI0cCkEnxfQVKLphsE27LwWO7eZdWrzdLDwC/N8vWy1ev3upJOy3xnIE1E
 FKktWSyHieLAlIMMCZW0juwCjkYQHdQqr4c8OsF1QoEU1z2jBmPU7Q+WhO0YN8U6jdC2TX
 RZr6v5kEAiaKA6LgzLfrxWQqR+W94QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Ge0KtxYuOFKjymkKd1XiRg-1; Fri, 19 Jun 2020 12:20:17 -0400
X-MC-Unique: Ge0KtxYuOFKjymkKd1XiRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629EB872FEE;
 Fri, 19 Jun 2020 16:20:15 +0000 (UTC)
Received: from localhost (ovpn-113-176.phx2.redhat.com [10.3.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4595879323;
 Fri, 19 Jun 2020 16:20:05 +0000 (UTC)
Date: Fri, 19 Jun 2020 12:20:04 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH 0/2] block: propagate discard alignment from format
 drivers to the guest
Message-ID: <20200619162004.GA9925@habkost.net>
References: <20200611171608.22052-1-den@openvz.org>
MIME-Version: 1.0
In-Reply-To: <20200611171608.22052-1-den@openvz.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:50:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 11, 2020 at 08:16:06PM +0300, Denis V. Lunev wrote:
> Nowaday SCSI drivers in guests are able to align UNMAP requests before
> sending to the device. Right now QEMU provides an ability to set
> this via "discard_granularity" property of the block device which could
> be used by management layer.
> 
> Though, in particular, from the point of QEMU, there is
> pdiscard_granularity on the format driver level, f.e. on QCOW2 or iSCSI.
> It would be beneficial to pass this value as a default for this
> property.

I assume the value is visible to the guest.  What is supposed to
happen if live migrating and the block backend is a different one
on the destination?

Also, don't we have mechanisms to change the block backend change
at run time?  What should happen in that case?

> 
> Technically this should reduce the amount of use less UNMAP requests
> from the guest to the host. Basic test confirms this. Fedora 31 guest
> during 'fstrim /' on 32 Gb disk has issued 401/415 requests with/without
> proper alignment to QEMU.
> 
> Changes from v2:
> - 172 iotest fixed
> 
> Changes from v1:
> - fixed typos in description
> - added machine type compatibility layer as suggested by Kevin
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Max Reitz <mreitz@redhat.com>
> CC: Eduardo Habkost <ehabkost@redhat.com>
> CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> 
> 

-- 
Eduardo


