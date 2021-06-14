Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704A3A5DE5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 09:49:59 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshM6-00037D-4W
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 03:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lshLF-0002I5-Ig
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lshLC-0007xy-7p
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623656940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R5YI6Ij89ZF+8SS7B6j8GNAORR/+bVrDALVzwAN17A8=;
 b=DCNZ+w75f5NSk1oIUQaxCTi9GhIIi5rQXokqb0BC/9CJRrQhQZfjbxFWBhYiRXbi5m7sty
 7SHZTWT6ux0gJ98tVcD32wZh73VsCnPJ7SX14nkpyyR2CjoTTGe7967/P4p0IEnhPFPQ92
 ldv3RZagbb4FHQtkcKKf5TB2YheEkoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-gazppTjvNi-oor15lLACYQ-1; Mon, 14 Jun 2021 03:48:59 -0400
X-MC-Unique: gazppTjvNi-oor15lLACYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42757801B15;
 Mon, 14 Jun 2021 07:48:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A941C19D7D;
 Mon, 14 Jun 2021 07:48:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FC9B113865F; Mon, 14 Jun 2021 09:48:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 02/18] qapi: add ModuleInfo schema
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-3-kraxel@redhat.com>
Date: Mon, 14 Jun 2021 09:48:23 +0200
In-Reply-To: <20210610055755.538119-3-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Thu, 10 Jun 2021 07:57:39 +0200")
Message-ID: <87im2g6g54.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> Add QAPI schema for the module info database.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qapi/meson.build      |  1 +
>  qapi/modules.json     | 36 ++++++++++++++++++++++++++++++++++++
>  qapi/qapi-schema.json |  1 +
>  3 files changed, 38 insertions(+)
>  create mode 100644 qapi/modules.json
>
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 376f4ceafe74..596aa5d71168 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -36,6 +36,7 @@ qapi_all_modules = [
>    'migration',
>    'misc',
>    'misc-target',
> +  'modules',
>    'net',
>    'pragma',
>    'qom',
> diff --git a/qapi/modules.json b/qapi/modules.json
> new file mode 100644
> index 000000000000..5420977d8765
> --- /dev/null
> +++ b/qapi/modules.json
> @@ -0,0 +1,36 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +

Missing a section heading like

   ##
   # = Loadable modules
   ##

Without it, the contents gets appended to whatever section precedes it
in qapi-schema.json, which is almost certainly not what you want.

> +##
> +# @ModuleInfo:
> +#
> +# qemu module metadata

It's spelled QEMU :)

Suggest "Loadable module meta-data".

> +#
> +# @name: module name
> +#
> +# @objs: list of qom objects implemented by the module.

s/qom objects/QOM types/

> +#
> +# @deps: list of other modules this module depends on.

Suggest to spell out that these are @name of other loadable modules.

> +#
> +# @arch: module architecture.

Semantics?

Should this be enum SysEmuTarget?

> +#
> +# @opts: qemu opts implemented by module.

Is this the name of a QemuOptsList?

Since this isn't a list, a module can only ever provide one
QemuOptsList.  Sure that's okay?

> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'ModuleInfo',
> +  'data': { 'name'  : 'str',
> +            '*objs' : ['str'],
> +            '*deps' : ['str'],
> +            '*arch' : 'str',
> +            '*opts' : 'str'}}
> +
> +##
> +# @Modules:
> +#
> +# qemu module list
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'Modules',
> +  'data': { 'list' : ['ModuleInfo']}}

This defines only types, no QMP commands or events.  Why do you need the
types to be QAPI types?

> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b9744e69..5baa511c2ff5 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -93,3 +93,4 @@
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
>  { 'include': 'pci.json' }
> +{ 'include': 'modules.json' }

Is this the place you want the section to be?  Remember, generated
documentation follows source order.


