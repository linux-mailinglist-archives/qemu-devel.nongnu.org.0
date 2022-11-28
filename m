Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF263AA27
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeaV-0008It-RS; Mon, 28 Nov 2022 08:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ozeaG-0008Gt-HB
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ozea3-0001Fj-Ak
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669643632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OYJ1zgqyOvarp2tDj/k7UVaA2dBVz9KgYC4Y3sE+aY=;
 b=MqpecfUBATZG4KRT6C/jgLiOzJUxszPuAWEY6PvfxR/3ubqSCvHq2eVVdKriVBe/ppQAPS
 LUBnTj/69QjtNStQN8sTFRtoJ0ORRiFDUVpkWTKKU45KnZ/JVw1SfidT7tKqHhTV2wZKT+
 I4HBQupM7vPnENT7gDn3D1l5O3xM+6c=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-GXQH2ABuMGi5N0wLWCnfJA-1; Mon, 28 Nov 2022 08:53:51 -0500
X-MC-Unique: GXQH2ABuMGi5N0wLWCnfJA-1
Received: by mail-io1-f72.google.com with SMTP id
 n23-20020a056602341700b00689fc6dbfd6so5835772ioz.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3OYJ1zgqyOvarp2tDj/k7UVaA2dBVz9KgYC4Y3sE+aY=;
 b=GlSVC+o0/mIPWoaVJmqMwkGwyWcHWSXHzFrDy6Xdo8zDuWUNwASBEWcm5g8dqcpCFz
 YvrGJTi9/3wOdIIyJXF1EcVXhgCP0LnFJcoF5JsCFbjEDwx7xg2LNAXl7H1qqX+fquB2
 AWrOF+5LZl+OhpjyHWZvx+bH66WuzQR4IQrpFU3P2cDrw/gfzKjtzbPvPa4R6eW3kwjk
 i6IYtVbtpVJl7MGLsK3Njec0iTFsv000BIUq0viu3qu2wSAfHAtAMd2Q3JV0EvlnfU2P
 tdRYA5yjWmjwXrWGDsrR1fErE3+8N4QfAr7/L4LzGsBRWdE9pUDymQFYcVR40jr4pi7M
 SLqg==
X-Gm-Message-State: ANoB5plQVnqPr/nijbyg7xlQBREnS7bCVTSfCD9mQjFEmr+obNFV2hax
 X1J83jsxqjioihgfOqhicyPVagKZkNdPTqunwjvdizeHtL/QH23OWAe65ximRBfWF9zTk6PMpbQ
 XXuIX1UyXrT/jWfrXXSAMBZUWfnXUHlM=
X-Received: by 2002:a02:a68b:0:b0:374:98f7:2ad2 with SMTP id
 j11-20020a02a68b000000b0037498f72ad2mr23180355jam.0.1669643630628; 
 Mon, 28 Nov 2022 05:53:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5c5o2+nEILJbNcpxSXdodJNZVRHcQ/k1Rx+mKxQ3+4+8ItwdSvP6buiGQjwlqDYnNrSbMhYhbivLtflqnR6mo=
X-Received: by 2002:a02:a68b:0:b0:374:98f7:2ad2 with SMTP id
 j11-20020a02a68b000000b0037498f72ad2mr23180335jam.0.1669643630304; Mon, 28
 Nov 2022 05:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-4-philmd@linaro.org>
