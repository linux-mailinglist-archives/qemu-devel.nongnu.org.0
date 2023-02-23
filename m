Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223676A0D36
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDi0-00021N-3E; Thu, 23 Feb 2023 10:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVDhu-0001yx-Hn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:40:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVDhr-00079s-43
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677166823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLZUE8VH+6dkkpIPjfzdL2nS7EwVm/z5YUCf7UEQs3s=;
 b=Enw8SF5JiTcceRT7ehhxtl+4wr7L5x3Qa2SquvYFiEmTUPaGVEWZ60vENyFmiWPrC/Ux/B
 Mw5fJvSahdvmrG2HJEeuIIKjfNNsN2YZwmcYUBrQYs2/X7M2w0gaR4lURNu0r7RxcU8JUJ
 t7QG8+wwhezKLt4BXFAjKw5QWb4Veng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-BI1bYQ0_Nu6_ozmL8xbr0A-1; Thu, 23 Feb 2023 10:40:20 -0500
X-MC-Unique: BI1bYQ0_Nu6_ozmL8xbr0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FD585D067;
 Thu, 23 Feb 2023 15:40:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC61FC15BA0;
 Thu, 23 Feb 2023 15:40:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E37721E6A1F; Thu, 23 Feb 2023 16:40:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,  qemu-block@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>,  Jason Wang <jasowang@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Yuval Shaia
 <yuval.shaia.ml@gmail.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fam Zheng <fam@euphon.net>,  Alexander Bulekov
 <alxndr@bu.edu>,  Bandan Das <bsd@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Darren Kenny
 <darren.kenny@oracle.com>,  Qiuhao Li <Qiuhao.Li@outlook.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 3/5] bulk: Have object_child_foreach() take Error* and
 return boolean
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-4-philmd@linaro.org>
Date: Thu, 23 Feb 2023 16:40:17 +0100
In-Reply-To: <20230216122524.67212-4-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Feb 2023 13:25:22
 +0100")
Message-ID: <875ybss84e.fsf@pond.sub.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> Following the Error API best practices documented in commit
> e3fe3988d7 ("error: Document Error API usage rules"), have the
> object_child_foreach[_recursive]() handler take a Error* argument
> and return a boolean indicating whether this error is set or not.
> Convert all handler implementations.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This patch does several things (no, I'm not going to ask to split it):

* Convert object_child_foreach() and object_child_foreach_recursive() to
  the Error API: add parameter Error **errp, change return type from int
  to bool.

  Straightforward.

* Adjust the callers: pass the new argument.

  Looks like you pass NULL, which makes sense for a conversion such as
  this.  Always NULL?

* Convert object_child_foreach()'s and
  object_child_foreach_recursive()'s callback parameter to the Error
  API: add parameter Error **errp, change return type from int to bool.

  Straightforward.

* Adjust the actual callbacks: take the new parameter and use it
  properly, return bool instead of int.

  Either don't touch @errp and return true, or store an error to @errp
  and return false.

  You're not doing this at least in bmc_find(), see right below.

  I don't have the time for checking all the callbacks today.  Mind
  doing that yourself?

[...]

> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 99f1e8d7f9..05acc88a55 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -283,17 +283,17 @@ typedef struct ForeachArgs {
>      Object *obj;
>  } ForeachArgs;
>=20=20
> -static int bmc_find(Object *child, void *opaque)
> +static bool bmc_find(Object *child, void *opaque, Error **errp)
>  {
>      ForeachArgs *args =3D opaque;
>=20=20
>      if (object_dynamic_cast(child, args->name)) {
>          if (args->obj) {
> -            return 1;
> +            return false;

No error set here.

>          }
>          args->obj =3D child;
>      }
> -    return 0;
> +    return true;
>  }
>=20=20
>  IPMIBmc *pnv_bmc_find(Error **errp)

[...]


