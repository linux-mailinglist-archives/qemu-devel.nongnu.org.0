Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471C508532
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:49:04 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6xL-0007Ph-72
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nh6uo-0006gJ-SU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nh6ul-0007uG-LD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650447982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LExYaWoctvAW9ICIvpZThOajXXjsYmMIxELEEr1LAts=;
 b=SP4Y988jP8YDCezA752fRGT1MUkCdHK+JmDoZyhBBwXXQ0Y3XRAChvzX1jYfYla1GNx61K
 MGyLxJEsi0wkiznBvCh9Y3QY4aAp/yL4LSn07X1a9hgpHPpJ9a/IVpNRC9D9Q10CCpCuM7
 oXUcKkc5mcU7SLto1T3IuKxgcgeEr38=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-8pTMJ4n5P-qP3wm--yv5-A-1; Wed, 20 Apr 2022 05:46:21 -0400
X-MC-Unique: 8pTMJ4n5P-qP3wm--yv5-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 r9-20020a1c4409000000b0038ff033b654so714273wma.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 02:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LExYaWoctvAW9ICIvpZThOajXXjsYmMIxELEEr1LAts=;
 b=3YbjWuSaF2CYczpdFAs9A8xypRnFgcrNbSY+d4LTIqoD0cJ5+X264/WPIIw3N2NZXN
 mpHVE+BStImvyNSfhoRgG6kYLTUSH55F7o9zZEsdS3vsifbq4wRT4Y6sLwVi5xwasMeZ
 qs7nwJtnYL74W09c+7uqNlWWBIgCrWKfAfle54p87EzQPU0JNSGjNnCBvAu4PXrOFEOy
 uRoWQoqTuMInxWYfrg2Hkw15jmCA5znqhNaDJOnfnrQmpLZDptahblHRbtFqfxkhDrFV
 PSBC+LIsjbCOo9ZW6cyTsq58NqWLIkAA4TXCOV4N8ivL9/FnL3U8vaoT/kbyxS00Z6t0
 EJ0Q==
X-Gm-Message-State: AOAM533QzOw2Xr90oHSd2RZkPLEWvP4gRAuJ07bZ/dEjnb5gG/55lzEc
 aTWoL3Fx0IXdNgYqQvnohR/vjc+cQ06IplV4Zul3xAVjNJUDz3O0vzRrpgvTLJ61hd0goMhi2aV
 k+CG+ursYCjPJTgw=
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr2709009wmb.199.1650447980048; 
 Wed, 20 Apr 2022 02:46:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdRAIT+bcHN/skTtnuSfMUnkQjuzGbJLjWrY4GIO8GblCa8zMicGxfdhGEQcw0Embdk7ZCtQ==
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr2708970wmb.199.1650447979755; 
 Wed, 20 Apr 2022 02:46:19 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b0020a7be3f1d2sm13924963wri.53.2022.04.20.02.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 02:46:19 -0700 (PDT)
Date: Wed, 20 Apr 2022 10:46:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v5 2/2] Added parameter to take screenshot with
 screendump as PNG
Message-ID: <Yl/WaN3WTlWxRhb5@work-vm>
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
 <20220408071336.99839-3-kshitij.suri@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220408071336.99839-3-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 armbru@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kshitij Suri (kshitij.suri@nutanix.com) wrote:
> Currently screendump only supports PPM format, which is un-compressed. Added
> a "format" parameter to QMP and HMP screendump command to support PNG image
> capture using libpng.
> 
> QMP example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
> 
> HMP example usage:
> screendump /tmp/image -f png
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> diff to v4:
>   - Modified format to be an optional flag based parameter in HMP.
> 
>  hmp-commands.hx    |  11 ++---
>  monitor/hmp-cmds.c |  12 +++++-
>  qapi/ui.json       |  24 +++++++++--
>  ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 136 insertions(+), 12 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9..808020d005 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,11 +244,12 @@ ERST
>  
>      {
>          .name       = "screendump",
> -        .args_type  = "filename:F,device:s?,head:i?",
> -        .params     = "filename [device [head]]",
> -        .help       = "save screen from head 'head' of display device 'device' "
> -                      "into PPM image 'filename'",
> -        .cmd        = hmp_screendump,
> +        .args_type  = "filename:F,format:-fs,device:s?,head:i?",
> +        .params     = "filename [-f format] [device [head]]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Currently only 'png' and 'ppm' formats are supported.",
> +         .cmd        = hmp_screendump,
>          .coroutine  = true,
>      },
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..2442bfa989 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_try_str(qdict, "format");
>      Error *err = NULL;
> +    ImageFormat format;
>  
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
> +                              IMAGE_FORMAT_PPM, &err);
> +    if (err) {
> +        goto end;
> +    }
> +
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   input_format != NULL, format, &err);
> +end:
>      hmp_handle_error(mon, err);
>  }

