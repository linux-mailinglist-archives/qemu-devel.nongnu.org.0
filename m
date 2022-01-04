Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF89483F1E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:25:20 +0100 (CET)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4g4F-0000bf-6A
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:25:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4g2P-0007pV-0q
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4g2N-00005E-C3
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641288202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7l/VSKcwZ3YwWv9gQySYhEfeiJ120ts0adXdqNo1jOg=;
 b=e4N5uSnOGuaIGKLXLlyMZjnKuiXuFW2pnxJ6JXzH6Xffm82lcvyawcG12G7neTWinys9rR
 ddGCnqaOx6TCdqO9c/2IT106eXxTxQPEIOqephhyQG0lETqJYlQNgiycWGfTZhjI7tbbVb
 Pc9eYEI+wx5EIp+qztLxtJXv8ppG8ZI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-epq-ZpaYMMiPEb_TXTMUSQ-1; Tue, 04 Jan 2022 04:23:21 -0500
X-MC-Unique: epq-ZpaYMMiPEb_TXTMUSQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 a14-20020a17090a8c0e00b001b2c566be8dso1625124pjo.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7l/VSKcwZ3YwWv9gQySYhEfeiJ120ts0adXdqNo1jOg=;
 b=Oz1xXewm/xXcH9Pb1z+mLJjmmWSQpdCbYPO8c5EXwLWvDTSi4bBA20sxxiAjJbu5ya
 lxQ79J6djixImpg8CfCXU4JUifH6Sf8EZM/B1YK1GCsOKb7Dut/YwAWapvLX2VrXGZHW
 D/fcbUidGprMEuhj0lMVKg+5VczuIbOEVxq1SRmgUQetc1bP+xqbUzGVk6FQ8KwpQeyU
 7BZbCQGniRMhwI3isNa9sYvO4TxZZe1lUSIDHFp6WisJPxXKTaOHPf0r9rX9bM7kL/nJ
 gq4ZfkPjKCL/394RIyk9np/gM34VRK9plss0msJ9btwUvLQKwHnd3n9sxFjnXqoErZby
 cv9A==
X-Gm-Message-State: AOAM532CK7Fjw7QrNtVbRceKNssp+wtEpFQdGh0p0qDqrg1tu1mYClS/
 mofjNghH/udP1MVRaTT8r9B5zWfblOj3TPVvfw2tZWAhb0AUiuxIbEPw/uKxZpoO2MV/SbteQgG
 aCB3j8JcXBuZ03NE=
X-Received: by 2002:a17:902:8215:b0:149:8429:43a4 with SMTP id
 x21-20020a170902821500b00149842943a4mr34234777pln.136.1641288200473; 
 Tue, 04 Jan 2022 01:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKlHtR21Z4bb3hMuKppalk5hS4PaqC/cD+Q8SCg+AuYeLXZWsaJVpcK7kDAqWExGXj0R+NDw==
X-Received: by 2002:a17:902:8215:b0:149:8429:43a4 with SMTP id
 x21-20020a170902821500b00149842943a4mr34234756pln.136.1641288200194; 
 Tue, 04 Jan 2022 01:23:20 -0800 (PST)
Received: from xz-m1.local ([191.101.132.50])
 by smtp.gmail.com with ESMTPSA id f125sm31231803pfa.28.2022.01.04.01.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:23:19 -0800 (PST)
Date: Tue, 4 Jan 2022 17:23:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] migration: Don't return for postcopy_send_discard_bm_ram()
Message-ID: <YdQSApCaFi3bZMoj@xz-m1.local>
References: <20211230160525.462185-1-philmd@redhat.com>
 <871r1n7tgb.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <871r1n7tgb.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 10:15:16AM +0100, Juan Quintela wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > postcopy_send_discard_bm_ram() always return zero. Since it can't
> > fail, simplify and do not return anything.
> >
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> > Based-on: <20211224065000.97572-1-peterx@redhat.com>
> > ---
> >  migration/ram.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 5234d1ece11..e241ce98461 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -2433,14 +2433,12 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
> >  /**
> >   * postcopy_send_discard_bm_ram: discard a RAMBlock
> >   *
> > - * Returns zero on success
> > - *
> >   * Callback from postcopy_each_ram_send_discard for each RAMBlock
> >   *
> >   * @ms: current migration state
> >   * @block: RAMBlock to discard
> >   */
> > -static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
> > +static void postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
> >  {
> >      unsigned long end = block->used_length >> TARGET_PAGE_BITS;
> >      unsigned long current;
> > @@ -2464,8 +2462,6 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
> >          postcopy_discard_send_range(ms, one, discard_length);
> >          current = one + discard_length;
> >      }
> > -
> > -    return 0;
> >  }
> >  
> >  static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
> 
> Nack.
> 
> You need to change the only caller (postcopy_each_send_discard) also.
> 
>         ret = postcopy_send_discard_bm_ram(ms, block);
>         postcopy_discard_send_finish(ms);
>         if (ret) {
>             return ret;
>         }
> 
> Not sure if doing the same operation with
> postcopy_each_send_discard/ram_postcopy_send_discard_bitmap() and
> postcopy_chunk_hugepages makes sense.

Juan,

Phil's patch has a based-on dependency with the other patch:

https://lore.kernel.org/qemu-devel/20211224065000.97572-6-peterx@redhat.com/

Thanks,

-- 
Peter Xu


