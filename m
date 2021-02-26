Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A042B3268F9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 21:57:21 +0100 (CET)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFkAq-0000zE-3T
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 15:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFk9C-00009a-9M
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 15:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFk99-0007qH-JD
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 15:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614372933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hhY+mBln8xc98CrPsiWH5T1QwBWbH/YQB4F8YipKfA=;
 b=BeFiujkz32ubocN9+aWF1p4HR2s3/aZKJHVJAxAqLlG1/EVDCieFJQe9gUruSAv+ri5SXM
 9h7xkuiCC+Ws4GJusuTxc+enpxL+LXFWmVn9PqWDF9yYEdnSjYmEKhubAOJX+EAJe5b0qs
 ALKEmc6vYuh5ZnXLtSDd6Lu+ju5wx/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-9W8vAbqsPmOYsaV6fhhD4A-1; Fri, 26 Feb 2021 15:55:31 -0500
X-MC-Unique: 9W8vAbqsPmOYsaV6fhhD4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 628481005501;
 Fri, 26 Feb 2021 20:55:30 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAD35D9D2;
 Fri, 26 Feb 2021 20:55:22 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-18-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 17/31] qapi/qom: Add ObjectOptions for input-*
Message-ID: <5b289a55-6c6f-2529-a21f-19012782229c@redhat.com>
Date: Fri, 26 Feb 2021 14:55:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-18-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the input-* objects.
> 
> ui.json cannot be included in qom.json because the storage daemon can't
> use it, so move GrabToggleKeys to common.json.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/common.json | 12 ++++++++++
>  qapi/qom.json    | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/ui.json     | 13 +----------
>  3 files changed, 71 insertions(+), 12 deletions(-)
> 

> +##
> +# @InputBarrierProperties:
> +#
> +# Properties for input-barrier objects.
> +#
> +# @name: the screen name as declared in the screens section of barrier.conf
> +#
> +# @server: hostname of the Barrier server (default: "localhost")
> +#
> +# @port: TCP port of the Barrier server (default: "24800")

I can understand this being a string (if non-numeric, it can be treated
as a well-known service name instead), but...

> +#
> +# @x-origin: x coordinate of the leftmost pixel on the guest screen
> +#            (default: "0")

...why are these other fields a string instead of an integer?  But you
are just doing faithful translation of what we already have.

Bummer - our naming for this member implies that it is experimental,
which is a misnomer (it is quite stable, when viewed in tandem with
y-origin).  Not your fault.  Would 'origin-x' and 'origin-y' be any
better as new aliases in a followup patch?

> +#
> +# @y-origin: y coordinate of he topmost pixel on the guest screen (default: "0")

"the", long line

> +#
> +# @width: the width of secondary screen in pixels (default: "1920")
> +#
> +# @height: the height of secondary screen in pixels (default: "1080")
> +#
> +# Since: 4.2
> +##
> +{ 'struct': 'InputBarrierProperties',
> +  'data': { 'name': 'str',
> +            '*server': 'str',
> +            '*port': 'str',
> +            '*x-origin': 'str',
> +            '*y-origin': 'str',
> +            '*width': 'str',
> +            '*height': 'str' } }

Matches ui/input-barrier.c:input_barrier_class_init().

> +
> +##
> +# @InputLinuxProperties:
> +#
> +# Properties for input-linux objects.
> +#
> +# @evdev: the path of the host evdev device to use
> +#
> +# @grab_all: if true, grab is toggled for all devices (e.g. both keyboard and
> +#            mouse) instead of just one device (default: false)

We have inconsistent naming within this object (see grab-toggle); a good
followup would be an alias for 'grab-all'.

> +#
> +# @repeat: enables auto-repeat events (default: false)
> +#
> +# @grab-toggle: the key or key combination that toggles device grab
> +#               (default: ctrl-ctrl)
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'InputLinuxProperties',
> +  'data': { 'evdev': 'str',
> +            '*grab_all': 'bool',
> +            '*repeat': 'bool',
> +            '*grab-toggle': 'GrabToggleKeys' } }

matches ui/input-linux.c.

> +
>  ##
>  # @IothreadProperties:
>  #
> @@ -689,6 +743,8 @@
>      'filter-redirector',
>      'filter-replay',
>      'filter-rewriter',
> +    'input-barrier',
> +    'input-linux',
>      'iothread',
>      'memory-backend-file',
>      'memory-backend-memfd',
> @@ -741,6 +797,8 @@
>        'filter-redirector':          'FilterRedirectorProperties',
>        'filter-replay':              'NetfilterProperties',
>        'filter-rewriter':            'FilterRewriterProperties',
> +      'input-barrier':              'InputBarrierProperties',
> +      'input-linux':                'InputLinuxProperties',
>        'iothread':                   'IothreadProperties',
>        'memory-backend-file':        'MemoryBackendFileProperties',
>        'memory-backend-memfd':       'MemoryBackendMemfdProperties',

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


