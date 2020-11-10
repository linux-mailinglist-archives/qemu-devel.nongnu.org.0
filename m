Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FF2AD9B3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:07:48 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVFL-0007x0-Bb
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcVBT-0004mX-Fe
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcVBM-0008I7-Q2
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605020618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y/KRUAK9w63Zb5EHm7h8Isezijx5gAkSorCc0nDszf8=;
 b=Mx3jNzaAe5Z+YEUQH4kBQe5fYeLq4ELSoEZiiMAn1ohCGPuILJT5zJ4gi/ywiv2Qccoh7t
 +LaYPmJfdF+30cY/vPZ+Ylmwth9m2zC9O9txvztOhTRmz/m3riAuFdTkb2dztevT3etQUd
 +xYoFEZLTqKEiRu5AfiGGLN32HMK4n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Asaqnun4O6ul4BhThB1aBg-1; Tue, 10 Nov 2020 10:03:36 -0500
X-MC-Unique: Asaqnun4O6ul4BhThB1aBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14A39186DD29;
 Tue, 10 Nov 2020 15:03:35 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEA075D9D2;
 Tue, 10 Nov 2020 15:03:34 +0000 (UTC)
Date: Tue, 10 Nov 2020 10:03:33 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: QOM address space handling
Message-ID: <20201110150333.GE5733@habkost.net>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Paolo, the Memory API maintainer.

On Tue, Nov 10, 2020 at 11:14:39AM +0000, Mark Cave-Ayland wrote:
> Hi all,
> 
> This email follows on from my investigation of intermittent Travis-CI
> failures in make check's device-introspect test when trying to add the patch
> at https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06093.html to my
> last qemu-sparc pull request.
> 
> The patch itself seems fairly harmless: moving the sun4u-iommu device as a
> QOM child of the sabre PCI host bridge device. So why was "make check"
> randomly segfaulting on Travis-CI?
> 
> The hardest part was trying to reproduce the issue to debug it: eventually
> after a number of Travis-CI runs I discovered I could generate the same
> problem locally if I ran "make check" around 15-20 times in a row, and that
> gave me a backtrace that looked like this:
> 
> 0x0000000000614b69 in address_space_init (as=0x16f684d8,
> root=0x16f68530, name=0x9a1db2 "iommu-as") at ../softmmu/memory.c:2780
> 2780        QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
> (gdb) bt
> #0  0x0000000000614b69 in address_space_init (as=0x16f684d8,
>  root=0x16f68530, name=0x9a1db2 "iommu-as") at
> ../softmmu/memory.c:2780
> #1  0x00000000005b8f6a in iommu_init (obj=0x16f681c0) at ../hw/sparc64/sun4u_iommu.c:301
> #2  0x000000000070a997 in object_init_with_type (obj=0x16f681c0,
>  ti=0x1629fac0) at ../qom/object.c:375
> 
> With the debugger attached I was able to figure out what was happening: the
> sun4u-iommu device creates the iommu-as address space during instance init,
> but doesn't have a corresponding instance finalize to remove it which leaves
> a dangling pointer in the address_spaces QTAILQ.
> 
> Normally this doesn't matter because IOMMUs are created once during machine
> init, but device-introspect-test instantiates sun4u-iommu (and with the
> patch sabre also adds it as a child object during instance init) which adds
> more dangling pointers to the address_spaces list. Every so often the
> dangling pointers end up pointing to memory that gets reused by another QOM
> object, eventually causing random segfaults during instance finalize and/or
> property iteration.
> 
> There are 2 possible solutions here: 1) ensure QOM objects that add address
> spaces during instance init have a corresponding instance finalize function
> to remove them or 2) move the creation of address spaces from instance init
> to realize.
> 
> Does anyone have any arguments for which solution is preferred?

I'd say (2) is preferred, as we don't expect object_new(T) to
have any side effects outside the object instance state.  Most
address_space_init() calls in the code today seem to be in
realize functions.

However, I wonder if we could make this simpler (and mistakes
less fatal) if we make AddressSpace a QOM child of the device.
Paolo, would it be too much overhead to make AddressSpace a QOM
object?

 
> As part of this work I hacked up an address_space_count() function in
> memory.c that returns the size of the address_spaces QTAILQ and added a
> printf() to display the value during instance init and finalize which
> demonstrates the problem nicely. This means it should be possible to add a
> similar to check to device-introspect-test in future to prevent similar
> errors from happening again.
> 
> 
> ATB,
> 
> Mark.
> 

-- 
Eduardo


