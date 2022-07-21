Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C357D20D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:55:33 +0200 (CEST)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZSV-0003jl-TC
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEZFP-0007LI-6q
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEZFL-0000Eg-S5
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421715;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vzmaaJ8Xexnb2ft/rdWjOgwJJiBRV0blLZlTx7HBXWE=;
 b=YGf96Dj2E8qTwB8mqGx3YP5N1JhpZQ4Pt5B+16dJ4OgqV1aFQLiKH/gW3EQqXQut3loRhO
 n0neyxJ1P5M5rzRDT0lAzahcak6F6M9c2gznX75sqZo+VCYSg5VTXRwVSX8oSRsdPix5Qo
 8d3prSZ8rIGDvxObYmsVPceBCl7fWcs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-2uyShMrpO5Ojq2z42-lUPA-1; Thu, 21 Jul 2022 12:41:51 -0400
X-MC-Unique: 2uyShMrpO5Ojq2z42-lUPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 904D4380115A;
 Thu, 21 Jul 2022 16:41:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F422026D64;
 Thu, 21 Jul 2022 16:41:50 +0000 (UTC)
Date: Thu, 21 Jul 2022 17:41:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Zhao, Zhou" <zhou.zhao@intel.com>
Cc: "Xu, Ling1" <ling1.xu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "Jin, Jun I" <jun.i.jin@intel.com>
Subject: Re: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Message-ID: <YtmBzCuMnY2kHr4f@redhat.com>
References: <20220721103147.96608-1-ling1.xu@intel.com>
 <20220721103147.96608-2-ling1.xu@intel.com>
 <YtlshIteVijWePbd@redhat.com>
 <DM6PR11MB28126DAC62A921E5551C1400F5919@DM6PR11MB2812.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR11MB28126DAC62A921E5551C1400F5919@DM6PR11MB2812.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 04:02:49PM +0000, Zhao, Zhou wrote:
> Hi dainel:
>   Cause our code depend on intel intrinsics lib implement. And
> this lib depend on macro like  " AVX512BW ". This macro need
> compile time check to enable some machine options . if you only
> use that utility to do runtime check ,you will met compile issue.
> And also if we want to save cpu time , we'd better check it in
> compile time.

Can you give more info about this library ? The patch isn't
linking to any new library so it was not immediately obvious
that this patch even introduced a dependancy on an external
library. Preferrably the library would be using 'pkg-config'
so we can check for it in a single line of meson.build code
instead of writing 100's of lines of configure compile tests.

Generally if the library is available in Linux dijstros, then
we'll want the CI to test that too, which will mean updating
the dockerfiles.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


