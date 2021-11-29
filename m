Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83614461D85
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 19:22:39 +0100 (CET)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrlIU-0006hN-M7
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 13:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mrlHF-0005NP-2y
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mrlHA-0002Is-Pn
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638210076;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Az8/5RAVtYztL9T2bGrHRaX3mMNRFk2fOxDFWc9sw5A=;
 b=IcJKiA/9d5Hx2g4yxfXKz41YJIyb5WwSDPbIK6gs6zifJ9f405VePFG3xObl4Sa/7VLu9X
 u2bYl5Hl1Ivew9VfGdjCCvu1GySarJMIaxprK9uIr5ekorAns8tVvKZlN7QFDrywHeGbR2
 t4Ho8pTj5IdPnBGo4ez2FnovneZgjSk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-AlaFFdHVPVyQKwMTmQjZUQ-1; Mon, 29 Nov 2021 13:21:14 -0500
X-MC-Unique: AlaFFdHVPVyQKwMTmQjZUQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so9035364wmb.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 10:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Az8/5RAVtYztL9T2bGrHRaX3mMNRFk2fOxDFWc9sw5A=;
 b=yTylndSQcXc/NW4sAihrEMDA4RLPl6EE0cfxm6C8D2ai3dPV0KXdUx8Ugh0e40fLrx
 oqfZBXmQkNoDdnyhHAi5aa0kxvCt/EslXz+0R64p4BnIeK2bzzv2YkRsVvVf19eMmQcP
 22MgSljZQaQ5cVgbYxjuDsPl0OCD37PiGx9XuEks7KSa4fR9XoGvtOpmwtD91bH5CB37
 vCfcMtdm7RTssowpab7zPwsmYKbXb3WBSdgyqsGx26P2TRR1QkUJvT1aB/HYP+skUO0s
 4E7WnvnbqL3brDBUPVH98Z0hCWQnVo6tH+K+XTU02aFk3yoH7yWigAhe1wZ4vExx29Ng
 n4tg==
X-Gm-Message-State: AOAM532eTAxsoKyu+OUrS4uIQG+A2Xz63SIVhe9qWQPIXjBkoiIeyujI
 fCFzQg5afnzz/4dTDQQHE3KcUg9Kzg3XAfCDFmoCkIxcsKcoL0dK3YcUem6pfb26/uR8Oad7bOH
 PSr1raDHkQW49wVI=
X-Received: by 2002:adf:ce08:: with SMTP id p8mr35936971wrn.154.1638210073416; 
 Mon, 29 Nov 2021 10:21:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGkHHv9D7333fOtOSyS1J0A6b3qNNGR7x8BU2Dp1YqLgAABTSp/y4DbVx4NeoDKbAhCZF7Qg==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr35936952wrn.154.1638210073242; 
 Mon, 29 Nov 2021 10:21:13 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id n32sm29834wms.42.2021.11.29.10.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:21:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 12/23] multifd: Make zlib use iov's
In-Reply-To: <YaUVlGxmZzpYpZFT@work-vm> (David Alan Gilbert's message of "Mon, 
 29 Nov 2021 18:01:56 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-13-quintela@redhat.com>
 <YaUVlGxmZzpYpZFT@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 29 Nov 2021 19:21:11 +0100
Message-ID: <871r2y257s.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd-zlib.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
>> index da6201704c..478a4af115 100644
>> --- a/migration/multifd-zlib.c
>> +++ b/migration/multifd-zlib.c
>> @@ -143,6 +143,9 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>>          }
>>          out_size += available - zs->avail_out;
>>      }
>> +    p->iov[p->iovs_num].iov_base = z->zbuff;
>> +    p->iov[p->iovs_num].iov_len = out_size;
>> +    p->iovs_num++;
>>      p->next_packet_size = out_size;
>
> Do you still need next_packet_size?

As my crystal ball didn't worked so well, I ended putting
next_packet_size on the wire.  So yes, I need it.

Yes, I also wanted to remove it.


Later, Juan.

>
> but:
>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
>>      p->flags |= MULTIFD_FLAG_ZLIB;
>>  
>> @@ -162,10 +165,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>>   */
>>  static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>>  {
>> -    struct zlib_data *z = p->data;
>> -
>> -    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
>> -                                 errp);
>> +    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
>>  }
>>  
>>  /**
>> -- 
>> 2.33.1
>> 


