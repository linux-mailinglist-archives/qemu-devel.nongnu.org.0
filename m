Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E73216AA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:30:08 +0100 (CET)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEALo-0003om-0E
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEAAa-00037q-HA
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEAAX-0000zo-9B
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613996308;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yJz/pKvrcDJRyYtpKkcojVeoZTBiSt0bJsgPsASKzW0=;
 b=T6rR5bIQuNiGfTEabVo+2SRTiUEndCijenD2pWXeCvrU1kDGRt+ZfIHD26il6RiTJNlSKD
 7PKx4h3vm8veKQXenrL0snazQ1w1aeq0xRePs1fzfO6wCBKbAlScy5UUmWElJAbCYWXthw
 kGFucpk7ry/TvU3mEMvIDQY2j9Elg+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-ogHZcgHnOtiGUbLCSYaj9A-1; Mon, 22 Feb 2021 07:18:23 -0500
X-MC-Unique: ogHZcgHnOtiGUbLCSYaj9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFC66DF8A5;
 Mon, 22 Feb 2021 12:18:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42F1E19C79;
 Mon, 22 Feb 2021 12:18:18 +0000 (UTC)
Date: Mon, 22 Feb 2021 12:18:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: Interactive launch over QMP socket?
Message-ID: <YDOhB4Db5xg52Zgv@redhat.com>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: jejb@linux.ibm.com, npmccallum@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 12:01:09PM -0600, Connor Kuehl wrote:
> Hello,
> 
> Does QEMU have an internal API which would allow VM construction to wait at
> a *very specific point* until specific data/QMP message(s) are supplied via
> the QMP socket?
> 
> For some additional context: QEMU supports launching AMD SEV-protected
> guests; in short: encrypted virtual machines. Guest owners may participate
> in attestation to cryptographically verify their assumptions about the
> guest's initial state, the host's platform, and the host platform owner's
> identity. If the guest owner is satisfied with the attestation process, a
> secret can be safely injected into the guest's address space over a secure
> channel.
> 
> Attestation is an unavoidably interactive process.
> 
> It appears that QEMU already exposes most of the API required to perform
> this attestation remotely with a guest owner over QMP, with only one
> exception: starting the attestation session. It looks like the session
> components (policy, session-file, and dh-cert-file) are supplied via command
> line arguments to QEMU and don't have a message type in the QMP spec:
> 
> 	-object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x1,session-file=blah.session,dh-cert-file=guest_owner.cert
> 
> I would like to add a message type to QMP which allows guest owners to
> supply this data over a socket and _not_ require these components a priori
> via command line arguments. In doing so, this would allow for a 100% remote
> attestation process over the socket. However, I'm not sure how to express
> this interactive "waiting" for this data to become available with internal
> APIs (assuming it's not supplied as a command line argument).
> 
> For example, in order to accomplish a 100% remote attestation:
> 
> Somewhere in between sev_guest_init() and sev_launch_start(), the guest
> owner may send the following messages:
> 
> 1. "query-sev" to collect important information about the platform state
> 
> 2. "query-sev-capabilities" to independently verify the platform certificate
> chain and derive a shared secret for establishing a secure channel with the
> AMD SP.

AFAIK, these two commands are merely fetching info about the host, and the
info doesn't vary based on guest config. IOW, this can be done before the
real guest QEMU process is launched, using a throwaway QEMU instance....

> 3. "sev-launch-start" this is the only message that I think is missing from
> the QMP message types for remote attestation. This is how the guest owner
> would deliver the session components over the socket instead of as command
> line arguments.

... so this doesn't actually seem to need to be done in QMP on the fly.
It can be provided on the CLI, which seems to be possible wth the args
shown earlier.

> Then, sometime before the VM is launched and is running, the guest owner may
> send:
> 
> 4. "query-sev-launch-measure" to compare its measurement against the AMD
> SP's measurement
> 
> 5. "sev-inject-launch-secret" if happy with attestation, securely deliver
> secrets
> 
> 6. Guest owner could send a "cont" command and the VM can launch
> 
> Any advice on how to accomplish adding this degree of interaction to
> supplying inputs to specific parts of the launch process this is greatly
> appreciated.

It seems like this is all doable already unless I'm missing something.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


