Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3FD48B00C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:51 +0100 (CET)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Icm-0000qp-Tx
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Ia3-0006Nv-6b
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:57:04 -0500
Received: from [2a00:1450:4864:20::330] (port=44621
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Ia0-0002Vp-Ui
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:56:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so1981328wmf.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Do1Saxo9rz5R5Jurnuvq1EJJ9pNQyMrd1RvHrUGBPKQ=;
 b=t0ZbcT0kVRKhx99fw0Ue07Ouaqk2bfvsouC3F70fMuxO++f+A2EbMlLzbuHeL55U0t
 BMl6anorMLZmwb7zPKQVlTNfA6hs5WREBHTLfZPD7BrIHnT6UgbPQakzx0lIHkZbUcNS
 ifMy6EA5ig+yxaH52KrT4nUaXzLf9E8P1BZUUIqzH+qv1uAlfZ1vKZ2peB28BAz18EIK
 AqjEwvmjrfA68IbAKhJkjJw9OHhmiF9EheZHCvrEP5RVoTUoxlo/1R1BCy9OJZCfLDpr
 Y2KA9LOUSHNE0tXkzN2OPNHnkpoNch7373QlIngeHAmXzhmdMxG0U6cHAndhaP/TJadZ
 hQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Do1Saxo9rz5R5Jurnuvq1EJJ9pNQyMrd1RvHrUGBPKQ=;
 b=hRPOeXEny+yebm44eL5r3qu45essV9VQW7ymtEmdYgUMZ9wHZ30bw9uxLspYnh2v0L
 rgFCQz4GZ1DkJ+F0kreY65DgFuJ1c6i0D9Nm1w48LglFDMZWDRKxDL7m+a1/B3YnWpIA
 cbEa0pHDRONwdOgRyx6OCN14gqOfciEWEVll8Xx2v/Ciavdw003p5W0a3rLZLJ0fiSX4
 JvNeovThOFeFzU6XZ/FYxR8DEeHfmOwlYh2jjmKN5I7GzEDkRacgIEs4E9b0vZMiTkIN
 SwU/HnUNT+YdJQLeO2LhBoHVsS2AGwNHGmuWQQQiH/uqJFM6y8bm0t2vZT6QdZQsaxv+
 yumA==
X-Gm-Message-State: AOAM531F+/ybOYAHSJyluJUA1vc7Iu8e72JQCoistAR9kAaatgE7HPgX
 LxgKjAtvosDxcGb3SqaP2a67bQ==
X-Google-Smtp-Source: ABdhPJzaFUzeHyOY4Q0TccP/gusH+jaqze4bN5WNLZLMz3L0/+9c+Qkdrm6yR9ptsgQxVErekp/ElA==
X-Received: by 2002:a1c:f209:: with SMTP id s9mr2887989wmc.94.1641913014750;
 Tue, 11 Jan 2022 06:56:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm11945208wrs.0.2022.01.11.06.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 06:56:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 350211FFB7;
 Tue, 11 Jan 2022 14:56:53 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-2-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 1/8] vhost-user-video: Add a README.md with cheat sheet
 of commands
Date: Tue, 11 Jan 2022 14:48:27 +0000
In-reply-to: <20211209145601.331477-2-peter.griffin@linaro.org>
Message-ID: <875yqqcocq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  tools/vhost-user-video/README.md | 98 ++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 tools/vhost-user-video/README.md
>
> diff --git a/tools/vhost-user-video/README.md b/tools/vhost-user-video/RE=
ADME.md
> new file mode 100644
> index 0000000000..c55e0a7b68
> --- /dev/null
> +++ b/tools/vhost-user-video/README.md

I think as we want this to be visible to the user we should put it in:

  docs/system/devices/vhost-user-video.rst

with the appropriate update to device-emulation.rst to include it.

