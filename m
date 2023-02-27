Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC07D6A425A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdHR-0008IL-Lb; Mon, 27 Feb 2023 08:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWdHM-0008Hd-Fu
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:10:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWdHK-0002u7-D6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677503453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0ObCjx3j/Lp6c/6sQzW921BoGV1+9uZOmiULpSL+B4=;
 b=WimDeuiZ9yLZ2H6goOocZCvi2EiDBYeFQxftRQDbglS/q4mChGPQ5Mj6u93p2KfoLVf4x+
 qQA1eOdPhtMuzHwwLu1B21U/fRMVdp6z1AWuWXRAgLx+SrW/ius0x80d9ow30dz95i7UM3
 +Hb8o736zOFoqIqGAFzaL3YM7l0sIKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-ZxhpmahZNoWZBppEGUyIgA-1; Mon, 27 Feb 2023 08:10:50 -0500
X-MC-Unique: ZxhpmahZNoWZBppEGUyIgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29827811E9C;
 Mon, 27 Feb 2023 13:10:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01B48C15BAD;
 Mon, 27 Feb 2023 13:10:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECE9A21E6A1F; Mon, 27 Feb 2023 14:10:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/2] qapi: Generate enum count as definition in
 gen_enum_lookup()
References: <20230224155451.20211-1-philmd@linaro.org>
 <20230224155451.20211-3-philmd@linaro.org>
Date: Mon, 27 Feb 2023 14:10:47 +0100
In-Reply-To: <20230224155451.20211-3-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 24 Feb 2023 16:54:51
 +0100")
Message-ID: <87ilfnqmnc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> QAPI's gen_enum() generates QAPI enum values and the number
> of this values (as foo__MAX).
> The number of entries in an enum type is not part of the
> enumerated values, but we generate it as such. See for
> example:
>
>   typedef enum OnOffAuto {
>       ON_OFF_AUTO_AUTO,
>       ON_OFF_AUTO_ON,
>       ON_OFF_AUTO_OFF,
>       ON_OFF_AUTO__MAX,        <---------
>   } OnOffAuto;
>
> Instead of declaring the enum count as the last enumerated
> value, #define it, so it is not part of the enum. The previous
> example becomes:
>
>   typedef enum OnOffAuto {
>       ON_OFF_AUTO_AUTO,
>       ON_OFF_AUTO_ON,
>       ON_OFF_AUTO_OFF,
>   #define ON_OFF_AUTO__MAX 3   <---------
>   } OnOffAuto;

I'm in favour.  In fact, I've wanted to do this for a while, just never
got around to it.

> Since Clang enables the -Wswitch warning by default [*], remove all
> pointless foo__MAX cases in switch statement, in order to avoid:
>
>  audio/audio.c:2231:10: error: case value not in enumerated type 'AudioFo=
rmat' (aka 'enum AudioFormat') [-Wswitch]
>     case AUDIO_FORMAT__MAX:
>          ^
>  ui/input.c:233:14: error: case value not in enumerated type 'KeyValueKin=
d' (aka 'enum KeyValueKind') [-Wswitch]
>         case KEY_VALUE_KIND__MAX:
>              ^
>  ...
>
> [*] https://clang.llvm.org/docs/DiagnosticsReference.html#wswitch
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Falls apart when the enum is empty:

    gcc -m64 -mcx16 -Iqga/qemu-ga.p -Iqga -I../qga -I. -Iqapi -Itrace -Iui =
-Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/in=
clude/sysprof-4 -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -std=3Dgnu11=
 -O0 -g -isystem /work/armbru/qemu/linux-headers -isystem linux-headers -iq=
uote . -iquote /work/armbru/qemu -iquote /work/armbru/qemu/include -iquote =
/work/armbru/qemu/tcg/i386 -pthread -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrit=
e-strings -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-=
style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -W=
format-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -=
Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-f=
ormat-attribute -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-ps=
abi -fstack-protector-strong -fPIE -MD -MQ qga/qemu-ga.p/meson-generated_..=
_qga-qapi-emit-events.c.o -MF qga/qemu-ga.p/meson-generated_.._qga-qapi-emi=
t-events.c.o.d -o qga/qemu-ga.p/meson-generated_.._qga-qapi-emit-events.c.o=
 -c qga/qga-qapi-emit-events.c
    In file included from qga/qga-qapi-emit-events.c:14:
    qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
       20 | } qga_QAPIEvent;
          | ^

qga/qapi-schema.json does not define any events, so its (implicitly
defined) event enumeration comes out empty.

We could detect this, and either emit a dummy event, or suppress code
generation for events entirely.

Explicitly defined enumerations may also be empty.  qapi-code-gen.rst
says:

    Nothing prevents an empty enumeration, although it is probably not
    useful.

We could forbid empty enumerations.

Speaking of qapi-code-gen.rst: it also needs an update.  Search for
__MAX.


