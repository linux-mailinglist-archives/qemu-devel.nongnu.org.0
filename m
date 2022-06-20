Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DF355213D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:37:37 +0200 (CEST)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JT6-0007x4-9X
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JS7-00073B-UR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JS5-0004ed-OK
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739393;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7jOJIUWRctINYoMPWyiCMMTGs6sPzhNR5OPyZOWS8E=;
 b=inULlm+aKdxCbnmCIKfpTHFhcbtk6Xm6MLfAN9vU1zhxCdIJVh+fPSxRexGf0A/NULanKf
 xvKOInTOA6sLDx9/TK8vkJUPP4McbNblCxWbnQFUkM//Ca36gV5p2QsL0r1xtkKqY6nFWI
 Qut0ZwryzgBoSySsp/PZLVMaIyPxhQk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-n4DJkuXfOY2duowv-4R67A-1; Mon, 20 Jun 2022 11:36:31 -0400
X-MC-Unique: n4DJkuXfOY2duowv-4R67A-1
Received: by mail-wr1-f71.google.com with SMTP id
 i10-20020a5d55ca000000b002103d76ffcaso2630944wrw.17
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C7jOJIUWRctINYoMPWyiCMMTGs6sPzhNR5OPyZOWS8E=;
 b=f+z0T3aVomqE/DziTS3m3G0k3pK1/e39PeoKJpvXS3hPh4RFttfMGVv8dbjDx+Zuml
 Ibl6zyYgQBKCFGLDysoE7q3rU6bs2/OIlZDUqGT9cTSDbUXwV7St/aMA3BNMsSliSbOw
 tAWXGcq/kYuQSWlmto9pltNilyai1PJ3+EP6LQoXxxj2Kr6vz1uj+uhy4By109PRIMQu
 FwkbivT6ZJtqu7d0I9ka2A8Qj4/Df2vTzq5VXg2hDRquQWCPkisWsJLkWWAl/wXHgt8z
 tchyaPkkX1VOmiLB05bVUWnspNhIfjRv7FwLsyTAnxUbCoddbGx9+8h71kLBEk+F0Trv
 lkbQ==
X-Gm-Message-State: AJIora91oU95CU62ecKaSXewvDWjy4zhMwdZvBisY8a9PmS0PE3ssjJv
 JUI5EtLrxrq+X/R8XRXm2lQtSbRv2tDWETB1YdDkbaPr/YQriaGH9/SSv8Uk+RlpHZSPgNC6Rar
 xBNhT94pY7H842H8=
X-Received: by 2002:a5d:5250:0:b0:21b:8b4e:ee54 with SMTP id
 k16-20020a5d5250000000b0021b8b4eee54mr8666514wrc.624.1655739390426; 
 Mon, 20 Jun 2022 08:36:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1zyd/rkjm+Ws8hTltAaAS+7RG/uvk9v4n4hpkk8me42RHMYI32l29Y9Zt+IZkjMQtsDcqKQ==
X-Received: by 2002:a5d:5250:0:b0:21b:8b4e:ee54 with SMTP id
 k16-20020a5d5250000000b0021b8b4eee54mr8666486wrc.624.1655739390210; 
 Mon, 20 Jun 2022 08:36:30 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 p33-20020a05600c1da100b0039ef836d841sm8534065wms.42.2022.06.20.08.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:36:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 15/21] migration: remove the QEMUFileOps 'shut_down'
 callback
In-Reply-To: <20220620110205.1357829-16-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:59
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-16-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:36:29 +0200
Message-ID: <87mte71h4y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This directly implements the shutdown logic using QIOChannel APIs.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> -{
> -    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> -
> -    if (qio_channel_has_feature(ioc,
> -                                QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> -        QIOChannelShutdown mode;
> -        if (rd && wr) {
> -            mode =3D QIO_CHANNEL_SHUTDOWN_BOTH;
> -        } else if (rd) {
> -            mode =3D QIO_CHANNEL_SHUTDOWN_READ;
> -        } else {
> -            mode =3D QIO_CHANNEL_SHUTDOWN_WRITE;
> -        }
> -        if (qio_channel_shutdown(ioc, mode, errp) < 0) {
> -            return -EIO;
> -        }
> -    }
> -    return 0;
> -}

Here we don't return ENOSYS, we return 0 when the channel don't have the fe=
ature.

>      f->shutdown =3D true;
> -    if (!f->ops->shut_down) {
> +    if (!qio_channel_has_feature(f->ioc,
> +                                 QIO_CHANNEL_FEATURE_SHUTDOWN)) {
>          return -ENOSYS;
>      }

Here we return -ENOSYS.

It could only matter here:

./migration.c\02209:        ret =3D qemu_file_shutdown(ms->to_dst_file);
./migration.c\02218:        ret =3D qemu_file_shutdown(mis->from_src_file);

And both are for migrate_pause (postcopy recovery), that requires an
implementation that has a qiochannel, so my understanding is that it
don't matter at all.

Code is much better than what we had, anyways.

Later, Juan.


