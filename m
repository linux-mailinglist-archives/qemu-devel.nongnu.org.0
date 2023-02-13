Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C9693ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSyT-0003zw-UE; Mon, 13 Feb 2023 02:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRSyF-0003Dj-M1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRSyB-00022A-Iv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676272185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USkSR0r84RP39g0+PiRdLRXSwaSjPvLTzKzXRCuFhEo=;
 b=hEuJ6v7Lew5IcZbSoFtBuk5WhAF5VyKH/u5aFH25ReHWgsROXVehlXiCTZsbkEzu9NTq6d
 7wTCk2StqQ7ivUddbwvW1k9thPFcl2scsD2WzvOmiR7wm85fI40Dd9CwRzy6Q2g+wle1kz
 W+4ujbKkXWCfemyRzPRTQlHLgv81+nE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-Pwcyms-GOoWuPHmGOKivig-1; Mon, 13 Feb 2023 02:09:41 -0500
X-MC-Unique: Pwcyms-GOoWuPHmGOKivig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B476B87B2A1;
 Mon, 13 Feb 2023 07:09:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7784F2166B26;
 Mon, 13 Feb 2023 07:09:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6027E21E6A1F; Mon, 13 Feb 2023 08:09:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Gonglei
 Arei <arei.gonglei@huawei.com>,  Li Qiang <liq3ea@163.com>,  Cao jin
 <caoj.fnst@cn.fujitsu.com>,  Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org,  qemu-ppc@nongnu.org,  xiaoqiang zhao
 <zxq_yx_007@163.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 9/9] qdev-monitor: Use qdev_get_parent_bus() in
 bus_print_dev()
References: <20230213070423.76428-1-philmd@linaro.org>
 <20230213070423.76428-10-philmd@linaro.org>
Date: Mon, 13 Feb 2023 08:09:39 +0100
In-Reply-To: <20230213070423.76428-10-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 13 Feb 2023 08:04:23
 +0100")
Message-ID: <87fsbaxcr0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> No need to pass 'dev' and 'dev->parent_bus' when we can
> retrieve 'parent_bus' with qdev_get_parent_bus().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  softmmu/qdev-monitor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 820e7f52ad..12e4899f0d 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -770,9 +770,9 @@ static void qdev_print_props(Monitor *mon, DeviceStat=
e *dev, Property *props,
>      }
>  }
>=20=20
> -static void bus_print_dev(BusState *bus, Monitor *mon, DeviceState *dev,=
 int indent)
> +static void bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
>  {
> -    BusClass *bc =3D BUS_GET_CLASS(bus);
> +    BusClass *bc =3D BUS_GET_CLASS(qdev_get_parent_bus(dev));
>=20=20
>      if (bc->print_dev) {
>          bc->print_dev(mon, dev, indent);
> @@ -811,7 +811,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev=
, int indent)
>          qdev_print_props(mon, dev, DEVICE_CLASS(class)->props_, indent);
>          class =3D object_class_get_parent(class);
>      } while (class !=3D object_class_by_name(TYPE_DEVICE));
> -    bus_print_dev(dev->parent_bus, mon, dev, indent);
> +    bus_print_dev(mon, dev, indent);
>      QLIST_FOREACH(child, &dev->child_bus, sibling) {
>          qbus_print(mon, child, indent);
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


