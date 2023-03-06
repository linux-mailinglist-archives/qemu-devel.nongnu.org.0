Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE16AC44A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCMj-0005GD-Tq; Mon, 06 Mar 2023 10:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZCMh-00057v-Js
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZCMf-0003jR-Sk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678114976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nh+sapTe5tY64U2Nv0Bwmk18zR+Qscm4Feq2vh1jlTI=;
 b=FQ1Ngb/KopWQqOIComLXRpXWDXsXjNhg65CPOfhhH2ZZysCEjIJmKRpOFZc3aeeou4NIfc
 cwQL0YsAkKluI7ONfJ+MxlkpdAnHJh4NM6qGUoAM+XgXO8nNscNthFHCrHD3N3uAwdzAn5
 TPk/YOJWH5etx0Rj1L67f5K68o8HTt4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-mdkfogrQO2-JpRmW6rVpGw-1; Mon, 06 Mar 2023 10:02:54 -0500
X-MC-Unique: mdkfogrQO2-JpRmW6rVpGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B221885625;
 Mon,  6 Mar 2023 15:02:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22ED5175AD;
 Mon,  6 Mar 2023 15:02:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E717C21E6A1F; Mon,  6 Mar 2023 16:02:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Michael Roth
 <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 05/11] qmp: 'add_client' actually expects sockets
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-6-marcandre.lureau@redhat.com>
Date: Mon, 06 Mar 2023 16:02:38 +0100
In-Reply-To: <20230306122751.2355515-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Mon, 6 Mar 2023 16:27:45 +0400")
Message-ID: <877cvtkjn5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Whether it is SPICE, VNC, D-Bus, or the socket chardev, they all
> actually expect a socket kind or will fail in different ways at runtime.
>
> Throw an error early if the given 'add_client' fd is not a socket, and
> close it to avoid leaks.
>
> This allows to replace the close() call with a more correct & portable
> closesocket() version.
>
> (this will allow importing sockets on Windows with a specialized command
> in the following patch, while keeping the remaining monitor associated
> sockets/add_client code & usage untouched)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  qapi/misc.json     | 3 +++
>  monitor/qmp-cmds.c | 7 +++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 27ef5a2b20..f0217cfba0 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -14,6 +14,9 @@
>  # Allow client connections for VNC, Spice and socket based
>  # character devices to be passed in to QEMU via SCM_RIGHTS.
>  #
> +# If the FD associated with @fdname is not a socket, the command will fa=
il and
> +# the FD will be closed.
> +#
>  # @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-displ=
ay" or
>  #            the name of a character device (eg. from -chardev id=3DXXXX)
>  #
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 859012aef4..9f7751beeb 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -14,6 +14,7 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qemu/sockets.h"
>  #include "monitor-internal.h"
>  #include "monitor/qdev.h"
>  #include "monitor/qmp-helpers.h"
> @@ -139,6 +140,12 @@ void qmp_add_client(const char *protocol, const char=
 *fdname,
>          return;
>      }
>=20=20
> +    if (!fd_is_socket(fd)) {
> +        error_setg(errp, "add_client expects a socket");

Let's mention the parameter name: "parameter @fdname must name a
socket".

> +        close(fd);
> +        return;
> +    }
> +
>      for (i =3D 0; i < ARRAY_SIZE(protocol_table); i++) {
>          if (!strcmp(protocol, protocol_table[i].name)) {
>              if (!protocol_table[i].add_client(fd, has_skipauth, skipauth,

Acked-by: Markus Armbruster <armbru@redhat.com>


