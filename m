Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2C54EA909
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 10:15:23 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ70c-0001q8-DC
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 04:15:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nZ6yf-0000xB-Ur
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nZ6ye-0002SM-3e
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648541599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxlbqk9zsQczOp9uFVgBL+smgVej4VxGA331+d1yViI=;
 b=G0bCfr3pAt3+bYkbZzJUXbOicSoTcGeJZhQr0zCfdjSmgaHbwn5Qzg1BwX20EHvQcgyvlt
 eLYQGeRyX31jT4rrrhkWmt980r6dhD7mDX9pASMzQ5DI10ZkmRy3HS4AD+IAFBl1GbaGeH
 Pc/+TYWSARNUsuyrQvCiIpjpxpoEsng=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-VWGK_QJSPBuiUHHVHNMW8Q-1; Tue, 29 Mar 2022 04:13:16 -0400
X-MC-Unique: VWGK_QJSPBuiUHHVHNMW8Q-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2e6d04210b3so109077437b3.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 01:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gxlbqk9zsQczOp9uFVgBL+smgVej4VxGA331+d1yViI=;
 b=HBuWLugDVDL1AQRxocE3FMFhYKYzUWsQD7d00DQ3Q8RDlWl0B1wRC9dRcyS3y8gePk
 gGCn9eSZJewGkFZkzHiNaSYU9r49Kopi4pW0gxt/vZWUaNub1t+Bl//R6SXgR+2uMT81
 sRnSjTAFUdi4Hu8bzAx+6/wbKxWu/k2uH7JsUIM97XLBaAK7uWB8KQiE9lCkNJ7dTvwp
 IE+aF5tDnZRKhdgGFQu4VZ+7KIOYZZ6OjMRTZwFn38u25FeTzAzouS58RvMYczR+FvUE
 dJnignOne7Nv9lw+Yy6rSZJHWE+N2ZQ5YcfWgagbw5vrMv4HEwUeAVQ1iecJ3HX4aR7N
 lzyA==
X-Gm-Message-State: AOAM532WP/ESNUsmRmAPSzUIg9wcZIBijJ7Eyn9LuEvD76kj9Py3p+ea
 XRT+q6edJqfj1x9rqRcACgMbt9SoqMd9qWjGvgaEOS0WC/FsYzEq7e7KxKhq3QYij6EIphYHFCd
 wSpKrvH/sC6aZ0IisfuHZHuInVkPmwME=
X-Received: by 2002:a0d:f485:0:b0:2e6:8c95:d874 with SMTP id
 d127-20020a0df485000000b002e68c95d874mr29463947ywf.23.1648541596302; 
 Tue, 29 Mar 2022 01:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmj7b5+7J2suKYHV+aAaVpTVLEFeMLJWGGsEAY40kGBRLhJ36N/e86uYCEWZvVKT9UfE4/Bat9FNS9yw6l6jU=
X-Received: by 2002:a0d:f485:0:b0:2e6:8c95:d874 with SMTP id
 d127-20020a0df485000000b002e68c95d874mr29463928ywf.23.1648541596145; Tue, 29
 Mar 2022 01:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-6-maxim.davydov@openvz.org>
In-Reply-To: <20220328211539.90170-6-maxim.davydov@openvz.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 29 Mar 2022 12:13:05 +0400
Message-ID: <CAMxuvazcTz6MjYHv-1Fx4VRtkk1pOUUSYMtY72vRPFpCt2r37Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] wctablet: add appropriate unregister handler
To: Maxim Davydov <maxim.davydov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, v.sementsov-og@mail.ru, "P. Berrange,
 Daniel" <berrange@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Michael Tsirkin <mst@redhat.com>, "Armbruster, Markus" <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 lizhijian@fujitsu.com,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhang Chen <chen.zhang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, "Bonzini,
 Paolo" <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>, den@openvz.org,
 "Blake, Eric" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 1:15 AM Maxim Davydov <maxim.davydov@openvz.org> wr=
ote:
>
> Attempt to finalize msmouse after initalization brings to segmentation
> fault in QTAILQ_REMOVE.
>
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/wctablet.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
> index e8b292c43c..43bdf6b608 100644
> --- a/chardev/wctablet.c
> +++ b/chardev/wctablet.c
> @@ -319,7 +319,9 @@ static void wctablet_chr_finalize(Object *obj)
>  {
>      TabletChardev *tablet =3D WCTABLET_CHARDEV(obj);
>
> -    qemu_input_handler_unregister(tablet->hs);
> +    if (tablet->hs) {
> +        qemu_input_handler_unregister(tablet->hs);
> +    }
>  }
>
>  static void wctablet_chr_open(Chardev *chr,
> --
> 2.31.1
>


