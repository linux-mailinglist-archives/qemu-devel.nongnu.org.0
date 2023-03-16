Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9796BCBC7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:59:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckOQ-0005IS-6b; Thu, 16 Mar 2023 05:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pckOK-0005I1-9P
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pckOI-0001bf-EJ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678960761;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=l5jq+Kr0nTBuGpvzh5sqlOmpqJCKrsKwuZML/cGbY0M=;
 b=gBcm18q8dn9hA7IhoixzgMgB2gsbAkR/8DlCex+mjFeLjFSnUANq6jKec5KgBTeM6nT81Y
 /x0yv6/19e8oFzqroZ6+CPzAL8J/EN9O2of1L+G9rbAERAMcF07HiKeFPxXWjhxbXDramR
 H4pTLR1ujJDZvoiQATPbtTU9EpTOYxw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-fe3Wg5XMMTOjiUDBVJOA1g-1; Thu, 16 Mar 2023 05:59:19 -0400
X-MC-Unique: fe3Wg5XMMTOjiUDBVJOA1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so529053wmb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 02:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678960758;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5jq+Kr0nTBuGpvzh5sqlOmpqJCKrsKwuZML/cGbY0M=;
 b=Ww8mU9akeXnrhFzLbuSFmRzXLQ3HlA08Xbt9pdaoYPUr3qruccFSdvMM34ooHX/zhL
 hh36B+PAgkjsEY0hnFN+DkjZrPOWm7sfKfTAcsdureXk0k/a5bGgusV+4jMp6+TAsxq2
 M5ZoUIXfff2S8Wh0ZkZRe2RxCineBT+8DsKduZn26fxUbcEdr6H0wjgz28NyTXqI22G6
 fHl3ruKK2fFmNJyKDTSNDJxh7vp1Hpjt44HQsjP41vMg0vEC/vlVCG0Kscdm1OThPtA2
 ciUT8KvuX8xDkaBro2JCnED0dhlurmDaRtHwKiLba9g6csNvBWnV4tiW9SxCJQ1gLarO
 Uw1Q==
X-Gm-Message-State: AO0yUKUmAey+Xz58tUa1qaEghGOPmy5cB4M+9QAVaEdTbTLxE+iw733c
 03v3LSZpfSo1YObjY2I3Bt8bxVfwd1DcF2hm7wxHTW5ZTq4/7hMqxFzDH4zwm1AgwjpvM5MSgYO
 8LXUvS+K3Bc/sLmk=
X-Received: by 2002:a05:600c:4f03:b0:3ed:346d:452f with SMTP id
 l3-20020a05600c4f0300b003ed346d452fmr4414842wmq.26.1678960758323; 
 Thu, 16 Mar 2023 02:59:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set9+cwasCC2K2CJo1leREZS77B91BBvENsmC19WQO8jPiLkUHicRIyAFPwUosqRu8auOGaAC0Q==
X-Received: by 2002:a05:600c:4f03:b0:3ed:346d:452f with SMTP id
 l3-20020a05600c4f0300b003ed346d452fmr4414828wmq.26.1678960758028; 
 Thu, 16 Mar 2023 02:59:18 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003ed1f69c967sm4560847wmi.9.2023.03.16.02.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 02:59:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: lizhijian@fujitsu.com
Cc: "dgilbert@redhat.com" <dgilbert@redhat.com>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] migration/rdma: Remove deprecated variable
 rdma_return_path
In-Reply-To: <baf1970f-d68a-dba4-cb6d-312431f2ff0e@fujitsu.com>
 (lizhijian@fujitsu.com's message of "Thu, 16 Mar 2023 08:51:47 +0000")
References: <20230315012247.9007-1-lizhijian@fujitsu.com>
 <baf1970f-d68a-dba4-cb6d-312431f2ff0e@fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 10:59:16 +0100
Message-ID: <87lejxm2yz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

"lizhijian@fujitsu.com" <lizhijian@fujitsu.com> wrote:
> Not clear why it doesn't appear in the archive(https://lists.gnu.org/archive/html/qemu-devel/2023-03/threads.html)

No clue either.

> nop...




>
>
> On 15/03/2023 09:22, Li Zhijian wrote:
>> It's no longer needed since commit
>> 44bcfd45e98 ("migration/rdma: destination: create the return patch after the first accept")
>> 
>> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
>> ---
>>   migration/rdma.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index f5d3bbe7e9c..2bc2fcf727b 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -4214,7 +4214,7 @@ static void rdma_accept_incoming_migration(void *opaque)
>>   void rdma_start_incoming_migration(const char *host_port, Error **errp)
>>   {
>>       int ret;
>> -    RDMAContext *rdma, *rdma_return_path = NULL;
>> +    RDMAContext *rdma;
>>       Error *local_err = NULL;
>>   
>>       trace_rdma_start_incoming_migration();
>> @@ -4260,7 +4260,6 @@ err:
>>           g_free(rdma->host_port);
>>       }
>>       g_free(rdma);
>> -    g_free(rdma_return_path);
>>   }
>>   
>>   void rdma_start_outgoing_migration(void *opaque,

Reviewed-by: Juan Quintela <quintela@redhat.com>

Regenerating it on my local tree and queuing.

Thanks,


