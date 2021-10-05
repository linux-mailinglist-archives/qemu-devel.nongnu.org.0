Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E7422331
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:14:45 +0200 (CEST)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhTA-0005UO-E4
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXhRA-0003Gv-Vy
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXhR9-00038Y-Ar
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633428758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORvgsqQnj7M31vYHXeYK0WKGmysy4qR4Z/macDDWu2c=;
 b=GYrNBgEK2yXYttf7FAZpeLU10K0W+j1r3CL8gOA5Bu/OuZWJcUsovkAzKQ2xq8wgtDvDEU
 qfHUu3f7c0lH89UaLG6q+OpxdPcEBZse7cRFaqk89Sc16tp3/unzwvFKkIsSYPOwISJNro
 wDu5857TwliwoxMKooroRyHGgT+pTu4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-HSmYZzh4OXShzF_1-Q9itw-1; Tue, 05 Oct 2021 06:12:35 -0400
X-MC-Unique: HSmYZzh4OXShzF_1-Q9itw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so5534230wrg.10
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HZSb9+9Ss7R1XzQ8qBsvSZLpp6OirNIVHWEx+/fbhxY=;
 b=uYKnrRDicEobHi/UogOKrl16H6N2b2eLaVG8QYBy0TmJiPylWyqi1wIYCA2O7bT/Hp
 nkpbLJ3/zrVuO50Hq177YmcHDVwPmr91yJyfNerBShUw18AS9R+zZF/TgABu5hvMnmeD
 jGxkiXJiuZqgbb4m+oPyCneegEEAGQ76dZrSeNqA6zHJawMinQsD5KhvbbcPcGTn3vAZ
 Zja1mOU61QcEIkQgYWN4LCMrLvSWZvzYNk+7e/WxRHlnQM5FjhHttogyBWo31Uqbkh4n
 vMPOgsD031eYaVvfXINIZdH7OlJ5m/tWM5TsSmmDHuXPOSgrDkgvo6H5CNk9s9P4WU9U
 rGFQ==
X-Gm-Message-State: AOAM533VdqNJpjSgrIOEKPFKCGlmKmYHYFGL7MPqZjMexydG4zFIwejH
 WOcNTHHjErZVR7BHwJX+ZRs0fIP41n/dQZVw5nNqBAsZlN7HrWjobOjkSv9qB/TTbnF8iQKL/Hr
 QgWWDKRuvz27hNNo=
X-Received: by 2002:adf:ce08:: with SMTP id p8mr20680849wrn.178.1633428754425; 
 Tue, 05 Oct 2021 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+FsAyPrG+AZ41xVkFJbK4h1NJorA4gZkDYVdXmTEKvEEgcEqkq1gGN4y9IPRzyyWui10Atg==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr20680832wrn.178.1633428754276; 
 Tue, 05 Oct 2021 03:12:34 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id p14sm1252671wmc.18.2021.10.05.03.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:12:33 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:12:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, peterx@redhat.com
Subject: Re: [PATCH v1 2/2] migration: add missing qemu_mutex_lock_iothread
 in migration_completion
Message-ID: <YVwlD1Ljc6y5ltHU@work-vm>
References: <20211005080751.3797161-1-eesposit@redhat.com>
 <20211005080751.3797161-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005080751.3797161-3-eesposit@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Emanuele Giuseppe Esposito (eesposit@redhat.com) wrote:
> qemu_savevm_state_complete_postcopy assumes the iothread lock (BQL)
> to be held, but instead it isn't.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Interesting, I think you're right - and I think it's been missing it
from the start.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index 041b8451a6..215d5281f2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3182,7 +3182,10 @@ static void migration_completion(MigrationState *s=
)
>      } else if (s->state =3D=3D MIGRATION_STATUS_POSTCOPY_ACTIVE) {
>          trace_migration_completion_postcopy_end();
> =20
> +        qemu_mutex_lock_iothread();
>          qemu_savevm_state_complete_postcopy(s->to_dst_file);
> +        qemu_mutex_unlock_iothread();
> +
>          trace_migration_completion_postcopy_end_after_complete();
>      } else if (s->state =3D=3D MIGRATION_STATUS_CANCELLING) {
>          goto fail;
> --=20
> 2.27.0
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


