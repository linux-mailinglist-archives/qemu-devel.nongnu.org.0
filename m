Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC618456A7F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 07:56:27 +0100 (CET)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnxow-0002Ip-N9
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 01:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnxka-0004af-43
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnxkS-0000QF-Tw
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637304706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrJpqtew4eeoZjC9xM07pBQc1IjG6I/B/z5efLQNs+o=;
 b=gkgCR3eZt+n2MzXlfi2V12/hO++CdIdHqlnEmvgqpfSVHXdSbY+119I74iZjTUsq4b8raQ
 MJQ0WDLyNP68TyUJQzho0fjP2gcTHSYT3l5rxe5k2x3dp+eowlwyRJENodjb3Rb/H9Pgzw
 xMmeoL/fBmvtCWom3bZo400q21C+dgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-tXVhLbC1Mxy2b8xvsXs_uA-1; Fri, 19 Nov 2021 01:51:42 -0500
X-MC-Unique: tXVhLbC1Mxy2b8xvsXs_uA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB8F8799EB;
 Fri, 19 Nov 2021 06:51:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0522019730;
 Fri, 19 Nov 2021 06:51:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78CE911380A7; Fri, 19 Nov 2021 07:51:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/5] hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-5-philmd@redhat.com>
Date: Fri, 19 Nov 2021 07:51:38 +0100
In-Reply-To: <20211029230147.2465055-5-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 30 Oct 2021 01:01:46
 +0200")
Message-ID: <87fsrsskn9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> QERR_PROPERTY_VALUE_BAD definition is obsolete since 2015 (commit
> 4629ed1e989, "qerror: Finally unused, clean up"). Replace the two
> uses and drop the definition.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qapi/qmp/qerror.h | 3 ---
>  hw/core/qdev-properties.c | 2 +-
>  target/i386/cpu.c         | 2 +-
>  3 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index f49ae01cdb0..a3f44fc4a1e 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -50,9 +50,6 @@
>  #define QERR_PERMISSION_DENIED \
>      "Insufficient permission to perform this operation"
> =20
> -#define QERR_PROPERTY_VALUE_BAD \
> -    "Property '%s.%s' doesn't take value '%s'"
> -
>  #define QERR_PROPERTY_VALUE_OUT_OF_RANGE \
>      "Property %s.%s doesn't take value %" PRId64 " (minimum: %" PRId64 "=
, maximum: %" PRId64 ")"
> =20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index c34aac6ebc9..dbea4cf8e5e 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -663,7 +663,7 @@ void error_set_from_qdev_prop_error(Error **errp, int=
 ret, Object *obj,
>          break;
>      default:
>      case -EINVAL:
> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD,
> +        error_setg(errp, "Property '%s.%s' doesn't take value '%s'",
>                     object_get_typename(obj), name, value);
>          break;
>      case -ENOENT:
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index fc3ed80ef1e..bc63b80e5bd 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4469,7 +4469,7 @@ static void x86_cpuid_set_vendor(Object *obj, const=
 char *value,
>      int i;
> =20
>      if (strlen(value) !=3D CPUID_VENDOR_SZ) {
> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD, "", "vendor", value);
> +        error_setg(errp, "Property '.vendor' doesn't take value '%s'", v=
alue);
>          return;
>      }

We error out unless the string has exactly CPUID_VENDOR_SZ characters.
We don't tell the user, though[*].  We should!

If this patch was long, I'd separate the long & mechanical from the
error message improvement.  Since it isn't, I suggest to make the error
message improvement the patch's subject, and include the removal of
QERR_PROPERTY_VALUE_BAD "while there".  You choose how to structure
this.


[*] This is a common issue with error systems that make new error
messages harder than reusing some existing message.


