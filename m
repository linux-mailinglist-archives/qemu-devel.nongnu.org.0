Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02A6A5E4A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3sd-0006QL-JR; Tue, 28 Feb 2023 12:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX3sa-0006FM-QT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:35:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX3sY-0000Uk-Kq
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677605705;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0VLBxERkgcWvszYK+YGYsRiugWgfQ/G4CvC+/UmPOBQ=;
 b=LvuClfyf96feN8NVkH4mpHYaRDvwqyVQQDojEuErIWkBTVNzNlPLHWWLM0AXDK4WP3nE0k
 WmgMYBwsk6tw/uWu23PiZpbGyTHVeMzapCSa39dB/ox31TokMI/sCGerXkGyMVT7SaONXZ
 HM5SsgkamlZQ0kLrDSVf0Ifgeq3iDEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-Qc9-aeVbMSyQx_QlfLwaEg-1; Tue, 28 Feb 2023 12:35:03 -0500
X-MC-Unique: Qc9-aeVbMSyQx_QlfLwaEg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 821E3882838;
 Tue, 28 Feb 2023 17:35:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C19EF492B12;
 Tue, 28 Feb 2023 17:34:59 +0000 (UTC)
Date: Tue, 28 Feb 2023 17:34:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH][RESEND v3 3/3] Add a Hyper-V Dynamic Memory Protocol
 driver (hv-balloon)
Message-ID: <Y/47QC6F/bPNgFOx@redhat.com>
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <4c4fe768b5457f8e6c17dcea7656cbe017c9a4df.1677274611.git.maciej.szmigiero@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c4fe768b5457f8e6c17dcea7656cbe017c9a4df.1677274611.git.maciej.szmigiero@oracle.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Fri, Feb 24, 2023 at 10:41:16PM +0100, Maciej S. Szmigiero wrote:

> Hot-adding additional memory is done by creating a new memory backend (for
> example by executing HMP command
> "object_add memory-backend-ram,id=mem1,size=4G"), then executing a new
> "hv-balloon-add-memory" QMP command, providing the id of that memory
> backend as the "id" parameter.

[snip]

> After a VM reboot each previously hot-added memory backend gets released.
> A "HV_BALLOON_MEMORY_BACKEND_UNUSED" QMP event is emitted in this case so
> the software controlling QEMU knows that it either needs to delete that
> memory backend (if no longer needed) or re-insert it.

IIUC you're saying that the 'hv-balloon-add-memory' command needs
to be re-run after a guest reset ? If so I feel that is a rather
undesirable job to punt over the mgmt app. The 'reset' event can
be missed if the mgmt app happend to be restarting and reconnecting
to existing running QMP console.

> In the future, the guest boot memory size might be changed on reboot
> instead, taking into account the effective size that VM had before that
> reboot (much like Hyper-V does).

Is that difficult to do right now ?  It isn't too nice to make the
mgmt apps implement the workaround now if we're going to make it
redundant later.

> The above design results in much better ballooning performance than when
> using virtio-balloon with the same guest: 230 GB / minute with this driver
> versus 70 GB / minute with virtio-balloon.

snip

> The unballoon operation is also pretty much instantaneous:
> thanks to the merging of the ballooned out page ranges 200 GB of memory can
> be returned to the guest in about 1 second.
> With virtio-balloon this operation takes about 2.5 minutes.

That's pretty impressive !

> These tests were done against a Windows Server 2019 guest running on a
> Xeon E5-2699, after dirtying the whole memory inside guest before each
> balloon operation.



> Since the required GTree operations aren't present in every Glib version
> a check for them was added to "configure" script, together with new
> "--enable-hv-balloon" and "--disable-hv-balloon" arguments.
> If these GTree operations are missing in the system's Glib version this
> driver will be skipped during QEMU build.

Funnily enough there's a patch posted recently that imports the glib
GTree impl into QEMU calling it QTree. This was to workaround a problem
with GSlice not being async signal safe, but if we take that patch, then
you wouldn't need to skip the build you could rely on this in-tree copy
instead.

https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg01225.html


> diff --git a/qapi/machine.json b/qapi/machine.json
> index b9228a5e46..04ff95337a 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1104,6 +1104,74 @@
>  { 'event': 'BALLOON_CHANGE',
>    'data': { 'actual': 'int' } }
>  
> +##
> +# @hv-balloon-add-memory:
> +#
> +# Hot-add memory backend via Hyper-V Dynamic Memory Protocol.
> +#
> +# @id: the name of the memory backend object to hot-add
> +#
> +# Returns: Nothing on success
> +#          Error if there's no guest connected with hot-add capability,
> +#          @id is not a valid memory backend or it's already in use.
> +#
> +# Since: TBD
> +#
> +# Example:
> +#
> +# -> { "execute": "hv-balloon-add-memory", "arguments": { "id": "mb1" } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'hv-balloon-add-memory', 'data': {'id': 'str'} }
> +
> +##
> +# @HV_BALLOON_STATUS_REPORT:
> +#
> +# Emitted when the hv-balloon driver receives a "STATUS" message from
> +# the guest.
> +#
> +# @commited: the amount of memory in use inside the guest plus the amount
> +#            of the memory unusable inside the guest (ballooned out,
> +#            offline, etc.)
> +#
> +# @available: the amount of the memory inside the guest available for new
> +#             allocations ("free")
> +#
> +# Since: TBD
> +#
> +# Example:
> +#
> +# <- { "event": "HV_BALLOON_STATUS_REPORT",
> +#      "data": { "commited": 816640000, "available": 3333054464 },
> +#      "timestamp": { "seconds": 1600295492, "microseconds": 661044 } }
> +#
> +##
> +{ 'event': 'HV_BALLOON_STATUS_REPORT',
> +  'data': { 'commited': 'size', 'available': 'size' } }
> +
> +##
> +# @HV_BALLOON_MEMORY_BACKEND_UNUSED:
> +#
> +# Emitted when the hv-balloon driver marks a memory backend object
> +# unused so it can now be removed, if required.
> +#
> +# This can happen because the VM was restarted.
> +#
> +# @id: the memory backend object id
> +#
> +# Since: TBD
> +#
> +# Example:
> +#
> +# <- { "event": "HV_BALLOON_MEMORY_BACKEND_UNUSED",
> +#      "data": { "id": "mb1" },
> +#      "timestamp": { "seconds": 1600295492, "microseconds": 661044 } }
> +#
> +##
> +{ 'event': 'HV_BALLOON_MEMORY_BACKEND_UNUSED',
> +  'data': { 'id': 'str' } }

There is a reply from Igor about possibility of sharing code with
virtio-mem. I also wonder if there's any scope for sharing with
the virtio-balloon driver too, in terms of the QAPI schema.

I've not looked closely enough to say if its possible to not, so
if not practical, no worries.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


