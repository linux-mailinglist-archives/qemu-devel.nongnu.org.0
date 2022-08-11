Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24258F8F0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 10:21:25 +0200 (CEST)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM3RS-00077i-UL
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 04:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3Hy-00005A-9D
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3Hw-0000Jq-Du
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660205491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loI5xv0OBHRlLXVRQ0M4jzh51GrYE75qga6KjSQUzPk=;
 b=VKMKdl3Wf8YMU9nW3HfGudiMEvh5P7VXiO3JwphqJyoLP/GZhWK/XXrYFn7pUaxsMDg7vU
 vvxRW2uHoP5P2lvd0kxekU9BbojIlomKajk0kiP488jw3vast+gdh6TUrVGcPl7yjTrfLi
 OOjxxe26wppVLqavM2FyKy43fjqnOpU=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-dixVPocENDKh4k-r5AsyYQ-1; Thu, 11 Aug 2022 04:11:30 -0400
X-MC-Unique: dixVPocENDKh4k-r5AsyYQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 j15-20020a056102000f00b00386db4622c2so2833258vsp.18
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 01:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=loI5xv0OBHRlLXVRQ0M4jzh51GrYE75qga6KjSQUzPk=;
 b=FBWUC0MIHBHKeeK6uJ/ZA6CZVObcnXconzhusHRXtDrCZpBSau0MF1tvOYPULyX+9N
 0TvHBejTcDdlyy/gCOnPboe+uES1FMsRWRriC+WomJeSvhvgxaaMiNNGnMxE+8U86SHk
 nAjtZlSt0SJIYzhUOcYeNu4Xwe/mjlAR7erO6TIFnyn9VWQbCCIOJWYykV+exmDHAKvj
 TztjYKJ/I2d0r77Gz+f8EieyZ9dQZKs8JQ+DApXCVQKuFc8bbcI2OlJ71oNw9OCTJAzI
 L5Vu3dxGW4PSyS/gSUIBok+DO/6h/eDtKEJ8FYgu8BhE7XlvHjPUYIUZWjz0HunJHq10
 Z9Jw==
X-Gm-Message-State: ACgBeo1BANr5P714ZqIz9YjRkisNv1R5SDBG+xJbye1WzfmCoBl3lx2S
 1+oVZlI6YPaZ42OeG+dArgvW4Qov8Tda7iN4j+/LImGY47EsvBeE5JyDammb4Dy0HLSfF+0opzt
 x/Hvq9kHcFj/RFek=
X-Received: by 2002:a67:c814:0:b0:385:1a6b:7284 with SMTP id
 u20-20020a67c814000000b003851a6b7284mr13187914vsk.15.1660205489836; 
 Thu, 11 Aug 2022 01:11:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5A1EPbXShbT+pqXgZwbCaebnGh4sm+jV0hPS1imU9tP7DGh4iGNhw22P+eb0W027e8K7wECg==
X-Received: by 2002:a67:c814:0:b0:385:1a6b:7284 with SMTP id
 u20-20020a67c814000000b003851a6b7284mr13187903vsk.15.1660205489635; 
 Thu, 11 Aug 2022 01:11:29 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 d203-20020a1f9bd4000000b00374060fae12sm1515633vke.4.2022.08.11.01.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:11:29 -0700 (PDT)
Message-ID: <01fcdde9f6246836b4058efc8c298a82e86d1458.camel@redhat.com>
Subject: Re: [PATCH v7 05/12] migration: Make ram_save_target_page() a pointer
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 05:11:25 -0300
In-Reply-To: <20220802063907.18882-6-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-6-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> We are going to create a new function for multifd latest in the series.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Double Signed-off-by again.

> ---
>  migration/ram.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index 85d89d61ac..499d9b2a90 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -310,6 +310,9 @@ typedef struct {
>      bool preempted;
>  } PostcopyPreemptState;
> =20
> +typedef struct RAMState RAMState;
> +typedef struct PageSearchStatus PageSearchStatus;
> +
>  /* State of RAM for migration */
>  struct RAMState {
>      /* QEMUFile used for this migration */
> @@ -372,8 +375,9 @@ struct RAMState {
>       * is enabled.
>       */
>      unsigned int postcopy_channel;
> +
> +    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
>  };
> -typedef struct RAMState RAMState;
> =20
>  static RAMState *ram_state;
> =20
> @@ -2255,14 +2259,14 @@ static bool save_compress_page(RAMState *rs, RAMB=
lock *block, ram_addr_t offset)
>  }
> =20
>  /**
> - * ram_save_target_page: save one target page
> + * ram_save_target_page_legacy: save one target page
>   *
>   * Returns the number of pages written
>   *
>   * @rs: current RAM state
>   * @pss: data about the page we want to send
>   */
> -static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
> +static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *p=
ss)
>  {
>      RAMBlock *block =3D pss->block;
>      ram_addr_t offset =3D ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> @@ -2469,7 +2473,7 @@ static int ram_save_host_page(RAMState *rs, PageSea=
rchStatus *pss)
> =20
>          /* Check the pages is dirty and if it is send it */
>          if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> -            tmppages =3D ram_save_target_page(rs, pss);
> +            tmppages =3D rs->ram_save_target_page(rs, pss);
>              if (tmppages < 0) {
>                  return tmppages;
>              }
> @@ -3223,6 +3227,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque=
)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
> =20
> +    (*rsp)->ram_save_target_page =3D ram_save_target_page_legacy;
>      ret =3D  multifd_send_sync_main(f);
>      if (ret < 0) {
>          return ret;


So, IIUC:
- Rename ram_save_target_page -> ram_save_target_page_legacy
- Add a function pointer to RAMState (or a callback)
- Assign function pointer =3D ram_save_target_page_legacy at setup
- Replace ram_save_target_page() by indirect function call using above poin=
ter.

I could see no issue in this, so I belive it works fine.

The only thing that concerns me is the name RAMState.
IMHO, a struct named RAMState is supposed to just reflect the state of ram =
(or
according to this struct's comments, the state of RAM for migration. Having=
 a
function pointer here that saves a page seems counterintuitive, since it do=
es
not reflect the state of RAM.

Maybe we could rename the struct, or even better, create another struct tha=
t
could look something like this:

struct RAMMigration {
    RAMState state;
    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
    /* Other callbacks or further info.*/
}

What do you think about it?

Best regards,=20
Leo


