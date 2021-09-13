Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089164096A3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:58:51 +0200 (CEST)
Received: from localhost ([::1]:39478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnQ2-0004T9-4O
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPnDH-0003mU-FQ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:45:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPnDE-00052m-Gf
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631544335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRzxsEoYMdikmOQqEZ8KsAkQ+paFcZYvNZrbK+ykTp8=;
 b=HbZzq9OZOx4D/JvQKny/KfwguJE2y6BJCLBNxdIl/JzBp5JITQ53KitEy3zYRcbLaMFU3K
 L+Mif9rrcZjsdnd2RiZBK5VrCYQ1cqKbEYyANNGI6vcIVaYC5jVLktlPNOBNibLVu1g+Yt
 FDuwmPTZnv6zeC4um3q6OC71eKBfAb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-U2Rn2BsaOcWH4f_fsMbEsg-1; Mon, 13 Sep 2021 10:45:24 -0400
X-MC-Unique: U2Rn2BsaOcWH4f_fsMbEsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D7C319200F8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 14:45:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ABEC6D005;
 Mon, 13 Sep 2021 14:45:18 +0000 (UTC)
Date: Mon, 13 Sep 2021 09:45:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 03/22] qapi: Convert simple union KeyValue to flat one
Message-ID: <20210913144516.jzk6naihnedytd6w@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-4-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:13PM +0200, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
> 
> To prepare for their removal, convert simple union KeyValue to an
> equivalent flat one.  Adds some boilerplate to the schema, which is a
> bit ugly, but a lot easier to maintain than the simple union feature.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/ui.json | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index b2cf7a6759..a6b0dce876 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -824,6 +824,30 @@
>              'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
>              'lang1', 'lang2' ] }
>  
> +##
> +# @KeyValueKind:
> +#
> +# Since: 6.1

6.2 now?  Or should this be...

> +
>  ##
>  # @KeyValue:
>  #
> @@ -832,9 +856,11 @@
>  # Since: 1.3

...1.3, since the type has been around by that name already (albeit
implicitly) since that older release?

>  ##
>  { 'union': 'KeyValue',
> +  'base': { 'type': 'KeyValueKind' },
> +  'discriminator': 'type',
>    'data': {
> -    'number': 'int',
> -    'qcode': 'QKeyCode' } }
> +    'number': 'IntWrapper',
> +    'qcode': 'QKeyCodeWrapper' } }
>

I'll trust your decision on the documentation issue; the conversion
itself is sane, so I'm fine with:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


