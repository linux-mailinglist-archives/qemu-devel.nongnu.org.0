Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E22DAA8A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:01:08 +0100 (CET)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp78j-0001ML-VO
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp77W-0000nu-4V
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 04:59:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp77P-000561-LI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 04:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608026382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSYkDQpWvdJf14y4fCWFOy8xlC3DCxG2bYQwrNm/2FI=;
 b=VMmvXwOftyesiqw8Afl1mGghtbz3aXzbwYF0AFnTQ7EWCfcOH/Ruxf7XLV0usjXJzxVRH8
 xZQ6m4fo+ZlgjOE/tgc8JgtyMQcQzeWiawGaHlai2/iBU1CGSY4o0kyIwvUv8Tk9yWZxVS
 rCSMuect9eULlKS/fmuVmJaVVDyJ7GA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-Utws2sZ6MrmBAyLpGKFv4A-1; Tue, 15 Dec 2020 04:59:40 -0500
X-MC-Unique: Utws2sZ6MrmBAyLpGKFv4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04AE01934109
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:59:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED63660C0F;
 Tue, 15 Dec 2020 09:59:35 +0000 (UTC)
Date: Tue, 15 Dec 2020 09:59:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui: add support for remote power control to VNC server
Message-ID: <20201215095931.GE121272@redhat.com>
References: <20201211160825.102679-1-berrange@redhat.com>
 <20201214110507.kwz74f4kwfofb7x7@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201214110507.kwz74f4kwfofb7x7@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 12:05:07PM +0100, Gerd Hoffmann wrote:
> On Fri, Dec 11, 2020 at 04:08:25PM +0000, Daniel P. Berrangé wrote:
> > The "XVP" (Xen VNC Proxy) extension defines a mechanism for a VNC client
> > to issue power control requests to trigger graceful shutdown, reboot, or
> > hard reset.
> 
> Looks good.  Any other clients are supporting this?

AFAIK, it has only been implmeneted in the Xen VNC Proxy's own Java
client. The extension is documented in rfbproto.rst and is trivial
though, so I've now implemented the corresponding client side in
GTK-VNC too.

> 
> > +            case VNC_XVP_ACTION_REBOOT:
> > +                send_xvp_message(vs, VNC_XVP_CODE_FAIL);
> > +                break;
> 
> > +            default:
> > +                send_xvp_message(vs, VNC_XVP_CODE_FAIL);
> > +                break;
> 
> Minor nit:
> 
> These two are identical, so you can drop the first.
> 
> take care,
>   Gerd
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


