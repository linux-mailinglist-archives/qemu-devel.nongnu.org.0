Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D555CF56
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:06:22 +0200 (CEST)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Av7-0005WN-Tm
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Arg-0003wE-1E
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Arc-0006SS-Q5
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421363;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xT8ba9mfzS6ObjqrACPXdd1Pm/GLY/pCDlxBFDRFBo0=;
 b=XyXIkC3/6UU9d7qxhrlTAU1BGjmBq2jVpLk9Iev1wJ8blheTl0mAHMXtvfdXWkFnShucYM
 JhSN/QHvzzX3xZ2X/qliagLVvv14k3KSPPW6PRfQG0ihsvcEmWoDPraCIRh3ld1q6/69/E
 Hn27SQjwRcJ0p0/4crtaNJxkdxKTFpY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-kwssVDOzPQuO_cKaK_QbSQ-1; Tue, 28 Jun 2022 09:02:41 -0400
X-MC-Unique: kwssVDOzPQuO_cKaK_QbSQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EC293C0D842
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 13:02:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B13492C3B;
 Tue, 28 Jun 2022 13:02:39 +0000 (UTC)
Date: Tue, 28 Jun 2022 14:02:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <Yrr77NfKtKcXTVCr@redhat.com>
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
 <YrqzhFAePnnEl8A8@redhat.com>
 <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
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

On Tue, Jun 28, 2022 at 09:32:04AM -0300, Leonardo Bras Soares Passos wrote:
> On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > > Some errors, like the lack of Scatter-Gather support by the network
> > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> > > zero-copy, which causes it to fall back to the default copying mechanism.
> >
> > How common is this lack of SG support ? What NICs did you have that
> > were affected ?
> 
> I am not aware of any NIC without SG available for testing, nor have
> any idea on how common they are.
> But since we can detect sendmsg() falling back to copying we should
> warn the user if this ever happens.
> 
> There is also a case in IPv6 related to fragmentation that may cause
> MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
> covered.
> 
> >
> > > After each full dirty-bitmap scan there should be a zero-copy flush
> > > happening, which checks for errors each of the previous calls to
> > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > > warn the user about it.
> > >
> > > Since it happens once each full dirty-bitmap scan, even in worst case
> > > scenario it should not print a lot of warnings, and will allow tracking
> > > how many dirty-bitmap iterations were not able to use zero-copy send.
> >
> > For long running migrations which are not converging, or converging
> > very slowly there could be 100's of passes.
> >
> 
> I could change it so it only warns once, if that is too much output.

Well I'm mostly wondering what we're expecting the user todo with this
information. Generally a log file containing warnings ends up turning
into a bug report. If we think it is important for users and/or mgmt
apps to be aware of this info, then it might be better to actually
put a field in the query-migrate stats to report if zero-copy is
being honoured or not, and just have a trace point in this location
instead.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


