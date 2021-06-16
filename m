Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF63AA2C4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:59:21 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZot-0003Yt-QK
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltZnz-0002Wm-1o
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltZnt-00070L-1E
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623866295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0NAZbQGuAMceoRXLEHtquzkdgrqlIMVEUMy9bJ3yY0s=;
 b=QYbvYEAUE43U4MmKrX033a6USoD2NDleDgQ7YNuUqKLLFKq2C8nIFxGG5XXs6aS3HRHHPB
 HPMoTja6djcz0EV2z4qUNtt/UtVjyBtC2kJphKYQt1fGWbaTdhA8T9SerRiDe/yYfsY5Ul
 A8SCrjyG+MpIsREleKvpFuJh/PCPbGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-K5eg_bTCMYix2L0IPUy3lQ-1; Wed, 16 Jun 2021 13:58:12 -0400
X-MC-Unique: K5eg_bTCMYix2L0IPUy3lQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881041006907;
 Wed, 16 Jun 2021 17:58:10 +0000 (UTC)
Received: from redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBBAC5D6BA;
 Wed, 16 Jun 2021 17:58:09 +0000 (UTC)
Date: Wed, 16 Jun 2021 12:58:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/2] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
Message-ID: <20210616175808.womwau3ajjrqwx6g@redhat.com>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-3-danielhb413@gmail.com>
 <87y2bgppan.fsf@dusky.pond.sub.org>
 <b24b965b-6e85-63b1-3bf1-2dc9418ec90a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b24b965b-6e85-63b1-3bf1-2dc9418ec90a@gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 01:58:04PM -0300, Daniel Henrique Barboza wrote:
> > Incompatible change: we now emit DEVICE_UNPLUG_ERROR instead of
> > MEM_UNPLUG_ERROR.  Intentional?
> > 
> > If yes, we need a release note.
> > 
> > To avoid the incompatible, we can emit both, and deprecate
> > MEM_UNPLUG_ERROR.
> > 
> > What about the MEM_UNPLUG_ERROR in acpi_memory_hotplug_write()?
> 
> I'll emit DEVICE_UNPLUG_ERROR together with all MEM_UNPLUG_ERROR instances.
> Then we can deprecate MEM_UNPLUG_ERROR.
> 
> By the way, how do I mark MEM_UNPLUG_ERROR as deprecated? I see examples
> of command line options being documented as deprecated in
> docs/system/deprecated.rst and some deprecated QOM/QDEV properties are
> marked as deprecated directly in their .json files, but I didn't find
> any case where a whole event is deprecated. Would something like this be
> adequate?

Almost.  That documents the deprecation for readers, but you also need
to mark it for viewing by machine code...

> 
> 
> $ git diff
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 58a9c86b36..ce3d873c64 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1261,6 +1261,10 @@
>  #
>  # @msg: Informative message
>  #
> +#
> +# @deprecated: Starting in 6.1 this event has been replaced by
> +#              DEVICE_UNPLUG_ERROR.
> +#
>  # Since: 2.4
>  #
>  # Example:

...do that by adding 'features':['deprecated'] to the QAPI event
definition.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


