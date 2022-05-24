Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FE53262B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:13:39 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntQbi-0004gX-F1
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntPvM-0000gS-5B
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntPvJ-0003tV-9e
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653380987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GUSD90TGVdoNT6RamwsTuRQRaKIMXTvwDZ4IEGfDVx4=;
 b=DhVCOaNh6Tc6uXYBa0gvkYLbJx1tQJoxqeeIplCqAM0wY7m9rfiuSX7M7iSFbhmuhZHKQx
 viuNeQUeU2Gbzan3/3fVqYw4Qx8lmbMK50kqL6IBKL7cx1pXNRLdMZ993NeflVqLKGWyni
 6eZ8cc9RU7cOwB6jJ522V6HBJtr8BLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-zN8m4DqDPYKTeySmcf9URg-1; Tue, 24 May 2022 04:29:43 -0400
X-MC-Unique: zN8m4DqDPYKTeySmcf9URg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FEB385A5AA;
 Tue, 24 May 2022 08:29:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94ED2492CA3;
 Tue, 24 May 2022 08:29:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E7B11800393; Tue, 24 May 2022 10:29:39 +0200 (CEST)
Date: Tue, 24 May 2022 10:29:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 13/36] i386/tdx: Validate TD attributes
Message-ID: <20220524082939.2clruwficvkdwnzh@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-14-xiaoyao.li@intel.com>
 <20220523093920.o6pk5i7zig6enwnm@sirius.home.kraxel.org>
 <1e0f0051-f7c1-ed3b-be02-d16f0cf9f25d@intel.com>
 <20220524065959.umzmlhwcspfwi7m2@sirius.home.kraxel.org>
 <89534991-1850-be09-8abd-6d29bef5958e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89534991-1850-be09-8abd-6d29bef5958e@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 04:11:56PM +0800, Xiaoyao Li wrote:
> On 5/24/2022 2:59 PM, Gerd Hoffmann wrote:
> > On Tue, May 24, 2022 at 12:19:51PM +0800, Xiaoyao Li wrote:
> > > On 5/23/2022 5:39 PM, Gerd Hoffmann wrote:
> > > > So, how is this supposed to work?  Patch #2 introduces attributes as
> > > > user-settable property.  So do users have to manually figure and pass
> > > > the correct value, so the check passes?  Specifically the fixed1 check?
> > > > 
> > > > I think 'attributes' should not be user-settable in the first place.
> > > > Each feature-bit which is actually user-settable (and not already
> > > > covered by another option like pmu) should be a separate attribute for
> > > > tdx-object.  Then the tdx code can create attributes from hardware
> > > > capabilities and user settings.
> > > 
> > > In patch #2, tdx-guest.attributes is defined as a field to hold a 64 bits
> > > value of attributes but it doesn't provide any getter/setter for it. So it's
> > > *not* user-settable.
> > 
> > Ok.  Why it is declared as object property in the first place then?
> 
> Is there another way to define a member/field of object besides property?

Well, the C object struct is completely independent from the qapi
struct.  Typically qapi-generated structs are added as struct fields.
Look at ui/input-linux.c for example.

struct InputLinux holds all the object state.  It has a GrabToggleKeys
field, that is a qapi-generated enum (see qapi/common.json) and is
user-configurable (there are getter and setter for it).

So, you can have a private 'attributes' struct field in your tdx class,
but the field doesn't have to be in the qapi struct for that.

HTH,
  Gerd


