Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07B63C93B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:30:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07Di-0004EM-0F; Tue, 29 Nov 2022 15:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1p07Dg-0004EB-8N
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:28:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1p07De-0006K8-Tv
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669753721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7xNJ4kMO7fV8AM5JwOToFaNCDTcDsmCvQ7fvcUap/Sk=;
 b=hAPLdd3XP9RPgIY4i15et9Ff0GjJXgvudKyXDZwmifO+T1v7UtSvQr4TFsUnsCMmmbxfAD
 bf4eMd61FrXVvUaqUPaEBesPxJF8VQ8MZtT//Yl9vAzofbG57O+HI3GEn+L5Gv3zfv+YOB
 LXo4pvrgG6Bb/8XlHYEJtibeQ2OU+1Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-0iJCnnbVMyKAM0JnEnIm9g-1; Tue, 29 Nov 2022 15:28:38 -0500
X-MC-Unique: 0iJCnnbVMyKAM0JnEnIm9g-1
Received: by mail-qk1-f198.google.com with SMTP id
 i21-20020a05620a405500b006fb25ba3e00so31269712qko.1
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 12:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xNJ4kMO7fV8AM5JwOToFaNCDTcDsmCvQ7fvcUap/Sk=;
 b=QnpSzIyzk2g7WjyD3K1adT3nKjlW/0F7MGK2YjBAwruWphzx7J17DT03mU2QviJ0jE
 f/Uz7JPvIjmYBlcwJx68zZkFr/N7QnLaSEEG954i7NO6UR7wMGFZlWV0dgs0YBn5g8HF
 HAGYypvJ9Oc0npuTkQBwBliBuKg6iPQsF17b6A9/lq37wDMihn6nvJ8KVTUBIv0UJxIz
 og743uz0lvxDOZJq8fJctahKBVrHjHiPMZYyXhdB20XUDHXoG+5DvorwYCyObYmzD4Jf
 3A0akdiImUtSeOsPe/YAwtMaLHIX8znI0Dh4JovBJ0dM2psDoD+qrgH2uHhmVS8KMi5y
 4aLQ==
X-Gm-Message-State: ANoB5pklfpMVEuyw+eh/UhH6pEteD02bV01nN6iLIbGVSU2NMdr60iUV
 z8UywmRDGzlpAf02DdFaBtP9LL/bKeSsFZY9YwSiMYRU7DZbbJ64eRoxr8OqJPubgThQqYqVhs8
 2xnim1aaXzi84zjMUN3ehmhxfhfyJKwk=
X-Received: by 2002:ac8:44b5:0:b0:3a4:e32b:2f7e with SMTP id
 a21-20020ac844b5000000b003a4e32b2f7emr54385930qto.320.1669753718300; 
 Tue, 29 Nov 2022 12:28:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf57e8VW2QjvEi48X1erbP2OxOF/YveKlXa5oP4MFae9655SqLWUuBFp26WE76sLD+MOmj1jCfsKdfnByV7C0K4=
X-Received: by 2002:ac8:44b5:0:b0:3a4:e32b:2f7e with SMTP id
 a21-20020ac844b5000000b003a4e32b2f7emr54385917qto.320.1669753718040; Tue, 29
 Nov 2022 12:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20221109055629.789795-1-leobras@redhat.com> <Y3+WGof3MQtaCYdS@x1n>
In-Reply-To: <Y3+WGof3MQtaCYdS@x1n>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 29 Nov 2022 17:28:26 -0300
Message-ID: <CAJ6HWG4KaEbUYHe75i4ty66nosHEM8ZJW0c1W4Q=s4YeNnP_rA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
To: Peter Xu <peterx@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 Li Xiaohui <xiaohli@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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

Hello Peter,

On Thu, Nov 24, 2022 at 1:04 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Nov 09, 2022 at 02:56:29AM -0300, Leonardo Bras wrote:
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index a0cdb714f7..250caff7f4 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >          exit(EXIT_FAILURE);
> >      }
> >
> > +    migration_load_cleanup();
>
> It's a bit weird to call multifd-load-clean in a listen phase..

I agree.

>
> How about moving it right above
> trace_process_incoming_migration_co_postcopy_end_main()?  Then the new
> helper can also be static.

Seems a nice Idea to have this function to be static.

We have to guarantee this is run after the migration finished, but
before migration_incoming_state_destroy().

You suggested calling it right above of
trace_process_incoming_migration_co_postcopy_end_main(), which git
grep pointed me to an if clause in process_incoming_migration_co().
If I got the location correctly, it would not help: this coroutine is
ran just after the VM went to the target host, and not when the
migration finished.

If we are using multifd channels, this will break the migration with
segmentation fault (SIGSEGV), since the channels have not finished
sending yet.

Best regards,
Leo




>
> > +
> >      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
> >                                     MIGRATION_STATUS_COMPLETED);
> >      /*
> > --
> > 2.38.1
> >
>
> --
> Peter Xu
>