In-Reply-To: <20221128134832.84867-4-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 28 Nov 2022 17:53:38 +0400
Message-ID: <CAMxuvawcwMP7xzNwFrKpQvzv5RhyHApZ4A5NkTxDSvgxrSox+g@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007c89e505ee883313"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--0000000000007c89e505ee883313
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Nov 28, 2022 at 5:48 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> Currently qxl_phys2virt() doesn't check for buffer overrun.
> In order to do so in the next commit, pass the buffer size
> as argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC: Please double-check qxl_render_update_area_unlocked()
> ---
>  hw/display/qxl-logger.c | 11 ++++++++---
>  hw/display/qxl-render.c | 12 ++++++++----
>  hw/display/qxl.c        | 14 +++++++++-----
>  hw/display/qxl.h        |  4 +++-
>  4 files changed, 28 insertions(+), 13 deletions(-)
>
> diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> index 1bcf803db6..35c38f6252 100644
> --- a/hw/display/qxl-logger.c
> +++ b/hw/display/qxl-logger.c
> @@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl,
> QXLPHYSICAL addr, int group_id)
>      QXLImage *image;
>      QXLImageDescriptor *desc;
>
> -    image =3D qxl_phys2virt(qxl, addr, group_id);
> +    image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
>      if (!image) {
>          return 1;
>      }
> @@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCm=
d
> *cmd, int group_id)
>                  cmd->u.set.position.y,
>                  cmd->u.set.visible ? "yes" : "no",
>                  cmd->u.set.shape);
> -        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
> +        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
> +                               sizeof(QXLCursor));
>          if (!cursor) {
>              return 1;
>          }
> @@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char
> *ring, QXLCommandExt *ext)
>  {
>      bool compat =3D ext->flags & QXL_COMMAND_FLAG_COMPAT;
>      void *data;
> +    size_t datasz;
>      int ret;
>
>      if (!qxl->cmdlog) {
> @@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char
> *ring, QXLCommandExt *ext)
>
>      switch (ext->cmd.type) {
>      case QXL_CMD_DRAW:
> +        datasz =3D compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDrawab=
le);
>          break;
>      case QXL_CMD_SURFACE:
> +        datasz =3D sizeof(QXLSurfaceCmd);
>          break;
>      case QXL_CMD_CURSOR:
> +        datasz =3D sizeof(QXLCursorCmd);
>          break;
>      default:
>          goto out;
>      }
> -    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
> +    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
>      if (!data) {
>          return 1;
>      }
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index ca217004bf..0a4bfa8aa6 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -107,7 +107,9 @@ static void
> qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
>          qxl->guest_primary.resized =3D 0;
>          qxl->guest_primary.data =3D qxl_phys2virt(qxl,
>
>  qxl->guest_primary.surface.mem,
> -                                                MEMSLOT_GROUP_GUEST);
> +                                                MEMSLOT_GROUP_GUEST,
> +
> qxl->guest_primary.abs_stride
>
+                                                * height);
>

Right, it looks like QXL device stride is in bytes.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>          if (!qxl->guest_primary.data) {
>              goto end;
>          }
> @@ -228,7 +230,7 @@ static void qxl_unpack_chunks(void *dest, size_t size=
,
> PCIQXLDevice *qxl,
>          if (offset =3D=3D size) {
>              return;
>          }
> -        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id);
> +        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id, bytes)=
;
>          if (!chunk) {
>              return;
>          }
> @@ -295,7 +297,8 @@ fail:
>  /* called from spice server thread context only */
>  int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
>  {
> -    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_i=
d);
> +    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_i=
d,
> +                                      sizeof(QXLCursorCmd));
>      QXLCursor *cursor;
>      QEMUCursor *c;
>
> @@ -314,7 +317,8 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandEx=
t
> *ext)
>      }
>      switch (cmd->type) {
>      case QXL_CURSOR_SET:
> -        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
> +        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
> +                               sizeof(QXLCursor));
>          if (!cursor) {
>              return 1;
>          }
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 5b10f697f1..231d733250 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -274,7 +274,8 @@ static void
> qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
>                                            QXL_IO_MONITORS_CONFIG_ASYNC))=
;
>      }
>
> -    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config,
> MEMSLOT_GROUP_GUEST);
> +    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config,
> MEMSLOT_GROUP_GUEST,
> +                        sizeof(QXLMonitorsConfig));
>      if (cfg !=3D NULL && cfg->count =3D=3D 1) {
>          qxl->guest_primary.resized =3D 1;
>          qxl->guest_head0_width  =3D cfg->heads[0].width;
> @@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struc=
t
> QXLCommandExt *ext)
>      switch (le32_to_cpu(ext->cmd.type)) {
>      case QXL_CMD_SURFACE:
>      {
> -        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id);
> +        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id,
> +                                           sizeof(QXLSurfaceCmd));
>
>          if (!cmd) {
>              return 1;
> @@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struc=
t
> QXLCommandExt *ext)
>      }
>      case QXL_CMD_CURSOR:
>      {
> -        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id);
> +        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id,
> +                                          sizeof(QXLCursorCmd));
>
>          if (!cmd) {
>              return 1;
> @@ -1456,7 +1459,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice
> *qxl, QXLPHYSICAL pqxl,
>  }
>
>  /* can be also called from spice server thread context */
> -void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
> +void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
> +                    size_t size)
>  {
>      uint64_t offset;
>      uint32_t slot;
> @@ -1964,7 +1968,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
>          }
>
>          cmd =3D qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
> -                            MEMSLOT_GROUP_GUEST);
> +                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));
>          assert(cmd);
>          assert(cmd->type =3D=3D QXL_SURFACE_CMD_CREATE);
>          qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index 78b3a6c9ba..bf03138ab4 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -153,6 +153,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>   * @qxl: QXL device
>   * @phys: physical offset of buffer within the VRAM
>   * @group_id: memory slot group
> + * @size: size of the buffer
>   *
>   * Returns a host pointer to a buffer placed at offset @phys within the
>   * active slot @group_id of the PCI VGA RAM memory region associated wit=
h
> @@ -166,7 +167,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>   * the incoming ram_addr_t.
>   *
>   */
> -void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
> +void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
> +                    size_t size);
>  void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
>      G_GNUC_PRINTF(2, 3);
>
> --
> 2.38.1
>
>

