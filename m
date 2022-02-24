Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15B4C2BDB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:37:42 +0100 (CET)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDNM-0007Ct-To
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:37:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNDM3-0006If-Bf
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNDM1-00078M-Ca
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645706176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MWh0W9bja238oe0uPj+lfAt/tVyXPjSOXa0Y1bJzIo=;
 b=dzAtJt8WUUvhWT3Ka5037IGYU5S1iCjbVbqywI47HnxGbcRCRh/L30d6yJx4G46otCKl1G
 Do9axS498z2estL3/YLO+GzL3exVmM6iQy+F2oRgAOFWZXYVkW8lTIp40jFhThV/9tnhn3
 j6Pg6+5BwDyW1xy98cbsX6KvYBgwqw0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-lmUHL-WOOfyzHTCwPNS0Jg-1; Thu, 24 Feb 2022 07:36:15 -0500
X-MC-Unique: lmUHL-WOOfyzHTCwPNS0Jg-1
Received: by mail-wr1-f69.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so702802wrg.19
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/MWh0W9bja238oe0uPj+lfAt/tVyXPjSOXa0Y1bJzIo=;
 b=hbTIs9X/Uyt8a3eN9z3EtOcGpdeFS8YAk0ciGO6KHI8jtgFE0XcLqYI5E/NfCVNaK7
 v9xFDUldjDeYAVWAL7+VbZUPZsoK/JxfnaxvQPxt+ocnWF6Gpi7LCU0oCenMvRMRrwPy
 gGL2iocNH9pOX7dwOWNMHdAZFMrOZ+xlnkSXlo320pJfWMGuaxkxbztmR0fR0OMReLnJ
 GekxrUimpgdIJ3MgV/GGpDBOw6LiP7NjDr74sG2ZfyPxjQIrK0vF8EuwRLs3qFeN685C
 7fvb/sbvuluZ8lpuM+5pt/JH1mWpRW8OOEssGoGGHtl8vRVrfyVq5fm+UOYFuaArKbB0
 PQag==
X-Gm-Message-State: AOAM532zRy5JfGyQMiTO0xYRRaFKVG0r/ve6NXWiPkmV7L6up3apcIlX
 i99SSFL9TpAFlWh3EE+b27OBrPUdRjPCHVwiiNS64huKOY0h8rrpI235/m1NJ67tpeJtf4srd40
 sx69RIBUSqagbqBo=
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr2024120wrb.514.1645706174555; 
 Thu, 24 Feb 2022 04:36:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOUnmnXi+ysIlWfishUEmSwWjk4pKmD8nWRSx9PuJP4OTrogtGKvsKgAibEP4cTg58MjSbfQ==
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr2024092wrb.514.1645706174309; 
 Thu, 24 Feb 2022 04:36:14 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id 50sm2633558wrc.113.2022.02.24.04.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:36:13 -0800 (PST)
Message-ID: <b8cd024f-d773-4ff5-855b-0b78a26120fc@redhat.com>
Date: Thu, 24 Feb 2022 13:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 09/20] jobs: add job lock in find_* functions
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-10-eesposit@redhat.com>
 <Yg5i9qPJLoNVqBW5@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yg5i9qPJLoNVqBW5@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/02/2022 16:00, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 09:35:02AM -0500, Emanuele Giuseppe Esposito wrote:
>> diff --git a/blockdev.c b/blockdev.c
>> index c5fba4d157..08408cd44b 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -3311,7 +3311,10 @@ out:
>>      aio_context_release(aio_context);
>>  }
>>  
>> -/* Get a block job using its ID and acquire its AioContext */
>> +/*
>> + * Get a block job using its ID and acquire its AioContext.
>> + * Returns with job_lock held on success.
> 
> The caller needs to deal with unlocking anyway, so maybe ask the caller
> to acquire the lock too? That would make the function simpler to reason
> about.

Those aiocontext locks there are going to be removed when job
lock/unlock are enabled, so it is useless to modify the logic now.
It makes sense to apply this logic with job_lock/unlock though.

> 
>> @@ -60,6 +65,7 @@ void qmp_job_cancel(const char *id, Error **errp)
>>      trace_qmp_job_cancel(job);
>>      job_user_cancel(job, true, errp);
>>      aio_context_release(aio_context);
>> +    job_unlock();
>>  }
> 
> Is job_mutex -> AioContext lock ordering correct? I thought the
> AioContext must be held before taking the job lock according to "jobs:
> remove aiocontext locks since the functions are under BQL"?
> 

I think you got it at this point, but anyways: job_lock is nop and when
it will be enabled, aio_context_acquire will go away in the same patch.

Thank you,
Emanuele


