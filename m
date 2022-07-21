Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF457CAA7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:31:46 +0200 (CEST)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVLE-0005m4-Pi
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEVHY-0001FD-V8
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEVHV-0004dH-30
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406472;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=urBEqRteQ6vbve64+cSGkqRLL1DOH018G2yNCqw3V1s=;
 b=cIN4qpjpvEDkfg1Owh0vTagl/FBHSkPZHXfocShsfTq7UmNdq/O+omLhkpA+Ws1fgVLWIm
 0Fgi3BMHkZcGjbMCuUBu1Ges1mfWBGwh6K7IjiwBfTIIKSgl9fneDyEfgI0tsYEoGKXA0k
 KqYu81G49yYUpJr622E+4HpXw0plCwY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-gPRzpKzBNN6ZiYPfzzFBgw-1; Thu, 21 Jul 2022 08:27:48 -0400
X-MC-Unique: gPRzpKzBNN6ZiYPfzzFBgw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F6323C10225;
 Thu, 21 Jul 2022 12:27:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1752D492C3B;
 Thu, 21 Jul 2022 12:27:45 +0000 (UTC)
Date: Thu, 21 Jul 2022 13:27:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
Message-ID: <YtlGPy+C9ksQQXzO@redhat.com>
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
 <20220721065744-mutt-send-email-mst@kernel.org>
 <1ee57e75-94a1-cf75-7d49-0d399607fee9@redhat.com>
 <YtlDtSlRel1UUd71@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtlDtSlRel1UUd71@zx2c4.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Thu, Jul 21, 2022 at 02:16:53PM +0200, Jason A. Donenfeld wrote:
> Hi Paolo,
> 
> On Thu, Jul 21, 2022 at 01:47:02PM +0200, Paolo Bonzini wrote:
> > On 7/21/22 13:00, Michael S. Tsirkin wrote:
> > > Well why not.
> > > 
> > > Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> > > 
> > > who's merging this? Paolo me or you?
> > 
> > I don't think this should be merged as is.
> > 
> > The linuxboot ROM takes the data from fw_cfg, and (with the exception of 
> > ACPI tables) that data is not migrated.  Because reading it into the 
> > guest is not atomic, both sides must match.  This version of the patches 
> > at least doesn't move the preexisting DTB entry of the setup_data, but 
> > it still has a mismatching size and that can be a problem when migrating 
> > backwards.
> 
> As discussed online, this seems absolutely preposterous and will never
> happen anywhere real ever at all. Trying to account for it is adding
> needless complexity for no real world benefit; it's the type of thinking
> that results in a mess. Further, conditionalizing the RNG seed on
> something else means fewer users receive the increased security of
> having an early boottime seed. This seems like a silly direction go go
> in.

As mentioned previously, few users are going to benefit from this
anyway, because most public cloud VMs don't use direct kernel boot,
the guest firmware loads the kernel from the guest /boot partition.

Regardless though, what Paolo described with a machine type specific
property won't have a significant impact on availablity. This is NOT
requiring users to opt-in to the seed in general.

Tieing settings to the machine type means that newly provisioned
guests will get it enabled out of the box, as they'll typically
use the latest machine type.

Pre-existing guests which have merely upgraded their QEMU instance
won't get the feature, because they'll be fixed on the old machine
type to guarantee no guest ABI change. This isn't a problem, as
such pre-existing guests likely won't have the new Linux code to
consume the seed anyway.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


