Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2D41C246
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:09:15 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWWY-0004j7-RP
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVWVA-0003hW-Pm
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVWV5-0004D6-LD
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632910062;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+rhttBClCHzFdv4pTSnXV4zLfQURpu5Cp/F+BNl6qI0=;
 b=CMcEY627uoSqmM9A9d1NPooUn+HblZ8VEcvKblcL3JNpd9vNo4gILeQaHSCkkzMi4b9YXv
 BHhDimM41nmMgb/4l7WJ3YXCVhT9Y0DdNqNymw7Z6EcejWQpc14xqP5Cw9scCYS9dJVXtX
 Av4Ee2s4iNF2PvydmwNrZDxThIt0Zg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-mS9w3I4iN8aYTOU8Ie07Xw-1; Wed, 29 Sep 2021 06:07:35 -0400
X-MC-Unique: mS9w3I4iN8aYTOU8Ie07Xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78915100C662;
 Wed, 29 Sep 2021 10:07:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20952100164A;
 Wed, 29 Sep 2021 10:07:32 +0000 (UTC)
Date: Wed, 29 Sep 2021 11:07:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <YVQ64pAP0iy1HbNn@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929094638.GF3361@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929094638.GF3361@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 10:46:39AM +0100, Richard W.M. Jones wrote:
> On Wed, Sep 29, 2021 at 10:33:43AM +0100, Daniel P. Berrangé wrote:
> > Ultimately as long as the mapping from libvirt XML to guest visible
> > string is consistent across drivers, that's sufficient.
> > 
> > > Adding qemu-devel because I'm interesting to see if the qemu
> > > developers would prefer to fix this properly in qemu.
> > 
> > No matter what order QEMU accepts the data in, it can be said to be
> > functionally correct. If the order is "unusual" though, it ought to
> > at least be documented how the QEMU order corresponds to guest visible
> > order.
> > 
> > Incidentally I wonder how much to trust VMGENID.EXE and whether that
> > actally reports what it gets out of guest memory "as is", or whether
> > it has done any byte re-ordering.
> > 
> > I'm curious what Linux kernel sees for the genid on Vmware vs KVM
> > hosts, as probably I'd trust that data more ?
> 
> As far as I can tell no driver has successfully made it upstream,
> although there have been a few attempts:
> 
>   https://lkml.org/lkml/2018/3/1/498
> 
> Here's a more recent one from 10 months ago:
> 
>   https://lore.kernel.org/linux-doc/3E05451B-A9CD-4719-99D0-72750A304044@amazon.com/
> 
> If I have time I'll patch a Linux kernel with the second patch and see
> how it relates to the VMware and KVM parameters, but it probably won't
> be today.

I'm not sure if we actually need the full driver or not for testing
purposes. The the GenID is just in memory somewhere, and the somewhere
is reported via ACPI table entry. For QEMU its easy as the data is
exposed via fw_cfg which can be read from sysfs directly without
even needing to look at ACPI entries to find it. Not sure how we
find it with VMWare/HyperV though.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


