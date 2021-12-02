Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1D4668B5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:53:41 +0100 (CET)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspL2-0008VH-Pr
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mspHK-0004UB-Vg
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:49:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mspHH-0005mK-Ik
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638463785;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9/4ynMIghDPFiscHuT2qZW0h3036j3uuBLZPub4pq3U=;
 b=NoOHGFB2yYM6p7GCCsNVdnc8GCf3dIfgTuaW5fzyrgWZI79KoF5k53+eEEC/fRd/MyJW0b
 nBJ4E/T1MGVOKeFEbYKtXAitk2UOZmKcadeSddfZ6HfkXhsQ6WcBEjehINCowWFLhn2a/+
 iYTKbKCraCqBJhLLqsM6hl0f4yKypDM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-rqdkyPZ_O9Wn_SgpS1fv8Q-1; Thu, 02 Dec 2021 11:49:44 -0500
X-MC-Unique: rqdkyPZ_O9Wn_SgpS1fv8Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so12010wrg.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=9/4ynMIghDPFiscHuT2qZW0h3036j3uuBLZPub4pq3U=;
 b=tqZI7PC5OCvpU0oaamylBW6qjU9PxZLT+0ttlS8tINoacqMW0Vcb9anAopvaw6Khtx
 uJNuMP11G9MbRqtsEyUuYDV8DHaQxlaVUwMBtGZl0wBQ7lSAWOGeCLX7DZ3uD8aML0Tn
 C5RmXpPdz39KFydt+dVx4ckNlbZUL+77zzhd4Mkmjpmy4rrfitPLXA/z8AN36lwu/6L9
 5Ij3Y/Ps266Vz9aJXBGBEZGBhyMb8aTPux5+vF5GoTp0uYaZX9jZDMpe9KElJGebheHe
 mbRFfbNLpOPRtF/Jf1OP9Tt1P6eAyXgf+i+BWa9Ld9cpIE6P+OFwKZAmrZYXxTCXgsrO
 UG7w==
X-Gm-Message-State: AOAM532W7qacDfhq6Vqf6PzTsZkvo4IrndTAWWdohJ1TiSAaOaK9WBbG
 Dje3ppJHar2Vtz/voM4rjSt1wLOHMwkW0+uDWp475m/JXVpoAWrT4rZ6Gd4SBJ3xrxcoZsfifKN
 dG2LHDe0mEG7Wg1U=
X-Received: by 2002:adf:d091:: with SMTP id y17mr16438351wrh.418.1638463783630; 
 Thu, 02 Dec 2021 08:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynNP5D22sKDw+e+zTDlYolsS684jRfkmEo4VsRbQ3/h5ZqsrREJegVO+tT0ZDBXxKn0Z74bw==
X-Received: by 2002:adf:d091:: with SMTP id y17mr16438319wrh.418.1638463783443; 
 Thu, 02 Dec 2021 08:49:43 -0800 (PST)
Received: from localhost (static-58-87-86-188.ipcom.comunitel.net.
 [188.86.87.58])
 by smtp.gmail.com with ESMTPSA id k13sm287880wri.6.2021.12.02.08.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:49:43 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 22/23] multifd: Zero pages transmission
In-Reply-To: <Yaj3i1S8DRB1y4DG@work-vm> (David Alan Gilbert's message of "Thu, 
 2 Dec 2021 16:42:51 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-23-quintela@redhat.com>
 <Yaj3i1S8DRB1y4DG@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 02 Dec 2021 17:49:42 +0100
Message-ID: <87o85zeyu1.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> This implements the zero page dection and handling.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.c | 33 +++++++++++++++++++++++++++++++--
>>  1 file changed, 31 insertions(+), 2 deletions(-)
>> 
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 2e4dffd6c6..5c1fc70ce3 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -11,6 +11,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/cutils.h"
>>  #include "qemu/rcu.h"
>>  #include "exec/target_page.h"
>>  #include "sysemu/sysemu.h"
>> @@ -277,6 +278,12 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>>  
>>          packet->offset[i] = cpu_to_be64(temp);
>>      }
>> +    for (i = 0; i < p->zero_num; i++) {
>> +        /* there are architectures where ram_addr_t is 32 bit */
>> +        uint64_t temp = p->zero[i];
>> +
>> +        packet->offset[p->normal_num + i] = cpu_to_be64(temp);
>
> OK, so if I'm understanding correctly here, the packet->offset array
> starts with the 'normals' and then the zeros?
> If so that probably needs a comment somewhere.

Yeap.

> Other than that,

Thanks, Juan.