> @@ -0,0 +1,98 @@
> +# Overview vhost-user-video
> +
> +This vmm translates from virtio-video v3 protocol and writes
> +to a v4l2 mem2mem stateful decoder/encoder device [1]. v3 was
> +chosen as that is what the virtio-video Linux frontend driver
> +currently implements.
> +
> +The primary goal so far is to enable development of virtio-video
> +frontend driver using purely open source software. Using vicodec
> +v4l2 stateful decoder on the host for testing then allows a pure
> +virtual environment for development and testing.
> +
> +Currently the vmm only supports v4l2 stateful devices, and the
> +intention is it will be used with Arm SoCs that implement stateful
> +decode/encode devices such as Qcom Venus, RPi, MediaTek etc.
> +
> +A Qemu + vicodec setup for virtio-video should also allow for
> +CI systems like kernelci, lkft to test the virtio-video interface
> +easily.
> +
> +Currently support for VAAPI or decoding via libavcodec or similar
> +libraries is not implemented, but this could be added in the future.
> +
> +Some example commands are provided below on how to run the daemon
> +and achieve a video decode using vicodec and a link to some test
> +content.
> +
> +[1] https://www.kernel.org/doc/html/latest/userspace-api/media/
> +    v4l/dev-decoder.html
> +
> +[2] https://lwn.net/Articles/760650/
> +
> +# Guest Linux kernel modules
> +CONFIG_MEDIA_SUPPORT=3Dy
> +CONFIG_MEDIA_TEST_SUPPORT=3Dy
> +CONFIG_V4L_TEST_DRIVERS=3Dy
> +CONFIG_VIRTIO_VIDEO=3Dy
> +CONFIG_GDB_SCRIPTS=3Dy

Is GDB_SCRIPTS really needed here?

> +CONFIG_DRM_VIRTIO_GPU=3Dy
> +
> +# Host kernel modules
> +CONFIG_MEDIA_SUPPORT=3Dy
> +CONFIG_MEDIA_TEST_SUPPORT=3Dy
> +CONFIG_V4L_TEST_DRIVERS=3Dy
> +CONFIG_VIDEO_VICODEC=3Dy

this last one isn't set on the default Debian kernel so it might be
worth mentioning that.

> +
> +# Run vhost-user-video daemon with vicodec
> +# (video3 typically is the stateful video)
> +vhost-user-video --socket-path=3D/tmp/video.sock --v4l2-device=3D/dev/vi=
deo3
> +
> +# Qemu command for virtio-video device
> +
> +-device vhost-user-video-pci,chardev=3Dvideo,id=3Dvideo
> +-chardev socket,path=3D/tmp//video.sock,id=3Dvideo
> +
> +# Example v4l2-ctl decode command
> +wget https://people.linaro.org/~peter.griffin/jelly_640_480-420P.fwht
> +
> +v4l2-ctl -d0 -x width=3D640,height=3D480 -v width=3D640,height=3D480,pix=
elformat=3DYU12
> +--stream-mmap --stream-out-mmap --stream-from jelly_640_480-420P.fwht
> +--stream-to out-jelly-640-480.YU12
> +
> +# Play the raw decoded video with ffplay or mplayer
> +ffplay -loglevel warning -v info -f rawvideo -pixel_format  yuv420p
> +  -video_size "640x480" ./out-jelly-640-480.YU12
> +
> +mplayer -demuxer rawvideo -rawvideo
> +  format=3Di420:w=3D640:h=3D480:fps=3D25 out-jelly-640-480.YU12
> +
> +# Enable v4l2 debug in virtio-video frontend driver
> +echo 0x1f > /sys/class/video4linux/video0/dev_debug
> +
> +# Enable v4l2 debug in vicodec backend driver
> +echo 0x1f > /sys/class/video4linux/video3/dev_debug
> +

and cut here...

The rest can probably be dropped from user facing documentation as long
as we record it somewhere ourselves (is it in the cards?).

> +# optee-build system qemu virtio-video command
> +make QEMU_VIRTFS_ENABLE=3Dy QEMU_USERNET_ENABLE=3Dy CFG_TA_ASLR=3Dn
> +    QEMU_VHOSTUSER_MEM=3Dy QEMU_VIRTVIDEO_ENABLE=3Dy SSH_PORT_FW=3Dy run=
-only
> +
> +Current status
> +* Tested with v4l2-ctl from v4l2-utils and vicodec stateful decoder driv=
er
> +* v4l2-compliance - reports
> +Total: 43, Succeeded: 37, Failed: 6, Warnings: 0
> +
> +Known Issues
> +* 6 v4l2-compliance failures remaining
> +* v4l2-ctl 0fps misleading output
> +* v4l2-ctl sometimes reports - 0 !=3D <somenumber>
> +* Encoder not tested yet
> +
> +TODOs
> +* Test with a "real" stateful decoder & codec
> +  (e.g. Qcom Venus or RPi).
> +* Test more v4l2 userspaces in the guest
> +
> +Future potential features
> +* Emulation using libavcodec or similar library
> +* Support for VAAPI, OpenMax or v4l2 stateless devices


--=20
Alex Benn=C3=A9e

