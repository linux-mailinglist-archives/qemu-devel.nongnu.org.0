Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D693E3595
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 15:43:49 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCMc8-0003qt-FE
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 09:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMaM-000252-Rb
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMaK-0006aY-T7
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628343716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dOgdYXpbSYxDhrQLwfHlHnGC1OiosC/xkcPWcDOioBo=;
 b=d17PZ4tp7W/ASCppZ00jAKAnj/0gaKl3Dcd0MRls+prBkmTz567VR0O2E+1vUcTid2d0Vt
 hTnvfNDOZL8xcCYvxjWsRJV+n9s6y4U1XzgbWzDZ5aWkeVBmhuHpKJcHmytAtbLZTG0Ixd
 fPrDsQG1cCWhaYhzGjhVrI7ryZeQwMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-RNFwhhM1Pj23XI67zcmpew-1; Sat, 07 Aug 2021 09:41:54 -0400
X-MC-Unique: RNFwhhM1Pj23XI67zcmpew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8660C760C1;
 Sat,  7 Aug 2021 13:41:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58DC860C13;
 Sat,  7 Aug 2021 13:41:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0FF4611380A0; Sat,  7 Aug 2021 15:41:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 3/7] spapr_drc.c: do not error_report() when
 drc->dev->id == NULL
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-4-danielhb413@gmail.com>
Date: Sat, 07 Aug 2021 15:41:52 +0200
In-Reply-To: <20210719200827.1507276-4-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 19 Jul 2021 17:08:23 -0300")
Message-ID: <878s1dcqxr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> The error_report() call in drc_unisolate_logical() is not considering
> that drc->dev->id can be NULL, and the underlying functions error_report()
> calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
> behavior when trying to handle "%s" with NULL arguments.
>
> Besides, there is no utility into reporting that an unknown device was
> rejected by the guest.
>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_drc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a2f2634601..a4d9496f76 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>              }
>  
>              drc->unplug_requested = false;
> -            error_report("Device hotunplug rejected by the guest "
> -                         "for device %s", drc->dev->id);
> +
> +            if (drc->dev->id) {
> +                error_report("Device hotunplug rejected by the guest "
> +                             "for device %s", drc->dev->id);
> +            }
>  
>              /*
>               * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when

This differs from PATCH 1 and 2 in that it actually fixes a crash bug.

The alternative is something like

               error_report("Device hotunplug rejected by the guest "
                            "for device %s", drc->dev->id ?: "");

If the maintainer is okay with dropping the message when the device has
no ID, then so am I:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


