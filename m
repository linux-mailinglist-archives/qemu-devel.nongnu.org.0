Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E724474302
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:55:04 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7Kh-0007Cm-It
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx7Ie-0005Kh-Sy
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:52:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx7Ib-0006Be-OJ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639486373;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G043V05UymokKjm4XwQnrS6WB3UOvGAD2xrmh5+aK/k=;
 b=AXQ2WHqBMRLJ3DJESUtVT5lw3zqRIA/a4h9j0JzmNKLC46hlb9pPk6URFpJyOC8Cn+LWxg
 nSGEkxndhawj3tmYWwbDxcNYNgXEBJa2l0TbqSRGY8IKAaZPO1LCMTDvNUM/R1u6b8wi5z
 G3mvRxrt3ueZrNImfKw4fnAmFgk+F80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-HfopJW6zN42dk5DgJZPicg-1; Tue, 14 Dec 2021 07:52:52 -0500
X-MC-Unique: HfopJW6zN42dk5DgJZPicg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A3810168C8;
 Tue, 14 Dec 2021 12:52:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2EFA19EF9;
 Tue, 14 Dec 2021 12:52:47 +0000 (UTC)
Date: Tue, 14 Dec 2021 12:52:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Message-ID: <YbiTm4ovRPjLW7EF@redhat.com>
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-4-f4bug@amsat.org>
 <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
 <87o85jz912.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87o85jz912.fsf@secure.mitica>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 01:05:29PM +0100, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
> > On 06/12/2021 23.45, Philippe Mathieu-Daudé wrote:
> >> Introduce TYPE_VGA_MMIO, a sysbus device.
> >> While there is no change in the vga_mmio_init()
> >> interface, this is a migration compatibility break
> >> of the MIPS Acer Pica 61 Jazz machine (pica61).
> >
> > It's unfortunate, but as far as I know, it would be pretty difficult
> > or even impossible to get this done without versioned machine types?
> > So IMHO it's ok to break this in this case here.
> 
> Hi
> 
> My understanding is that outside of x86*, and now ppc, arm and s390,
> no one else really cares about migration compatibility.  I am not even
> sure if they really care about migration at all O:-)
>
> So, if the code is better for other reasons, I will not wonder about
> migration compatibility.

Essentially if it has versioned machine types, then migration ABI
compat is mandatory. If it doesn't have versioned machine types
then migration API compat explicitly doesn't exist.

There are no versioned machine types for MIPS, so migration compat
is a non-issue.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


