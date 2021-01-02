Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797622E87A0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:29:11 +0100 (CET)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhu2-0006CM-GV
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <towo@siduction.org>)
 id 1kvgf4-0005PX-TB
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:09:39 -0500
Received: from www226.your-server.de ([188.40.28.6]:35846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <towo@siduction.org>)
 id 1kvgeu-0006b2-TF
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:09:37 -0500
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www226.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <towo@siduction.org>)
 id 1kvgem-0009eG-7n
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 14:09:20 +0100
Received: from [31.16.171.184] (helo=[192.168.178.10])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <towo@siduction.org>) id 1kvgem-000Xvs-3n
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 14:09:20 +0100
To: qemu-devel@nongnu.org
From: Torsten Wohlfarth <towo@siduction.org>
Subject: qemu git error with virgl
Message-ID: <b177a411-f81a-7d69-aea0-e50980a9fc45@siduction.org>
Date: Sat, 2 Jan 2021 14:09:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: towo@siduction.org
X-Virus-Scanned: Clear (ClamAV 0.102.4/26035/Fri Jan  1 13:36:41 2021)
Received-SPF: none client-ip=188.40.28.6; envelope-from=towo@siduction.org;
 helo=www226.your-server.de
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HEXHASH_WORD=1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Jan 2021 09:24:39 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

i can't start any system if i use virgl. I get the following error:

qemu-x86_64: ../ui/console.c:1791: dpy_gl_ctx_create: Assertion 
`con->gl' failed.
./and.sh: line 27: 3337167 Aborted                 qemu-x86_64 -m 4096 
-smp cores=4,sockets=1 -cpu host -machine pc-q35-4.0,accel=kvm -device 
virtio-vga,virgl=on,xres=1280,yres=800 -display sdl,gl=on -device 
intel-hda,id=sound0,msi=on -device 
hda-micro,id=sound0-codec0,bus=sound0.0,cad=0 -device qemu-xhci,id=xhci 
-device usb-tablet,bus=xhci.0 -net 
nic,macaddr=52:54:00:12:34:62,model=e1000 -net 
tap,ifname=$INTERFACE,script=no,downscript=no -drive 
file=/media/daten2/image/lineageos.qcow2,if=virtio,index=1,media=disk,cache=none,aio=threads
Set 'tap3' nonpersistent

i have bicected the issue:

towo:Defiant> git bisect good
b4e1a342112e50e05b609e857f38c1f2b7aafdc4 is the first bad commit
commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue Oct 27 08:44:23 2020 -0400

     vl: remove separate preconfig main_loop

     Move post-preconfig initialization to the x-exit-preconfig. If 
preconfig
     is not requested, just exit preconfig mode immediately with the QMP
     command.

     As a result, the preconfig loop will run with accel_setup_post
     and os_setup_post restrictions (xen_restrict, chroot, etc.)
     already done.

     Reviewed-by: Igor Mammedov <imammedo@redhat.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

  include/sysemu/runstate.h |  1 -
  monitor/qmp-cmds.c        |  9 -----
  softmmu/vl.c              | 95 
++++++++++++++++++++---------------------------
  3 files changed, 41 insertions(+), 64 deletions(-)

Regards,

Torsten Wohlfarth


