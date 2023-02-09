Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0926909C9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:23:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6t6-0002bD-3w; Thu, 09 Feb 2023 08:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ6t3-0002SC-3A
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:22:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ6t1-0000R3-8k
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675948970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=78Rqg3ctoDBequlUNCz9nlj7OXzdJSDKpEUVy63KjRI=;
 b=SxSkL4ZHVbqGJPPOIBX0LPH6RonmaQcmvcrdfqq745hIRAqDEoGc9MEt51gyPwLh60AaTI
 1CpBA5CNQKW7wQdDmX7t7+/nzu9OeJkJMbrtJNFPJsBW2V5bUk+BJMopbJZzn1FEJ7V8Jj
 LnNnQkEFqXPGL+56PioJdyklB6zKdDk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-IhumfXoFPjS-MFvKNY7LPA-1; Thu, 09 Feb 2023 08:22:49 -0500
X-MC-Unique: IhumfXoFPjS-MFvKNY7LPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so2824533wmq.9
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 05:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78Rqg3ctoDBequlUNCz9nlj7OXzdJSDKpEUVy63KjRI=;
 b=1jCO9Acx//G80heeAscPrs7w06sjJm7FNs4G2KDxjeW5BlvpoSXm0Am4FO+m/3yO4T
 lM1vSqQX9j8/Dwvz7SK9TZ8zZK0XanzY0f7QOAxfFhsAMPjnoSptb1j0RkjZi8Djgal/
 m5WCWyKbvucgobWgAVxhQ5+ggvN+UBvM0LYjViXDpQ5IP2ZR1nc+CM9NvmwLcuzEcdK5
 FwSJgArjyyH5Bhluvik8hpxvuTBSnUDuGgN+bBv12XSJyqOabM0kW1ffZpm8JxlDX3lH
 ENQwLKuK26UIm5GEpTLCHmJ0NYwIsUsuEWksSwQafvcK91mvzE8KnsNDgaQs3L9HZ7+F
 vHag==
X-Gm-Message-State: AO0yUKU2GF1pwMTA8F7oP+ROm7Eq4muA++g25Wg0YpO8HPuS4cFLWnS2
 7ucfBidrLdN1PZZGX/puuh6T6DckMX/m6TQTYKgVn3eEZJdjyuxkQr3ogdHuEFiPgp8M3scc49w
 UXZmFPsury4B/BT8=
X-Received: by 2002:a5d:6108:0:b0:2c4:3d5:46dc with SMTP id
 v8-20020a5d6108000000b002c403d546dcmr5463405wrt.37.1675948968054; 
 Thu, 09 Feb 2023 05:22:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9Q5lOWo2Y+kgMZziIfNgbVzOx+tzHw/JmOoJal1RB+NCRiwm89s0dmdwr3E+6zUQqvRmSpkw==
X-Received: by 2002:a5d:6108:0:b0:2c4:3d5:46dc with SMTP id
 v8-20020a5d6108000000b002c403d546dcmr5463384wrt.37.1675948967863; 
 Thu, 09 Feb 2023 05:22:47 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfe44c000000b002c3dd9bb283sm1288369wrm.37.2023.02.09.05.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:22:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 1/6] multifd: Create property
 multifd-sync-after-each-section
In-Reply-To: <20230208202526.p2jmikndw5lx2ong@redhat.com> (Eric Blake's
 message of "Wed, 8 Feb 2023 14:25:26 -0600")
References: <20230208133010.17323-1-quintela@redhat.com>
 <20230208133010.17323-2-quintela@redhat.com>
 <20230208202526.p2jmikndw5lx2ong@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 14:22:46 +0100
Message-ID: <87ttzv3rdl.fsf@secure.mitica>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> wrote:
> On Wed, Feb 08, 2023 at 02:30:05PM +0100, Juan Quintela wrote:
>> We used to synchronize all channels at the end of each RAM section
>> sent.  That is not needed, so preparing to only synchronize once every
>> full round in latests patches.
>> 
>> Notice that we initialize the property as true.  We will change the
>> default when we introduce the new mechanism.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> 
>> ---
>> 
>> Rename each-iteration to after-each-section
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  qapi/migration.json   |  9 ++++++++-
>>  migration/migration.h |  1 +
>>  hw/core/machine.c     |  1 +
>>  migration/migration.c | 15 +++++++++++++--
>>  4 files changed, 23 insertions(+), 3 deletions(-)
>> 
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..d712b082c8 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -478,6 +478,12 @@
>>  #                    should not affect the correctness of postcopy migration.
>>  #                    (since 7.1)
>>  #
>> +# @multifd-sync-after-each-section: Synchronize channels after each
>> +#                                   section is sent.  We used to do
>> +#                                   that on the past, but it is
>
> s/on/in/

good catch.

>> +#                                   suboptimal.
>> +#                                   (since 7.1)
>
> Shouldn't this be 8.0 now?

You are right (as always).

Changing it.  Thanks.


