Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91B4DB1AD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:38:19 +0100 (CET)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTr0-00083Y-JT
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:38:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUTf2-00071f-6q
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUTf0-0004UF-4p
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TdqVy8pGY7J5tuZ9MetHkvVu4Zjy2yaS2lG/tkB9org=;
 b=Ckdbj9vzM42O+hsMG/eRntc0pgv2Swj/cMyWa5FwH2AVL+4J1gxs8YLmReSC8llqorNCBU
 JeKQNCKgGocAcztjGRN/R7OAd94i81SF/Osqtjon/QIKtEh2QBsSV1lmfDx6qtnAtburAf
 +S7/4+8B6WZ19oYQT4rdb8ELnDZSGD0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-OqDl4Tt7Nia-aeh2efBNog-1; Wed, 16 Mar 2022 09:25:50 -0400
X-MC-Unique: OqDl4Tt7Nia-aeh2efBNog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1410B3C1484D;
 Wed, 16 Mar 2022 13:25:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1D545390B;
 Wed, 16 Mar 2022 13:25:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6946521E6821; Wed, 16 Mar 2022 14:25:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as
References: <20220315044740.155268-1-kshitij.suri@nutanix.com>
 <20220315044740.155268-2-kshitij.suri@nutanix.com>
Date: Wed, 16 Mar 2022 14:25:48 +0100
In-Reply-To: <20220315044740.155268-2-kshitij.suri@nutanix.com> (Kshitij
 Suri's message of "Tue, 15 Mar 2022 04:47:40 +0000")
Message-ID: <87sfrivxk3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> From: "kshitij.suri" <kshitij.suri@nutanix.com>
>
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added a "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
>
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
> diff to v1:
>   - Removed repeated alpha conversion operation.
>   - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>   - Added a new CONFIG_PNG parameter for libpng support.
>   - Changed input format to enum instead of string.
>   - Improved error handling.
>  hmp-commands.hx    |  11 ++---
>  monitor/hmp-cmds.c |  19 ++++++++-
>  qapi/ui.json       |  24 +++++++++--
>  ui/console.c       | 102 +++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 144 insertions(+), 12 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..5eda4eeb24 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,17 +244,18 @@ ERST
>  
>      {
>          .name       = "screendump",
> -        .args_type  = "filename:F,device:s?,head:i?",
> -        .params     = "filename [device [head]]",
> -        .help       = "save screen from head 'head' of display device 'device' "
> -                      "into PPM image 'filename'",
> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
> +        .params     = "filename [device [head]] [format]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Currently only 'png' and 'ppm' formats are supported.",
>          .cmd        = hmp_screendump,
>          .coroutine  = true,
>      },
>  
>  SRST
>  ``screendump`` *filename*
> -  Save screen into PPM image *filename*.
> +  Save screen as an image *filename*, with default format of PPM.
>  ERST
>  
>      {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8c384dc1b2..9a640146eb 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_str(qdict, "format");
>      Error *err = NULL;
> +    ImageFormat format;
>  
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);

The second id != NULL looks wrong.  Shouldn't it be head != NULL?
Not your patch's fault, of course.

> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format, -1, &err);
> +    if (val < 0) {
> +        goto end;
> +    }
> +
> +    switch (val) {
> +    case IMAGE_FORMAT_PNG:
> +        format = IMAGE_FORMAT_PNG;
> +        break;
> +    default:
> +        format = IMAGE_FORMAT_PPM;
> +    }
> +
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   input_format != NULL, format, &err);
> +end:
>      hmp_handle_error(mon, err);
>  }

This isn't quite right.

qapi_enum_parse() is awkward to use.

If its second argument @input_format is null, it returns its third
argument -1.

Else, it @input_format is a valid enum string, it returns the
enumeration value, i.e. either IMAGE_FORMAT_PPM or IMAGE_FORMAT_PNG.

Else, it sets an error and returns its third argument -1.

If @input_format is null, I suspect your code jumps to
hmp_handle_error() with a null @err.  Silently does nothing.

It should default to IMAGE_FORMAT_PPM instead.

I think you want something like this (completely untested):

    val = qapi_enum_parse(&ImageFormat_lookup, input_format,
                          IMAGE_FORMAT_PPM, &err);
    if (err) {
        goto end;
    }

    qmp_screendump(filename, id != NULL, id, head != NULL, head,
                   input_format != NULL, val, &err);

>  
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..a6d994ba2c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -73,12 +73,27 @@
>  ##
>  { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>  
> +##
> +# @ImageFormat:
> +#
> +# Supported image format types.
> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Write a screenshot of the VGA screen to a file.

Let's improve this to

   # Capture the contents of a screen and write it to a file.

>  #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>  #
>  # @device: ID of the display device that should be dumped. If this parameter
>  #          is missing, the primary display will be used. (Since 2.12)
> @@ -87,6 +102,8 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump is specified. (default: ppm) (Since 7.0)
> +#
>  # Returns: Nothing on success
>  #
>  # Since: 0.14
> @@ -99,7 +116,8 @@
>  #
>  ##
>  { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
> +           '*format': 'ImageFormat'},
>    'coroutine': true }
>  
>  ##

[...]

> @@ -327,7 +413,8 @@ static void graphic_hw_update_bh(void *con)
>  /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>  void coroutine_fn
>  qmp_screendump(const char *filename, bool has_device, const char *device,
> -               bool has_head, int64_t head, Error **errp)
> +               bool has_head, int64_t head, bool has_format,
> +               ImageFormat format, Error **errp)

Please break the line like

                  bool has_head, int64_t head,
                  bool has_format, ImageFormat format, Error **errp)

>  {
>      g_autoptr(pixman_image_t) image = NULL;
>      QemuConsole *con;
> @@ -383,8 +470,17 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>       * yields and releases the BQL. It could produce corrupted dump, but
>       * it should be otherwise safe.
>       */
> -    if (!ppm_save(fd, image, errp)) {
> -        qemu_unlink(filename);
> +
> +    if (has_format && format == IMAGE_FORMAT_PNG) {
> +        /* PNG format specified for screendump */
> +        if (!png_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else {
> +        /* PPM format specified/default for screendump */
> +        if (!ppm_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
>      }
>  }


