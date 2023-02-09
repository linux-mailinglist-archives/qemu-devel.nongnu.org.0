Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F826691016
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 19:12:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQBNP-0006VX-VF; Thu, 09 Feb 2023 13:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQBNL-0006Th-57
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQBNI-0004mf-4U
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675966223;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=epZAs6MMbK+E5ItUqI/NtSymR28IIqvuUpbwCb7Zsis=;
 b=eUHM+Pj2TXzIeyBuklMbP5DH6sIDJB6eYXSvj40/nR7H/gmKKCB16o+6+JI9kHDGHVvltg
 DRDZn5ekkXyp6BI56E0wLgJoi0CxUqZrOEiLJhXqNbVC34+bBR6tE9XW4nqTQ+DdD7ZZMW
 Yzusr8mHrIBHIxAmCKzncHS2OkIN8W8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-jc8gwUbtNwyLIDX0lY1ZVQ-1; Thu, 09 Feb 2023 13:10:21 -0500
X-MC-Unique: jc8gwUbtNwyLIDX0lY1ZVQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l21-20020a05600c4f1500b003e00be23a70so3222369wmq.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 10:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epZAs6MMbK+E5ItUqI/NtSymR28IIqvuUpbwCb7Zsis=;
 b=MEwX2XwvlxGRMplDIZG4nvIEONRbgNTo4E9lGCqQaRdkO+T3pNBYlVb5+LgKS786ht
 OjFGj4Lv735CsK8NVWVbAZTZsHQvSOWCF7jbArpsw+gSzETUxbv4OOfDQ4x5W4CEPcFD
 eEFxGe40PQDgNNSEaJs2VwpOdDnp1zveYiF4QvNO70Pvy/Y0BLXoLfv3G/IIdfe8U6Dc
 Ys9ldXrU+4LbG25yBzuXL1Pk0CdxXkTXl91GiFuDqNw0hxqEmq0BDoEouHhpDLHoet2W
 ZQOMJYaIQsvcpbCtIfJy/lCv49vWGAKHkP7k0Qzd5mEsuvUFij3CQgswb2wJoTlF36v9
 ttxQ==
X-Gm-Message-State: AO0yUKWRNEeYvua75o7D0pYnjucb1xksawlmYED14z+byvBcSe6qbBXb
 TVooIVyFStVbrd0ZY9utfNJ8nuL9HhasTXZONmQhAVik2l8kBT1eTsLR9VKNL8ndnOHueblK4Ir
 Gja9E5Rm27NMMf2c=
X-Received: by 2002:adf:e584:0:b0:2c4:80a:e84a with SMTP id
 l4-20020adfe584000000b002c4080ae84amr4271562wrm.26.1675966220543; 
 Thu, 09 Feb 2023 10:10:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9tGO6wqy6U9LUNZTFxWwg65qzgo2XFAJ2/YVe8ilABvRxYriP4sjN6vCccrXEvUdg+xjlZTg==
X-Received: by 2002:adf:e584:0:b0:2c4:80a:e84a with SMTP id
 l4-20020adfe584000000b002c4080ae84amr4271527wrm.26.1675966220202; 
 Thu, 09 Feb 2023 10:10:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q7-20020adfdfc7000000b002c3daaef051sm1747983wrn.82.2023.02.09.10.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:10:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 Fam Zheng <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  David
 Hildenbrand <david@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>,  qemu-s390x@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/3] migration: In case of postcopy, the memory ends in
 res_postcopy_only
In-Reply-To: <61c84841-7018-edb2-806b-921e2065f940@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 9 Feb 2023 20:36:13 +0300")
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-2-quintela@redhat.com>
 <61c84841-7018-edb2-806b-921e2065f940@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 19:10:18 +0100
Message-ID: <87mt5m3e2d.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 08.02.23 16:57, Juan Quintela wrote:
>> So remove last assignation of res_compatible.
>
> I hoped for some description when asked to split it out :)
>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/ram.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/migration/ram.c b/migration/ram.c
>> index b966e148c2..85ccbf88ad 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -3474,7 +3474,7 @@ static void ram_state_pending_exact(void *opaque,
>>         if (migrate_postcopy_ram()) {
>>           /* We can do postcopy, and all the data is postcopiable */
>> -        *res_compatible += remaining_size;
>> +        *res_postcopy_only += remaining_size;
>
> Actually, these "remaining_size" bytes are still compatible, i.e. we
> can migrate these pending bytes in pre-copy, and we actually do it,
> until user call migrate-start-postcopy, yes? But we exploit the fact
> that, this change don't affect any logic, just name becomes
> wrong.. Yes? Or I don't follow:/

My definition of the fields is: how are we going to transfer that bytes.

if they are on res_precopy_only, we transfer them with precopy, if they
are on res_postocpy_only, we transfer them with postcopy.

So, the rest of RAM, if we are in postcopy, we sent it with postcopy,
and if we are in precopy, we sent them with precopy.  See the whole
code.  This is the _estimate function.

    uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;

    if (migrate_postcopy_ram()) {
        /* We can do postcopy, and all the data is postcopiable */
        *res_postcopy_only += remaining_size;
    } else {
        *res_precopy_only += remaining_size;
    }

After the change, _exact does exactly the same.

The caller (migration_iteration_run()) does this (I remove traces and
things that don't matter for this). This is before the change.
Remember: in precopy, we add res_compat to pend_pre, and in postcopy to
pend_post.

    uint64_t pending_size = pend_pre + pend_compat + pend_post;

### pending_size is the sum of the three, so it doesn't matter.

    if (pend_pre + pend_compat <= s->threshold_size) {

###  In precopy, we add pend_compat to pend_pre, so we are ok.
###  In postcopy, we add the data to pend_postcopy, but that is right,
###  because to calculate the downtime, we only care about what we have
###  to transfer with precopy, in particular, we aren't going to send
###  more ram, so it is ok that it is in pend_post.

        qemu_savevm_state_pending_exact(&pend_pre, &pend_compat, &pend_post);
        pending_size = pend_pre + pend_compat + pend_post;
    }

    if (!pending_size || pending_size < s->threshold_size) {
        migration_completion(s);
        return MIG_ITERATE_BREAK;
    }

    /* Still a significant amount to transfer */
    if (!in_postcopy && pend_pre <= s->threshold_size &&
        qatomic_read(&s->start_postcopy)) {

#### this is what I mean.  See how we only use pend_pre to decide if we
###  are entering postcopy.

        if (postcopy_start(s)) {
            error_report("%s: postcopy failed to start", __func__);
        }
        return MIG_ITERATE_SKIP;
    }

So the only "behaviour" that we can say are having is that with the
change we are a little bit more aggressive on calling
qemu_savevm_state_pending_exact(), but I will arguee that the new
behaviour is the right one.

What do you think?

Later, Juan.


