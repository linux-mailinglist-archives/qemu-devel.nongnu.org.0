Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD814B2F4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 11:48:25 +0100 (CET)
Received: from localhost ([::1]:56846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwOPw-0007lW-KX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 05:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwOOu-00072g-Ns
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:47:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwOOt-0001KA-Re
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:47:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46828
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwOOt-0001Jv-Oj
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580208439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z43FRblCwedOjRZvSZiB/yhTk6UmQiFMUw8swuZX8Wo=;
 b=M7Xn4ZwyRb4NTUaBbx0AvgfdKFILtDOPE4KleJGR0m1Z8Y+e34lLIu0opbwiKwMdvKvbW3
 pABQ8AHORTyGkmOvdofOkU0IIsTf3VGl3qbCoIE6vwRu8Iev92025zM3V/X2DhO7KeiaTG
 zZx5wI2zeke5Y+PoBHCkpOvJetstR6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-2W3dnW85NyWrDNwJwjlzmQ-1; Tue, 28 Jan 2020 05:47:15 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9181813E1;
 Tue, 28 Jan 2020 10:47:14 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0AE1001B08;
 Tue, 28 Jan 2020 10:47:12 +0000 (UTC)
To: qemu list <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Subject: [question] hw/arm/virt: about the default gic-version in accelerated
 mode
Message-ID: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
Date: Tue, 28 Jan 2020 11:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 2W3dnW85NyWrDNwJwjlzmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Andrew Jones <drjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

When arm virt machine is run in accelerated mode with "-cpu host
-machine virt", the default gic version is 2.

I understand the rationale with TCG where we don't have MSI ITS
emulation along with GICv3 so we need to choose GICv2 to get GICv2M
functionality.

However in KVM mode, I would have expected to see the host GIC probed to
set the same version on guest. Indeed most of our HW now have GICv3
without GICv2 compat mode so our default values lead to weird traces:

"
qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
qemu-system-aarch64: failed to set irq for PMU
"

I would like to propose a patch to improve those errors and also suggest
a hint. But I also wanted to know whether you would accept to change the
default value with KVM and choose the host version instead of 2. For TCG
we would keep v2.

Thanks

Eric


