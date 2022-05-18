Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F552BECD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:42:12 +0200 (CEST)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLoR-0003UD-7R
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLnP-0002gz-DQ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLnN-00077b-9x
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652888464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0/fOBPEYfB4pwXhvmLn8TWHcTA7j3G+o6HIjQ/4lGZg=;
 b=gl/Y1Fz0UAoXIMuM8XG3j06HYI6+KFMI3+uHoQNO44PAyN+TbG17N6Th7osdWpr/vIGmF0
 c8VJLw2G27aRU2XC4x63L0Q4oLrqlAErLZUwDZ9a5xhL2bDj09tbV4pAg9ONL7Z7yxWJI+
 3WwodB7fvtemTLlcaT5+nxQoLHZ0Bw0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-xBlSFp7uPimbj8Z7VUxMlQ-1; Wed, 18 May 2022 11:41:03 -0400
X-MC-Unique: xBlSFp7uPimbj8Z7VUxMlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B37623979683
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 15:41:02 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A162166B26;
 Wed, 18 May 2022 15:41:02 +0000 (UTC)
Date: Wed, 18 May 2022 10:41:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Message-ID: <20220518154100.7yoqrgdsdgnwhepu@redhat.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518134446.211632-3-thuth@redhat.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 18, 2022 at 03:44:45PM +0200, Thomas Huth wrote:
> The "-display sdl" option still uses a hand-crafted parser for its
> parameters since we didn't want to drag an interface we considered
> somewhat flawed into the QAPI schema. Since the flaws are gone now,
> it's time to QAPIfy.
> 
> This introduces the new "DisplaySDL" QAPI struct that is used to hold
> the parameters that are unique to the SDL display. The only specific
> parameter is currently "grab-mod" that is used to specify the required
> modifier keys to escape from the mouse grabbing mode.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

> +++ b/qapi/ui.json
> @@ -1295,6 +1295,30 @@
>        '*swap-opt-cmd': 'bool'
>    } }
>  
> +##
> +# @GrabMod:
> +#
> +# Set of modifier keys that need to be hold for shortcut key actions.

s/hold/held/

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


