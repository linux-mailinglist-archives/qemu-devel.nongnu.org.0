Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC52BA08
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 20:23:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVKHD-0001HP-HE
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 14:23:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVKG9-0000wO-V7
	for qemu-devel@nongnu.org; Mon, 27 May 2019 14:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVKG9-00035s-2J
	for qemu-devel@nongnu.org; Mon, 27 May 2019 14:22:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hVKG8-00035U-TH
	for qemu-devel@nongnu.org; Mon, 27 May 2019 14:22:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3BC93082E42
	for <qemu-devel@nongnu.org>; Mon, 27 May 2019 18:22:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 849C75D9D3;
	Mon, 27 May 2019 18:22:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E7E0B1138648; Mon, 27 May 2019 20:22:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <1558079119-320634-1-git-send-email-imammedo@redhat.com>
	<1558079119-320634-4-git-send-email-imammedo@redhat.com>
Date: Mon, 27 May 2019 20:22:03 +0200
In-Reply-To: <1558079119-320634-4-git-send-email-imammedo@redhat.com> (Igor
	Mammedov's message of "Fri, 17 May 2019 09:45:16 +0200")
Message-ID: <871s0jiwqc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 27 May 2019 18:22:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/6] qmp: qmp_qom_list_properties():
 ignore empty string options
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: libvir-list@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
	qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> Current QAPI semantics return empty "" string in case string property
> value hasn't been set (i.e. NULL). Do not show initial value in this
> case in "qom-list-properties" command output to reduce clutter.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  qmp.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/qmp.c b/qmp.c
> index 8415541..463c7d4 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -41,6 +41,7 @@
>  #include "qom/object_interfaces.h"
>  #include "hw/mem/memory-device.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> +#include "qapi/qmp/qstring.h"
>  
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -596,7 +597,16 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
>          if (obj) {
>              info->q_default =
>                  object_property_get_qobject(obj, info->name, NULL);
> -            info->has_q_default = !!info->q_default;
> +            if (info->q_default) {
> +               if (qobject_type(info->q_default) == QTYPE_QSTRING) {
> +                   QString *value = qobject_to(QString, info->q_default);
> +                   if (!strcmp(qstring_get_str(value), "")) {
> +                       qobject_unref(info->q_default);
> +                       info->q_default = NULL;
> +                   }
> +               }
> +               info->has_q_default = !!info->q_default;
> +            }
>          }
>  
>          entry = g_malloc0(sizeof(*entry));

The commit message suggests we omit @default when a string-valued
property is null.  We omit it when it's "", too.

Makes me wonder whether we should omit other "default defaults", too,
such as integer zero.  After all, what's so special about strings?

I'm not sure omitting any default defaults is a good idea.  But then I'm
not yet sure @default is a good idea.

