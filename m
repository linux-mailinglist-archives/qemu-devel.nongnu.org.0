Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141C4B49A2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:36:00 +0100 (CET)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYi7-0000Ld-5q
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:35:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJYcv-00069b-1m
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJYcs-0007ns-Pa
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644834633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1tO2NWITAnce+5vRCgppP+B+Icvby3c0gmVwtt+hV0w=;
 b=ek/iPh84YnDYDnWYqJCZ/+pjsKusyqeNClD/SHsqhr6JlmxA2zSBqOgydr9Pxok5PzoRO/
 mQJU9qdKtbtE2DfIdoqrJpxKjEcv3trw/Fufm8DGZgTbvsJnkzDP59K2Xo2P4o/h+528o4
 OHCS6rKCQbdnUWShUxozQVd7SSX5Po0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-9hXoYG-8NyWwpgUOY2DNKA-1; Mon, 14 Feb 2022 05:30:30 -0500
X-MC-Unique: 9hXoYG-8NyWwpgUOY2DNKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32BBF1091DA2;
 Mon, 14 Feb 2022 10:30:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 263847B6F7;
 Mon, 14 Feb 2022 10:30:20 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:30:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Message-ID: <YgovOszouLTQfZgI@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
 <20220207093752.7503b6cb@redhat.com>
 <20220214065857.GA5015@yangzhon-Virtual>
 <20220214092107.56d3f300@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220214092107.56d3f300@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 09:21:07AM +0100, Igor Mammedov wrote:
> On Mon, 14 Feb 2022 14:58:57 +0800
> Yang Zhong <yang.zhong@intel.com> wrote:
> 
> > On Mon, Feb 07, 2022 at 09:37:52AM +0100, Igor Mammedov wrote:
> > > On Sat,  5 Feb 2022 13:45:26 +0100
> > > Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > >   
> > > > Previously SGX-EPC objects were exposed in the QOM tree at a path
> > > > 
> > > >   /machine/unattached/device[nn]
> > > > 
> > > > where the 'nn' varies depending on what devices were already created.
> > > > 
> > > > With this change the SGX-EPC objects are now at
> > > > 
> > > >   /machine/sgx-epc[nn]
> > > > 
> > > > where the 'nn' of the first SGX-EPC object is always zero.  
> > > 
> > > yet again, why it's necessary?  
> > 
> > 
> >   Igor, Sorry for delay feedback because of Chinese New Year holiday.
> > 
> >   This series patches are to fix below issues I reported before,
> >   https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html
> > 
> >   Since the /machine/unattached/device[0] is used by vcpu and Libvirt
> >   use this interface to get unavailable-features list. But in the SGX
> >   VM, the device[0] will be occupied by virtual sgx epc device, Libvirt
> >   can't get unavailable-features from this device[0].
> > 
> >   Although patch 2 in this series already fixed "unavailable-features" issue,
> 
> I've seen patches on libvirt fixing "unavailable-features" in another way
> without dependence on  /machine/unattached/device[0].
> see:
>  https://www.mail-archive.com/libvir-list@redhat.com/msg226244.html
> 
> >   this patch can move sgx virtual device from /machine/unattached/device[nn]
> >   to /machine/sgx-epc[nn], which seems more clear. Thanks!
> 
> with those patches device[0] becomes non issue, and this patch also becomes
> unnecessary.
> I don't mind putting sgx-epc under machine, but that shall be justified
> somehow. A drawback I noticed in this case is an extra manual
> plumbing/wiring without apparent need for it.

This is effectively questioning why we have a QOM hierarchy with
named devices at all. IMHO we don't need to justify giving explicitly
named nodes under QOM beyond  "this is normal QOM modelling", and
anything under '/unattached' is subject to being fixed in this way.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