For HMP:


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> diff --git a/qapi/ui.json b/qapi/ui.json
> index 664da9e462..98f0126999 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -157,12 +157,27 @@
>  ##
>  { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
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
>  # @device: ID of the display device that should be dumped. If this parameter
>  #          is missing, the primary display will be used. (Since 2.12)
> @@ -171,6 +186,8 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump. (default: ppm) (Since 7.1)
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
>  
>  ##
> diff --git a/ui/console.c b/ui/console.c
> index da434ce1b2..f42f64d556 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>  #include "exec/memory.h"
>  #include "io/channel-file.h"
>  #include "qom/object.h"
> +#ifdef CONFIG_PNG
> +#include <png.h>
> +#endif
>  
>  #define DEFAULT_BACKSCROLL 512
>  #define CONSOLE_CURSOR_PERIOD 500
> @@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
>      }
>  }
>  
> +#ifdef CONFIG_PNG
> +/**
> + * png_save: Take a screenshot as PNG
> + *
> + * Saves screendump as a PNG file
> + *
> + * Returns true for success or false for error.
> + *
> + * @fd: File descriptor for PNG file.
> + * @image: Image data in pixman format.
> + * @errp: Pointer to an error.
> + */
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    g_autofree png_struct *png_ptr = NULL;
> +    g_autofree png_info *info_ptr = NULL;
> +    g_autoptr(pixman_image_t) linebuf =
> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg_errno(errp, errno,
> +                         "Failed to create file from file descriptor");
> +        return false;
> +    }
> +
> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                      NULL, NULL);
> +    if (!png_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        fclose(f);
> +        return false;
> +    }
> +
> +    info_ptr = png_create_info_struct(png_ptr);
> +
> +    if (!info_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        fclose(f);
> +        png_destroy_write_struct(&png_ptr, &info_ptr);
> +        return false;
> +    }
> +
> +    png_init_io(png_ptr, f);
> +
> +    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
> +
> +    png_write_info(png_ptr, info_ptr);
> +
> +    for (y = 0; y < height; ++y) {
> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
> +        png_write_row(png_ptr, buf);
> +    }
> +    qemu_pixman_image_unref(linebuf);
> +
> +    png_write_end(png_ptr, NULL);
> +
> +    png_destroy_write_struct(&png_ptr, &info_ptr);
> +
> +    if (fclose(f) != 0) {
> +        error_setg_errno(errp, errno,
> +                         "PNG creation failed. Unable to close file");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +#else /* no png support */
> +
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    error_setg(errp, "Enable PNG support with libpng for screendump");
> +    return false;
> +}
> +
> +#endif /* CONFIG_PNG */
> +
>  static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>  {
>      int width = pixman_image_get_width(image);
> @@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
>  /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>  void coroutine_fn
>  qmp_screendump(const char *filename, bool has_device, const char *device,
> -               bool has_head, int64_t head, Error **errp)
> +               bool has_head, int64_t head,
> +               bool has_format, ImageFormat format, Error **errp)
>  {
>      g_autoptr(pixman_image_t) image = NULL;
>      QemuConsole *con;
> @@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>       * yields and releases the BQL. It could produce corrupted dump, but
>       * it should be otherwise safe.
>       */
> -    if (!ppm_save(fd, image, errp)) {
> -        qemu_unlink(filename);
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
>  
> -- 
> 2.22.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


