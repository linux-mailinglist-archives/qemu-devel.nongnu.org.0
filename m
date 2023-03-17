Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B156E6BE140
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 07:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd3YQ-0001eC-Vz; Fri, 17 Mar 2023 02:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3YG-0001cr-PY
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 02:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3YD-0002s1-3Z
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 02:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679034411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dfuLEUSfi0004STv+BH1G8Sinv08oeR79btFCC3X8OY=;
 b=YH6Ngd4+lwIeaMDlKTWk/cFFCdVMqzPhrWJ2ezTa0qj8f8P0QUMAU9YKrbNu4inKXwfdrK
 K9ldp7Ia++WD+1jPP2XXv7EuvIO3xloawNWCkomFCv8h1Vb2VqgTJP9f9ovVOPZDTYwNXR
 irlUymnu6Kx7oorULioKpZff77pOwGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-3LTd-63aP56kuJKc9e1OeQ-1; Fri, 17 Mar 2023 02:26:47 -0400
X-MC-Unique: 3LTd-63aP56kuJKc9e1OeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B9A485A588;
 Fri, 17 Mar 2023 06:26:46 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D30F2166B26;
 Fri, 17 Mar 2023 06:26:34 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v4 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64 and
 riscv machines
Date: Fri, 17 Mar 2023 14:25:39 +0800
Message-Id: <20230317062542.61061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
used to populate the CPU topology in the Linux guest. It's required that
the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
scheduling domain can't be sorted out, as the following warning message
indicates. To avoid the unexpected confusion, this series attempts to
warn about such kind of irregular configurations.

   -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
   -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
   -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
   -numa node,nodeid=2,cpus=4-5,memdev=ram2                \

   ------------[ cut here ]------------
   WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
   Modules linked in:
   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
   pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : build_sched_domains+0x284/0x910
   lr : build_sched_domains+0x184/0x910
   sp : ffff80000804bd50
   x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
   x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
   x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
   x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
   x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
   x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
   x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
   x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
   x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
   x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
   Call trace:
    build_sched_domains+0x284/0x910
    sched_init_domains+0xac/0xe0
    sched_init_smp+0x48/0xc8
    kernel_init_freeable+0x140/0x1ac
    kernel_init+0x28/0x140
    ret_from_fork+0x10/0x20

PATCH[1] Warn about the irregular configuration if required
PATCH[2] Enable the validation for aarch64 machines
PATCH[3] Enable the validation for riscv machines

v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01226.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html

Changelog
=========
v4:
  * Pick r-b and ack-b from Daniel/Philippe                   (Gavin)
  * Replace local variable @len with possible_cpus->len in
    validate_cpu_cluster_to_numa_boundary()                   (Philippe)
v3:
  * Validate cluster-to-NUMA instead of socket-to-NUMA
    boundary                                                  (Gavin)
  * Move the switch from MachineState to MachineClass         (Philippe)
  * Warning instead of rejecting the irregular configuration  (Daniel)
  * Comments to mention cluster-to-NUMA is platform instead
    of architectural choice                                   (Drew)
  * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
v2:
  * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
  * Add helper set_numa_socket_boundary() and validate the
    boundary in the generic path                              (Philippe)

Gavin Shan (3):
  numa: Validate cluster and NUMA node boundary if required
  hw/arm: Validate cluster and NUMA node boundary
  hw/riscv: Validate cluster and NUMA node boundary

 hw/arm/sbsa-ref.c   |  2 ++
 hw/arm/virt.c       |  2 ++
 hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
 hw/riscv/spike.c    |  2 ++
 hw/riscv/virt.c     |  2 ++
 include/hw/boards.h |  1 +
 6 files changed, 51 insertions(+)

-- 
2.23.0


