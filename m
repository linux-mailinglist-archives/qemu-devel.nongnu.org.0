Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF3142FB0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 17:30:54 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itZwy-0004CL-8Q
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 11:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1itZvr-0003Pn-A8
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1itZvo-00065U-Pm
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:29:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25356
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1itZvn-00064O-TW
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579537779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOITkiXqRRf8iJs/9tzvLTnIHkc867r22m9sdcvO0ZI=;
 b=XbJ8bf893ZalCd8sv1Iqj2TZh0QbtIPzsA5dxTPAp2R9FqrcXEAjxWUxGoa7Goi0pH+osz
 VfQMlgu/doHR+5I96DLeIksGPW5tgHjlbFFOpvpY8C8ZLF20ILHfaGF5RT9/d9JMJc2P6a
 AJsyKPrEDMOuMyPBL7VcKL8SfK5kcaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-tdEIeTFZOS6tnizbxKohIw-1; Mon, 20 Jan 2020 11:29:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2836800D48;
 Mon, 20 Jan 2020 16:29:34 +0000 (UTC)
Received: from gondolin (ovpn-205-161.brq.redhat.com [10.40.205.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10327289A1;
 Mon, 20 Jan 2020 16:29:20 +0000 (UTC)
Date: Mon, 20 Jan 2020 17:29:18 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v3] target/s390x/kvm: Enable adapter interruption
 suppression again
Message-ID: <20200120172918.26d5db9b.cohuck@redhat.com>
In-Reply-To: <a4606ae6-1c74-d584-4bf1-9e4d11bb7a8e@linux.ibm.com>
References: <20200120132441.11884-1-thuth@redhat.com>
 <a4606ae6-1c74-d584-4bf1-9e4d11bb7a8e@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: tdEIeTFZOS6tnizbxKohIw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jan 2020 11:23:37 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 1/20/20 8:24 AM, Thomas Huth wrote:
> > The AIS feature has been disabled late in the v2.10 development cycle since
> > there were some issues with migration (see commit 3f2d07b3b01ea61126b -
> > "s390x/ais: for 2.10 stable: disable ais facility"). We originally wanted
> > to enable it again for newer machine types, but apparently we forgot to do
> > this so far. Let's do it for the new s390-ccw-virtio-5.0 machine now.
> > 
> > While at it, also add a more verbose comment why we need the *_allowed()
> > wrappers in s390-virtio-ccw.c.
> > 
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1756946
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---  
> 
> Took it for a spin with vfio-pci.  With this patch applied, I see the 
> appropriate change reflected in guest /proc/cpuinfo.  I did some tracing 
> and see the expected behavior changes (ex: hits in host 
> kvm_s390_injrect_airq that show suppression occurring).  Data transfer 
> tests worked fine.  Also sanity-tested that ais=off behaves as expected.
> 
> Looks good to me.
> 

Excellent, thanks for testing!

Should I add a Tested-by: ?


