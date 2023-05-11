Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0FD6FEFC7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3Lt-0002k3-L0; Thu, 11 May 2023 06:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px3Lo-0002j2-VH
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px3Ln-0003d2-1k
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683800201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YfVQ5eqWeaZmu7c9ee1+CTfDk2uK4OWbyPCPtaQvDL8=;
 b=eb53lTgsCxgJaGDHoUedgsxPKiuRHfOJyFcUUxnjGGkuEwKPG4rP2mvAUWvIRX13LVdaxL
 lZnA15AmE0ALRYKoUeN7KDp2RAuOh55MkxnxgBQ7wO7lR+Taoi8yPjxutfQ7cDFut9Sn0S
 DVbRPCbL6oxyusdyW6OPvW4rxKFlQWE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-cw6GVORiM6W-TQP-7BjJ5A-1; Thu, 11 May 2023 06:16:40 -0400
X-MC-Unique: cw6GVORiM6W-TQP-7BjJ5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30643d4a430so2959859f8f.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683800200; x=1686392200;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfVQ5eqWeaZmu7c9ee1+CTfDk2uK4OWbyPCPtaQvDL8=;
 b=YYz6FUegWsQ9d28oVTx3tRiW1xmoN3M8UYn+98mpX2ljy3Q5YOlASVPXxNS2rUE0TQ
 3wRK+g1g5paVXcgDioznMPQRUR4JFrzSQRN6h/4/Lcaaa3QwrKC3MLTaOmbkQzI8w/L4
 Ltok8kHvhp409iZhvd9YrgE+TbSz9ciHixze1UPN8u9R6SN+ncNXI3kxnpRqseccltrR
 xU87ZPNPJ6LoFHP1l2ljLraIxr/yWsoIvWpWfo5/deAySOZWvseoS4kaIRLhTSsZ3aj0
 RwloeEnxAQpPY21oIvmmEHIUDoPv6ApEbGFF2rRYN+MdkVRcOzTVkY0fly5nPCf+Un75
 gkEw==
X-Gm-Message-State: AC+VfDyJE4m4H8aA1kaGbAs3BRoJgylr0q+BsMW6cqQhgSfdFPj+cV+L
 C75oeUXX9iEbtfK1uE6z+xLFJHal9dg4VpWcvWFCrE/Mp8+SzbHA04VX2iPAhSkpthxx5xZ0hqT
 h5fm9reyVRUKq6+A=
X-Received: by 2002:a5d:6a8b:0:b0:304:6762:2490 with SMTP id
 s11-20020a5d6a8b000000b0030467622490mr15684070wru.3.1683800199801; 
 Thu, 11 May 2023 03:16:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7BFSRPk7Zo08IODMv8yL/qDNr5lvHPsUoZCw1B+I0ioYs8ZemB+0Xaau2XTY/MEriqYdZBDw==
X-Received: by 2002:a5d:6a8b:0:b0:304:6762:2490 with SMTP id
 s11-20020a5d6a8b000000b0030467622490mr15684052wru.3.1683800199477; 
 Thu, 11 May 2023 03:16:39 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm20024760wrt.74.2023.05.11.03.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:16:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH] multifd: Add colo support
In-Reply-To: <20230511100227.2fd1b86d@gecko.fritz.box> (Lukas Straub's message
 of "Thu, 11 May 2023 12:02:27 +0200")
References: <20230509181528.84212-1-quintela@redhat.com>
 <20230511094713.6f08730c@gecko.fritz.box>
 <87fs835h54.fsf@secure.mitica>
 <20230511100227.2fd1b86d@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 12:16:38 +0200
Message-ID: <87bkir5g1l.fsf@secure.mitica>
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

Lukas Straub <lukasstraub2@web.de> wrote:
> On Thu, 11 May 2023 11:52:55 +0200
> Juan Quintela <quintela@redhat.com> wrote:
>
>> Lukas Straub <lukasstraub2@web.de> wrote:
>> > On Tue,  9 May 2023 20:15:28 +0200
>> > Juan Quintela <quintela@redhat.com> wrote:
>> >  
>> >> From: Lukas Straub <lukasstraub2@web.de>
>> >> 
>> >> Like in the normal ram_load() path, put the received pages into the
>> >> colo cache and mark the pages in the bitmap so that they will be
>> >> flushed to the guest later.
>> >> 
>> >> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>> >> 
>> >> ---
>> >> 
>> >> Hi Lukas
>> >> 
>> >> What about this instead of your other three patches?  I think it is
>> >> clearer, and I don't think that we are going to have anything else
>> >> that is going to hook there anytime soon.
>> >> 
>> >> Notice that I put CONFIG_COLO waiting for Vladimir changes to get in
>> >> before I merge this.
>> >> 
>> >> Notice also that I "lost" the line:
>> >> 
>> >>   p->host = p->block->host;
>> >> 
>> >> In the error case.  But in that case we are aborting the migration, so
>> >> we don't care.
>> >> 
>> >> Can you check if it works for you?
>> >> Here it compiles, so it must be perfect.
>> >> 
>> >> Thanks, Juan.  
>> >
>> > This way is okay for now. Though I will send a patch.  
>> 
>> 
>> If it works for you, you can add a review-by and I will integrate in
>> next PULL.
>
> Nack, There are quite few things wrong at a glance. I will cook up my
> own patch, similar to this one.

Perfect.  Thanks.
>> >> @@ -23,7 +23,7 @@ softmmu_ss.add(files(
>> >>    'migration.c',
>> >>    'multifd.c',
>> >>    'multifd-zlib.c',
>> >> -  'multifd-zlib.c',
>
> ???

Patch sent upstream to fix it.  Introduced (by me) when I rebased/merged
your compression code changes.

>> >> diff --git a/migration/multifd-colo.h b/migration/multifd-colo.h
>> >> new file mode 100644
>> >> index 0000000000..1636c617fc
>> >> --- /dev/null
>> >> +++ b/migration/multifd-colo.h
>> >> @@ -0,0 +1,24 @@
>> >> +/*
>> >> + * multifd colo header
>> >> + *
>> >> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
>> >> + *
>> >> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> >> + * See the COPYING file in the top-level directory.
>> >> + */
>> >> +
>> >> +#ifndef QEMU_MIGRATION_MULTIFD_COLO_H
>> >> +#define QEMU_MIGRATION_MULTIFD_COLO_H
>> >> +
>> >> +#ifndef CONFIG_COLO
>
> Should be CONFIG_REPLICATION

Aha, thanks.

Will wait for your patch.

Later, Juan.

>> >> +
>> >> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p);
>> >> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p);
>> >> +
>> >> +#else
>> >> +
>> >> +static inline void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p) {}
>> >> +static inline void multifd_colo_process_recv_pages(MultiFDRecvParams *p) {}
>> >> +
>> >> +#endif /* CONFIG_COLO */
>> >> +#endif  
>> 


