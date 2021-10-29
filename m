Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88F4403FB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:24:17 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYQB-0004Wo-Ct
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgXtj-0000Ds-Sn
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgXth-0001UW-1l
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635537040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1IuQ6Flrp2/vhbVQZ7uLl1ISL2N9ShBDT9/PWYk6YAc=;
 b=H/S1XYve41hsBypHiTaJWW0VHFQ+RkkIFuXTH9DJ7RchW8IrZehzO818teYeF52kL/LEHZ
 VTqSfdX6/yhU4Lu6I7tC9b0iHsMMd0EQQU/zZNj4j9xkRStGwwv05FpY1estJMJkisY9LZ
 vRiZ2wmCbVHVYgnC1I5J/o9xyIVdX1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104--PqofFJpOEi09KZkJkuc5w-1; Fri, 29 Oct 2021 15:50:34 -0400
X-MC-Unique: -PqofFJpOEi09KZkJkuc5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0631006AA8;
 Fri, 29 Oct 2021 19:50:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D132C60CA1;
 Fri, 29 Oct 2021 19:50:02 +0000 (UTC)
Date: Fri, 29 Oct 2021 14:50:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v6 1/5] monitor/hmp: add support for flag argument with
 value
Message-ID: <20211029195000.mjzlzvcjgzx5dulp@redhat.com>
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
 <20211020135500.2384930-2-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20211020135500.2384930-2-s.reiter@proxmox.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 03:54:56PM +0200, Stefan Reiter wrote:
> Adds support for the "-xV" parameter type, where "-x" denotes a flag
> name and the "V" suffix indicates that this flag is supposed to take an
> arbitrary string parameter.
> 
> These parameters are always optional, the entry in the qdict will be
> omitted if the flag is not given.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
> 
> v6:
> It wasn't possible to pass the 'connected' parameter to set_password, since the
> code to handle optional parameters couldn't live with a different param (not
> starting with '-') coming up instead - fix that by advancing over the 'value
> flag' modifier in case `*p != '-'`.
> 
> Also change the modifier to 'V' instead of 'S' so it can be distinguished from
> an actual trailing 'S' type param.
> 
> Discovered in testing. I dropped Eric's R-b due to the code change.

Good that you caught it, and correct in dropping my earlier R-b.  But
now that I've read this version:

> +++ b/monitor/monitor-internal.h
> @@ -63,7 +63,8 @@
>   * '.'          other form of optional type (for 'i' and 'l')
>   * 'b'          boolean
>   *              user mode accepts "on" or "off"
> - * '-'          optional parameter (eg. '-f')
> + * '-'          optional parameter (eg. '-f'); if followed by an 'V', it

s/an/a/

> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
>   *

With the typo fix,
Reviewed-by: Eric Blake <eblake@redhat.com>

[Hmm, I see that you posted v7 in the meantime, and it still has the
typo, but I already typed this mail]

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


