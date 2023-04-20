Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDA6E9D83
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:57:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbLH-00004v-WA; Thu, 20 Apr 2023 16:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbLE-0008WN-Mg
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbLD-0006j9-8o
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEJsuEZKqfVEZojpuxcbenGCovBmmoEZk+t+WNyFu/s=;
 b=d8N52SgeNDbAtf/MCy6qctVzX+LE2T6zZRsMNKhFOnPcqBFiJ307rBVwH1NXsGH/qbHION
 DXWoMTSccrxilI6sGJFr9a03nuyILpiQjfcKO1O+N2HevDE8PJp1VYX/phhytLOdfpKMNC
 vkHYRU0Y9lxpmL+RKmA4u/TxQySwgJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-Kkv49fz-NhqVHozmeobWOQ-1; Thu, 20 Apr 2023 16:57:16 -0400
X-MC-Unique: Kkv49fz-NhqVHozmeobWOQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f46fb1so4066935e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024235; x=1684616235;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jEJsuEZKqfVEZojpuxcbenGCovBmmoEZk+t+WNyFu/s=;
 b=EexSCKFKhCFt1m5C8Scq6q48n4mZfLiK/9/5+UwP+QbuAzBHhmboDuLNFilCQxNYnD
 kbyScYetBX+8ruG7ql9ZsVUTzl/epMvw/25QahbBKQVa2PrEQZaWTlreuMahXqLj3GXL
 RGgukNCqcBHDO7ku2O/PCEItg0TEpjv+f1GaK4q1gGaUXouN+qebwOQSb84ytjRfgZTZ
 zv973H7OaYJGVLxHf3/729XTdvdjEDOuHWo3WmBjgI5H1Y5kTogx4l+E4ChSV+d6uFWc
 dIZqCazxKr1nazjRSYVJCb28hcjbsGPvHsSYkdtw/JNPkFiA12zlcvqzRPNbJ4sVTHHR
 Ae0g==
X-Gm-Message-State: AAQBX9eMmYyo/9tRhOcwgZvPv86i10j6W3J92BCkVITGFJL9cUwh/4rW
 KMs/Vd5rzazRXJPk7nr8OfdxJTRd8e4t3LqnmdPx/aDz93j9RetAlbtu18KfSPstetnxYCMhoi0
 MCq7WYMAvQi2lJ/FIAXUtct2VPkeP
X-Received: by 2002:a7b:ce92:0:b0:3f0:a7c0:5297 with SMTP id
 q18-20020a7bce92000000b003f0a7c05297mr100281wmj.41.1682024235174; 
 Thu, 20 Apr 2023 13:57:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350aY68p+YV15J+R8KjNdN6yQDby6p01BLcstWc414cB3ens7KSZicBDbxq6W9BldqPFJ8WYUzQ==
X-Received: by 2002:a7b:ce92:0:b0:3f0:a7c0:5297 with SMTP id
 q18-20020a7bce92000000b003f0a7c05297mr100270wmj.41.1682024234896; 
 Thu, 20 Apr 2023 13:57:14 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f182973377sm2954917wmi.32.2023.04.20.13.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:57:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,  John G Johnson
 <john.g.johnson@oracle.com>,  Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 7/9] docs/devel: make a statement about includes
In-Reply-To: <20230420155723.1711048-8-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 20 Apr 2023 16:57:21 +0100")
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-8-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:57:13 +0200
Message-ID: <87mt32uv9y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> While not explicitly disallowing header macro abuse (because that
> would make us hypocrites) lets at least address some things to think
> about.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/style.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 68aa776930..5bc6f2f095 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -300,6 +300,20 @@ putting those into qemu/typedefs.h instead of includ=
ing the header.
>=20=20
>  Cyclic inclusion is forbidden.
>=20=20
> +Generative Includes
> +-------------------
> +
> +QEMU makes fairly extensive use of the macro pre-processor to
> +instantiate multiple similar functions. While such abuse of the macro
> +processor isn't discouraged it can make debugging and code navigation
> +harder. You should consider carefully if the same effect can be
> +achieved by making it easy for the compiler to constant fold or using
> +python scripting to generate grep friendly code.
> +
> +If you do use template header files they should be named with the
> +``.c.inc`` or ``.h.inc`` suffix to make it clear they are being
> +included for expansion.
> +
>  C types
>  =3D=3D=3D=3D=3D=3D=3D

Reviewed-by: Juan Quintela <quintela@redhat.com>

Fair enough.