--0000000000007c89e505ee883313
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 28, 2022 at 5:48 PM Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Currently qxl_phys2virt() doesn&#39;t check for buffer overrun.<br>
In order to do so in the next commit, pass the buffer size<br>
as argument.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
RFC: Please double-check qxl_render_update_area_unlocked()<br>
---<br>
=C2=A0hw/display/qxl-logger.c | 11 ++++++++---<br>
=C2=A0hw/display/qxl-render.c | 12 ++++++++----<br>
=C2=A0hw/display/qxl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++++-----<br>
=C2=A0hw/display/qxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A04 files changed, 28 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c<br>
index 1bcf803db6..35c38f6252 100644<br>
--- a/hw/display/qxl-logger.c<br>
+++ b/hw/display/qxl-logger.c<br>
@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYSICAL=
 addr, int group_id)<br>
=C2=A0 =C2=A0 =C2=A0QXLImage *image;<br>
=C2=A0 =C2=A0 =C2=A0QXLImageDescriptor *desc;<br>
<br>
-=C2=A0 =C2=A0 image =3D qxl_phys2virt(qxl, addr, group_id);<br>
+=C2=A0 =C2=A0 image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage=
));<br>
=C2=A0 =C2=A0 =C2=A0if (!image) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCmd =
*cmd, int group_id)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;u.set=
.position.y,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;u.set=
.visible ? &quot;yes&quot; : &quot;no&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;u.set=
.shape);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.sh=
ape, group_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.sh=
ape, group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cursor) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring=
, QXLCommandExt *ext)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool compat =3D ext-&gt;flags &amp; QXL_COMMAND_FLAG_CO=
MPAT;<br>
=C2=A0 =C2=A0 =C2=A0void *data;<br>
+=C2=A0 =C2=A0 size_t datasz;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!qxl-&gt;cmdlog) {<br>
@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ri=
ng, QXLCommandExt *ext)<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (ext-&gt;cmd.type) {<br>
=C2=A0 =C2=A0 =C2=A0case QXL_CMD_DRAW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D compat ? sizeof(QXLCompatDrawable) =
: sizeof(QXLDrawable);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case QXL_CMD_SURFACE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D sizeof(QXLSurfaceCmd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case QXL_CMD_CURSOR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D sizeof(QXLCursorCmd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 data =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, ext-&gt;group_=
id);<br>
+=C2=A0 =C2=A0 data =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, ext-&gt;group_=
id, datasz);<br>
=C2=A0 =C2=A0 =C2=A0if (!data) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c<br>
index ca217004bf..0a4bfa8aa6 100644<br>
--- a/hw/display/qxl-render.c<br>
+++ b/hw/display/qxl-render.c<br>
@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQXLDevic=
e *qxl)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.resized =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.data =3D qxl_phys2v=
irt(qxl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.surface.mem,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 qxl-&gt;guest_primary.abs_stride <br></blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * height);<br></blockquote><div><br></div><div>Right, =
it looks like QXL device stride is in bytes.</div><div><br></div><div>Revie=
wed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redha=
t.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qxl-&gt;guest_primary.data) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto end;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -228,7 +230,7 @@ static void qxl_unpack_chunks(void *dest, size_t size, =
PCIQXLDevice *qxl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (offset =3D=3D size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D qxl_phys2virt(qxl, chunk-&gt;next_ch=
unk, group_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D qxl_phys2virt(qxl, chunk-&gt;next_ch=
unk, group_id, bytes);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chunk) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -295,7 +297,8 @@ fail:<br>
=C2=A0/* called from spice server thread context only */<br>
=C2=A0int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, e=
xt-&gt;group_id);<br>
+=C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, e=
xt-&gt;group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(QXLCurso=
rCmd));<br>
=C2=A0 =C2=A0 =C2=A0QXLCursor *cursor;<br>
=C2=A0 =C2=A0 =C2=A0QEMUCursor *c;<br>
<br>
@@ -314,7 +317,8 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt =
*ext)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0switch (cmd-&gt;type) {<br>
=C2=A0 =C2=A0 =C2=A0case QXL_CURSOR_SET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.sh=
ape, ext-&gt;group_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.sh=
ape, ext-&gt;group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cursor) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
index 5b10f697f1..231d733250 100644<br>
--- a/hw/display/qxl.c<br>
+++ b/hw/display/qxl.c<br>
@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDevic=
e *qxl, int replay)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0QXL_IO_MONITORS_CONFIG_ASYNC));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 cfg =3D qxl_phys2virt(qxl, qxl-&gt;guest_monitors_config, ME=
MSLOT_GROUP_GUEST);<br>
+=C2=A0 =C2=A0 cfg =3D qxl_phys2virt(qxl, qxl-&gt;guest_monitors_config, ME=
MSLOT_GROUP_GUEST,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sizeof(QXLMonitorsConfig));<br>
=C2=A0 =C2=A0 =C2=A0if (cfg !=3D NULL &amp;&amp; cfg-&gt;count =3D=3D 1) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.resized =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_head0_width=C2=A0 =3D cfg-&=
gt;heads[0].width;<br>
@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct =
QXLCommandExt *ext)<br>
=C2=A0 =C2=A0 =C2=A0switch (le32_to_cpu(ext-&gt;cmd.type)) {<br>
=C2=A0 =C2=A0 =C2=A0case QXL_CMD_SURFACE:<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext-=
&gt;cmd.data, ext-&gt;group_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext-=
&gt;cmd.data, ext-&gt;group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sizeof(QXLSurfaceCmd));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct =
QXLCommandExt *ext)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0case QXL_CMD_CURSOR:<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&=
gt;cmd.data, ext-&gt;group_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&=
gt;cmd.data, ext-&gt;group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
izeof(QXLCursorCmd));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
@@ -1456,7 +1459,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *q=
xl, QXLPHYSICAL pqxl,<br>
=C2=A0}<br>
<br>
=C2=A0/* can be also called from spice server thread context */<br>
-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)<br>
+void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
_t size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint64_t offset;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t slot;<br>
@@ -1964,7 +1968,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D qxl_phys2virt(qxl, qxl-&gt;guest_=
surfaces.cmds[i],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cmd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cmd-&gt;type =3D=3D QXL_SURFACE_CM=
D_CREATE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_dirty_one_surface(qxl, cmd-&gt;u.surf=
ace_create.data,<br>
diff --git a/hw/display/qxl.h b/hw/display/qxl.h<br>
index 78b3a6c9ba..bf03138ab4 100644<br>
--- a/hw/display/qxl.h<br>
+++ b/hw/display/qxl.h<br>
@@ -153,6 +153,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)<br>
=C2=A0 * @qxl: QXL device<br>
=C2=A0 * @phys: physical offset of buffer within the VRAM<br>
=C2=A0 * @group_id: memory slot group<br>
+ * @size: size of the buffer<br>
=C2=A0 *<br>
=C2=A0 * Returns a host pointer to a buffer placed at offset @phys within t=
he<br>
=C2=A0 * active slot @group_id of the PCI VGA RAM memory region associated =
with<br>
@@ -166,7 +167,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)<br>
=C2=A0 * the incoming ram_addr_t.<br>
=C2=A0 *<br>
=C2=A0 */<br>
-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);<br=
>
+void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
_t size);<br>
=C2=A0void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(2, 3);<br>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div></div>

--0000000000007c89e505ee883313--


