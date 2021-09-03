Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8011D40057C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:05:34 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEVJ-0008Vl-9i
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMESo-0006oS-1T
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMESj-0004oJ-2J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630695761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83MWl93Zctky6jaAKIQHmkV65QjejM6HFIOHSaBL8AI=;
 b=bDzNFQFyWyZ39F4iOpmC41jb3kkLqHoc79WKHmyWLg4zA/9WsITWuz6+uYIt8Zbr3NVWwT
 Kq7lrf6pepPZtSUgrOvV6AY546kES4aVuvh3uCMyidfhc4cZq5o/w3R6+BuJJQpjq0LvEJ
 XjMGG39gaJo2IJJ+BxLLPm8wTYhnWMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-Ax07aP8vN_-NaY2Xbs9Ujg-1; Fri, 03 Sep 2021 15:02:35 -0400
X-MC-Unique: Ax07aP8vN_-NaY2Xbs9Ujg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E32CC622;
 Fri,  3 Sep 2021 19:02:32 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FC0053E08;
 Fri,  3 Sep 2021 19:02:23 +0000 (UTC)
Date: Fri, 3 Sep 2021 14:02:21 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v2 3/3] monitor: allow VNC related QMP and HMP commands
 to take a display ID
Message-ID: <20210903190221.6hik7knycpj6xeqs@redhat.com>
References: <20210901151748.1712048-1-s.reiter@proxmox.com>
 <20210901151748.1712048-4-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210901151748.1712048-4-s.reiter@proxmox.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

On Wed, Sep 01, 2021 at 05:17:48PM +0200, Stefan Reiter wrote:
> It is possible to specify more than one VNC server on the command line,
> either with an explicit ID or the auto-generated ones à la "default",
> "vnc2", "vnc3", ...
> 
> It is not possible to change the password on one of these extra VNC
> displays though. Fix this by adding a "display" parameter to the
> "set_password" and "expire_password" QMP and HMP commands.
> 
> For HMP, the display is specified using the "-d" value flag.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---

QMP review:

> +++ b/qapi/ui.json
> @@ -25,6 +25,9 @@
>  #             'disconnect' to disconnect existing clients
>  #             'keep' to maintain existing clients
>  #
> +# @display: In case of VNC, the id of the display where the password
> +#           should be changed. Defaults to the first.
> +#
>  # Returns: - Nothing on success
>  #          - If Spice is not enabled, DeviceNotFound
>  #
> @@ -38,7 +41,8 @@
>  #
>  ##
>  { 'command': 'set_password',
> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
> +  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str',

Pre-existing, but given the documentation that protocol is either
'vnc' or 'spice', this feels like set_password should take a
discriminated union type with 'protocol' as an enum type,...

> +           '*display': 'str'} }

...so that you only add the optional 'display' member to 'vnc'.  This
would keep the status quo of rejecting it as invalid when protocol is
'spice', and make it easier to introspect that no other protocols are
supported.

Markus may have better advice on whether cleaning this up is worth it.

>  
>  ##
>  # @expire_password:
> @@ -54,6 +58,9 @@
>  #        - '+INT' where INT is the number of seconds from now (integer)
>  #        - 'INT' where INT is the absolute time in seconds
>  #
> +# @display: In case of VNC, the id of the display where the password
> +#           should be set to expire. Defaults to the first.
> +#
>  # Returns: - Nothing on success
>  #          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
>  #
> @@ -71,7 +78,8 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
> +{ 'command': 'expire_password',
> +  'data': {'protocol': 'str', 'time': 'str', '*display': 'str'} }

This would benefit from the same treatment, if we decide to use a QAPI
enum type and discriminated union.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


