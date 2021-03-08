Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03DA331267
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:39:44 +0100 (CET)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHyx-0004mX-4D
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJHx8-0003M4-BI; Mon, 08 Mar 2021 10:37:50 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJHx6-0006PU-QJ; Mon, 08 Mar 2021 10:37:50 -0500
Received: by mail-ej1-x62d.google.com with SMTP id p7so9805851eju.6;
 Mon, 08 Mar 2021 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fn2gEV3G/kygbpFHacoeS321gNY5LdRCPbB3H151lJk=;
 b=juDgIbweKpRe+LrxMcPxh2ijrmFJWPmgk4Cs+4beuWenmEKi+0nY/2WmiNNKhCl8d8
 vdL94rqU8x+lKGple3JZuEZI0AewBzocnqSw9qg8tNJbWS+KZSCGfZ/JLwOMMdRuWOLL
 gzpclNgSIvmOf7jsOjvob7Sup9m4kAH4MKDmqETdCc3/OMeyIlxzxK1NUCJ6QkMVt1vi
 CxUwnFwjYYtB7lcnJ4yKF3LwA0mbcAg3/8iTpVr5FpdoUvBVp2dIFxgNNV/UgVef/BK3
 JIi9iZWfCEzBCoaEp9bW7/zHzxALLw0MGPlNCc9tj9VVJmv+NKkSAZptN48LmFcAUtzg
 SlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fn2gEV3G/kygbpFHacoeS321gNY5LdRCPbB3H151lJk=;
 b=Kyhhmty0XD0TYp1nqlILbCLO9FT7953SqBHNEiGscLyJZtETsFh237LZNnd1CuBWfo
 /yn7QvZHCFl/vv4Se4+7HFDnXyz+E6fE6CuiIffx+Dcixjb9iCvVk/75nSo3tWNgO2rH
 Y8YERGoMyxRQMNCYp9LytdFB0NFgLOTg4QVIfToJPZCvtD6u24OQ1SQepTscOSPn5Zdq
 yDHt47ekhYZLPI7JrKpLzXQc0seA6U8HngjASg5G5qNs0CFilEIZdIEp7Z7ak55fLZsx
 23H2etears1p71rE0qo8XmU6hTob7Wir0vpVwpozRa003Qmy0vvOsLQ815uIJqtTiimx
 wkwg==
X-Gm-Message-State: AOAM530KtyyZ5q2l5pDpHV1UzLd4J3/KG6INNjaSLXRfM0mRb16Wpgsx
 qMjPnbq8oqFYc0Oku1PmV1drnfI2N+93pUudf5c=
X-Google-Smtp-Source: ABdhPJzagKjNrm5vpH6bqDmE3dwaJeSXNuwkXBHrDw9/XVWaYpZnQAm94ATDZzG+qPAHQnown18N0uOq21JeRXeWs/U=
X-Received: by 2002:a17:906:b6cc:: with SMTP id
 ec12mr15463587ejb.520.1615217866480; 
 Mon, 08 Mar 2021 07:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
In-Reply-To: <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 9 Mar 2021 00:37:35 +0900
Message-ID: <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 0:17 Stefan Hajnoczi <stefanha=
@redhat.com>:
>
> The live migration compatibility issue is still present. Migrating to
> another host might not work if the block limits are different.
>
> Here is an idea for solving it:
>
> Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> support a new value called "host". The default behavior remains
> unchanged for live migration compatibility but now you can use "host" if
> you know it's okay but don't care about migration compatibility.
>
> The downside to this approach is that users must explicitly say
> something like --drive ...,opt_io_size=3Dhost. But it's still better than
> the situation we have today where user must manually enter values for
> their disk.
>
> Does this sound okay to everyone?
>
> Stefan

I wonder how that change affects other block drivers implementing
bdrv_probe_blocksizes. As far as I know, the values they report are
already used by default, which is contrary to the default not being
"host".

Regards,
Akihiko Odaki

