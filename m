Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB5273A74
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 07:58:46 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKbK9-00077a-6H
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 01:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKbIr-0006dK-QT
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 01:57:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40683
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKbIp-0005cm-03
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 01:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600754241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tmaGdyFr9K9IePSDXSY/EZOgvOomPn2w7UEXYEHN3jw=;
 b=Jq8i55XJ6eLqJ5/rhn0NBjpUojV6x60gSDaA2bI+1dKUSWdghStU5IcN5ULTrZNIwVhzYJ
 7x6Idpb7XsLbOojYUbODHJdwg3ZLXs4cg7FMHrhcHtxlcIeKoGagNVlutm47c4gpgglq50
 QDwI2TbjwbG84cS6N5HRNbznuXoNjkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-Pyk6eaeeP7GOINPh8I7jNA-1; Tue, 22 Sep 2020 01:57:13 -0400
X-MC-Unique: Pyk6eaeeP7GOINPh8I7jNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13240425D3;
 Tue, 22 Sep 2020 05:57:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C37310013BD;
 Tue, 22 Sep 2020 05:57:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A9799D5A; Tue, 22 Sep 2020 07:57:05 +0200 (CEST)
Date: Tue, 22 Sep 2020 07:57:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: Regression with latest SeaBIOS booting multi-disk root LVs?
Message-ID: <20200922055705.kzh6elyjq3lruvsu@sirius.home.kraxel.org>
References: <247d7ead-e426-abb5-07a1-0bd009253c37@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <247d7ead-e426-abb5-07a1-0bd009253c37@proxmox.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 01:57:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: seabios@seabios.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 21, 2020 at 03:10:51PM +0200, Stefan Reiter wrote:
> Hi list,
> 
> since SeaBIOS 1.14.0 (QEMU 5.1) VMs with LVM root disks spanning more than
> one PV fail to boot, if only the first is set as bootable. I believe this is
> due to the changes in SeaBIOS only initializing drives marked as 'bootable'
> by QEMU.
> 
> One fix is to mark all disks containing root data as bootable, but existing
> setups will still break on upgrade (where only the disk containing the
> bootloader is marked). This is not ideal.
> 
> Discovered by a user in our bugtracker:
> https://bugzilla.proxmox.com/show_bug.cgi?id=3011
> 
> and verified by installing Ubuntu 20.04 w/ LVM and GRUB on virtio-scsi, then
> expanding the LV to a second disk.
> 
> I found that just reverting SeaBIOS to 1.13.0 makes it work again, same
> guest install, even with QEMU 5.1.
> 
> Is this intended behaviour?

Yes, it is intentional.  Save some memory and speed up boot by not
initializing disks which are not needed.

> Any fix or workaround?

 - Assign a bootindex to all drives needed, as you already figured, or

 - Start qemu with -boot strict=off, or

 - Install guest with a /boot filesystem on a normal partition.  Which
   is IMHO a good idea anyway for robustness reasons, you can use all
   lvm features without worrying whenever grub is able to cope or not.

take care,
  Gerd


