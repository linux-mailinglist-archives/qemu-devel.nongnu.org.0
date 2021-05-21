Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688338C7D9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:24:27 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk58c-00035z-HV
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=768ad4fdb=sidcha@amazon.de>)
 id 1lk1Hp-0004SN-N2
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:17:41 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:43176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=768ad4fdb=sidcha@amazon.de>)
 id 1lk1Hn-00025n-71
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1621588659; x=1653124659;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qP5rIrggqubBpYoJjMi9a5/TgC6a6gG6fXhPrFiU3mM=;
 b=ifwSAk5OqGsfu/QjNzJgxv/nm5GmfewifDxTjfGzJhFHmaNTdRHonEXX
 7P0NTTqaiUvs4RQvYqkbOPlTGcUr6exXKueXjI8PSLccHeF72CQL9MHoc
 38QQj3hjC3BBs5fpxswOGtcw0Kpg2xhqStHVn1b/mqgzgdQ7jcSsCpR1F w=;
X-IronPort-AV: E=Sophos;i="5.82,313,1613433600"; d="scan'208";a="110834211"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 21 May 2021 09:17:29 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 31662A1C8C; Fri, 21 May 2021 09:17:28 +0000 (UTC)
Received: from u366d62d47e3651.ant.amazon.com (10.43.161.63) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 21 May 2021 09:17:23 +0000
Date: Fri, 21 May 2021 11:17:19 +0200
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: Windows fails to boot after rebase to QEMU master
Message-ID: <20210521091451.GA6016@u366d62d47e3651.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.43.161.63]
X-ClientProxiedBy: EX13D19UWA004.ant.amazon.com (10.43.160.102) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=768ad4fdb=sidcha@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 May 2021 09:20:03 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After a rebase to QEMU master, I am having trouble booting windows VMs.
Git bisect indicates commit f5cc5a5c1686 ("i386: split cpu accelerators
from cpu.c, using AccelCPUClass") to have introduced the issue. I spent
some time looking at into it yesterday without much luck.

Steps to reproduce:

    $ ./configure --enable-kvm --disable-xen --target-list=x86_64-softmmu --enable-debug
    $ make -j `nproc`
    $ ./build/x86_64-softmmu/qemu-system-x86_64 \
        -cpu host,hv_synic,hv_vpindex,hv_time,hv_runtime,hv_stimer,hv_crash \
        -enable-kvm \
        -name test,debug-threads=on \
        -smp 1,threads=1,cores=1,sockets=1 \
        -m 4G \
        -net nic -net user \
        -boot d,menu=on \
        -usbdevice tablet \
        -vnc :3 \
        -machine q35,smm=on \
        -drive if=pflash,format=raw,readonly=on,unit=0,file="../OVMF_CODE.secboot.fd" \
        -drive if=pflash,format=raw,unit=1,file="../OVMF_VARS.secboot.fd" \
        -global ICH9-LPC.disable_s3=1 \
        -global driver=cfi.pflash01,property=secure,value=on \
        -cdrom "../Windows_Server_2016_14393.ISO" \
        -drive file="../win_server_2016.qcow2",format=qcow2,if=none,id=rootfs_drive \
        -device ahci,id=ahci \
        -device ide-hd,drive=rootfs_drive,bus=ahci.0

If the issue is not obvious, I'd like some pointers on how to go about
fixing this issue.

~ Sid.




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




