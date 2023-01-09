Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D285662569
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEr9i-0000Kp-S1; Mon, 09 Jan 2023 07:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEr9J-0008U1-38
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:21:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEr9E-0003tU-UK
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673266863;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PBxGVfWAIh4jy7kwMxYvvcElgnz6bQtjp5xAtCoIig=;
 b=iaaL7LpylT9XDAJQ3Eh6Ys5sUu0EJPLZP6T9F4uZmkIWbhOj1YAaN8Ky7/6VTIP7jfU+Pa
 6kH5gHJnlUkenGEPYy36BSRZZpiC1hkLXHhbmt4gqIHGCRC1Q3xCMfQvLjZaYTkIy6ArEh
 34gsdDUY+VD28th4NZH2/BHwh74Lmq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-rUe3OkAkM8GwNXOEZCFQqQ-1; Mon, 09 Jan 2023 07:20:59 -0500
X-MC-Unique: rUe3OkAkM8GwNXOEZCFQqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60ABE85CCE1;
 Mon,  9 Jan 2023 12:20:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 126CA1121314;
 Mon,  9 Jan 2023 12:20:52 +0000 (UTC)
Date: Mon, 9 Jan 2023 12:20:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Eric Blake <eblake@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 08/10] qmp: add 'get-win32-socket'
Message-ID: <Y7wGoMdJpfIkEDwx@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103110814.3726795-9-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Jan 03, 2023 at 03:08:12PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> A process with enough capabilities can duplicate a socket to QEMU. Add a
> QMP command to import it and add it to the monitor fd list, so it can be
> later used by other commands.
> 
> Note that we actually store the SOCKET in the FD list, appropriate care
> must now be taken to use the correct socket functions (similar approach
> is taken by our io/ code and in glib, this is internal and shouldn't
> affect the QEMU/QMP users)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/misc.json | 32 ++++++++++++++++++++++
>  monitor/misc.c | 74 ++++++++++++++++++++++++++++++++++++++++----------
>  2 files changed, 91 insertions(+), 15 deletions(-)
> 
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 27ef5a2b20..a19dd78fab 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -272,6 +272,38 @@
>  ##
>  { 'command': 'getfd', 'data': {'fdname': 'str'} }
>  
> +##
> +# @get-win32-socket:
> +#
> +# Add a socket that was duplicated to QEMU process with WSADuplicateSocketW()
> +# via WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A SOCKET
> +# is considered as a kind of "file descriptor" by QMP clients, for historical
> +# reasons and simplicity, although QEMU takes care to use socket functions
> +# appropriately.
> +#
> +# @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
> +#
> +# @fdname: file descriptor name
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 8.0
> +#
> +# Notes: If @fdname already exists, the file descriptor assigned to
> +#        it will be closed and replaced by the received file
> +#        descriptor.
> +#
> +#        The 'closefd' command can be used to explicitly close the
> +#        file descriptor when it is no longer needed.
> +#
> +# Example:
> +#
> +# -> { "execute": "get-win32-socket", "arguments": { "info": "abcd123..", fdname": "skclient" } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'get-win32-socket', 'data': {'info': 'str', 'fdname': 'str'}, 'if': 'CONFIG_WIN32' }

IIUC, this is needed because  'getfd' doesn't work on Windows ?

Can't we just implement getfd on Windows, using this WSAPROTOCOL_INFOW
structure passing, or are you anticipating that future Windows make get
normal 'getfd' support ?  

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


