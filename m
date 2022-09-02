Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913FB5AB179
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:35:00 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6p1-0002IO-EY
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oU6iI-00023y-RD
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oU6iA-00054A-Dd
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662125267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLdI5EIVo4Okpj2FJPH4XPi17VI6wauDP7QcRS8jg2c=;
 b=WxVcVrzBHZcVCJHwzGuRneaP6IC8HtjLtAGfsPFIjUSTHz8mcbnY/YLF3wj4CckXG4bCPV
 wHP5ToL+SXrwMd/zqODy4vWVEzijGO7RNmsM49S2UKVUbVtUqoUWzCt3ySi1s1ZG3AA3xh
 4/21KUc7CeN59f5JvfSwqRRFQeadhiw=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-wV78vfImObCGXyh0xmweYA-1; Fri, 02 Sep 2022 09:27:44 -0400
X-MC-Unique: wV78vfImObCGXyh0xmweYA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-11eadf59e50so1000035fac.8
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 06:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=MLdI5EIVo4Okpj2FJPH4XPi17VI6wauDP7QcRS8jg2c=;
 b=GnukllB7cu0n0/modl11BI/Os4NXC4Vvd9ZWhBhsWQFPvOc+wgiPPaHZO4oxRQZ9n9
 O86sLnXa8YjFwzMtUlItnAIpNXcbRe+0j08BRwKafNAg1u7zwPHbfpJqWEtsr3wBv5Vb
 UFhifMxAnGPIIhEiB4eiDCEfW0H8CKkctuHJtxLsc5A2SyHEd3FvfWEy/zCQM9lApxwO
 f9YngC/mXt9ABlD3d6rKDwQvldUSOXjYJ/NHL1PVeFmWnvomHmtQ/tkpmBeAA45utvdc
 MijNDOzdYYZLlDZjAG1VtZteQFLkeR6TBQKuXTM4qPOzaPHoyI1QfOtegN2CqT62FumR
 DOjA==
X-Gm-Message-State: ACgBeo2WUvbrIdmkDZzksrOtjjmfxt/wpOBASeZH9hyOFLUrqDtIRVnI
 b6Iton5wQ1TCf7Y8p+mUbxkiu5BlV/ZFZBNfhASTsjWH3MRAJW4Gb9l6KoTGIWxNy3a0ubLHlLb
 ok02F9f5nAm6xa3w=
X-Received: by 2002:aca:2304:0:b0:344:eadc:770f with SMTP id
 e4-20020aca2304000000b00344eadc770fmr1825684oie.107.1662125264269; 
 Fri, 02 Sep 2022 06:27:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5j3Hgq287aFYAQKZg+92l2QlB4PgZ9XPNRDcGdrt8Y6TWGIqbStXc/hsh+0h5EvArAsjszCw==
X-Received: by 2002:aca:2304:0:b0:344:eadc:770f with SMTP id
 e4-20020aca2304000000b00344eadc770fmr1825661oie.107.1662125264005; 
 Fri, 02 Sep 2022 06:27:44 -0700 (PDT)
Received: from ?IPv6:2804:7f3:fb01:346:a2d4:22c5:c748:1982?
 ([2804:7f3:fb01:346:a2d4:22c5:c748:1982])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a9d65c4000000b00636e6dea5e5sm1025829oth.23.2022.09.02.06.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 06:27:43 -0700 (PDT)
Message-ID: <2601bbd8eebdfec7bcc682632ef1480afc81feea.camel@redhat.com>
Subject: Re: [PATCH v7 12/12] So we use multifd to transmit zero pages.
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Fri, 02 Sep 2022 10:27:36 -0300
In-Reply-To: <20220802063907.18882-13-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-13-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>=20
> ---
>=20
> - Check zero_page property before using new code (Dave)
> ---
>  migration/migration.c |  4 +---
>  migration/multifd.c   |  6 +++---
>  migration/ram.c       | 33 ++++++++++++++++++++++++++++++++-
>  3 files changed, 36 insertions(+), 7 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index ce3e5cc0cd..13842f6803 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2599,9 +2599,7 @@ bool migrate_use_main_zero_page(void)
> =20
>      s =3D migrate_get_current();
> =20
> -    // We will enable this when we add the right code.
> -    // return s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAG=
E];
> -    return true;
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAGE];
>  }
> =20
>  bool migrate_pause_before_switchover(void)
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 89811619d8..54acdc004c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -667,8 +667,8 @@ static void *multifd_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p =3D opaque;
>      Error *local_err =3D NULL;
> -    /* qemu older than 7.0 don't understand zero page on multifd channel=
 */
> -    bool use_zero_page =3D migrate_use_multifd_zero_page();
> +    /* older qemu don't understand zero page on multifd channel */
> +    bool use_multifd_zero_page =3D !migrate_use_main_zero_page();

I understand that "use_main_zero_page", which is introduced as a new capabi=
lity,
is in fact the old behavior, and the new feature is introduced when this
capability is disabled.

But it sure looks weird reading:
 use_multifd_zero_page =3D !migrate_use_main_zero_page();

This series is fresh in my mind, but it took a few seconds to see that this=
 is
actually not a typo.=20

>      int ret =3D 0;
>      bool use_zero_copy_send =3D migrate_use_zero_copy_send();
> =20
> @@ -711,7 +711,7 @@ static void *multifd_send_thread(void *opaque)
> =20
>              for (int i =3D 0; i < p->pages->num; i++) {
>                  uint64_t offset =3D p->pages->offset[i];
> -                if (use_zero_page &&
> +                if (use_multifd_zero_page &&
>                      buffer_is_zero(rb->host + offset, p->page_size)) {
>                      p->zero[p->zero_num] =3D offset;
>                      p->zero_num++;
> diff --git a/migration/ram.c b/migration/ram.c
> index 2af70f517a..26e60b9cc1 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2428,6 +2428,32 @@ static void postcopy_preempt_reset_channel(RAMStat=
e *rs)
>      }
>  }
> =20
> +/**
> + * ram_save_target_page_multifd: save one target page
> + *
> + * Returns the number of pages written
> + *
> + * @rs: current RAM state
> + * @pss: data about the page we want to send
> + */
> +static int ram_save_target_page_multifd(RAMState *rs, PageSearchStatus *=
pss)
> +{
> +    RAMBlock *block =3D pss->block;
> +    ram_addr_t offset =3D ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> +    int res;
> +
> +    if (!migration_in_postcopy()) {
> +        return ram_save_multifd_page(rs, block, offset);
> +    }
> +
> +    res =3D save_zero_page(rs, block, offset);
> +    if (res > 0) {
> +        return res;
> +    }
> +
> +    return ram_save_page(rs, pss);
> +}
> +
>  /**
>   * ram_save_host_page: save a whole host page
>   *
> @@ -3225,7 +3251,12 @@ static int ram_save_setup(QEMUFile *f, void *opaqu=
e)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
> =20
> -    (*rsp)->ram_save_target_page =3D ram_save_target_page_legacy;
> +    if (migrate_use_multifd() && !migrate_use_main_zero_page()) {
> +        (*rsp)->ram_save_target_page =3D ram_save_target_page_multifd;
> +    } else {
> +        (*rsp)->ram_save_target_page =3D ram_save_target_page_legacy;
> +    }
> +
>      ret =3D  multifd_send_sync_main(f);
>      if (ret < 0) {
>          return ret;

The rest LGTM.

FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>



