Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B7E6E949F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:38:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTUd-000894-3P; Thu, 20 Apr 2023 08:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTTN-0007aU-Pa
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:33:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTTF-0003pW-GX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681993983;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JhDLk/SqPgXK2QInUsrJK1w8i1ZTj94RZMSFlIVMx70=;
 b=BHQrM//tURVW8HAZiKhAKtW66XtAJRyIxNrnroXqVgt9QJdEW4bYI1H+vA5xewjdXFa4qH
 GN+sGnvy/rwJuu3rm0foyUfMmIQD9qY5VQLQr3BbF7Q74pzf7M3ZzFRWN9iOeLZp7NMzMK
 LB33KOkWUM5STer10kZivmI0b27B2Po=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-kmJ3SO_5Nwa7-eX9FzgPOA-1; Thu, 20 Apr 2023 08:33:02 -0400
X-MC-Unique: kmJ3SO_5Nwa7-eX9FzgPOA-1
Received: by mail-wr1-f69.google.com with SMTP id
 j25-20020adfb319000000b002f70ae9c545so70137wrd.22
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681993981; x=1684585981;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhDLk/SqPgXK2QInUsrJK1w8i1ZTj94RZMSFlIVMx70=;
 b=BGpadfR3qov29E/WGsz2B7mBp3JGErAI7RTPVandpgIWGgohwRLkV+J8o+kRvAgZ9Y
 lKx5H6lHXN8vkMSO3ZoBkjF8ccTBkaU5bcC7uxOckxj4+gN4uZwbDPlTXlVf0NME8oav
 u6oA3mMwZdiGueACYeKWWFgbRvMOSug4KXnR1DLgA+Vp/llskFKXFEkU7zJPxw9y3CpC
 ILQ0Q1aUvoNu05mx4Yp9uyYF4vAHFcQpQ1tevnP3aBAHIyE0t3AwO5QuiBOZudUPaQZ/
 PUeulYfZSlX6tShWIzykKc/0stsJReiVfazAj+ABwkBlnlhMlLehqs1HFFBRHwP+9cxh
 fJ8w==
X-Gm-Message-State: AAQBX9d2T2kECD4R5TBPzlP6nnjnvBD4p8+dhLyVCVAlN4XlZ+t/+RbO
 KRtCMKR+EHy5+YxsXCXaIwwQFfTJm04SByb0MhskJBZNSaJ7eDIhJ7XWIBcEEmai3qw08lM2TIF
 ILOexBLqUNJ97lho=
X-Received: by 2002:a7b:cb82:0:b0:3ef:acf6:f815 with SMTP id
 m2-20020a7bcb82000000b003efacf6f815mr1118369wmi.32.1681993981091; 
 Thu, 20 Apr 2023 05:33:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7U+GD/1gzT4fFmctVnditQrM5Ykj+3uFOglj2wrGE7ZKmnxwpRw9g/PKmI9rAYWkBrSS7qQ==
X-Received: by 2002:a7b:cb82:0:b0:3ef:acf6:f815 with SMTP id
 m2-20020a7bcb82000000b003efacf6f815mr1118347wmi.32.1681993980765; 
 Thu, 20 Apr 2023 05:33:00 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iw18-20020a05600c54d200b003f174cafcdasm5279721wmb.7.2023.04.20.05.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:33:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  John Snow
 <jsnow@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Hailiang Zhang <zhanghailiang@xfusion.com>,  Fam
 Zheng <fam@euphon.net>,  "Michael S. Tsirkin" <mst@redhat.com>,  Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH 03/43] migration: Create migration_cap_set()
In-Reply-To: <ZAhn2k22hpqIW3i1@work-vm> (David Alan Gilbert's message of "Wed, 
 8 Mar 2023 10:47:54 +0000")
References: <20230302163410.11399-1-quintela@redhat.com>
 <20230302163410.11399-4-quintela@redhat.com>
 <ZAhn2k22hpqIW3i1@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 14:32:59 +0200
Message-ID: <877cu6ybr8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> And remove the convoluted use of qmp_migrate_set_capabilities() to
>> enable disable MIGRATION_CAPABILITY_BLOCK.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/migration.c | 34 ++++++++++++++++------------------
>>  1 file changed, 16 insertions(+), 18 deletions(-)
>> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 119027a656..e3062530f0 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1910,25 +1910,24 @@ void migrate_set_state(int *state, int old_state, int new_state)
>>      }
>>  }
>>  
>> -static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
>> -                                                  bool state)
>> +static bool migrate_cap_set(int cap, bool value, Error **errp)
>
> Why int cap rather than MigrationCapability ?

It is the index in one array, so it is int.  And it is much, much
shorter.

In this particular case I think that we don't lost anything having it as
int, but will not fight over this O:-)

Later, Juan.


