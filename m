Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DE64C87C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 12:56:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5QMA-0002CZ-DU; Wed, 14 Dec 2022 06:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5QM4-0002B2-L6
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5QM0-0002Ui-8V
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671018915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8hcFkED5OYaENrmwLIUiWTeaJl4b81i5geLrTuM9uw=;
 b=fg/cpq5teXySFHGg5hPbd6TLjTKaXvEDFwdTzKnKkr+iSYQmTaXdJluNbfvm6f8VMmfkLq
 lgXjUIumEAEue1tborcb8XxNssCqTK7zxETmaCdNZCUlHyqqkiSLhiyB79VlVoFUmEpQ1Y
 47xghHg5CMy4Rx9fJF5DDt70/AuhWY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-nBP3rGnqPhuiD1kT_6g5zA-1; Wed, 14 Dec 2022 06:55:12 -0500
X-MC-Unique: nBP3rGnqPhuiD1kT_6g5zA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08E1F811E6E;
 Wed, 14 Dec 2022 11:55:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1416079A1;
 Wed, 14 Dec 2022 11:55:10 +0000 (UTC)
Date: Wed, 14 Dec 2022 11:55:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: jejb@linux.ibm.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] tpm: add backend for mssim
Message-ID: <Y5m5mq5yxQX88UKi@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
 <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
 <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
 <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 12, 2022 at 01:58:29PM -0500, Stefan Berger wrote:
> 
> 
> On 12/12/22 13:48, James Bottomley wrote:
> > On Mon, 2022-12-12 at 11:59 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/12/22 11:38, James Bottomley wrote:
> > > > On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
> > > > > Copy'ing Markus for QAPI design feedback.
> > > > > 
> > > > > On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
> > > > > > The Microsoft Simulator (mssim) is the reference emulation
> > > > > > platform for the TCG TPM 2.0 specification.
> > > > > > 
> > > > > > https://github.com/Microsoft/ms-tpm-20-ref.git
> > > > > > 
> > > > > > It exports a fairly simple network socket baset protocol on two
> > > > > > sockets, one for command (default 2321) and one for control
> > > > > > (default 2322).  This patch adds a simple backend that can
> > > > > > speak the mssim protocol over the network.  It also allows the
> > > > > > host, and two ports to be specified on the qemu command line.
> > > > > > The benefits are twofold: firstly it gives us a backend that
> > > > > > actually speaks a standard TPM emulation protocol instead of
> > > > > > the linux specific TPM driver format of the current emulated
> > > > > > TPM backend and secondly, using the microsoft protocol, the end
> > > > > > point of the emulator can be anywhere on the network,
> > > > > > facilitating the cloud use case where a central TPM service can
> > > > > > be used over a control network.
> > > > > 
> > > > > What's the story with security for this ?  The patch isn't using
> > > > > TLS, so talking to any emulator over anything other than
> > > > > localhost looks insecure, unless I'm missing something.
> > > > 
> > > > Pretty much every TPM application fears interposers and should thus
> > > > be using the TPM transport security anyway. *If* this is the case,
> > > > then the transport is secure.  Note that this currently isn't the
> > > > case for
> > > 
> > > What about all the older kernels that are out there?
> > 
> > No current kernel uses transport security.  In the event the patch
> > eventually gets upstream, the kernel be secure against interposer
> > attacks going forwards.  I would imagine there might be pressure to
> > backport the patch given the current level of worry about interposers.
> > 
> > > > the kernel use of the TPM, but I'm trying to fix that.  The
> > > > standard mssim server is too simplistic to do transport layer
> > > > security, but like everything that does this (or rather doesn't do
> > > > this), you can front it with stunnel4.
> > > 
> > > And who or what is going to set this up?
> > 
> > I'm not sure I understand the question.  Stunnel4 is mostly used to
> > convert unencrypted proxies like imap on 143 or smtp on 25 to the
> > secure version.  Most people who run servers are fairly familiar with
> > using it.  It's what IBM used for encrypted migration initially.  You
> > can run stunnel on both ends, or the qemu side could be built in using
> > the qemu tls-creds way of doing things but anything running the
> > standard MS server would have to front it with stunnel still.
> 
> 
> So it's up to libvirt to setup stunnel to support a completely
> different setup than what it has for swtpm already?

Well technically libvirt doesn't have todo anything. We are free
to decide to only support locally hosted mssim deployments, and
declare that off node access is unsupported and warn it is
potentially insecure .

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


