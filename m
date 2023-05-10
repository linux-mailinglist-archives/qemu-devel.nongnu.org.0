Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B413B6FDACB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:32:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgAn-0003B6-0l; Wed, 10 May 2023 05:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwgAk-00039u-Pi
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:31:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwgAi-0004T8-NR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683711103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qyODjprkuNWf2l4tRGk/iEStDKXQjgKvYokRZsXlg4=;
 b=KkiBFnzASZG16kTeYSRs3k4Tj3w6JcA8GOJCnchn3Kedxrqr6YoHLlPn4B/KTJTbaTiDhI
 giG+22T/vk2OzQFAOww429dbwIXXwoUiWk47KdX8dAW6JeWM8fhJKAdLD2LFNrdSo5F/Cj
 6lnltianLLzNFxAo8N2MEjKgjeH/fWE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-ALwgnz_HMEC9Munuhwn9ow-1; Wed, 10 May 2023 05:31:42 -0400
X-MC-Unique: ALwgnz_HMEC9Munuhwn9ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D9C91C0879B
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:31:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB34C15BA0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:31:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A930421E6924; Wed, 10 May 2023 11:31:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  berrange@redhat.com,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH] chardev: report the handshake error
References: <20230510072531.3937189-1-marcandre.lureau@redhat.com>
Date: Wed, 10 May 2023 11:31:40 +0200
In-Reply-To: <20230510072531.3937189-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 10 May 2023 11:25:31 +0400")
Message-ID: <877ctg7csj.fsf@pond.sub.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This can help to debug connection issues.
>
> Related to:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2196182
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-socket.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 8c58532171..e8e3a743d5 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTask *task,=
 gpointer user_data)
>  {
>      Chardev *chr =3D user_data;
>      SocketChardev *s =3D user_data;
> +    Error *err =3D NULL;
>=20=20
> -    if (qio_task_propagate_error(task, NULL)) {
> +    if (qio_task_propagate_error(task, &err)) {
> +        error_reportf_err(err,
> +                          "websock handshake of character device %s fail=
ed: ",
> +                          chr->label);

Code smell: reports an error without failing the function.

Should it be a warning instead?

>          tcp_chr_disconnect(chr);
>      } else {
>          if (s->do_telnetopt) {
> @@ -778,8 +782,12 @@ static void tcp_chr_tls_handshake(QIOTask *task,
>  {
>      Chardev *chr =3D user_data;
>      SocketChardev *s =3D user_data;
> +    Error *err =3D NULL;
>=20=20
> -    if (qio_task_propagate_error(task, NULL)) {
> +    if (qio_task_propagate_error(task, &err)) {
> +        error_reportf_err(err,
> +                          "TLS handshake of character device %s failed: =
",
> +                          chr->label);
>          tcp_chr_disconnect(chr);
>      } else {
>          if (s->is_websock) {

Likewise.


