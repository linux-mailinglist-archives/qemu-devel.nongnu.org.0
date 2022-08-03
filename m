Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF0588AC2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:50:27 +0200 (CEST)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBxK-000448-FX
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oJBth-0002NK-4i
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oJBtf-0006Se-Lk
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659523598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MdnLN5PIt1FMlGFlixO3xRUWYIqpyA/qYv0kgPzaN/4=;
 b=a5VJMMnbzzEUM4EQyuLNLtRMYq0qGstTfb+654bnD/XCmoZMTFzMDrq+Tpv1oSM8/HIuEL
 KCfrJ6zgDfhbOdLkHxdepBKT0cFQBM4moJucbOduIeLIc2QxWZLCHPlesZ4vid0CiJlz8u
 xgKpWA7odtNSbeIJ7MTGyZa6YZwLiHs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-bJOLshNgPfmtY2kTQRcpRg-1; Wed, 03 Aug 2022 06:46:33 -0400
X-MC-Unique: bJOLshNgPfmtY2kTQRcpRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 d10-20020a05600c34ca00b003a4f0932ec3so899664wmq.0
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 03:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MdnLN5PIt1FMlGFlixO3xRUWYIqpyA/qYv0kgPzaN/4=;
 b=k+eiDfFpwdRjRy8diYBCaPcVUMHStsk52v1jXiMJJjFc5wdCpE1jtT/0EJ8bv/YORG
 WuVSskbbxAefrR9CnzQM1TS8rZH9bWnnBpNlUicFwWPkwxW4uf9KgTBuArdjKXEsgXnM
 WtRtpCvll62+NgzX9yCdUW5ZQniBRb++11/tv4uonSvzxJa0KHVOZkWhmCPsDycmEhsA
 hAXGQGr8sbm0uyMdXYQTanKrUiSVAAY4qxwu+8LCvAl6CdGbzOZpd8hc32HMC9yTXoI8
 27MLmJ4lHxz4dICuCOtGkfxefDYwQmRj4mZNn+ub4tLL6L4WzAwAoKvgKkZT6v7OjnmD
 mpQQ==
X-Gm-Message-State: ACgBeo12DGryq8hlBX+3sawOA4+DTc3ephR7im2/B/fMsd/QzvuinyUj
 mEWmRwWzdgmkKy3r5qTU91MWVE6G61Bg/czoxwqSHyERLLm9oYEjOmf6Qq9QNXrlEh1OYcf65e3
 b5o+RSL1bf5HhYOk=
X-Received: by 2002:a05:600c:4b96:b0:3a4:e8c6:97fa with SMTP id
 e22-20020a05600c4b9600b003a4e8c697famr2388971wmp.102.1659523590307; 
 Wed, 03 Aug 2022 03:46:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR469/a5z2MM262xtAy5hyusMtpj0BUZe7dtHcbtdxY+7tPKtrPBq6S4/4D+U15jJicJLhkp6A==
X-Received: by 2002:a05:600c:4b96:b0:3a4:e8c6:97fa with SMTP id
 e22-20020a05600c4b9600b003a4e8c697famr2388909wmp.102.1659523590082; 
 Wed, 03 Aug 2022 03:46:30 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a3278d5cafsm1958553wmi.28.2022.08.03.03.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 03:46:29 -0700 (PDT)
Date: Wed, 3 Aug 2022 11:46:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alberto Faria <afaria@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Peter Lieven <pl@kamp.de>, kvm@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Weil <sw@weilnetz.de>, Klaus Jensen <its@irrelevant.dk>,
 Laurent Vivier <lvivier@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Michael Roth <michael.roth@amd.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC v2 02/10] Drop unused static function return values
Message-ID: <YupSAhFRK962i+nL@work-vm>
References: <20220729130040.1428779-1-afaria@redhat.com>
 <20220729130040.1428779-3-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729130040.1428779-3-afaria@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alberto Faria (afaria@redhat.com) wrote:
> Make non-void static functions whose return values are ignored by
> all callers return void instead.
> 
> These functions were found by static-analyzer.py.
> 
> Not all occurrences of this problem were fixed.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

<snip>

> diff --git a/migration/migration.c b/migration/migration.c
> index e03f698a3c..4698080f96 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -175,7 +175,7 @@ static MigrationIncomingState *current_incoming;
>  
>  static GSList *migration_blockers;
>  
> -static bool migration_object_check(MigrationState *ms, Error **errp);
> +static void migration_object_check(MigrationState *ms, Error **errp);
>  static int migration_maybe_pause(MigrationState *s,
>                                   int *current_active_state,
>                                   int new_state);
> @@ -4485,15 +4485,15 @@ static void migration_instance_init(Object *obj)
>   * Return true if check pass, false otherwise. Error will be put
>   * inside errp if provided.
>   */
> -static bool migration_object_check(MigrationState *ms, Error **errp)
> +static void migration_object_check(MigrationState *ms, Error **errp)
>  {

I'm not sure if this is a good change.
Where we have a function that returns an error via an Error ** it's
normal practice for us to return a bool to say whether it generated an
error.

Now, in our case we only call it with error_fatal:

    migration_object_check(current_migration, &error_fatal);

so the bool isn't used/checked.

So I'm a bit conflicted:

  a) Using error_fatal is the easiest way to handle this function
  b) Things taking Error ** normally do return a flag value
  c) But it's not used in this case.

Hmm.

Dave

>      MigrationCapabilityStatusList *head = NULL;
>      /* Assuming all off */
> -    bool cap_list[MIGRATION_CAPABILITY__MAX] = { 0 }, ret;
> +    bool cap_list[MIGRATION_CAPABILITY__MAX] = { 0 };
>      int i;
>  
>      if (!migrate_params_check(&ms->parameters, errp)) {
> -        return false;
> +        return;
>      }
>  
>      for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
> @@ -4502,12 +4502,10 @@ static bool migration_object_check(MigrationState *ms, Error **errp)
>          }
>      }
>  
> -    ret = migrate_caps_check(cap_list, head, errp);
> +    migrate_caps_check(cap_list, head, errp);
>  
>      /* It works with head == NULL */
>      qapi_free_MigrationCapabilityStatusList(head);
> -
> -    return ret;
>  }
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


