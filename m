Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2594C1100
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:07:23 +0100 (CET)
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpUP-0007I5-RQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:07:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMpON-00038O-3E
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMpO4-000542-8O
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645614045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wjw/0FN/0GEGOtU7y/PoQbPd9mok9xDGUICJXCru+xw=;
 b=GPbzKn95ZkD2jkxzGqwJcWksGGnu1n5jJcwOoPEObArFZsMRfH5I0PY/77kJCQxvg4mfPL
 7vCT0fv+SYhV9JCulmqYV0mzuR+5nU5gHcVm5Iiv64h/VQTdbZJxRMYgjmYWZKL5hdU+nQ
 ICSztPOuCtfhAtnaTqcxtUyh5vu73co=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-sL5mUZnYP22gcUTKSliCvA-1; Wed, 23 Feb 2022 06:00:43 -0500
X-MC-Unique: sL5mUZnYP22gcUTKSliCvA-1
Received: by mail-wm1-f70.google.com with SMTP id
 q17-20020a1ca711000000b0037be98d03a1so958628wme.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 03:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wjw/0FN/0GEGOtU7y/PoQbPd9mok9xDGUICJXCru+xw=;
 b=RZGocE/VsIIXHFRZXUv784NgG8O/gAlq16fx03SxSF/EY/SifNOjNRy+O+Z8UMrKhI
 rv4q1sG89N4xHzSd2pPL5ukN/TZfK/BCvCkxI82z+XnSza8QWMnLp1WXb0lCNud4wScG
 MmkOilV8N6+5YDbGm+9jTJOI76I8CDZrFrCVLs97iglCb71axEGsJLfBk3MsMunGVkTv
 Z7xYOsRMtqtJw5H0xA/vzHmnK/8yRuSRG9uBvTJh8kFEbnqzp4o/TEBtnf64LlyBP/Ep
 CrcT6Dr+2xysI/iXaDCqA4U0Sf/KUUhS1WOyKRFjjM4OsZcA9ypwSw7Jk2iFtVZy3rTt
 wJiQ==
X-Gm-Message-State: AOAM533U7AWVuveiwycdeu5d68TByQwuoC1CMWma6BFEoaaudq6q+EIV
 /8EtacZy3Ln0aPX5CB3BPq5KV90pvNsGr7b1rh2nShQoVdEnIy50Z7v5Am6ty1pkkwnwoDFmKGl
 A6WTekISQEPzj0RI=
X-Received: by 2002:a5d:4ecd:0:b0:1ea:910b:7641 with SMTP id
 s13-20020a5d4ecd000000b001ea910b7641mr5652099wrv.103.1645614041640; 
 Wed, 23 Feb 2022 03:00:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyq7P29jHC5f5+dd1ZhPeBwjHu+0KdQsmeivo76i9wSrNjqNGGurbZ2T0GncEQ4qSq+8LAoLA==
X-Received: by 2002:a5d:4ecd:0:b0:1ea:910b:7641 with SMTP id
 s13-20020a5d4ecd000000b001ea910b7641mr5652070wrv.103.1645614041262; 
 Wed, 23 Feb 2022 03:00:41 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id b16sm6004286wmj.32.2022.02.23.03.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 03:00:40 -0800 (PST)
Date: Wed, 23 Feb 2022 11:00:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH] Added parameter to take screenshot with screendump as PNG
Message-ID: <YhYT1i68j/VcSZsD@work-vm>
References: <20220222152758.207415-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220222152758.207415-1-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, armbru@redhat.com, kraxel@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kshitij Suri (kshitij.suri@nutanix.com) wrote:
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added an "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
> 
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
>  hmp-commands.hx    |  11 ++--
>  monitor/hmp-cmds.c |   4 +-
>  qapi/ui.json       |   7 ++-
>  ui/console.c       | 153 ++++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 165 insertions(+), 10 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..2163337f35 100644
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
> +                      "Default format for screendump is PPM.",
>          .cmd        = hmp_screendump,
>          .coroutine  = true,
>      },
>  
>  SRST
>  ``screendump`` *filename*
> -  Save screen into PPM image *filename*.
> +  Save screen as image *filename*.
>  ERST
>  
>      {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 2669156b28..3fb1394561 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1665,9 +1665,11 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *format  = qdict_get_str(qdict, "format");
>      Error *err = NULL;
>  
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   format != NULL, format, &err);
>      hmp_handle_error(mon, err);
>  }

I think that's OK from the HMP front, see some questions below.

> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..9fdb56b60b 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -76,7 +76,7 @@
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Write a screenshot of the VGA screen to a file.
>  #
>  # @filename: the path of a new PPM file to store the image
>  #
> @@ -87,6 +87,9 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump is specified. Currently only PNG and
> +#             PPM are supported.
> +#
>  # Returns: Nothing on success
>  #
>  # Since: 0.14
> @@ -99,7 +102,7 @@
>  #
>  ##
>  { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'str'},
>    'coroutine': true }
>  
>  ##
> diff --git a/ui/console.c b/ui/console.c
> index 40eebb6d2c..7813b195ac 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>  #include "exec/memory.h"
>  #include "io/channel-file.h"
>  #include "qom/object.h"
> +#ifdef CONFIG_VNC_PNG
> +#include "png.h"
> +#endif
>  
>  #define DEFAULT_BACKSCROLL 512
>  #define CONSOLE_CURSOR_PERIOD 500
> @@ -289,6 +292,137 @@ void graphic_hw_invalidate(QemuConsole *con)
>      }
>  }
>  
> +#ifdef CONFIG_VNC_PNG
> +/**
> + * a8r8g8b8_to_rgba: Convert a8r8g8b8 to rgba format
> + *
> + * @dst: Destination pointer.
> + * @src: Source pointer.
> + * @n_pixels: Size of image.
> + */
> +static void a8r8g8b8_to_rgba(uint32_t *dst, uint32_t *src, int n_pixels)
> +{
> +    uint8_t *dst8 = (uint8_t *)dst;
> +    int i;
> +
> +    for (i = 0; i < n_pixels; ++i) {
> +        uint32_t p = src[i];
> +        uint8_t a, r, g, b;
> +
> +        a = (p & 0xff000000) >> 24;
> +        r = (p & 0x00ff0000) >> 16;
> +        g = (p & 0x0000ff00) >> 8;
> +        b = (p & 0x000000ff) >> 0;
> +
> +        if (a != 0) {
> +            #define DIVIDE(c, a) \
> +            do { \
> +                int t = ((c) * 255) / a; \
> +                (c) = t < 0 ? 0 : t > 255 ? 255 : t; \

I can't see how 't' can be less than 0 here?

> +            } while (0)
> +
> +            DIVIDE(r, a);
> +            DIVIDE(g, a);
> +            DIVIDE(b, a);
> +            #undef DIVIDE
> +        }
> +
> +        *dst8++ = r;
> +        *dst8++ = g;
> +        *dst8++ = b;
> +        *dst8++ = a;
> +    }
> +}

Now, I'm not too much of a graphics person, but I'm a bit confused; this
seems to be applying the alpha scaling to the r/g/b/ data - but then
still including the alpha value in the output; doesn't that mean that
the thing displaying the result will also apply the alpha scaling again?

> +/**
> + * png_save: Take a screenshot as PNG
> + *
> + * Saves screendump as a PNG file
> + *
> + * Returns true for success or false for error.
> + * Inspired from png test utils from https://github.com/aseprite/pixman
> + *
> + * @fd: File descriptor for PNG file.
> + * @image: Image data in pixman format.
> + * @errp: Pointer to an error.
> + */
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    int stride = width * 4;
> +    g_autofree uint32_t *src_data = g_malloc(height * stride);
> +    g_autofree uint32_t *dest_data = g_malloc(height * stride);
> +    g_autoptr(pixman_image_t) src_copy;
> +    g_autoptr(pixman_image_t) dest_copy;
> +    g_autofree png_struct *write_struct;
> +    g_autofree png_info *info_struct;
> +    g_autofree png_bytep *row_pointers = g_malloc(height * sizeof(png_bytep));
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg(errp, "Failed to create file from file descriptor");
> +        return false;
> +    }
> +
> +    src_copy = pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height,
> +                                        src_data, stride);
> +
> +    pixman_image_composite32(PIXMAN_OP_SRC, image, NULL, src_copy, 0, 0, 0, 0,
> +                             0, 0, width, height);

Nothing in the rest of qemu uses pixman_image_composite*32* - all the
rest uses the plain version; what's the difference?

> +    memcpy(dest_data, src_data, sizeof(*src_data));

Why if you're just about to nuke dest_data with the converted version?

> +    a8r8g8b8_to_rgba(dest_data, src_data, height * width);
> +
> +    for (y = 0; y < height; ++y) {
> +        row_pointers[y] = (png_bytep)(src_data + y * width);
> +    }
> +
> +    write_struct = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                                 NULL, NULL);
> +    if (!write_struct) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        return false;
> +    }
> +
> +    info_struct = png_create_info_struct(write_struct);
> +
> +    if (!info_struct) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        return false;
> +    }
> +
> +    png_init_io(write_struct, f);
> +
> +    png_set_IHDR(write_struct, info_struct, width, height, 8,
> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
> +
> +    png_write_info(write_struct, info_struct);
> +
> +    png_write_image(write_struct, row_pointers);

Had you considered using png_write_row and avoiding having to
hold/allocate the destination and row_pointers at all?
(In actual fact, can you steal the code in ui/vnc-enc-tight.c
send_png_rect ? )

Dave

> +    png_write_end(write_struct, NULL);
> +
> +    if (fclose(f) != 0) {
> +        error_setg(errp, "PNG creation failed. Unable to close file");
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
> +    error_setg(errp, "Enable VNC PNG support for png screendump");
> +    return false;
> +}
> +
> +#endif /* CONFIG_VNC_PNG */
> +
>  static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>  {
>      int width = pixman_image_get_width(image);
> @@ -327,7 +461,8 @@ static void graphic_hw_update_bh(void *con)
>  /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>  void coroutine_fn
>  qmp_screendump(const char *filename, bool has_device, const char *device,
> -               bool has_head, int64_t head, Error **errp)
> +               bool has_head, int64_t head, bool has_format,
> +               const char *format, Error **errp)
>  {
>      g_autoptr(pixman_image_t) image = NULL;
>      QemuConsole *con;
> @@ -383,8 +518,22 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>       * yields and releases the BQL. It could produce corrupted dump, but
>       * it should be otherwise safe.
>       */
> -    if (!ppm_save(fd, image, errp)) {
> +
> +    if (has_format && strcmp(format, "png") == 0) {
> +        /* PNG format specified for screendump */
> +        if (!png_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else if (!has_format || (has_format && strcmp(format, "ppm") == 0)) {
> +        /* PPM format specified/default for screendump */
> +        if (!ppm_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else {
> +        /* Invalid specified for screendump */
> +        error_setg(errp, "Invalid format provided for screendump.");
>          qemu_unlink(filename);
> +        return;
>      }
>  }
>  
> -- 
> 2.22.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


