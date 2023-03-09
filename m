Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BE6B22FA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEQT-0000Gb-LG; Thu, 09 Mar 2023 06:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1paEQS-0000Es-6z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1paEQQ-0003NV-TK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NweXCai3D9fC7VKDrwRq6qLK3V8Z0L3HiXwrI+4REjQ=;
 b=I9ImXHFHbdmsln8iwRlZFFCjTl1OX7ss16xR2Gtg4Mb8ukLwUFcD4YdEuntk6YARnfMpWD
 yxEqz2fnTlK4bxT9f/GM9wdmb/KMSwEcvAwRA+SWctsT01oZUfk7bGG9jtPMZi7/0z9EQF
 j1XjCHVVJQONe+7ar0McKn3NDmQ4b2g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-tvoRFtBpM--OzeyhJmdd9A-1; Thu, 09 Mar 2023 06:27:06 -0500
X-MC-Unique: tvoRFtBpM--OzeyhJmdd9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC777380610B;
 Thu,  9 Mar 2023 11:27:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 851A7440DD;
 Thu,  9 Mar 2023 11:27:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E31341800082; Thu,  9 Mar 2023 12:27:03 +0100 (CET)
Date: Thu, 9 Mar 2023 12:27:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>, xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] Re: [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <20230309112703.dht7yisk7on3sfwg@sirius.home.kraxel.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
 <Y9scWQ/ASMCrY/uM@morn>
 <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
 <20230202091031.xmnao56wziptjak2@sirius.home.kraxel.org>
 <0f25af10f21de2a36f4748f20d457dca5bce1f64.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f25af10f21de2a36f4748f20d457dca5bce1f64.camel@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 08:42:18AM +0000, David Woodhouse wrote:
> On Thu, 2023-02-02 at 10:10 +0100, Gerd Hoffmann wrote:
> > > Thanks, Kevin.
> > > 
> > > I'd like to get the rest of the Xen platform support in to qemu 8.0
> > > if
> > > possible. Which is currently scheduled for March.
> > > 
> > > Is there likely to be a SeaBIOS release before then which Gerd
> > > would
> > > pull into qemu anyway, or should I submit a submodule update to a
> > > snapshot of today's tree? That would just pull in this commit, and
> > > the
> > > one other fix that's in the SeaBIOS tree since 1.16.1?
> > 
> > Tagging 1.16.2 in time for the qemu 8.0 should not be a problem given
> > that we have only bugfixes in master.  Roughly around soft freeze is
> > probably a good time for that.
> 
> That's, erm, at the *end* of today 2023-03-07, and the freeze happens
> only *after* Paul has reviewed the phase 2 Xen PV back end support,
> right?

Ok, we have as of today two changes:

  kraxel@sirius ~/projects/seabios (master)# git log --oneline rel-1.16.1..
  ea1b7a073390 xen: require Xen info structure at 0x1000 to detect Xen
  645a64b4911d usb: fix wrong init of keyboard/mouse's if first interface is not boot protocol

With no changes since January and no known issues.
I think we can safely tag the current state as 1.16.2.

I'll do that next monday (plus qemu pull request) unless
there are objections until then.

take care,
  Gerd


