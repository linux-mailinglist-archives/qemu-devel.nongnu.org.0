Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B208620C0B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKnK-0005zv-8q; Tue, 08 Nov 2022 04:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKn6-0005wW-60
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:21:08 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKn1-0008GF-2F
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:21:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id o4so19966159wrq.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEFsEDHN462JhD+LXx2CTCcMm8U+UelgduHkVY0dgto=;
 b=nutRG5YlasD2vs/eEhb2qPj8ygEKn5yNW3IjLC+Rs+MJG3dDZ6l4BcVDRe44qJipWI
 rIgGw4d4WWSSZ76mRQB6f99+CHAf4QJyY4kDVhVQUJzt2rXcSwtGBGWJd8P1I40AsaSV
 mHK9PwOhwDTgnboV+Ag03QQzrR8li6O4be8QvHcSE3QDzZ7QwSVIdvak9PUzGtbznVxa
 RUQyx1r/1fOBV4td6D8zCEgEUQLmZ3mJSmJ9qX9jHXt51q5wLwWCNUbkSdER0igNSWdr
 C2D/8z+8Q6MYJ55a4OgS8rLTqmm24R+ESGb7DAlfKYYARpp16i5fL03l6zJG3TqXoCZm
 lO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lEFsEDHN462JhD+LXx2CTCcMm8U+UelgduHkVY0dgto=;
 b=ApSX7lhjfSoXNsg/PWI7ge5rXAiDzhmM5QSmohMR9vixRbmTJVz21qExbfnN6Q3xXU
 Y2VhOMPzzMOX44e+HRncku8ipZpcxWfrz+O7JP3LnpooI95ipmSqsoigLNMcIZ6A1yYl
 efXAFAHNi08TcCsVAKNy0h3bk5hxhwIjg3ts0qDBFWUTw7HOcPcPnctvBED0xgHNZ/qM
 OfjV4Eqh2urAaNJeHpkTFg0GD7vu0Mir7swuFCzG1rzfy25B3yLGMH+S7rqUOyqxcEh/
 020ryTnToUeWxlCZTcM5IGlTBoUiMB1dCUdnBzvf1LVSXc0KXzUAR2lcfgkCccf4R5P4
 KaHg==
X-Gm-Message-State: ACrzQf2VAnVY9O50eUZrA/vLLxP9tt4b8n9ohkwgBn9+gVZ89OSKLhw2
 2/aSXboB9CZHzj5Yp/3oO4I/hw==
X-Google-Smtp-Source: AMsMyM5wVZkkpS2HuB0KZKrofbuJ0ktViH7Fg76lqdajW66FckAdQi21kIw3M7isnFu0hATw/Xg0/Q==
X-Received: by 2002:a05:6000:1203:b0:236:9aac:8d00 with SMTP id
 e3-20020a056000120300b002369aac8d00mr33461869wrx.221.1667899261353; 
 Tue, 08 Nov 2022 01:21:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b003b49ab8ff53sm11426525wmq.8.2022.11.08.01.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:21:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 746C51FFB7;
 Tue,  8 Nov 2022 09:21:00 +0000 (GMT)
References: <20221108051120.6859-1-nyoro.martin@gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: nyoro.gachu@gmail.com
Cc: stefanha@redhat.com, samkergachu@gmail.com, Samker
 <nyoro.martin@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] LOCK GUARDS: replace manual lock()/unlock() calls to
 QEMU_LOCK_GUARD()
Date: Tue, 08 Nov 2022 09:19:51 +0000
In-reply-to: <20221108051120.6859-1-nyoro.martin@gmail.com>
Message-ID: <87bkphg5tv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


nyoro.gachu@gmail.com writes:

> From: Samker <nyoro.martin@gmail.com>
>
> This is patch replaces WITH_QEMU_LOCK_GUARD() call with the
> QEMU_LOCK_GUARD()

You could extend this description as to why ".. because it extends the
scope of the lock to the whole function rather than the non-existent
block".

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Signed-off-by: Samker <nyoro.martin@gmail.com>
> ---
>  softmmu/physmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index fb00596777..907491ae17 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3115,7 +3115,7 @@ void cpu_register_map_client(QEMUBH *bh)
>  {
>      MapClient *client =3D g_malloc(sizeof(*client));
>=20=20
> -    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
> +    QEMU_LOCK_GUARD(&map_client_list_lock);
>      client->bh =3D bh;
>      QLIST_INSERT_HEAD(&map_client_list, client, link);
>      if (!qatomic_read(&bounce.in_use)) {
> @@ -3143,7 +3143,7 @@ void cpu_unregister_map_client(QEMUBH *bh)
>  {
>      MapClient *client;
>=20=20
> -    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
> +    QEMU_LOCK_GUARD(&map_client_list_lock);
>      QLIST_FOREACH(client, &map_client_list, link) {
>          if (client->bh =3D=3D bh) {
>              cpu_unregister_map_client_do(client);


--=20
Alex Benn=C3=A9e

