Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA06F713B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:40:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoT-00071E-6O; Thu, 04 May 2023 13:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1pua1I-0007KH-74
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1pua1G-0006tN-0w
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683210796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gdKlPqkQPeQt2emxyapQvIEiy/pM14oXdqQvg/Iwt2E=;
 b=g3DKEJiQqtcXCrNUwS37Yi+nDHJF2UW92cijf/zmxhcc08jZLqAfVsUcdQSP4motrHq04J
 BnQGyqsLsSGCwt+lvBnvp6YJXp5ZkTeuO9VOHRp4GEno7DPYq8BkcXVr01jtFpd4VZ8rEw
 DqVumR1WIHMBddRhiqE2SFt5CH9VMmo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-COnVYqe8P9-n0kqbasaDIQ-1; Thu, 04 May 2023 10:33:15 -0400
X-MC-Unique: COnVYqe8P9-n0kqbasaDIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35A51185A79C;
 Thu,  4 May 2023 14:33:15 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69552C15BB8;
 Thu,  4 May 2023 14:33:13 +0000 (UTC)
Date: Thu, 4 May 2023 16:33:11 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: imammedo@redhat.com, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 mst@redhat.com, anisinha@redhat.com, jusual@redhat.com, gibi@redhat.com
Subject: Re: [PATCH v4] acpi: pcihp: allow repeating hot-unplug requests
Message-ID: <ZFPCJ+xm7Si6uC+a@pinwheel>
References: <20230418090449.2155757-1-imammedo@redhat.com>
 <eaff7481-48ab-14f4-330b-e2d84dd72855@msgid.tls.msk.ru>
 <ZEldKCEgmDA7Hmdx@pinwheel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEldKCEgmDA7Hmdx@pinwheel>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 07:20:08PM +0200, Kashyap Chamarthy wrote:
> On Wed, Apr 26, 2023 at 07:40:02PM +0300, Michael Tokarev wrote:
> > 18.04.2023 12:04, Igor Mammedov wrote:
> > > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > > device is ignored when it's issued before guest OS has been booted.
> > > And any additional attempt to request device hot-unplug afterwards
> > > results in following error:
> > > 
> > >    "Device XYZ is already in the process of unplug"
> > > 
> > > arguably it can be considered as a regression introduced by [2],
> > > before which it was possible to issue unplug request multiple
> > > times.
> > 
> > Stable-8.0 material?
> 
> FWIW, I'd say, yes. This fix is useful for stable releases.  As this
> solves a real problem for upper-management tools.
> 
> I have tested this fix; and it works.  I'll post my testing notes /
> reproducer in a follow-up email.  In short, I followed the
> reproducer steps from here[1].

Tested-by: Kashyap Chamarthy <kchamart@redhat.com>    

It solves the device-detach bug noted here[1].  As promised, here are my
reproducer notes (expanded from[1]):

Disk image prep
---------------

(1) Download an Ubuntu "Jammy" guest image from here:
    https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

(2) Update the above disk image's kernel command-line to have the
    guest-boot slowed down by 100 seconds; use "boot_delay=100".

(3) Have an additional image ("disk2.img") ready for hot-plug/un-plug.

Test
----

(1) Build QEMU with the patch in question:

      $ git describe
      7.2.94v8.0.0-rc4-1-gfa6650df6d7

(2) Use the above QEMU binary to launch the Ubuntu "Jammy" guest:

      $ virsh dumpxml jammy1 | grep emulator
      <emulator>/home/kashyapc/tinker-space/qemu-upstream/build/qemu-system-x86_64</emulator>

(3) Have a split `tmux` ready; start the guest in the first pane, with
    the serial console logs rolling:

      $ virsh start jammy1 --console

(4) Wait until the guest consoles messages start rolling.  Once they do,
    on the other `tmux` pane, issue the below command (it's a live
    attach, followed by a detach):

      $ virsh attach-disk jammy1 ./disk2.img vdb --live --persistent \
          && sleep 1 \
          && virsh detach-disk jammy1 --live ./disk2.img
  
      Disk attached successfully
                                                     
      Disk detached successfully

(5) Enumerate the attached block devices to the guest.  We still see the
    second disk, "disk2.img":

      $> virsh domblklist jammy1
       Target   Source                         
      -------------------------------------------
       vda      /data/images/jammy-ubuntu.qcow2      
       vdb      /data/images/disk2.img

(6) Now detach the disk from the inactive guest XML (that affects
    next boot) by using "--persistent" flag; and enumerate the live
    block devices (we still see the second disk)

      $> virsh detach-disk jammy1 --persistent /data/images/disk2.img
      Disk detached successfully
  
      $> virsh domblklist jammy1
       Target   Source                         
      -------------------------------------------
       vda      /data/images/jammy-ubuntu.qcow2      
       vdb      /data/images/disk2.img
 
(NOTE: We're using two separate calls to `virsh detach-disk`, one with
"--live" and the other with "--persistent" based on upstream libvirt
recommendation in [1].)

(7) Again, re-issue the detach command with just "--live" flag:

      $> virsh detach-disk jammy1 --live /data/images/disk2.img                                       
      Disk detached successfully

(8) Re-enumerate the attached block devices: 

      $> virsh domblklist jammy1                                                                      
       Target   Source
      -------------------------------------------
       vda      /data/images/jammy-ubuntu.qcow2

Now we see the second device is detached "for real".  Overall, we were
able to successfully re-issue `device detach` while the guest is still
booting, and see through the actual detach to its logical conclusion.


[1] https://gitlab.com/libvirt/libvirt/-/issues/309 -- Disk detach is
    unsuccessfull while the guest is still booting

-- 
/kashyap


