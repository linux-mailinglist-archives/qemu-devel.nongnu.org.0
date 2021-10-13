Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927842B45F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 07:00:06 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maWN2-0004yE-Fv
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 01:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLU-0002Mo-Be
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLQ-0004gl-Sf
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634101103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qnSLuY2lflgjwZuZwik2uOYIB3j3gAfJ/I+UIsnpFww=;
 b=iP0dp97fyljq2r65ZOIMS4YT4dlCW/JWW4jOdZCdtNj5D0skCH0jetq71F0yRDjk2QoJdT
 ZtHcYmM6ZMHgc7aaepIISC6rh0mwWaNHoAE22vKeYbjqRcR8EpPp1xOSbaXeA4RFA6esi+
 FtKLrb1Q3Qpja3/y8qrSI2KX7GBm8bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ZQ3WVVLYPkWNla4e8VxHBQ-1; Wed, 13 Oct 2021 00:58:21 -0400
X-MC-Unique: ZQ3WVVLYPkWNla4e8VxHBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D24B01006AA3;
 Wed, 13 Oct 2021 04:58:19 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 104985D9C6;
 Wed, 13 Oct 2021 04:58:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/virt: Fix qemu booting failure on device-tree
Date: Wed, 13 Oct 2021 12:58:03 +0800
Message-Id: <20211013045805.192165-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: robh@kernel.org, drjones@redhat.com, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The empty NUMA nodes, where no memory resides, are allowed on ARM64 virt
platform. However, QEMU fails to boot because the device-tree can't be
populated due to the conflicting device-tree node names of these empty
NUMA nodes. For example, QEMU fails to boot and the following error
message reported when below command line is used.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host -smp 4,sockets=2,cores=2,threads=1            \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=512M            \
  -object memory-backend-ram,id=mem1,size=512M            \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
  -numa node,nodeid=2                                     \
  -numa node,nodeid=3                                     \
    :
  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS

The lastest device-tree specification doesn't indicate how the device-tree
nodes should be populated for these empty NUMA nodes. The proposed way
to handle this is documented in linux kernel. The linux kernel patches
have been acknoledged and merged to upstream pretty soon.

  https://lkml.org/lkml/2021/9/27/31

This series follows the suggestion, which is included in linux kernel
patches, to resolve the QEMU boot failure issue: The corresponding
device-tree nodes aren't created for the empty NUMA nodes, but their
distance map matrix should be provided by users so that the empty
NUMA node IDs can be parsed properly.

Changelog
=========
v3:
   * Require users to provide distance map matrix when empty
     NUMA node is included. The default distance map won't
     be generated any more                                        (Igor/Drew)
v2:
   * Amend PATCH[01/02]'s changelog to explain why we needn't
     switch to disable generating the default distance map        (Drew)

Gavin Shan (2):
  numa: Require distance map when empty node exists
  hw/arm/virt: Don't create device-tree node for empty NUMA node

 hw/arm/boot.c         |  4 ++++
 hw/core/machine.c     |  4 ++++
 hw/core/numa.c        | 24 ++++++++++++++++++++++++
 include/sysemu/numa.h |  1 +
 4 files changed, 33 insertions(+)

-- 
2.23.0


