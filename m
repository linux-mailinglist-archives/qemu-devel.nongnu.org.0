Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E868815D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:12:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbGI-0003h8-Fe; Thu, 02 Feb 2023 10:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbGG-0003gn-Cg
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbGE-0000Zd-Mq
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675350738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KZL3fgTosrYRv/tRv4K7TKXW2VtLjN33rhLNea7ODbg=;
 b=JNYIMUb9zCw0jBJPtu/APAXaRpf1o+tSzt0bEDitDlkedhQtXsJBTM33PnsoxtOc1NvLNZ
 2risbFRYj/F+OOvOUZJMyWhI1wNcAAIUnmso9sbqwVgC3KHQg801/DyYfn+LUK3Oc6JrmQ
 d3IxJ6i1jYytNvH5Feo/mlk10pZk9dM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-tiKVeemYOYOyVB6V4hWKaw-1; Thu, 02 Feb 2023 10:09:37 -0500
X-MC-Unique: tiKVeemYOYOyVB6V4hWKaw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003deab30bb8bso1154618wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZL3fgTosrYRv/tRv4K7TKXW2VtLjN33rhLNea7ODbg=;
 b=MVZkWe42/uHh+9eXPajNloXKPcxXhTiNNTAemMh5ftRQHACklBiS1x5Szk6mJbCvSO
 g7FPI2oiLT1QOw3wjskQmSMCuS2Fnxdug8YbysVz6LPNnuSc3BV5gX9+1gjMQlQ3f6I6
 d093HsEiSn7u/o2/3vNLhtfm0eqtpjdj46tVmZv9yTUftbaPaO++HezmfULgQxigF/Vs
 pXQaquTkHYFAwjzNZgCwIkxR7kIEfjmW9y8fcLfsvh6zrwVCbt5nkNQ0K+0Mj063EmPG
 VGhsdmT7thBG7kTVBA+c5Me3i6zp+wQoJZISXELKdJv8XARXSQNLH9lGgxTZYzh+7w3C
 wgxA==
X-Gm-Message-State: AO0yUKWXMUuCdS/kDwoLmh0hhhZVG5Oyfmp4Cd1JSDuWWgxJ6kDHa3AB
 0jSfx3jre53lOFHTzlnRNzXTOFqeXWMl1YdIUFEe1Cf/DnfSP6llZgr9pBr9NJHQd5gmDuFDWYw
 c1lMhlW6Mggql9D0=
X-Received: by 2002:a05:600c:1d21:b0:3dc:5ad0:e583 with SMTP id
 l33-20020a05600c1d2100b003dc5ad0e583mr6125821wms.22.1675350569727; 
 Thu, 02 Feb 2023 07:09:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/xQCN+/tE5YKGwWPTEZGCcAd42zCnz4l1/3t352c0Yg9F3BjZVjF57F8nmgDpVMNv+yw4Zug==
X-Received: by 2002:a05:600c:1d21:b0:3dc:5ad0:e583 with SMTP id
 l33-20020a05600c1d2100b003dc5ad0e583mr6125784wms.22.1675350569444; 
 Thu, 02 Feb 2023 07:09:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003dc4050c97bsm6552966wmo.3.2023.02.02.07.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:09:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Thomas Huth <thuth@redhat.com>,  Alex
 Williamson <alex.williamson@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-s390x@nongnu.org,  Halil Pasic <pasic@linux.ibm.com>,  Eric Farman
 <farman@linux.ibm.com>,  qemu-block@nongnu.org,  David Hildenbrand
 <david@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PULL 5/5] migration: simplify migration_iteration_run()
In-Reply-To: <38da6faf-1d7f-66fc-b305-738a6e8dfaf1@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 31 Jan 2023 14:44:14 +0300")
References: <20230130080307.1792-1-quintela@redhat.com>
 <20230130080307.1792-6-quintela@redhat.com>
 <38da6faf-1d7f-66fc-b305-738a6e8dfaf1@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 16:09:27 +0100
Message-ID: <874js4p0ig.fsf@secure.mitica>
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
> On 30.01.23 11:03, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>   migration/migration.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 594a42f085..644c61e91d 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3764,23 +3764,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>                                       pend_pre, pend_compat, pend_post);
>>       }
>>   -    if (pending_size && pending_size >= s->threshold_size) {
>> -        /* Still a significant amount to transfer */
>> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
>> -            qatomic_read(&s->start_postcopy)) {
>> -            if (postcopy_start(s)) {
>> -                error_report("%s: postcopy failed to start", __func__);
>> -            }
>> -            return MIG_ITERATE_SKIP;
>> -        }
>> -        /* Just another iteration step */
>> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>> -    } else {
>> +    if (pending_size < s->threshold_size) {
>
> to keep the logic, formally it should be "if (!pending_size || pending_size < s->threshold_size)"...

And here I am, back.

To stand corrected O:-)

I have to do the change that you suggested.

Why?  Because it never ever happens with "real" migrations.
But qemu-iotest 181, well, sometimes it fails.

Never when you compile x86_64.
You need to compile all architectures.
And it fails only sometimes.

Ok, changed to
if (!pending_size || pending_size < s->threshold_size)

Thanks, Juan.

> Actually, could s->threshold_size be 0 here? Or, worth an assertion
> assert(s->threshold_size) ?

This test in particular sets the "bandwidth_limit" to 4k, that is one
page, so it could be that gets zero.

Later, Juan.


