Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8146F8389
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvBn-0001WL-0t; Fri, 05 May 2023 09:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dwagner@suse.de>)
 id 1puuIX-0006l1-3H; Fri, 05 May 2023 08:12:29 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dwagner@suse.de>)
 id 1puuIV-0006ck-8b; Fri, 05 May 2023 08:12:28 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5AF2C1FEEF;
 Fri,  5 May 2023 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683288743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=usvS7Iy9sN6aNa5wwzl35FjKsxJVMNEbIzBaHX8V0NQ=;
 b=DypQm0dw8R2k+D6HJs5dWZNJcvJabC+uSd8nRyTcvyf4j8peIF/6hhfVjQaq3zPv7SV1Cv
 Noh5+UkT74Wl7Cg3/BHCQtfoBJ+lrq1b14obqqIEpDeJ5oCU076Xr2ZpbxF/k6Asx1fI9H
 eV0gktSf/7NziLub57yba57Pblwso6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683288743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=usvS7Iy9sN6aNa5wwzl35FjKsxJVMNEbIzBaHX8V0NQ=;
 b=aBGSCcYh1uF/FEyNtQEUGWdYKm9zmTZkcbrBeed4Yd8zioTMn0hEttT3zYpz6wFCquQTJf
 moSoee7b8IXX7OCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4ACB713513;
 Fri,  5 May 2023 12:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wG07EqfyVGRGLwAAMHmgww
 (envelope-from <dwagner@suse.de>); Fri, 05 May 2023 12:12:23 +0000
From: Daniel Wagner <dwagner@suse.de>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, Daniel Wagner <dwagner@suse.de>
Subject: [PATCH v1 0/1] Add support for namespace attach/detach during runtime
Date: Fri,  5 May 2023 14:12:15 +0200
Message-Id: <20230505121216.30740-1-dwagner@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=dwagner@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 May 2023 09:09:27 -0400
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

This is a follow up on a very old thread[1]. My aim is to attach/detatch nvme
devices during runtime and test the Linux nvme subsystem in the guest.

In order to it working, I had first to add hotplug able PCI bus and the
nvme-subsystem. The nvme-subsystem can't be instatiated during runtime so far
(libvirtd config):

  <qemu:commandline>
    <qemu:arg value='-device'/>
    <qemu:arg value='pcie-root-port,id=root,bus=pcie.0,addr=0x6'/>
    <qemu:arg value='-device'/>
    <qemu:arg value='nvme-subsys,id=nvme-subsys-1,nqn=nvme-1'/>
  </qemu:commandline>

and then with a bunch of monitor commands:

  qemu-monitor-command tw --hmp device_add nvme,id=nvme1,serial=nvme-1,subsys=nvme-subsys-1,bus=root
  qemu-monitor-command tw --hmp drive_add 0 if=none,file=/var/lib/libvirt/images/tw-nvme1.img,format=raw,id=nvme1
  qemu-monitor-command tw --hmp device_add nvme-ns,drive=nvme1,shared=on

  qemu-monitor-command tw --hmp info block

  qemu-monitor-command tw --hmp device_del nvme1

I see the nvme device pop up in the guest:

  [  187.047693 ] pci 0000:0f:00.0: [1b36:0010] type 00 class 0x010802
  [  187.050324 ] pci 0000:0f:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
  [  187.098823 ] pci 0000:0f:00.0: BAR 0: assigned [mem 0xc0800000-0xc0803fff 64bit]
  [  187.102173 ] nvme nvme1: pci function 0000:0f:00.0
  [  187.103084 ] nvme 0000:0f:00.0: enabling device (0000 -> 0002)
  [  187.131154 ] nvme nvme1: 4/0/0 default/read/poll queues
  [  187.133460 ] nvme nvme1: Ignoring bogus Namespace Identifiers

and it looks pretty reasonable:

  # nvme list -v
  Subsystem        Subsystem-NQN                                                                                    Controllers
  ---------------- ------------------------------------------------------------------------------------------------ ----------------
  nvme-subsys1     nqn.2019-08.org.qemu:nvme-1                                                                      nvme1
  nvme-subsys0     nqn.2019-08.org.qemu:nvme-0                                                                      nvme0
  
  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces      
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme1    nvme-1               QEMU NVMe Ctrl                           8.0.0    pcie   0000:0f:00.0   nvme-subsys1 nvme1n1
  nvme0    nvme-0               QEMU NVMe Ctrl                           8.0.0    pcie   0000:00:05.0   nvme-subsys0 nvme0n1
  
  Device       Generic      NSID       Usage                      Format           Controllers     
  ------------ ------------ ---------- -------------------------- ---------------- ----------------
  /dev/nvme1n1 /dev/ng1n1   0x1          1.07  GB /   1.07  GB    512   B +  0 B   nvme1
  /dev/nvme0n1 /dev/ng0n1   0x1          1.07  GB /   1.07  GB    512   B +  0 B   nvme0


[1] https://lore.kernel.org/all/Y195nENga028PvT9@cormorant.local/

Daniel Wagner (1):
  hw/nvme: Add hotplug handler to nvme bus

 hw/nvme/ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.40.0


