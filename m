Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EF4A4C3D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:34:42 +0100 (CET)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZdZ-00046I-HW
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEZI7-0005yI-J9
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEZI5-0006ks-6I
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643645547;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HsETV6wdrZlAwhTV+Bys2hOYcqZq8TRx4wvaXH/FXE=;
 b=NGgalrP/I0S/YYc88EXb50buS/C6Wsgz5ytdxj5vCbzhk+op+kfls5iK7jAHcKx6TxTsXg
 dD2Z1i6P+K6mOG+MbBOjXa77Dn6DKnhkwfY2OwbVauZfXon2bW7I4GMBQQ5xxIMAjgi2pL
 Jlv649k+jCBQ7dgj5+xjBI0GiIiiFi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-Fif9ANSnP0CZJBIRBKNNZQ-1; Mon, 31 Jan 2022 11:12:24 -0500
X-MC-Unique: Fif9ANSnP0CZJBIRBKNNZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 463131083F6C;
 Mon, 31 Jan 2022 16:12:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D723798C5;
 Mon, 31 Jan 2022 16:11:52 +0000 (UTC)
Date: Mon, 31 Jan 2022 16:11:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Message-ID: <YfgKRefM8yRXejLu@redhat.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87ee4x8cpc.fsf@dusky.pond.sub.org> <YfASE9EieKWM7fEt@redhat.com>
 <562b90ea-3cf1-d59f-7fe9-7e4a57e996f6@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <562b90ea-3cf1-d59f-7fe9-7e4a57e996f6@proxmox.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 10:45:08AM +0100, Fabian Ebner wrote:
> Am 25.01.22 um 16:06 schrieb Daniel P. Berrangé:
> > On Mon, Jan 24, 2022 at 02:50:39PM +0100, Markus Armbruster wrote:
> >> Stefan Reiter <s.reiter@proxmox.com> writes:
> >>
> >>> Since the removal of the generic 'qmp_change' command, one can no longer replace
> >>> the 'default' VNC display listen address at runtime (AFAIK). For our users who
> >>> need to set up a secondary VNC access port, this means configuring a second VNC
> >>> display (in addition to our standard one for web-access), but it turns out one
> >>> cannot set a password on this second display at the moment, as the
> >>> 'set_password' call only operates on the 'default' display.
> >>>
> >>> Additionally, using secret objects, the password is only read once at startup.
> >>> This could be considered a bug too, but is not touched in this series and left
> >>> for a later date.
> >>
> >> Related: Vladimir recently posted a patch to add a new command for
> >> changing VNC server listening addresses.  Daniel asked him to work it
> >> into display-reload instead[1].  Vladimir complied[2].
> >>
> >> Daniel, what do you think about this one?  Should it also use
> >> display-reload?
> > 
> > I'd ultimately intend to deprecate & remove the direct setting of
> > passwords on the CLI, and exclusively rely on the 'secret' object
> > for passing in passwords. With this in mind, I'd not be enthusiastic
> > about adding new commands for changing passwords in QMP directly,
> > rather I think we should have a way to change the 'secret' object
> > in use.
> > 
> 
> How should I proceed with this series then? Does adding the new argument
> for the display ID count as "adding new commands"?

Ok, so I've gone back and properly read the series. Since you're simply
extending existing commands with new arguments I've no objection to
carrying on with this approach.

We should still aim to have a general purpose command for live config
changes, but that shouldn't be considered a blocker for you series
here, as your series isn't making the existing situation worse.

> If what I should do is switching to only using secret objects, would the
> plan be something like the following?
> 
> 1. Add an option to display-reload for switching the display's
> password-secret while adding SPICE as a valid display type.
> 2. Also include the set password action (i.e. disconnect/fail/keep) and
> expiration time as part of that option.
> 3. Extend display-reload to also take an optional display ID for VNC.
> 4. Deprecate expire_password and set_password.

I've realized that we shouldn't overload display-reload for dual purposes.

We have two distinct usage scenarios that are meaningul

 - Re-loading the value of the existing secret
 - Changing which secret is used

The 'display-reload' command is reasonable for the first.

We should have a 'display-update' command for the second.

Either way, I don't think this series should be blocked on this since
it is merely modifying an existing command.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


