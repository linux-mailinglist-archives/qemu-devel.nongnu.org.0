Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E154EEC47
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:23:12 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFN1-0000tI-2B
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:23:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naFKL-0007nw-I3
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naFKG-0002Em-UA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648812019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6S0abJ9PuoQGwkueUbtxiqe1MgXGqFuidyO9F4UnsrA=;
 b=gJib9X+AkIUSnhbmzpYFNYGfN5+Ow1PgoH5ZIWkD5vDe5H72xYRDsWSnPVTTXLYex4t8kj
 tarpoPH69onrhGhjIHBoVxcu92O5nE2VzmgSTguaLSBGGCB6/lEvOuMqryuZQ8U8RG4/YJ
 +IPhoYwBKGEVt0CriO+h+yykkG0JLFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-wV0SZb9UNFKJsprcu-STwg-1; Fri, 01 Apr 2022 07:20:16 -0400
X-MC-Unique: wV0SZb9UNFKJsprcu-STwg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C63E1801388;
 Fri,  1 Apr 2022 11:20:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA495E2025;
 Fri,  1 Apr 2022 11:20:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 537C921E691D; Fri,  1 Apr 2022 13:20:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v4 2/2] Added parameter to take screenshot with
 screendump as PNG
References: <20220330061134.59254-1-kshitij.suri@nutanix.com>
 <20220330061134.59254-3-kshitij.suri@nutanix.com>
Date: Fri, 01 Apr 2022 13:20:14 +0200
In-Reply-To: <20220330061134.59254-3-kshitij.suri@nutanix.com> (Kshitij Suri's
 message of "Wed, 30 Mar 2022 06:11:34 +0000")
Message-ID: <87wng96oep.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 David Alan Gilbert <dgilbert@redhat.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, pbonzini@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dave, please have a look at the HMP compatibility issue in
hmp-command.hx below.

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> Currently screendump only supports PPM format, which is un-compressed and=
 not
> standard.

If "standard" means "have to pay a standards organization $$$ to access
the spec", PPM is not standard.  If it means "widely supported", it
certainly is.  I'd drop "and not standard".  Suggestion, not demand.

>           Added a "format" parameter to qemu monitor screendump capabilit=
es
> to support PNG image capture using libpng. The param was added in QAPI sc=
hema
> of screendump present in ui.json along with png_save() function which con=
verts
> pixman_image to PNG. HMP command equivalent was also modified to support =
the
> feature.

Suggest to use imperative mood to describe the commit, and omit details
that aren't necessary here:

            Add a "format" parameter to QMP and HMP screendump command
  to support PNG image capture using libpng.

>
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }

Providing an example in the commit message is always nice, thanks!

>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hmp-commands.hx    |  11 ++---
>  monitor/hmp-cmds.c |  12 +++++-
>  qapi/ui.json       |  24 +++++++++--
>  ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 136 insertions(+), 12 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9..19b7cab595 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,11 +244,12 @@ ERST
> =20
>      {
>          .name       =3D "screendump",
> -        .args_type  =3D "filename:F,device:s?,head:i?",
> -        .params     =3D "filename [device [head]]",
> -        .help       =3D "save screen from head 'head' of display device =
'device' "
> -                      "into PPM image 'filename'",
> -        .cmd        =3D hmp_screendump,
> +        .args_type  =3D "filename:F,format:s?,device:s?,head:i?",

Incompatible change: meaning of "screendump ONE TWO" changes from
filename=3DONE, device=3DTWO to filename=3DONE, format=3DTWO.

As HMP is not a stable interface, incompatible change is permissible.
But is this one wise?

Could we add the new argument at the end instead?

            .args_type  =3D "filename:F,device:s?,head:i?,format:s?",

Could we do *without* an argument, and derive the format from the
filename extension?  .png means format=3Dpng, anything else format=3Dppm.
Would be a bad idea for QMP.  Okay for HMP?

> +        .params     =3D "filename [format] [device [head]]",

This tells us that parameter format can be omitted like so

    screendump foo.ppm device-id

which isn't true.  Better: "filename [format [device [head]]".

> +        .help       =3D "save screen from head 'head' of display device =
'device'"
> +                      "in specified format 'format' as image 'filename'.=
"
> +                      "Currently only 'png' and 'ppm' formats are suppor=
ted.",
> +         .cmd        =3D hmp_screendump,
>          .coroutine  =3D true,
>      },
> =20
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..2442bfa989 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename =3D qdict_get_str(qdict, "filename");
>      const char *id =3D qdict_get_try_str(qdict, "device");
>      int64_t head =3D qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  =3D qdict_get_try_str(qdict, "format");
>      Error *err =3D NULL;
> +    ImageFormat format;
> =20
> -    qmp_screendump(filename, id !=3D NULL, id, id !=3D NULL, head, &err)=
;
> +    format =3D qapi_enum_parse(&ImageFormat_lookup, input_format,
> +                              IMAGE_FORMAT_PPM, &err);
> +    if (err) {
> +        goto end;
> +    }
> +
> +    qmp_screendump(filename, id !=3D NULL, id, id !=3D NULL, head,
> +                   input_format !=3D NULL, format, &err);
> +end:
>      hmp_handle_error(mon, err);
>  }
> =20
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 664da9e462..24371fce05 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -157,12 +157,27 @@
>  ##
>  { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOp=
tions' }
> =20
> +##
> +# @ImageFormat:
> +#
> +# Supported image format types.
> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 7.1
> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Capture the contents of a screen and write it to a file.
>  #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>  #
>  # @device: ID of the display device that should be dumped. If this param=
eter
>  #          is missing, the primary display will be used. (Since 2.12)
> @@ -171,6 +186,8 @@
>  #        parameter is missing, head #0 will be used. Also note that the =
head
>  #        can only be specified in conjunction with the device ID. (Since=
 2.12)
>  #
> +# @format: image format for screendump is specified. (default: ppm) (Sin=
ce 7.1)

Recommend

   # @format: image format for screendump (default: ppm) (Since 7.1)

> +#
>  # Returns: Nothing on success
>  #
>  # Since: 0.14
> @@ -183,7 +200,8 @@
>  #
>  ##
>  { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
> +           '*format': 'ImageFormat'},
>    'coroutine': true }
> =20
>  ##

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


