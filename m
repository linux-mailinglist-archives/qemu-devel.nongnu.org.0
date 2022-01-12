Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FC848C247
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:27:51 +0100 (CET)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ar8-0006MJ-TB
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:27:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7ao6-0003bL-Cx
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7ao4-0002Fb-Eg
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641983080;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/wBvKdQrqtutFpt9mLnacu4tuCBJM2RMB16LyOgZio=;
 b=TudOmtjd5fb6Y7YSQjD/E3O/v2CZt/xTpL5BaJvsIrnY9+LK+IffcyxteP96iABbb7R8kj
 S8JmE1BTWw1doimUmqK5N8l1wB5rFOFD3WOS9bQoEz8OXw8bm0VtWKjDiDxFCyNGRV5alI
 4cRXIqK4XaW4AZyWBQB0Oqn0flseYrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-F9B3P8XCPRSBzoQ42LfIRg-1; Wed, 12 Jan 2022 05:24:38 -0500
X-MC-Unique: F9B3P8XCPRSBzoQ42LfIRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B43381EE60;
 Wed, 12 Jan 2022 10:24:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09C6C1059110;
 Wed, 12 Jan 2022 10:24:35 +0000 (UTC)
Date: Wed, 12 Jan 2022 10:24:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] sgx: Move sgx object from /machine/unattached to /machine
Message-ID: <Yd6sYaHLtCgMLMKS@redhat.com>
References: <20220112165517.4140482-1-yang.zhong@intel.com>
 <Yd6pV+6kdfLNQRnA@redhat.com>
 <CAFEAcA-K2uVc2NpfHBQokBZBRSeTGm0dnr7UCLE+sN+Ro-Lj8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-K2uVc2NpfHBQokBZBRSeTGm0dnr7UCLE+sN+Ro-Lj8w@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, eduardo@habkost.net,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 10:16:33AM +0000, Peter Maydell wrote:
> On Wed, 12 Jan 2022 at 10:14, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jan 12, 2022 at 11:55:17AM -0500, Yang Zhong wrote:
> > > When Libvirt start, it get the vcpu's unavailable-features from
> > > /machine/unattached/device[0] path by qom-get command, but in SGX
> > > guest, since the sgx-epc virtual device is initialized before VCPU
> > > creation(virtual sgx need set the virtual EPC info in the cpuid). This
> > > /machine/unattached/device[0] is occupied by sgx-epc device, which
> > > fail to get the unvailable-features from /machine/unattached/device[0].
> >
> > If libvirt decides to enable SGX in a VM, then surely it knows
> > that it should just query /machine/unattached/device[1] to get
> > the CPU features instead. Why do we need to do anything in QEMU ?
> 
> libvirt having to know it needs to look at /machine/unattached/device[n]
> for anything is a bit fragile, really... it's effectively encoding
> knowledge about what order things happen to get created inside QEMU.

So how do CPUs and other devices end up being under /unattached/ ?
Can we ensure that *all* QEMU devices have a well defined attachment
point ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


