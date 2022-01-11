Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA82548B41D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:36:09 +0100 (CET)
Received: from localhost ([::1]:52116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7L45-0002E4-1i
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:36:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Kpj-0000Li-Lm
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:21:19 -0500
Received: from [2607:f8b0:4864:20::a32] (port=37525
 helo=mail-vk1-xa32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Kpf-0000S7-S0
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:21:19 -0500
Received: by mail-vk1-xa32.google.com with SMTP id l68so10859424vkh.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W9kOReSb8kfgfdAUrTxJvZpI8yZ0002WAEM9DnvJNg4=;
 b=gsU4UepkvbhshSFISocyEQDc/p3pGKBQc8HhAYYSJYpf5YVxyl3ybGoYroXj7wZBlZ
 zH9lVwtKw+w3Wa+ae+voks61A7aPBHZJTXQyhMRr1BG+o4KeHbsWiUmRL4FghTNktjoa
 Z6TUMuB0X/jTHjjpptmCmiPOj9gykv8y6p96vUiGj+GWp489Wlak3zr6qJUOgAiEq2U6
 MONX4gm1SH+Ndl2HtiicRDg8VHzusHSJf7Fim8rpqZx0m1BnQC3z9qMdNd4pQ8T7sgHH
 rm4odCYfVpS4EoaZd3DB5wd5nBrP4ECo/cTAPPKzaQjM1wKWuE0/CLHqXIRg8zdwtX3q
 j5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W9kOReSb8kfgfdAUrTxJvZpI8yZ0002WAEM9DnvJNg4=;
 b=tF4QnXDYMz9HUBz4ORuP4O1AaTG3hW8c9LIpqmAUu3IESEyAGGoyEpPAFN/55iRezG
 vSedOPBo+1X8jTyymRVHE7VflQ2DUXvRnBgUJFOlbstKR1o9gQTMaIhLr/CRkE5CXrzB
 d5DOFzzERIKh48D/McJNGAaTWmDmotYIfy/E3x3MqJ0YEU2NbTTegE8WVKx5ptOG2Pgv
 4cIOTjyKAQJiYGlYcXhiPiyd/I/m7CxkiqyJyQAHF9WrazdO0uAZ75gRhhUJ1CRghUia
 Kr0nAZPKKhUIynw4U//jT95ZPpIpyBc0qXjkxrKXc1lvjXswAmbeypbYeIR3oVEjKTTe
 LZww==
X-Gm-Message-State: AOAM5325anYmt6chJMOcx9Bc5cqAeh8jSLnyrQxVrfdxFDX4z2qnrPQ4
 qBaAUDqgfSpze41Wi8eMo5Q5FA==
X-Google-Smtp-Source: ABdhPJw29sytGtX5K4YDi/l2Yg+orCVXsgc79fEE0R2kiPUn7C7faYrptKFCAUP6bhv3aobIqhg7WA==
X-Received: by 2002:a05:6122:1347:: with SMTP id
 f7mr2933840vkp.40.1641921674490; 
 Tue, 11 Jan 2022 09:21:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u33sm6178045uau.7.2022.01.11.09.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:21:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 812B61FFB7;
 Tue, 11 Jan 2022 17:21:11 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-9-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 8/8] tools/vhost-user-video: Add initial
 vhost-user-video vmm
Date: Tue, 11 Jan 2022 16:38:52 +0000
In-reply-to: <20211209145601.331477-9-peter.griffin@linaro.org>
Message-ID: <87fspub33s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alex.bennee@linaro.org; helo=mail-vk1-xa32.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_OTHER_BAD_TLD=1.851,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Griffin <peter.griffin@linaro.org> writes:

> This vmm translates from virtio-video v3 protocol and writes
> to a v4l2 mem2mem stateful decoder/encoder device [1]. v3 was
> chosen as that is what the virtio-video Linux frontend driver
> implements.
>
> This allows for testing with the v4l2 vicodec test codec [2]
> module in the Linux kernel, and is intended to also be used
> with Arm SoCs that implement a v4l2 stateful decoder/encoder
> drivers.
>
> The advantage of developing & testing with vicodec is that
> is allows quick development on a purely virtual setup with
> qemu and a host Linux kernel. Also it allows ci systems like
> lkft, kernelci to easily test the virtio interface.
>
> Currently conversion from virtio-video to v4l2 stateless m2m
> codec driver or VAAPI drivers is consiered out ot scope as
> is emulation of a decoder device using a something like ffmpeg.
> Although this could be added in the future.
>
> Note some virtio & v4l2 helpers were based off virtio-video
> Linux frontend driver and yavta utility, both GPL v2.
>
> Example host commands
>  modprobe vicodec
>  vhost-user-video --v4l2-device=3D/dev/video3 -v --socket-path=3Dvideo.so=
ck
>
> Run Qemu with
>  -device vhost-user-video-pci,chardev=3Dvideo,id=3Dvideo
>
> Guest decoder
>  v4l2-ctl -d0 -x width=3D640,height=3D480 -v width=3D640,height=3D480,pix=
elformat=3DYU12
>    --stream-mmap --stream-out-mmap --stream-from jelly_640_480-420P.fwht
>    --stream-to out-jelly-640-480.YU12
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/
>     v4l/dev-decoder.html
>
> [2] https://lwn.net/Articles/760650/
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  tools/vhost-user-video/50-qemu-rpmb.json.in   |    5 +
>  tools/vhost-user-video/main.c                 | 1680 ++++++++++++++++
>  tools/vhost-user-video/meson.build            |   10 +
>  tools/vhost-user-video/v4l2_backend.c         | 1777 +++++++++++++++++
>  tools/vhost-user-video/v4l2_backend.h         |   99 +
>  tools/vhost-user-video/virtio_video_helpers.c |  462 +++++
>  tools/vhost-user-video/virtio_video_helpers.h |  166 ++
>  tools/vhost-user-video/vuvideo.h              |   43 +
>  8 files changed, 4242 insertions(+)
>  create mode 100644 tools/vhost-user-video/50-qemu-rpmb.json.in
>  create mode 100644 tools/vhost-user-video/main.c
>  create mode 100644 tools/vhost-user-video/meson.build
>  create mode 100644 tools/vhost-user-video/v4l2_backend.c
>  create mode 100644 tools/vhost-user-video/v4l2_backend.h
>  create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
>  create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
>  create mode 100644 tools/vhost-user-video/vuvideo.h
>
> diff --git a/tools/vhost-user-video/50-qemu-rpmb.json.in b/tools/vhost-us=
er-video/50-qemu-rpmb.json.in
> new file mode 100644
> index 0000000000..2b033cda56
> --- /dev/null
> +++ b/tools/vhost-user-video/50-qemu-rpmb.json.in
> @@ -0,0 +1,5 @@
> +{
> +  "description": "QEMU vhost-user-rpmb",
> +  "type": "block",
> +  "binary": "@libexecdir@/vhost-user-rpmb"
> +}

I'm spotting a copy and paste error here (filename, description and binary).

> diff --git a/tools/vhost-user-video/main.c b/tools/vhost-user-video/main.c
> new file mode 100644
> index 0000000000..a944efadb6
> --- /dev/null
> +++ b/tools/vhost-user-video/main.c
> @@ -0,0 +1,1680 @@
> +/*
> + * VIRTIO Video Emulation via vhost-user
> + *
> + * Copyright (c) 2021 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#define G_LOG_DOMAIN "vhost-user-video"
> +#define G_LOG_USE_STRUCTURED 1
> +
> +#include <glib.h>
> +#include <gio/gio.h>
> +#include <gio/gunixsocketaddress.h>
> +#include <glib-unix.h>
> +#include <glib/gstdio.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <inttypes.h>
> +#include <fcntl.h>
> +#include <sys/ioctl.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +#include <endian.h>
> +#include <assert.h>
> +
> +#include "libvhost-user-glib.h"
> +#include "libvhost-user.h"
> +#include "standard-headers/linux/virtio_video.h"
> +
> +#include "qemu/compiler.h"
> +#include "qemu/iov.h"
> +
> +#include "vuvideo.h"
> +#include "v4l2_backend.h"
> +#include "virtio_video_helpers.h"
> +
> +#ifndef container_of
> +#define container_of(ptr, type, member) ({                      \
> +        const typeof(((type *) 0)->member) * __mptr =3D (ptr);     \
> +        (type *) ((char *) __mptr - offsetof(type, member)); })
> +#endif
> +
> +static gchar *socket_path;
> +static gchar *v4l2_path;
> +static gint socket_fd =3D -1;
> +static gboolean print_cap;
> +static gboolean verbose;
> +static gboolean debug;
> +
> +static GOptionEntry options[] =3D {
> +    { "socket-path", 0, 0, G_OPTION_ARG_FILENAME, &socket_path,
> +      "Location of vhost-user Unix domain socket, "
> +      "incompatible with --fd", "PATH" },
> +    { "v4l2-device", 0, 0, G_OPTION_ARG_FILENAME, &v4l2_path,
> +      "Location of v4l2 device node", "PATH" },
> +    { "fd", 0, 0, G_OPTION_ARG_INT, &socket_fd,
> +      "Specify the fd of the backend, "
> +      "incompatible with --socket-path", "FD" },
> +    { "print-capabilities", 0, 0, G_OPTION_ARG_NONE, &print_cap,
> +      "Output to stdout the backend capabilities "
> +      "in JSON format and exit", NULL},
> +    { "verbose", 'v', 0, G_OPTION_ARG_NONE, &verbose,
> +      "Be more verbose in output", NULL},
> +    { "debug", 0, 0, G_OPTION_ARG_NONE, &debug,
> +      "Include debug output", NULL},
> +    { NULL }
> +};
> +
> +enum {
> +    VHOST_USER_VIDEO_MAX_QUEUES =3D 2,
> +};
> +
> +/* taken from util/iov.c */
> +size_t video_iov_size(const struct iovec *iov, const unsigned int iov_cn=
t)
> +{
> +    size_t len;
> +    unsigned int i;
> +
> +    len =3D 0;
> +    for (i =3D 0; i < iov_cnt; i++) {
> +        len +=3D iov[i].iov_len;
> +    }
> +    return len;
> +}
> +
> +static size_t video_iov_to_buf(const struct iovec *iov,
> +                               const unsigned int iov_cnt,
> +                               size_t offset, void *buf, size_t bytes)
> +{
> +    size_t done;
> +    unsigned int i;
> +    for (i =3D 0, done =3D 0; (offset || done < bytes) && i < iov_cnt; i=
++) {
> +        if (offset < iov[i].iov_len) {
> +            size_t len =3D MIN(iov[i].iov_len - offset, bytes - done);
> +            memcpy(buf + done, iov[i].iov_base + offset, len);
> +            done +=3D len;
> +            offset =3D 0;
> +        } else {
> +            offset -=3D iov[i].iov_len;
> +        }
> +    }
> +    assert(offset =3D=3D 0);
> +    return done;
> +}
> +
> +static size_t video_iov_from_buf(const struct iovec *iov, unsigned int i=
ov_cnt,
> +                                 size_t offset, const void *buf, size_t =
bytes)
> +{
> +    size_t done;
> +    unsigned int i;
> +    for (i =3D 0, done =3D 0; (offset || done < bytes) && i < iov_cnt; i=
++) {
> +        if (offset < iov[i].iov_len) {
> +            size_t len =3D MIN(iov[i].iov_len - offset, bytes - done);
> +            memcpy(iov[i].iov_base + offset, buf + done, len);
> +            done +=3D len;
> +            offset =3D 0;
> +        } else {
> +            offset -=3D iov[i].iov_len;
> +        }
> +    }
> +    assert(offset =3D=3D 0);
> +    return done;
> +}
> +
> +static void video_panic(VuDev *dev, const char *msg)
> +{
> +    g_critical("%s\n", msg);
> +    exit(EXIT_FAILURE);
> +}
> +
> +static uint64_t video_get_features(VuDev *dev)
> +{
> +    g_info("%s: replying", __func__);
> +    return 0;
> +}
> +
> +static void video_set_features(VuDev *dev, uint64_t features)
> +{
> +    if (features) {
> +        g_autoptr(GString) s =3D g_string_new("Requested un-handled feat=
ure");
> +        g_string_append_printf(s, " 0x%" PRIx64 "", features);
> +        g_info("%s: %s", __func__, s->str);
> +    }
> +}
> +
> +/*
> + * The configuration of the device is static and set when we start the
> + * daemon.
> + */
> +static int
> +video_get_config(VuDev *dev, uint8_t *config, uint32_t len)
> +{
> +    VuVideo *v =3D container_of(dev, VuVideo, dev.parent);
> +
> +    g_return_val_if_fail(len <=3D sizeof(struct virtio_video_config), -1=
);
> +    v->virtio_config.version =3D 0;
> +    v->virtio_config.max_caps_length =3D MAX_CAPS_LEN;
> +    v->virtio_config.max_resp_length =3D MAX_CAPS_LEN;
> +
> +    memcpy(config, &v->virtio_config, len);
> +
> +    g_debug("%s: config.max_caps_length =3D %d", __func__
> +           , ((struct virtio_video_config *)config)->max_caps_length);
> +    g_debug("%s: config.max_resp_length =3D %d", __func__
> +           , ((struct virtio_video_config *)config)->max_resp_length);
> +
> +    return 0;
> +}
> +
> +static int
> +video_set_config(VuDev *dev, const uint8_t *data,
> +                 uint32_t offset, uint32_t size,
> +                 uint32_t flags)
> +{
> +    g_debug("%s: ", __func__);
> +    /* ignore */
> +    return 0;
> +}
> +
> +/*
> + * Handlers for individual control messages
> + */
> +
> +static void
> +handle_set_params_cmd(struct VuVideo *v, struct vu_video_ctrl_command *v=
io_cmd)
> +{
> +    int ret =3D 0;
> +    enum v4l2_buf_type buf_type;
> +    struct virtio_video_set_params *cmd =3D
> +        (struct virtio_video_set_params *) vio_cmd->cmd_buf;
> +    struct stream *s;
> +
> +    g_debug("%s: type(x%x) stream_id(%d) %s ", __func__,
> +            cmd->hdr.type, cmd->hdr.stream_id,
> +            vio_queue_name(le32toh(cmd->params.queue_type)));
> +    g_debug("%s: format=3D0x%x frame_width(%d) frame_height(%d)",
> +            __func__, le32toh(cmd->params.format),
> +            le32toh(cmd->params.frame_width),
> +            le32toh(cmd->params.frame_height));
> +    g_debug("%s: min_buffers(%d) max_buffers(%d)", __func__,
> +            le32toh(cmd->params.min_buffers), le32toh(cmd->params.max_bu=
ffers));
> +    g_debug("%s: frame_rate(%d) num_planes(%d)", __func__,
> +            le32toh(cmd->params.frame_rate), le32toh(cmd->params.num_pla=
nes));
> +    g_debug("%s: crop top=3D%d, left=3D%d, width=3D%d, height=3D%d", __f=
unc__,
> +            le32toh(cmd->params.crop.left), le32toh(cmd->params.crop.top=
),
> +            le32toh(cmd->params.crop.width), le32toh(cmd->params.crop.he=
ight));
> +
> +    s =3D find_stream(v, cmd->hdr.stream_id);
> +    if (!s) {
> +        g_critical("%s: stream_id(%d) not found", __func__, cmd->hdr.str=
eam_id);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }

I think you can just return from here as no clean-up is required.

> +
> +    g_mutex_lock(&s->mutex);

It is possible to use the g_autofree stuff to simplify this but as we
are avoiding bringing in QEMU code we can't use WITH_QEMU_LOCK_GUARD :-/

> +
> +    buf_type =3D get_v4l2_buf_type(le32toh(cmd->params.queue_type),
> +                                 s->has_mplane);
> +
> +    ret =3D v4l2_video_set_format(s->fd, buf_type, &cmd->params);
> +    if (ret < 0) {
> +        g_error("%s: v4l2_video_set_format() failed", __func__);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out_unlock;
> +    }
> +
> +    if (is_capture_queue(buf_type)) {
> +        /* decoder supports composing on CAPTURE */
> +        struct v4l2_selection sel;
> +        memset(&sel, 0, sizeof(struct v4l2_selection));
> +
> +        sel.r.left =3D le32toh(cmd->params.crop.left);
> +        sel.r.top =3D le32toh(cmd->params.crop.top);
> +        sel.r.width =3D le32toh(cmd->params.crop.width);
> +        sel.r.height =3D le32toh(cmd->params.crop.height);
> +
> +        ret =3D v4l2_video_set_selection(s->fd, buf_type, &sel);
> +        if (ret < 0) {
> +            g_printerr("%s: v4l2_video_set_selection failed: %s (%d).\n"
> +                       , __func__, g_strerror(errno), errno);
> +            cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +            goto out_unlock;
> +        }
> +    }
> +
> +    cmd->hdr.type =3D VIRTIO_VIDEO_RESP_OK_NODATA;
> +
> +out_unlock:
> +    vio_cmd->finished =3D true;
> +    send_ctrl_response_nodata(vio_cmd);
> +    g_mutex_unlock(&s->mutex);
> +out:
> +    return;
> +}
> +
> +static void
> +handle_get_params_cmd(struct VuVideo *v, struct vu_video_ctrl_command *v=
io_cmd)
> +{
> +    int ret;
> +    struct v4l2_format fmt;
> +    struct v4l2_selection sel;
> +    enum v4l2_buf_type buf_type;
> +    struct virtio_video_get_params *cmd =3D
> +        (struct virtio_video_get_params *) vio_cmd->cmd_buf;
> +    struct virtio_video_get_params_resp getparams_reply;
> +    struct stream *s;
> +
> +    g_debug("%s: type(0x%x) stream_id(%d) %s", __func__,
> +            cmd->hdr.type, cmd->hdr.stream_id,
> +            vio_queue_name(le32toh(cmd->queue_type)));
> +
> +    s =3D find_stream(v, cmd->hdr.stream_id);
> +    if (!s) {
> +        g_critical("%s: stream_id(%d) not found\n"
> +                   , __func__, cmd->hdr.stream_id);
> +        getparams_reply.hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAM=
ETER;
> +        goto out;
> +    }
> +
> +    g_mutex_lock(&s->mutex);
> +
> +    getparams_reply.hdr.stream_id =3D cmd->hdr.stream_id;
> +    getparams_reply.params.queue_type =3D cmd->queue_type;
> +
> +    buf_type =3D get_v4l2_buf_type(cmd->queue_type, s->has_mplane);
> +
> +    ret =3D v4l2_video_get_format(s->fd, buf_type, &fmt);
> +    if (ret < 0) {
> +        g_printerr("v4l2_video_get_format failed\n");
> +        getparams_reply.hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAM=
ETER;
> +        goto out_unlock;
> +    }
> +
> +    if (is_capture_queue(buf_type)) {
> +        ret =3D v4l2_video_get_selection(s->fd, buf_type, &sel);
> +        if (ret < 0) {
> +            g_printerr("v4l2_video_get_selection failed\n");
> +            getparams_reply.hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_P=
ARAMETER;
> +            goto out_unlock;
> +        }
> +    }
> +
> +    /* convert from v4l2 to virtio */
> +    v4l2_to_virtio_video_params(v->v4l2_dev, &fmt, &sel,
> +                                &getparams_reply);
> +
> +    getparams_reply.hdr.type =3D VIRTIO_VIDEO_RESP_OK_GET_PARAMS;
> +
> +out_unlock:
> +    vio_cmd->finished =3D true;
> +    send_ctrl_response(vio_cmd, (uint8_t *)&getparams_reply,
> +                       sizeof(struct virtio_video_get_params_resp));
> +    g_mutex_unlock(&s->mutex);
> +out:
> +    return;
> +}
> +
> +struct stream *find_stream(struct VuVideo *v, uint32_t stream_id)
> +{
> +    GList *l;
> +    struct stream *s;
> +
> +    for (l =3D v->streams; l !=3D NULL; l =3D l->next) {
> +        s =3D (struct stream *)l->data;
> +        if (s->stream_id =3D=3D stream_id) {
> +            return s;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +int add_resource(struct stream *s, struct resource *r, uint32_t queue_ty=
pe)
> +{
> +
> +    if (!s || !r) {
> +        return -EINVAL;
> +    }
> +
> +    switch (queue_type) {
> +    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
> +        s->inputq_resources =3D g_list_append(s->inputq_resources, r);
> +        break;
> +
> +    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
> +        s->outputq_resources =3D g_list_append(s->outputq_resources, r);
> +        break;
> +    default:
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +void free_resource_mem(struct resource *r)
> +{
> +
> +    /*
> +     * Frees the memory allocated for resource_queue_cmd
> +     * not the memory allocated in resource_create
> +     */
> +
> +    if (r->vio_q_cmd) {
> +        g_free(r->vio_q_cmd->cmd_buf);
> +        r->vio_q_cmd->cmd_buf =3D NULL;
> +        free(r->vio_q_cmd);
> +        r->vio_q_cmd =3D NULL;
> +    }
> +}
> +
> +void remove_all_resources(struct stream *s, uint32_t queue_type)
> +{
> +    GList **resource_list;
> +    struct resource *r;
> +
> +    /* assumes stream mutex is held by caller */
> +
> +    switch (queue_type) {
> +    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
> +        resource_list =3D  &s->inputq_resources;
> +        break;
> +    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
> +        resource_list =3D &s->outputq_resources;
> +        break;
> +    default:
> +        g_critical("%s: Invalid virtio queue!", __func__);
> +        return;
> +    }
> +
> +    g_debug("%s: resource_list has %d elements", __func__
> +            , g_list_length(*resource_list));
> +
> +    GList *l =3D *resource_list;
> +    while (l !=3D NULL) {
> +        GList *next =3D l->next;
> +        r =3D (struct resource *)l->data;
> +        if (r) {
> +            g_debug("%s: Removing resource_id(%d) resource=3D%p"
> +                    , __func__, r->vio_resource.resource_id, r);
> +
> +            /*
> +             * Assumes that either QUEUE_CLEAR or normal dequeuing
> +             * of buffers will have freed resource_queue cmd memory
> +             */
> +
> +            /* free resource memory allocated in resource_create() */
> +            g_free(r->iov);
> +            g_free(r);
> +            *resource_list =3D g_list_delete_link(*resource_list, l);
> +        }
> +        l =3D next;
> +   }
> +}
> +
> +struct resource *find_resource(struct stream *s, uint32_t resource_id,
> +                                uint32_t queue_type)
> +{
> +    GList *l;
> +    struct resource *r;
> +
> +    switch (queue_type) {
> +    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
> +        l =3D s->inputq_resources;
> +        break;
> +
> +    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
> +        l =3D s->outputq_resources;
> +        break;
> +    default:
> +        g_error("%s: Invalid queue type!", __func__);
> +    }
> +
> +    for (; l !=3D NULL; l =3D l->next) {
> +        r =3D (struct resource *)l->data;
> +        if (r->vio_resource.resource_id =3D=3D resource_id) {
> +            return r;
> +        }
> +    }

Given the iteration here would it be worth tracking the struct resource
in a GArray rather than chasing pointers in a linked list?

> +
> +    return NULL;
> +}
> +
> +struct resource *find_resource_by_v4l2index(struct stream *s,
> +                                             enum v4l2_buf_type buf_type,
> +                                             uint32_t v4l2_index)
> +{
> +    GList *l =3D NULL;
> +    struct resource *r;
> +
> +    switch (buf_type) {
> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +        l =3D s->outputq_resources;
> +        break;
> +
> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +        l =3D s->inputq_resources;
> +        break;
> +
> +    default:
> +        g_error("Unsupported buffer type\n");
> +    }
> +
> +    for (; l !=3D NULL; l =3D l->next) {
> +        r =3D (struct resource *)l->data;
> +        if (r->v4l2_index =3D=3D v4l2_index) {
> +            g_debug("%s: found Resource=3D%p streamid(%d) resourceid(%d)=
 "
> +                    "numplanes(%d) planes_layout(0x%x) vio_q_cmd=3D%p", =
__func__,
> +                    r, r->stream_id, r->vio_resource.resource_id,
> +                    r->vio_resource.num_planes, r->vio_resource.planes_l=
ayout,
> +                    r->vio_q_cmd);
> +            return r;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +#define EVENT_WQ_IDX 1
> +
> +static void *stream_worker_thread(gpointer data)
> +{
> +    int ret;
> +    struct stream *s =3D data;
> +    VuVideo *v =3D s->video;
> +    VugDev *vugdev =3D &v->dev;
> +    VuDev *vudev =3D &vugdev->parent;
> +    VuVirtq *vq =3D vu_get_queue(vudev, EVENT_WQ_IDX);
> +    VuVirtqElement *elem;
> +    size_t len;
> +
> +    struct v4l2_event ev;
> +    struct virtio_video_event vio_event;
> +
> +    /* select vars */
> +    fd_set efds, rfds, wfds;
> +    bool have_event, have_read, have_write;
> +    enum v4l2_buf_type buf_type;
> +
> +    fcntl(s->fd, F_SETFL, fcntl(s->fd, F_GETFL) | O_NONBLOCK);
> +
> +    while (true) {
> +            int res;
> +
> +            g_mutex_lock(&s->mutex);
> +
> +            /* wait for STREAMING or DESTROYING state */
> +            while (s->stream_state !=3D STREAM_DESTROYING &&
> +                   s->stream_state !=3D STREAM_STREAMING &&
> +                   s->stream_state !=3D STREAM_DRAINING)
> +                g_cond_wait(&s->stream_cond, &s->mutex);
> +
> +            if (s->stream_state =3D=3D STREAM_DESTROYING) {
> +                g_debug("stream worker thread exiting!");
> +                s->stream_state =3D STREAM_DESTROYED;
> +                g_cond_signal(&s->stream_cond);
> +                g_mutex_unlock(&s->mutex);
> +                g_thread_exit(0);
> +            }
> +
> +            g_mutex_unlock(&s->mutex);
> +
> +            FD_ZERO(&efds);
> +            FD_SET(s->fd, &efds);
> +            FD_ZERO(&rfds);
> +            FD_SET(s->fd, &rfds);
> +            FD_ZERO(&wfds);
> +            FD_SET(s->fd, &wfds);
> +
> +            struct timeval tv =3D { 0 , 500000 };
> +            res =3D select(s->fd + 1, &rfds, &wfds, &efds, &tv);
> +            if (res < 0) {
> +                g_printerr("%s:%d - select() failed errno(%s)\n", __func=
__,
> +                           __LINE__, g_strerror(errno));
> +                break;
> +            }
> +
> +            if (res =3D=3D 0) {
> +                g_debug("%s:%d - select() timeout", __func__, __LINE__);
> +                continue;
> +            }
> +
> +            have_event =3D FD_ISSET(s->fd, &efds);
> +            have_read =3D FD_ISSET(s->fd, &rfds);
> +            have_write =3D FD_ISSET(s->fd, &wfds);
> +            /* read is capture queue, write is output queue */
> +
> +            g_debug("%s:%d have_event=3D%d, have_write=3D%d, have_read=
=3D%d\n"
> +                    , __func__, __LINE__, FD_ISSET(s->fd, &efds)
> +                    , FD_ISSET(s->fd, &wfds), FD_ISSET(s->fd, &rfds));
> +
> +            g_mutex_lock(&s->mutex);
> +
> +            if (have_event) {
> +                g_debug("%s: have_event!", __func__);
> +                res =3D ioctl(s->fd, VIDIOC_DQEVENT, &ev);
> +                if (res < 0) {
> +                    g_printerr("%s:%d - VIDIOC_DQEVENT failed: errno(%s)=
\n",
> +                               __func__, __LINE__, g_strerror(errno));
> +                    break;
> +                }
> +                v4l2_to_virtio_event(&ev, &vio_event);
> +
> +                /* get event workqueue */
> +                elem =3D vu_queue_pop(vudev, vq, sizeof(struct VuVirtqEl=
ement));
> +                if (!elem) {
> +                    g_debug("%s:%d\n", __func__, __LINE__);
> +                    break;
> +                }
> +
> +                len =3D video_iov_from_buf(elem->in_sg,
> +                                         elem->in_num, 0, (void *) &vio_=
event,
> +                                         sizeof(struct virtio_video_even=
t));
> +
> +                vu_queue_push(vudev, vq, elem, len);
> +                vu_queue_notify(vudev, vq);
> +            }
> +
> +            if (have_read && s->capture_streaming =3D=3D true) {
> +                /* TODO assumes decoder */
> +                buf_type =3D s->has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE=
_MPLANE
> +                    : V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +
> +                ret =3D v4l2_dequeue_buffer(s->fd, buf_type, s);
> +                if (ret < 0) {
> +                    g_info("%s: v4l2_dequeue_buffer() failed CAPTURE ret=
(%d)"
> +                           , __func__, ret);
> +
> +                    if (errno =3D=3D EPIPE) {
> +                        /* dequeued last buf, so stop streaming */
> +                        ioctl_streamoff(s, buf_type);
> +                    }
> +                 }
> +            }
> +
> +            if (have_write  && s->output_streaming =3D=3D true) {
> +                buf_type =3D s->has_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_=
MPLANE
> +                    : V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +
> +                ret =3D v4l2_dequeue_buffer(s->fd, buf_type, s);
> +                if (ret < 0) {
> +                    g_info("%s: v4l2_dequeue_buffer() failed OUTPUT ret(=
%d)"
> +                           , __func__, ret);
> +                }
> +            }
> +
> +            g_mutex_unlock(&s->mutex);
> +    }
> +
> +    return NULL;
> +}
> +
> +void handle_queue_clear_cmd(struct VuVideo *v,
> +                       struct vu_video_ctrl_command *vio_cmd)
> +{
> +    struct virtio_video_queue_clear *cmd =3D
> +        (struct virtio_video_queue_clear *)vio_cmd->cmd_buf;
> +    int ret =3D 0;
> +    struct stream *s;
> +    uint32_t stream_id =3D le32toh(cmd->hdr.stream_id);
> +    enum virtio_video_queue_type queue_type =3D le32toh(cmd->queue_type);
> +
> +    g_debug("%s: stream_id(%d) %s\n", __func__, stream_id,
> +            vio_queue_name(queue_type));
> +
> +    if (!v || !cmd) {
> +        return;
> +    }
> +
> +    s =3D find_stream(v, stream_id);
> +    if (!s) {
> +        g_critical("%s: stream_id(%d) not found", __func__, stream_id);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }
> +
> +    g_mutex_lock(&s->mutex);
> +
> +    enum v4l2_buf_type buf_type =3D
> +        get_v4l2_buf_type(le32toh(cmd->queue_type), s->has_mplane);
> +
> +    /*
> +     * QUEUE_CLEAR behaviour from virtio-video spec
> +     * Return already queued buffers back from the input or the output q=
ueue
> +     * of the device. The device SHOULD return all of the buffers from t=
he
> +     * respective queue as soon as possible without pushing the buffers =
through
> +     * the processing pipeline.
> +     *
> +     * From v4l2 PoV we issue a VIDIOC_STREAMOFF on the queue which will=
 abort
> +     * or finish any DMA in progress, unlocks any user pointer buffers l=
ocked
> +     * in physical memory, and it removes all buffers from the incoming =
and
> +     * outgoing queues.
> +     */
> +
> +    /* issue streamoff  */
> +    ret =3D ioctl_streamoff(s, buf_type);
> +    if (ret < 0) {
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out_unlock;
> +    }
> +
> +    /* iterate the queues resources list - and send a reply to each one =
*/
> +
> +    /*
> +     * If the processing was stopped due to VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
> +     * the device MUST respond with VIRTIO_VIDEO_RESP_OK_NODATA as a res=
ponse
> +     * type and VIRTIO_- VIDEO_BUFFER_FLAG_ERR in flags.
> +     */
> +
> +    g_list_foreach(get_resource_list(s, queue_type),
> +                   (GFunc)send_qclear_res_reply, s);
> +
> +    cmd->hdr.type =3D VIRTIO_VIDEO_RESP_OK_NODATA;
> +
> +out_unlock:
> +    vio_cmd->finished =3D true;
> +    send_ctrl_response_nodata(vio_cmd);
> +    g_mutex_unlock(&s->mutex);
> +out:
> +    return;
> +}
> +
> +GList *get_resource_list(struct stream *s, uint32_t queue_type)
> +{
> +    switch (queue_type) {
> +    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
> +        return s->inputq_resources;
> +        break;
> +
> +    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
> +        return s->outputq_resources;
> +        break;
> +    default:
> +        g_critical("%s: Unknown queue type!", __func__);
> +        return NULL;
> +    }
> +}
> +
> +void send_ctrl_response(struct vu_video_ctrl_command *vio_cmd,
> +                       uint8_t *resp, size_t resp_len)
> +{
> +    size_t len;
> +
> +    virtio_video_ctrl_hdr_htole((struct virtio_video_cmd_hdr *)resp);
> +
> +    /* send virtio_video_resource_queue_resp */
> +    len =3D video_iov_from_buf(vio_cmd->elem.in_sg,
> +                             vio_cmd->elem.in_num, 0, resp, resp_len);
> +
> +    if (len !=3D resp_len) {
> +        g_critical("%s: response size incorrect %zu vs %zu",
> +                   __func__, len, resp_len);
> +    }
> +
> +    vu_queue_push(vio_cmd->dev, vio_cmd->vq, &vio_cmd->elem, len);
> +    vu_queue_notify(vio_cmd->dev, vio_cmd->vq);
> +
> +    if (vio_cmd->finished) {
> +        g_free(vio_cmd->cmd_buf);
> +        free(vio_cmd);
> +    }
> +}
> +
> +void send_ctrl_response_nodata(struct vu_video_ctrl_command *vio_cmd)
> +{
> +    send_ctrl_response(vio_cmd, vio_cmd->cmd_buf,
> +                       sizeof(struct virtio_video_cmd_hdr));
> +}
> +
> +void send_qclear_res_reply(gpointer data, gpointer user_data)
> +{
> +    struct resource *r =3D data;
> +    struct vu_video_ctrl_command *vio_cmd =3D r->vio_q_cmd;
> +    struct virtio_video_queue_clear *cmd =3D
> +        (struct virtio_video_queue_clear *) vio_cmd->cmd_buf;
> +    struct virtio_video_resource_queue_resp resp;
> +
> +    /*
> +     * only need to send replies for buffers that are
> +     * inflight
> +     */
> +
> +    if (r->queued) {
> +
> +        resp.hdr.stream_id =3D cmd->hdr.stream_id;
> +        resp.hdr.type =3D VIRTIO_VIDEO_RESP_OK_NODATA;
> +        resp.flags =3D htole32(VIRTIO_VIDEO_BUFFER_FLAG_ERR);
> +        resp.timestamp =3D htole64(r->vio_res_q.timestamp);
> +
> +        g_debug("%s: stream_id=3D%d type=3D0x%x flags=3D0x%x resource_id=
=3D%d t=3D%llx"
> +                , __func__, resp.hdr.stream_id, resp.hdr.type, resp.flag=
s,
> +                r->vio_resource.resource_id, resp.timestamp);
> +
> +        vio_cmd->finished =3D true;
> +        send_ctrl_response(vio_cmd, (uint8_t *) &resp,
> +                           sizeof(struct virtio_video_resource_queue_res=
p));
> +    }
> +    return;
> +}
> +
> +static int
> +handle_resource_create_cmd(struct VuVideo *v,
> +                           struct vu_video_ctrl_command *vio_cmd)
> +{
> +    int ret =3D 0, i;
> +    uint32_t total_entries =3D 0;
> +    uint32_t stream_id ;
> +    struct virtio_video_resource_create *cmd =3D
> +        (struct virtio_video_resource_create *)vio_cmd->cmd_buf;
> +    struct virtio_video_mem_entry *mem;
> +    struct resource *res;
> +    struct virtio_video_resource_create *r;
> +    struct stream *s;
> +    enum virtio_video_mem_type mem_type;
> +
> +    stream_id =3D cmd->hdr.stream_id;
> +
> +    s =3D find_stream(v, stream_id);
> +    if (!s) {
> +        g_critical("%s: stream_id(%d) not found", __func__, stream_id);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }
> +
> +    g_mutex_lock(&s->mutex);
> +
> +    if (le32toh(cmd->resource_id) =3D=3D 0) {
> +        g_critical("%s: resource id 0 is not allowed", __func__);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out_unlock;
> +    }
> +
> +    /* check resource id doesn't already exist */
> +    res =3D find_resource(s, le32toh(cmd->resource_id), le32toh(cmd->que=
ue_type));
> +    if (res) {
> +        g_critical("%s: resource_id:%d already exists"
> +                   , __func__, le32toh(cmd->resource_id));
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
> +        goto out_unlock;
> +    } else {
> +        res =3D g_new0(struct resource, 1);
> +        res->vio_resource.resource_id =3D le32toh(cmd->resource_id);
> +        res->vio_resource.queue_type =3D le32toh(cmd->queue_type);
> +        res->vio_resource.planes_layout =3D le32toh(cmd->planes_layout);
> +
> +        res->vio_resource.num_planes =3D le32toh(cmd->num_planes);
> +        r =3D &res->vio_resource;
> +
> +        ret =3D add_resource(s, res, le32toh(cmd->queue_type));
> +        if (ret) {
> +            g_critical("%s: resource_add id:%d failed"
> +                       , __func__, le32toh(cmd->resource_id));
> +            cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
> +            goto out_unlock;
> +        }
> +
> +        g_debug("%s: resource=3D%p streamid(%d) resourceid(%d) numplanes=
(%d)"
> +                "planes_layout(0x%x) %s",
> +                __func__, res, res->stream_id, r->resource_id, r->num_pl=
anes,
> +                r->planes_layout, vio_queue_name(r->queue_type));
> +    }
> +
> +    if (r->planes_layout & VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE) {
> +        g_debug("%s: streamid(%d) resourceid(%d) planes_layout(0x%x)"
> +                , __func__, res->stream_id, r->resource_id, r->planes_la=
yout);
> +
> +        for (i =3D 0; i < r->num_planes; i++) {
> +            total_entries +=3D le32toh(cmd->num_entries[i]);
> +            g_debug("%s: streamid(%d) resourceid(%d) num_entries[%d]=3D%=
d"
> +                    , __func__, res->stream_id, r->resource_id,
> +                    i, le32toh(cmd->num_entries[i]));
> +        }
> +    } else {
> +        total_entries =3D 1;
> +    }
> +
> +    /*
> +     * virtio_video_resource_create is followed by either
> +     * - struct virtio_video_mem_entry entries[]
> +     *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
> +     * - struct virtio_video_object_entry entries[]
> +     *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
> +     */
> +
> +    if (r->queue_type =3D=3D VIRTIO_VIDEO_QUEUE_TYPE_INPUT) {
> +        mem_type =3D s->vio_stream.in_mem_type;
> +    } else {
> +        mem_type =3D s->vio_stream.out_mem_type;
> +    }
> +    /*
> +     * Followed by either
> +     * - struct virtio_video_mem_entry entries[]
> +     *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
> +     * - struct virtio_video_object_entry entries[]
> +     *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
> +     */
> +
> +    if (mem_type =3D=3D VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES) {
> +        mem =3D (void *)cmd + sizeof(struct virtio_video_resource_create=
);
> +
> +        res->iov =3D g_malloc0(sizeof(struct iovec) * total_entries);
> +        for (i =3D 0; i < total_entries; i++) {
> +            uint64_t len =3D le32toh(mem[i].length);
> +            g_debug("%s: mem[%d] addr=3D0x%lx", __func__
> +                    , i, le64toh(mem[i].addr));
> +
> +            res->iov[i].iov_len =3D le32toh(mem[i].length);
> +            res->iov[i].iov_base =3D
> +                vu_gpa_to_va(&v->dev.parent, &len, le64toh(mem[i].addr));
> +            g_debug("%s: [%d] iov_len =3D 0x%lx", __func__
> +                    , i, res->iov[i].iov_len);
> +            g_debug("%s: [%d] iov_base =3D 0x%p", __func__
> +                    , i, res->iov[i].iov_base);
> +        }
> +        res->iov_count =3D total_entries;
> +
> +    } else if (mem_type =3D=3D VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT) {
> +        g_critical("%s: VIRTIO_OBJECT not implemented!", __func__);
> +        /* TODO implement VIRTIO_OBJECT support */
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out_unlock;
> +    }
> +
> +    /* check underlying driver supports GUEST_PAGES */
> +    enum v4l2_buf_type buf_type =3D
> +        get_v4l2_buf_type(r->queue_type, s->has_mplane);
> +
> +    ret =3D v4l2_resource_create(s, buf_type, mem_type, res);
> +    if (ret < 0) {
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out_unlock;
> +    }
> +
> +    cmd->hdr.type =3D VIRTIO_VIDEO_RESP_OK_NODATA;
> +
> +out_unlock:
> +    /* send response */
> +    vio_cmd->finished =3D true;
> +    send_ctrl_response_nodata(vio_cmd);
> +    g_mutex_unlock(&s->mutex);
> +out:
> +    return ret;
> +}
> +
> +static int
> +handle_resource_queue_cmd(struct VuVideo *v,
> +                          struct vu_video_ctrl_command *vio_cmd)
> +{
> +    struct virtio_video_resource_queue *cmd =3D
> +        (struct virtio_video_resource_queue *)vio_cmd->cmd_buf;
> +    struct resource *res;
> +    struct stream *s;
> +    uint32_t stream_id;
> +    int ret =3D 0;
> +
> +    g_debug("%s: type(0x%x) %s resource_id(%d)", __func__,
> +            cmd->hdr.type, vio_queue_name(le32toh(cmd->queue_type)),
> +            le32toh(cmd->resource_id));
> +    g_debug("%s: num_data_sizes =3D %d", __func__, le32toh(cmd->num_data=
_sizes));
> +    g_debug("%s: data_sizes[0] =3D %d", __func__, le32toh(cmd->data_size=
s[0]));
> +
> +    stream_id =3D cmd->hdr.stream_id;
> +
> +    s =3D find_stream(v, stream_id);
> +    if (!s) {
> +        g_critical("%s: stream_id(%d) not found", __func__, stream_id);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }
> +
> +    g_mutex_lock(&s->mutex);
> +
> +    if (cmd->resource_id =3D=3D 0) {
> +        g_critical("%s: resource id 0 is not allowed", __func__);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
> +        goto out_unlock;
> +    }
> +
> +    /* get resource object */
> +    res =3D find_resource(s, le32toh(cmd->resource_id), le32toh(cmd->que=
ue_type));
> +    if (!res) {
> +        g_critical("%s: resource_id:%d does not exist!"
> +                   , __func__, le32toh(cmd->resource_id));
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
> +        goto out_unlock;
> +    }
> +
> +    res->vio_res_q.timestamp =3D le64toh(cmd->timestamp);
> +    res->vio_res_q.num_data_sizes =3D le32toh(cmd->num_data_sizes);
> +    res->vio_res_q.queue_type =3D le32toh(cmd->queue_type);
> +    res->vio_q_cmd =3D vio_cmd;
> +
> +    g_debug("%s: res=3D%p res->vio_q_cmd=3D0x%p", __func__, res, res->vi=
o_q_cmd);
> +
> +    enum v4l2_buf_type buf_type =3D get_v4l2_buf_type(
> +        cmd->queue_type, s->has_mplane);
> +
> +
> +    ret =3D v4l2_queue_buffer(s->fd, buf_type, cmd, res, s, v->v4l2_dev);
> +    if (ret < 0) {
> +        g_critical("%s: v4l2_queue_buffer failed", __func__);
> +        /* virtio error set by v4l2_queue_buffer */
> +        goto out_unlock;
> +    }
> +
> +    /*
> +     * let the stream worker thread do the dequeueing of output and
> +     * capture queue buffers and send the resource_queue replies
> +     */
> +
> +    g_mutex_unlock(&s->mutex);
> +    return ret;
> +
> +out_unlock:
> +    /* send response */
> +    vio_cmd->finished =3D true;
> +    send_ctrl_response_nodata(vio_cmd);
> +    g_mutex_unlock(&s->mutex);
> +out:
> +    return ret;
> +}
> +
> +
> +static void
> +handle_resource_destroy_all_cmd(struct VuVideo *v,
> +                                struct vu_video_ctrl_command *vio_cmd)
> +{
> +    struct virtio_video_resource_destroy_all *cmd =3D
> +        (struct virtio_video_resource_destroy_all *)vio_cmd->cmd_buf;
> +    enum v4l2_buf_type buf_type;
> +    struct stream *s;
> +    int ret =3D 0;
> +
> +    g_debug("%s: type(0x%x) %s stream_id(%d)", __func__,
> +            cmd->hdr.type, vio_queue_name(le32toh(cmd->queue_type)),
> +            cmd->hdr.stream_id);
> +
> +    s =3D find_stream(v, cmd->hdr.stream_id);
> +    if (!s) {
> +        g_critical("%s: stream_id(%d) not found", __func__, cmd->hdr.str=
eam_id);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }
> +
> +    g_mutex_lock(&s->mutex);
> +
> +    buf_type =3D get_v4l2_buf_type(le32toh(cmd->queue_type), s->has_mpla=
ne);
> +
> +    ret =3D v4l2_free_buffers(s->fd, buf_type);
> +    if (ret) {
> +        g_critical("%s: v4l2_free_buffers() failed", __func__);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }
> +
> +    remove_all_resources(s, le32toh(cmd->queue_type));
> +
> +    /* free resource objects from queue list */
> +    cmd->hdr.type =3D VIRTIO_VIDEO_RESP_OK_NODATA;
> +
> +out:
> +    vio_cmd->finished =3D true;
> +    send_ctrl_response_nodata(vio_cmd);
> +    g_mutex_unlock(&s->mutex);
> +}
> +
> +static void
> +handle_stream_create_cmd(struct VuVideo *v,
> +                         struct vu_video_ctrl_command *vio_cmd)
> +{
> +    int ret =3D 0;
> +    struct stream *s;
> +    uint32_t req_stream_id;
> +    uint32_t coded_format;
> +
> +    struct virtio_video_stream_create *cmd =3D
> +        (struct virtio_video_stream_create *)vio_cmd->cmd_buf;
> +
> +    g_debug("%s: type(0x%x) stream_id(%d) in_mem_type(0x%x) "
> +            "out_mem_type(0x%x) coded_format(0x%x)",
> +            __func__, cmd->hdr.type, cmd->hdr.stream_id,
> +            le32toh(cmd->in_mem_type), le32toh(cmd->out_mem_type),
> +            le32toh(cmd->coded_format));
> +
> +    req_stream_id =3D cmd->hdr.stream_id;
> +    coded_format =3D le32toh(cmd->coded_format);
> +
> +    if ((le32toh(cmd->in_mem_type) =3D=3D VIRTIO_VIDEO_MEM_TYPE_VIRTIO_O=
BJECT) ||
> +        (le32toh(cmd->out_mem_type) =3D=3D VIRTIO_VIDEO_MEM_TYPE_VIRTIO_=
OBJECT)) {
> +        /* TODO implement VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT */
> +        g_printerr("%s: MEM_TYPE_VIRTIO_OBJECT not supported yet", __fun=
c__);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
> +        goto out;
> +    }
> +
> +    if (!find_stream(v, req_stream_id)) {
> +        s =3D g_new0(struct stream, 1);
> +        /* copy but bswap */
> +        s->vio_stream.in_mem_type =3D le32toh(cmd->in_mem_type);
> +        s->vio_stream.out_mem_type =3D le32toh(cmd->out_mem_type);
> +        s->vio_stream.coded_format =3D le32toh(cmd->coded_format);
> +        strncpy((char *)&s->vio_stream.tag, (char *)cmd->tag,
> +                sizeof(cmd->tag) - 1);
> +        s->vio_stream.tag[sizeof(cmd->tag) - 1] =3D 0;
> +        s->stream_id =3D req_stream_id;
> +        s->video =3D v;
> +        s->stream_state =3D STREAM_STOPPED;
> +        s->has_mplane =3D v->v4l2_dev->has_mplane;
> +        g_mutex_init(&s->mutex);
> +        g_cond_init(&s->stream_cond);
> +        v->streams =3D g_list_append(v->streams, s);
> +
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_OK_NODATA;
> +    } else {
> +        g_debug("%s: Stream ID in use - ", __func__);
> +        cmd->hdr.type =3D VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID;
> +        goto out;
> +    }

Couldn't you avoid the goto by folding this in a level:

  if (le32toh....) {
    ...
  } else if (find_stream()) {
    ...
  } else {
    .. fall through case ..
    v4l_stream_create...
    g_thread_new
  }=20

  send_ctrl_response()

I know gotos are the kernel style but we can at least try to avoid them ;-)

I've run out of steam here (3000 lines is a lot for one patch)... I'll
do another pass on the next revision.

--=20
Alex Benn=C3=A9e

