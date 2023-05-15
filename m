Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430317029DD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:02:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyV1P-0000AY-RX; Mon, 15 May 2023 06:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyV1M-0000AC-8t
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyV1K-00008p-JC
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684144893;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+er3SmwxNzckxz5VtOsZb3kaVfUpRRYhO619Y4S63Zg=;
 b=S/qkavYgw1CjvQJuGW8zZHL26LY4Y0WyyIGreyGtD8kjyuPSvF6+4581TEJEgyDC97flhV
 Ugatu2nsqq87wiXkl0Y3juzwpHZ2tIsB58Gb3kxH0+SOreFgAkwKjbXejaGo1EfMGD6oX0
 dlfN/wHYvbFXf4Xnae8tfQvtIsvFiT0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-hsit1v3HPlu641-MJUgZug-1; Mon, 15 May 2023 06:01:32 -0400
X-MC-Unique: hsit1v3HPlu641-MJUgZug-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so5843384f8f.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684144891; x=1686736891;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+er3SmwxNzckxz5VtOsZb3kaVfUpRRYhO619Y4S63Zg=;
 b=XZhmtwA+iWMxfYqqx4+eL08xOWVKy9n/mOI4lkp63NNNg889lIi9swK8AIa27+YLBi
 QZhO+4m3N/WJ19ylKy8a29JEAuglhWSdg6QjGK+aT5a9wn4JMsfS6/u4xKrzVHjo6knI
 VdyW2SnXRvAw2HR8MyrPGIr7CWs2t+yDxMemQQGMfkqJ/RcGwW9QLMq4can3eIn6N6RM
 mb1kfOLEXTB8vtaIU/QpFA3zZvd4LnDuDK72Ef4MxyVmY7toh8nK+5Kpcr6LbtqQeYTI
 xgaupGmP/3hTTjBW45JfYo8NJny8Ugp7pp6zTh1xk2oamiI73xoZtMerj++9ZybavV4V
 zZOw==
X-Gm-Message-State: AC+VfDxH4t7lBb8sazSif7XM5BeEAJHfkT3y4h58vwso2Wo2adbBkJl5
 Qs2hZdvaKlHusXd1u0FrAXlLxPgP9un8bTNwM283dPnuz+gY+7c+CL/BpXiOUAZIh4bNQClrZvd
 4HrDcvIemccJSd6A=
X-Received: by 2002:a5d:4d44:0:b0:306:484e:e568 with SMTP id
 a4-20020a5d4d44000000b00306484ee568mr25000467wru.40.1684144891428; 
 Mon, 15 May 2023 03:01:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ocMnCFoGEWdZtYwZnCQnCj4gnYQ7wTIoVLN27lOtptEc3Wv0e8iOtH3R7QMRiRBLBuZfi/g==
X-Received: by 2002:a5d:4d44:0:b0:306:484e:e568 with SMTP id
 a4-20020a5d4d44000000b00306484ee568mr25000442wru.40.1684144891105; 
 Mon, 15 May 2023 03:01:31 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003f4289b18a7sm20808403wma.5.2023.05.15.03.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 03:01:30 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 7/8] migration: modified 'migrate-incoming' QAPI to
 accept 'channels' argument for migration.
In-Reply-To: <20230512143240.192504-8-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:39 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-8-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 12:01:29 +0200
Message-ID: <87jzx929s6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> MigrateChannelList ideally allows to have multiple listener interfaces up for
> connection.
>
> Added MigrateChannelList struct as argument to 'migrate-incoming' qapi. Introduced
> MigrateChannelList in hmp_migrate_incoming() and qmp_migrate_incoming() functions.
>
> Future patchset series plans to include multiple MigrateChannels to have multiple
> listening interfaces up. That is the reason, 'MigrateChannelList' is the preferred
> choice of argument over 'MigrateChannel' and making 'migrate-incoming' QAPI future
> proof.
>
> For current patch, have just limit size of MigrateChannelList to 1 element as
> a runtime check.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration-hmp-cmds.c | 14 +++++++++++++-
>  migration/migration.c          | 21 ++++++++++++++++----
>  qapi/migration.json            | 35 +++++++++++++++++++++++++++++++++-
>  softmmu/vl.c                   |  2 +-
>  4 files changed, 65 insertions(+), 7 deletions(-)
>
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index f098d04542..8c11a8c83b 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -518,10 +518,22 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
>      const char *uri = qdict_get_str(qdict, "uri");
> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
> +    MigrateChannelList *caps = NULL;
> +
> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
> +        error_setg(&err, "error in retrieving channel from qdict");
> +        goto end;
> +    }
>  
> -    qmp_migrate_incoming(uri, &err);
> +    QAPI_LIST_PREPEND(caps, channel);
> +    qmp_migrate_incoming(uri, !!caps, caps, &err);
> +    qapi_free_MigrateChannelList(caps);
>  
> +end:
> +    qapi_free_MigrateChannel(channel);
>      hmp_handle_error(mon, err);
> +    return;

Useless return?


The rest seeams ok.


