Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4407A606B2E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:21:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olduv-0006j4-JG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:21:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldhd-0006dj-GL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oldhU-0006d2-6G
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oldhR-00027o-GE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666303656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Va8oCj1o0LjNDGBxN1xVRiOnDUw9j7JbQrBbkitPwUE=;
 b=b8otAf4KgbLFgqNciBTOs2UEcHo/K9DvAVzgGCzWei+d1y1WDXxpgtrXpWbUI89ucLZ1Ro
 Fz92qNfBDHme5U8X1CCIJzR9F5vCN6x24mLxUTM5vklUj17k1VgQbfuuXlACg0bs7ksLzG
 H4nN1+DVmkdfJUO9J6/mZMURB1mRwB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-GtYf0T29NCegJR0VMc3vYg-1; Thu, 20 Oct 2022 18:07:34 -0400
X-MC-Unique: GtYf0T29NCegJR0VMc3vYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DCE5803D4A;
 Thu, 20 Oct 2022 22:07:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD9B20290A5;
 Thu, 20 Oct 2022 22:07:32 +0000 (UTC)
Date: Thu, 20 Oct 2022 23:07:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>
Subject: Re: MultiFD and default channel out of order mapping on receive side.
Message-ID: <Y1HGgwe/tcJ80pM/@redhat.com>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
 <Y00+tsrBs2m2CH6R@redhat.com> <Y03F97gmi7N4cyMM@x1n>
 <Y05hVC7AXdc0Ak4z@redhat.com> <Y069YMtwwOrmI6lM@x1n>
 <Y08T+DZQXh/89O/g@x1n>
 <4c1e4137-a686-427c-df3e-22f299a39478@nutanix.com>
 <Y1F4BgFskXizW2za@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y1F4BgFskXizW2za@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 12:32:06PM -0400, Peter Xu wrote:
> On Thu, Oct 20, 2022 at 08:14:19PM +0530, manish.mishra wrote:
> > I had one concern, during recover we do not send any magic. As of now we
>   do not support multifd with postcopy so it should be fine, we can do
>   explict checking for non-recovery case. But i remember from some
>   discussion in future there may be support for multiFD with postcopy or
>   have multiple postcopy preempt channels too, then proper handshake will
>   be required? So at some point we want to take that path? For now i agree
>   approach 1 will be good as suggested by Daniel it can be backported
>   easily to older qemu's too.
> 
> Yes for the long run I think we should provide a generic solution for all
> the channels to be established for migration purpose.
> 
> Not to mention that as I replied previously to my original email, the trick
> won't easily work with dest QEMU where we need further change to allow qemu
> to accept new channels during loading of the VM.
> 
> Considering the complexity that it'll take just to resolve the prempt
> channel ordering, I think maybe it's cleaner we just look for the long term
> goal.

I think we should just ignore the preempt channel. Lets just do the
easy bit and fix the main vs multifd channel mixup, as that's the one
that is definitely actively hitting people today. We can solve that as
a quick win in a way that is easy to backport to existing releases of
QEMU for those affected.

Separately from that, lets define a clean slate migration protocol to
solve many of our historic problems and mistakes that can't be dealt
with through retrofitting, not limited to just this ordering mistake.

We had a significant discussion about it at the start of the year
in this thread, which I think we should take forward and write into
a formal protocol spec.

  https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03655.html


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


