Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398B4C2A06
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:58:09 +0100 (CET)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBp2-0005yH-GY
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:58:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNBnJ-0004zA-GV
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNBnE-0006Z7-Di
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645700166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YaoPgRiiMFZyEiFbgVOYNnx9/MH1T+le09fTeysDAhE=;
 b=EQ76mn3gvwDJb5keZFJInzqkaPNxUWQ/0Hjy71jV+ajO0Irf2QB7Mvg8E8BSmRUVfJxas5
 ZAs7M6fDyzo0S4TW6Q5vm+EomNA0iUNZpK3n9R8KBvHORapkFNN3opTWONUjaxOIN/Hqt0
 Zxqr9Bm6QG40XDDOkeWT9Q0iWmp9IaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-8ALh40HuPAmZXiOGTne0Rw-1; Thu, 24 Feb 2022 05:56:03 -0500
X-MC-Unique: 8ALh40HuPAmZXiOGTne0Rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B05CB51DF;
 Thu, 24 Feb 2022 10:56:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A15123769;
 Thu, 24 Feb 2022 10:55:13 +0000 (UTC)
Date: Thu, 24 Feb 2022 10:55:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
Message-ID: <YhdkD4S7Erzl98So@redhat.com>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
 <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-s390@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ben@skyportsystems.com,
 "Weiss, Radu" <raduweis@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "Catangiu, Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Colm MacCarthaigh <colmmacc@amazon.com>,
 "Singh, Balbir" <sblbir@amazon.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 09:22:50AM +0100, Laszlo Ersek wrote:
> (+Daniel, +Rich)
> 
> On 02/23/22 17:08, Jason A. Donenfeld wrote:
> > On Wed, Feb 23, 2022 at 2:12 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> second patch is the reason this is just an RFC: it's a cleanup of the
> >> ACPI driver from last year, and I don't really have much experience
> >> writing, testing, debugging, or maintaining these types of drivers.
> >> Ideally this thread would yield somebody saying, "I see the intent of
> >> this; I'm happy to take over ownership of this part." That way, I can
> >> focus on the RNG part, and whoever steps up for the paravirt ACPI part
> >> can focus on that.
> 
> > (It appears there's a bug in QEMU which prevents
> > the GUID from being reinitialized when running `loadvm` without
> > quitting first; I suppose this should be discussed with QEMU
> > upstream.)
> 
> That's not (necessarily) a bug; see the end of the above-linked QEMU
> document:
> 
> "There are no known use cases for changing the GUID once QEMU is
> running, and adding this capability would greatly increase the complexity."

IIRC this part of the QEMU doc was making an implicit assumption
about the way QEMU is to be used by mgmt apps doing snapshots.

Instead of using the 'loadvm' command on the existing running QEMU
process, the doc seems to tacitly expect the management app will
throwaway the existing QEMU process and spawn a brand new QEMU
process to load the snapshot into, thus getting the new GUID on
the QEMU command line. There are some downsides with doing this
as compared  to running 'loadvm' in the existing QEMU, most
notably the user's VNC/SPICE console session gets interrupted.
I guess the ease of impl for QEMU was more compelling though.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


