Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE37425213
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:33:39 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRec-0000Tf-1M
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYRbu-0006Pe-90
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYRbr-0002dn-Gm
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633606246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePovFbjflOS/AZJoPQ4U1sBtebTYICdlU5lUXYJS+C0=;
 b=FixcqpQ4HooOeTYX2ekY5t5VBRrBCrgSIBmQiAlPbdMDwkarwUpHjWQks99BJ5CYx5gLGj
 j0j0oi1VavHyi0Bp1x3Y/peqTZ2zDDSv3YqWmUNEvuUIqd8ZB/pJF6KZ5S9e7jfMqxpDGw
 we8UTh+Tzx7F51WQjutlGmL8aWFTdMY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-cIT_-tkrNWqm4HnSrwJaTw-1; Thu, 07 Oct 2021 07:30:45 -0400
X-MC-Unique: cIT_-tkrNWqm4HnSrwJaTw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so5664353edj.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ePovFbjflOS/AZJoPQ4U1sBtebTYICdlU5lUXYJS+C0=;
 b=l9pufVZbRzcNdFXf6n1/n7CRDGzObEuMCFSGDVMmBAowW/j9zDADHB5cE1UJjQH3e7
 3tLzR42vVfq6Jfyinder1kUlrwtFr6+TiR3erjV3nHrjUDejFDjB5MerNuD0utIJujX9
 vx/Ro9YKWfRRqhn61f06HL+q25l2tdGfv/6ZkmKmikmLEYw6AiHef0ctpRT6A4/IoNOn
 SkLR3hYVakX1Q5gbmRFnWqBEm628OLtgPqBcSP7ODFwt5ykh1I9C3exQYHa+AXp1Cs2X
 RMFVB8Hv5BExKNnetkiwOPpHs0uT2Vf+HGAIwHA/Xtt5LWrBG8V6zwlIxmMOw5uvMOhA
 lRtQ==
X-Gm-Message-State: AOAM530mLEMrYeCUiiVgpDVlay4wnBuxlPn3Gfq2Rvojdc0pOTKrerya
 +IQHZROCGMvM0tY7iIpWLUnTEex2/vO9HmlbC35WiXOJIQmpPAINTbyWLnjYeBYY/lJQIRlaMgp
 dbgj23UtD0axtWRG8qDZCuJT7ejQHgnBmUuIF1zeuHjnd9a6eo47Gw2tJ54yBwg/T9zg=
X-Received: by 2002:a17:907:2cca:: with SMTP id
 hg10mr4915244ejc.94.1633606244374; 
 Thu, 07 Oct 2021 04:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytR3IIQU3DfKfKgV8bb50PQSDkIchVlEfnd0UgLw6X9ySpUMmOCGD6w7f9P5c4S4kfblAtTg==
X-Received: by 2002:a17:907:2cca:: with SMTP id
 hg10mr4915193ejc.94.1633606243972; 
 Thu, 07 Oct 2021 04:30:43 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bm1sm10034560ejb.38.2021.10.07.04.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:30:43 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/25] include/block/block_int: split header into
 I/O and global state API
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-7-eesposit@redhat.com>
 <YV7Ri5adGVrl0pPQ@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <70405d0c-3f1f-ccfe-a233-fdda9d4b213e@redhat.com>
Date: Thu, 7 Oct 2021 13:30:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV7Ri5adGVrl0pPQ@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 12:52, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 10:31:56AM -0400, Emanuele Giuseppe Esposito wrote:
>> +int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
>> +                                         BdrvChild *dst, int64_t dst_offset,
>> +                                         int64_t bytes,
>> +                                         BdrvRequestFlags read_flags,
>> +                                         BdrvRequestFlags write_flags);
>> +int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
>> +                                       BdrvChild *dst, int64_t dst_offset,
>> +                                       int64_t bytes,
>> +                                       BdrvRequestFlags read_flags,
>> +                                       BdrvRequestFlags write_flags);
> 
> These look like I/O APIs to me. Are they in the GS API because only
> qemu-img.c call copy_range? I thought SCSI emulation might call it too,
> but grep says otherwise.

SCSI (iscsi.c) implements the function pointer 
(*bdrv_co_copy_range_from/to), but does not call the function itself. 
However, later in the patches I put the function pointer as I/O.

These two functions are only tested by test-replication and thus are 
always under BQL when tested. But after looking at them again, and since 
they internally use only I/O APIs, I think we can move them to the I/O API.

Thank you,
Emanuele


