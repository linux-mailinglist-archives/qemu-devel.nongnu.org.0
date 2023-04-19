Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7576E8228
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:55:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDt3-0002gH-07; Wed, 19 Apr 2023 15:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDt0-0002g7-JY
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDsz-0001pa-5L
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681934076;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=keXMOIPt3vZZQcDtSs5E16c2FYlWQX7Z7GZG7/E1uZU=;
 b=FgmbGJnPoFNBbw/xlhp6sjEsztmCLkELmzLbng6GC+kM80yr9yeE0hvEtVqiK9R0n7L2KV
 AqNlBcB4tBlf+oE2w+ku4WawJrLYa89OAdgrHIfdKzdKmz/9RsYSDXX0vA82tL8x9FY4FO
 r+qVVoVAoyntkSmlS8kX17edi0Rqh9I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-rCGOAYQSPBi6uXH1BCRW3g-1; Wed, 19 Apr 2023 15:54:35 -0400
X-MC-Unique: rCGOAYQSPBi6uXH1BCRW3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so14961f8f.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681934074; x=1684526074;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keXMOIPt3vZZQcDtSs5E16c2FYlWQX7Z7GZG7/E1uZU=;
 b=WpvbA7QenFUrkFax4UEDlcc/Q4iTRMbgsT6QlNZZMOygSGG8plkWxsrQop8U+LOKQ5
 q3Ld9iqbqQm7zjpjDAawQCxWgZGlPpGBY81S3yTP3wGoZ7he81MKEHnXe4A/wCmMgkov
 2yaoZEgRpGSiip1zWegD8CsWjbs15hXWFB5ujwsdC46hQubHioneoOqsY9BpWfUPOvJy
 O93zCV5KFCDiLJCuupDxUekCoNO7iTCynBa2rMQ7nnXrLBBUtso4ETJatkQ31aFI+CQH
 szMKGoJ8V7/pD0/rkKsjhUV8nfhU2vjVlCJ/PSrFkZPmClheLnXNjDUVKvllZ375ilDe
 aX1g==
X-Gm-Message-State: AAQBX9c293gBEOu8wPkb1loBFu0Z3jnR87EKPDj9b8/rRUuzGpANSb+J
 QgRfi6bA6EstGna95eRXXQplyxmBZuGbtS4whnE6K4wteC6RiPvTHBMLGdoMp2YLWcPW3NmGXay
 cN1o1nDPAOWOdBhThZFI4ZJOW+6de
X-Received: by 2002:adf:fa8b:0:b0:2ee:fc1b:b7ba with SMTP id
 h11-20020adffa8b000000b002eefc1bb7bamr5345421wrr.39.1681934073867; 
 Wed, 19 Apr 2023 12:54:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+bIGOsZ51C+6uFMg2SfVlHnWpZihTZI/2qpzXcCAGlh/gynZX9Z0Cf4+WNg4xacyXnDVbuw==
X-Received: by 2002:adf:fa8b:0:b0:2ee:fc1b:b7ba with SMTP id
 h11-20020adffa8b000000b002eefc1bb7bamr5345411wrr.39.1681934073528; 
 Wed, 19 Apr 2023 12:54:33 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 u7-20020a5d5147000000b002cde25fba30sm15774wrt.1.2023.04.19.12.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:54:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 00/12] Migration: Make more ram_counters atomic
In-Reply-To: <ZEBBDlcGuVxOGQOt@x1n> (Peter Xu's message of "Wed, 19 Apr 2023
 15:29:23 -0400")
References: <20230419162415.16260-1-quintela@redhat.com> <ZEBBDlcGuVxOGQOt@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 19 Apr 2023 21:54:32 +0200
Message-ID: <87ttxbzlzb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Peter Xu <peterx@redhat.com> wrote:
> On Wed, Apr 19, 2023 at 06:24:03PM +0200, Juan Quintela wrote:
>> Juan Quintela (12):
>>   migration: Merge ram_counters and ram_atomic_counters
>>   migration: Update atomic stats out of the mutex
>>   migration: Make multifd_bytes atomic
>>   migration: Make dirty_sync_missed_zero_copy atomic
>>   migration: Make precopy_bytes atomic
>>   migration: Make downtime_bytes atomic
>>   migration: Make dirty_sync_count atomic
>>   migration: Make postcopy_requests atomic
>>   migration: Make dirty_pages_rate atomic
>>   migration: Make dirty_bytes_last_sync atomic
>>   migration: Rename duplicate to zero_pages
>>   migration: Rename normal to full_pages
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> One trivial comment on last patch: full_pages is slightly confusing to me,
> probably because "normal" matches with the code (save_normal_page()),
> meanwhile "full" makes me think of small/huge page where it can be a
> huge/full page (comparing to a "partial" page).
>
> I'd think "normal_pages" could be slightly better? No strong opinions
> though.

Ok, will move it back to normal.

I think this cames from Spanish, if some pages are normal, the others
are non-normal, and that sounds really weird.

In this case full was used with the meaning that we are sending the full
page, but I can see that it is confusing that a non-full page is a
partial page.

Later, Juan.


