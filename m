Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7A4DAE81
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:51:57 +0100 (CET)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURG0-0001px-NE
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:51:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUQRT-00014t-UF
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUQRR-0000AN-JR
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ky4QD0c7g31WBKaQtrROjr2wTZ+EbiRmdIWdpVD8/nc=;
 b=BXlI+wS22Z+bWuXEDAuFcpR7DVEreCaDG8hFSolW8TPqXHdHBVmbO8Y06+NH2dLn3rVNGE
 4Bo6UC3321Zpn5Q7EOyIMcOhyNbA60G2BoGtxdGyZlSYbPECy5GYTPVoSGdzTFbx99Gcai
 yR/Wc+Wqd7KCCbPfr+UMKfMyKe9kpZQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-LqlcqhmkMXmDcr8HZ-8_GQ-1; Wed, 16 Mar 2022 05:59:33 -0400
X-MC-Unique: LqlcqhmkMXmDcr8HZ-8_GQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94101C05B0C
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:59:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A05434850;
 Wed, 16 Mar 2022 09:59:31 +0000 (UTC)
Date: Wed, 16 Mar 2022 09:59:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjG1AGhai1QvDdrd@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
 <YjAul3GIWmB3+v0P@xz-m1.local> <YjB1XXzIsJWtSR4E@redhat.com>
 <YjFZ84Wdz6jpSekr@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YjFZ84Wdz6jpSekr@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 11:30:59AM +0800, Peter Xu wrote:
> On Tue, Mar 15, 2022 at 11:15:41AM +0000, Daniel P. Berrangé wrote:
> > > I still remember you mentioned the upper layer softwares can have
> > > assumption on using only 1 pair of socket for migration, I think that makes
> > > postcopy-preempt by default impossible.
> > > 
> > > Why multifd is different here?
> > 
> > It isn't different. We went through the pain to extending libvirt
> > to know how to open many channels for multifd. We'll have todo
> > the same with this postcopy-pre-empt. To this day though, management
> > apps above libvirt largely don't enable multifd, which is a real
> > shame. This is the key reason I think we need to handle this at
> > the QEMU level automatically.
> 
> But I still don't undertand how QEMU could know about those tunnels, which
> should be beyond QEMU's awareness?
> 
> The tunneling program can be some admin initiated socat tcp forwarding
> programs, which by default may not allow >1 socket pairs.
> 
> Or maybe I have mis-understood on what's the tunneling we're discussing?

I dont think I was talking about tunneling at all, just QEMU
migration protocol options !

If an app is tunnelling QEMU's migration protocol over some
channel, that isn't important to QEMU - regardless whether a
passed in 'fd:' protocol FD is a direct TCP socket, or a
UNIX socket for a tunnel, QEMU works the same way. In one
of my other replies I mention a way to make 'fd:' work with
an arbitrary number of channels, by using an event from QEMU
to request the app provide additional FDs.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


