Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408085840F7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:22:02 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4Om-0003Qh-Sl
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH3n4-0000xM-Er
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH3n2-0004u9-6A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015779;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXj9nVQ/mjAesr4ZOv1U+A/yFbiNZTKkaMAseqrqIuA=;
 b=SKBczq0fcd/+SZYPxcA118/9AnuDLuKnKwlYCbStt4BFA7ZLxYx+loZSkFb3PikoMqNnMr
 3GUXtSBHkxyJpEwN6wTf6Rf889DnXWZ2v2P0CfdgSVx6BVzYnxJJoMPHqxolY7Rf7ZaXvd
 SEH7CpGbcisXlfWzEsbhxroSheYelYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-sncxsaPuNSCsDY5gC1HY6w-1; Thu, 28 Jul 2022 09:42:55 -0400
X-MC-Unique: sncxsaPuNSCsDY5gC1HY6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 686A385A581;
 Thu, 28 Jul 2022 13:42:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2753318EB5;
 Thu, 28 Jul 2022 13:42:54 +0000 (UTC)
Date: Thu, 28 Jul 2022 14:42:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org,
 dgilbert@redhat.com, agraf@suse.de
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
Message-ID: <YuKSXDgCmmBNJndy@redhat.com>
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
 <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
 <87mtctxt49.fsf@pond.sub.org>
 <CAFEAcA_GfY8uDA+z8NSOebw1MKoaNoCNYiRBss3Ku-Q-jTBeWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_GfY8uDA+z8NSOebw1MKoaNoCNYiRBss3Ku-Q-jTBeWg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Thu, Jul 28, 2022 at 02:40:22PM +0100, Peter Maydell wrote:
> On Thu, 28 Jul 2022 at 14:30, Markus Armbruster <armbru@redhat.com> wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > I applaud the renaissance of roman-style inscriptions, but it's not just
> > words without spaces, it's also capital letters only:
> >
> >     ANY64CHARACTERFAKEOSKISENOUGHTOPREVENTINVALIDKEYWARNINGSONSTDERR
> >
> > Seriously, throw in some dashes or spaces.
> 
>       any-64-char-fake-osk-will-avoid-an-invalid-key-warning-on-stderr

On the basis that virtualization gives you turtles all the way down...

 -device isa-applesmc,osk=🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


