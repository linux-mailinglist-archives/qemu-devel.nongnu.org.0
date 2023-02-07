Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DF468DC2E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPMs-0007M8-03; Tue, 07 Feb 2023 09:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPPMo-0007Lz-Ez
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPPMm-0004dC-45
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675781678;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXtnh2n9lRcUMq3kGUQ4tNFKPQXAq5H+GgHzfMsIFbg=;
 b=H17lGHVzT0k+TtHUbS5qtsEMvbV9cu+7jPEzYXUzhShVi3ccRsAMD/EzaOPQaNBcdGRoTt
 hPQMeLWRGU1onkDKPkfqzQaTUcggYdTI3kRAVMG6QOYFEsMYbxz3RDauOhklknZLeM+TxK
 i/TA1mcPTBkU2IHTqpuz0k1HXhaPi9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-Xhq6YzhzPeqqKNBQf7wIJQ-1; Tue, 07 Feb 2023 09:54:35 -0500
X-MC-Unique: Xhq6YzhzPeqqKNBQf7wIJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38330101A521;
 Tue,  7 Feb 2023 14:54:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A9172026D37;
 Tue,  7 Feb 2023 14:54:32 +0000 (UTC)
Date: Tue, 7 Feb 2023 14:54:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
Message-ID: <Y+JmJQEhAejYwS/T@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207142535.1153722-9-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Feb 07, 2023 at 06:25:33PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> A process with enough capabilities can duplicate a socket to QEMU.
> Modify 'getfd' to import it and add it to the monitor fd list, so it can
> be later used by other commands.
> 
> Note that we actually store the SOCKET in the FD list, appropriate care
> must now be taken to use the correct socket functions (similar approach
> is taken by our io/ code and in glib, this is internal and shouldn't
> affect the QEMU/QMP users)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/misc.json     | 16 ++++++++--
>  monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
>  monitor/hmp-cmds.c |  6 +++-
>  3 files changed, 81 insertions(+), 20 deletions(-)
> 
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 27ef5a2b20..cd36d8befb 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -249,10 +249,18 @@
>  ##
>  # @getfd:
>  #
> -# Receive a file descriptor via SCM rights and assign it a name
> +# On UNIX, receive a file descriptor via SCM rights and assign it a name.
> +#
> +# On Windows, (where ancillary socket fd-passing isn't an option yet), add a
> +# socket that was duplicated to QEMU process with WSADuplicateSocketW() via
> +# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A SOCKET is
> +# considered as a kind of "file descriptor" in QMP context, for historical
> +# reasons and simplicity. QEMU takes care to use socket functions appropriately.
>  #
>  # @fdname: file descriptor name
>  #
> +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since 8.0.

This is a clever trick, but it also feels pretty gross from
POV of QMP design normal practice, which would be to define
a struct in QAPI to represent the WSAPROTOCOL_INFOW contents.

The main downside would be that its more verbose to convert
between the windows and QAPI structs.


> @@ -270,7 +278,11 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'getfd', 'data': {'fdname': 'str'} }
> +{ 'command': 'getfd', 'data': {
> +    'fdname': 'str',
> +    '*wsa-info': {'type': 'str', 'if': 'CONFIG_WIN32'}
> +  }
> +}

snip

> +void qmp_getfd(const char *fdname,
> +#ifdef WIN32
> +               const char *wsa_info,
> +#endif
> +               Error **errp)
> +{
> +    Monitor *cur_mon = monitor_cur();
> +    int fd;
> +
> +#ifdef WIN32
> +    if (wsa_info) {
> +        g_autofree WSAPROTOCOL_INFOW *info = NULL;
> +        gsize len;
> +        SOCKET sk;
> +
> +        info = (void *)g_base64_decode(wsa_info, &len);
> +        if (len != sizeof(*info)) {
> +            error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
> +            return;
> +        }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


