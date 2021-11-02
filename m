Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316C442E5E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:40:52 +0100 (CET)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht5u-0003jc-HY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhsxY-0000Dq-OF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhsxW-0000Gf-6t
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856328;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Fx/HPzm8LbFmkIQ9dvtkfB3vSF+qQpWjQpQfMWrLdfs=;
 b=Mx77VCJxKP8x5k4fQV9lxRGrZj4hM9uqoLlpTTwDibJh4FTXhELaI2jWw/3umvQj7P9Ilw
 RS5Bzl9KBK2jaoXy6O5q5wY0MumifjSKo12wD4LX9Qoyt6DZ5zf4SDuo75XbFaLmkriyvq
 GkuTtYTbGG6cR6Hht9FOxu10U5It7aY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-uj3m1cqoMQ-ajld5XM1H7A-1; Tue, 02 Nov 2021 08:32:07 -0400
X-MC-Unique: uj3m1cqoMQ-ajld5XM1H7A-1
Received: by mail-wr1-f70.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so4111063wrj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Fx/HPzm8LbFmkIQ9dvtkfB3vSF+qQpWjQpQfMWrLdfs=;
 b=Z+6MHEr5/u+dGi94P5Do48uKhK/zkorgF6LL7iLnFArEQCDEk3TLeNv+CtHirIsEVg
 Hq8Pbi6A7SEgVj/L2TrAt9foMWlRNr4AkZl8xpy+9VmItFmYn2GT1qxgd4BgfGKB5Nyd
 xNkxA3FMiEFtq3cfVHugJlGc5VSHjLbOnVBAhvEzEOr6j2RsfQRqO6BUY2r9lKInRTMI
 x3buBx9iQmNJ2VyIenGfgxeSqtJjxDBrcY4kkfQeIZX5Ik5CdogNsBSzwqP6SNefPCmu
 bf4xDLtwuo4Yw2BxU7qqBK6nLpK+AlUXlkH0ebT4ncneGvj2xtBBlRrNXntxPRg/gbco
 4WXg==
X-Gm-Message-State: AOAM532QdM61x72RP5jJlgF7c3PlXNiUo57MHCMHCRVhGyDqCTdEK1Ka
 IFJIPloVpSJS0xVZdQKOo9WTdwgHV7LCU2IHGWfaL9UALChtVPYThudzcDXC+9La2H/oXqABxqH
 sBQJqwmnT/YgFzK0=
X-Received: by 2002:a5d:5850:: with SMTP id i16mr21256983wrf.197.1635856326741; 
 Tue, 02 Nov 2021 05:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkqV+ggTMDCGlxaaSqiH31/gPFoXyY2DJs5wv5a7q/bFdVo370p4vhlg6szVgLF44e19YMvA==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr21256947wrf.197.1635856326503; 
 Tue, 02 Nov 2021 05:32:06 -0700 (PDT)
Received: from localhost ([77.208.170.68])
 by smtp.gmail.com with ESMTPSA id x1sm2023899wru.40.2021.11.02.05.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:32:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
In-Reply-To: <20211009075612.230283-4-leobras@redhat.com> (Leonardo Bras's
 message of "Sat, 9 Oct 2021 04:56:13 -0300")
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 13:32:04 +0100
Message-ID: <87sfwekabf.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> zerocopy interface.
>
> Change multifd_send_sync_main() so it can distinguish the last sync from
> the setup and per-iteration ones, so a flush_zerocopy() can be called
> at the last sync in order to make sure all RAM is sent before finishing
> the migration.

You need to do this after each iteration.  Otherwise it can happen that:

channel 1:               channel 2:

   send page 11

next iteration
                         send page 11

                         this page arrives

now arrives this old copy.

After each iteration, one needs to be sure that no ram is inflight.

This means that I think you don't need the last_sync parameter at all,
as you have to do the flush() in every iteration.

> Also make it return -1 if flush_zerocopy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
>
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between async_send() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
>
> Given a lot of locked memory may be needed in order to use multid migration
> with zerocopy enabled, make it optional by creating a new parameter
> multifd-zerocopy on qapi, so low-privileged users can still perform multifd
> migrations.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

I think it is better that you split this patch into two:

- Add the new parameter (it looks good to me, and can be reviewed-by)
- Implement the feature, here probably you need more changes/review


>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> +	    '*multifd-zerocopy': 'bool',
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }

Something weird here.

>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> +	    '*multifd-zerocopy': 'bool',
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>  

Same here.


> @@ -105,7 +105,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
>   */
>  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> +    int flags = 0;
> +
> +    if (migrate_multifd_zerocopy()) {
> +        flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> +    }

You have added an if on each write, just add it during initialization.

There is already a uint32_t flags field in MultiFDRecvParams, but you
can add a

int write_flags;

one and add it during initialization.  That way you don't need any check
here, just pass it.

> +    return qio_channel_writev_all_flags(p->c, p->pages->iov, used, flags, errp);


> -void multifd_send_sync_main(QEMUFile *f)
> +int multifd_send_sync_main(QEMUFile *f, bool last_sync)

As you need to check every round, you now have to check for errors on
every multifd_send_sync_main() call.  It really looked weird that you
only need to check it sometimes.

> @@ -3006,13 +3006,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>          ram_control_after_iterate(f, RAM_CONTROL_FINISH);
>      }
>  
> -    if (ret >= 0) {
> -        multifd_send_sync_main(rs->f);
> -        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> -        qemu_fflush(f);
> +    if (ret < 0) {
> +        return ret;
>      }
>  
> -    return ret;
> +    ret = multifd_send_sync_main(rs->f, true);
> +    if (ret < 0) {
> +        return -1;

Why are you returning -1 instead of ret?

Callers of ram_save_complete(). We set qemu_error_file() with that
error, so it is not a good idea to reset it.


Later, Juan.


