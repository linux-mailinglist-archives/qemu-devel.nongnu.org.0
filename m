Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E794AB8C2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:33:52 +0100 (CET)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1LD-0006xv-GL
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH0ve-00034d-1A
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:07:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH0va-0004Jm-Gq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644228441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJ3QOtukejvI0Tb2Q0CDTGD6ryltBEVDlXxlGUnwZNM=;
 b=BmGam1voo6sil3fTwTEWI46u2aGJ4lxbIE2yw6ebNCsf0+tbrCFQ6JHGQERYznvTMCCgFp
 6TEc8W3eKXUI4TR1OE0x8xwtBhnsxNF7+zSkNU8vjxyESk9Gxy3NDt4b0t4jGA63hCEwkI
 Vh59ON75FblxSdp7s5z7OND1TexQBl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-i9YLyDzMN8CGe5q-c5PeJg-1; Mon, 07 Feb 2022 05:07:18 -0500
X-MC-Unique: i9YLyDzMN8CGe5q-c5PeJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11B9835B4D;
 Mon,  7 Feb 2022 10:07:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CCB57B039;
 Mon,  7 Feb 2022 10:06:51 +0000 (UTC)
Date: Mon, 7 Feb 2022 10:06:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <YgDvOATB5SOvS9pZ@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <YgDoKlkP9Isdjnv8@angien.pipo.sk>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 10:36:42AM +0100, Peter Krempa wrote:
> On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > On Mon, 7 Feb 2022 09:14:37 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > > On Sat,  5 Feb 2022 13:45:24 +0100
> > > Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > > 
> > > > Previously CPUs were exposed in the QOM tree at a path
> > > > 
> > > >   /machine/unattached/device[nn]
> > > > 
> > > > where the 'nn' of the first CPU is usually zero, but can
> > > > vary depending on what devices were already created.
> > > > 
> > > > With this change the CPUs are now at
> > > > 
> > > >   /machine/cpu[nn]
> > > > 
> > > > where the 'nn' of the first CPU is always zero.  
> > > 
> > > Could you add to commit message the reason behind the change?
> > 
> > regardless, it looks like unwarranted movement to me
> > prompted by livirt accessing/expecting a QOM patch which is
> > not stable ABI. I'd rather get it fixed on libvirt side.
> > 
> > If libvirt needs for some reason access a CPU instance,
> > it should use @query-hotpluggable-cpus to get a list of CPUs
> > (which includes QOM path of already present CPUs) instead of
> > hard-codding some 'well-known' path as there is no any guarantee 
> > that it will stay stable whatsoever.
> 
> I don't disagree with you about the use of hardcoded path, but the way
> of using @query-hotpluggable-cpus is not really aligning well for how
> it's being used.
> 
> To shed a bit more light, libvirt uses the following hardcoded path
> 
> #define QOM_CPU_PATH  "/machine/unattached/device[0]"
> 
> in code which is used to query CPU flags. That code doesn't care at all
> which cpus are present but wants to get any of them. So yes, calling
> query-hotpluggable-cpus is possible but a bit pointless.
> 
> In general the code probing cpu flags via qom-get is very cumbersome as
> it ends up doing ~400 QMP calls at startup of a VM in cases when we deem
> it necessary to probe the cpu fully.

Yes, that's one QMP call per CPUID feature bit that QEMU knows
about. It is a massive performance bottleneck that we need a
much better solution for.  We really should have raised this
with QEMU right away when we found we had this need for 100's
of QMP commands.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


