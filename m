Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6E455BB2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:46:01 +0100 (CET)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngng-0002sZ-6L
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mngkf-0001uY-Cg
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mngkb-0001Z8-Em
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637239367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gITdo2WI+hp8uQmE3BWnoxOLD6sLIkBEk8N8eKLacRY=;
 b=Jk82gARDFyWI8+AOGsdNVhVhCBYO2i7Bw+D7LqOg9GMziB4uPEri/UpLwwR1VR2vts1fwR
 j5gW2PsxgFp/QpX9SlqLmMQPJF7lDZYq9h3P/Nqv+SwayUJfAZMulF6OSG58Afwzojkt4N
 dkVapaQbyLsUaiSQkwmfTrI4wvp5lec=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Yzv_628INvuR-a_b04EW5Q-1; Thu, 18 Nov 2021 07:42:46 -0500
X-MC-Unique: Yzv_628INvuR-a_b04EW5Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402510800b003e29de5badbso5126940edd.18
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gITdo2WI+hp8uQmE3BWnoxOLD6sLIkBEk8N8eKLacRY=;
 b=MgVyYzCq+XbSta1FG3z9zTLt4s5QTXHCLLzjZODs+0i4XxwKNVkDg2cMuH07QqaGBC
 /2imy8NHFx9HLpBn01oXWauj3yzSgW6BCZ33MgA6X2eesMIYi10ShSnCT4Uc269xV8CZ
 9gR+TaelxzPJAN+vPvQzBYw0AQfxvuWgiYuVbDcOkFDIOPTvxGAAidmbExvfqWoZFfBX
 rhTEwoTYsK22CiGV9ZN4hc5uX/B2SwmFIqJCj7mjyEh0uyPU/Ue5BLqcEgqhoz+hEhlq
 dKPpg+keKqNV7BKbMHJtPBFwCMrWA6t53TpVJiivghqpQKffRmJzLYsVsE42pMxscd2a
 6xTg==
X-Gm-Message-State: AOAM532LufMHYuGQSVoto2q+fCXcekOtJ2Nk86acHAocWKsb1NjhmIF6
 NFYE8M1qgBc0D/vaJi2yFkZR6wZodpxmZoiVeBhNEDurkHHP1OXFVjrezUmRNYbQRz2EzSqKDa/
 9ou/5hJsvzxTyUrA=
X-Received: by 2002:a50:c38c:: with SMTP id h12mr10767730edf.72.1637239365610; 
 Thu, 18 Nov 2021 04:42:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEIgTk0BXmyQaLeY9VYEvOM4+2MHtXfgPgJLqA6qnQZ/IdBd2GlmWDKrFdALgGbb6mfuCpVg==
X-Received: by 2002:a50:c38c:: with SMTP id h12mr10767641edf.72.1637239365226; 
 Thu, 18 Nov 2021 04:42:45 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id m6sm1698997edc.36.2021.11.18.04.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 04:42:43 -0800 (PST)
Message-ID: <7847bfd0-e017-691e-6e2e-37fb3decd48d@redhat.com>
Date: Thu, 18 Nov 2021 13:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 19/25] block_int-common.h: split function pointers in
 BlockDriver
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-20-eesposit@redhat.com>
 <619cd983-4339-f70d-af25-678f5a7ebd83@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <619cd983-4339-f70d-af25-678f5a7ebd83@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/11/2021 13:00, Hanna Reitz wrote:
>> +
>> +    /*
>> +     * I/O API functions. These functions are thread-safe.
>> +     *
>> +     * See include/block/block-io.h for more information about
>> +     * the I/O API.
>> +     */
>> +
>> +    int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
>> +                                       Error **errp);
>> +    int coroutine_fn (*bdrv_co_create_opts)(BlockDriver *drv,
>> +                                            const char *filename,
>> +                                            QemuOpts *opts,
>> +                                            Error **errp);
> 
> Now this is really interesting.  Technically I suppose these should work 
> in any thread, but trying to do so results in:
> 
> $ touch /tmp/iothread-create-test.qcow2
> $ ./qemu-system-x86_64 -object iothread,id=iothr0 -qmp stdio <<EOF
> {"execute": "qmp_capabilities"}
> {"execute":"blockdev-add","arguments":{"node-name":"proto","driver":"file","filename":"/tmp/iothread-create-test.qcow2"}} 
> 
> {"execute":"x-blockdev-set-iothread","arguments":{"node-name":"proto","iothread":"iothr0"}} 
> 
> {"execute":"blockdev-create","arguments":{"job-id":"create","options":{"driver":"qcow2","file":"proto","size":0}}} 
> 
> EOF
> {"QMP": {"version": {"qemu": {"micro": 90, "minor": 1, "major": 6}, 
> "package": "v6.2.0-rc0-40-gd02d5fe5fb-dirty"}, "capabilities": ["oob"]}}
> {"return": {}}
> {"return": {}}
> {"return": {}}
> {"timestamp": {"seconds": 1636973542, "microseconds": 338117}, "event": 
> "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
> {"timestamp": {"seconds": 1636973542, "microseconds": 338197}, "event": 
> "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
> {"return": {}}
> qemu: qemu_mutex_unlock_impl: Operation not permitted
> [1]    86154 IOT instruction (core dumped)  ./qemu-system-x86_64 -object 
> iothread,id=iothr0 -qmp stdio <<<''
> 
> So something’s fishy and perhaps we should investigate this...  I mean, 
> I can’t really imagine a case where someone would need to run a 
> blockdev-create job in an I/O thread, but right now the interface allows 
> for it.
> 
> And then bdrv_create() is classified as global state, and also 
> bdrv_co_create_opts_simple(), which is supposed to be a drop-in function 
> for this .bdrv_co_create_opts function.  So that can’t work.
> 
> Also, I believe there might have been some functions you classified as 
> GS that are called from .create* implementations.  I accepted that, 
> given the abort I sketched above.  However, if we classify image 
> creation as I/O, then those would need to be re-evaluated. For example, 
> qcow2_co_create_opts() calls bdrv_create_file(), which is a GS function.
> 
> Some of this issues could be addressed by making .bdrv_co_create_opts a 
> GS function and .bdrv_co_create an I/O function.  I believe that would 
> be the ideal split, even though as shown above .bdrv_co_create doesn’t 
> work in an I/O thread, and then you have the issue of probably all 
> format drivers’ .bdrv_co_create implementations calling 
> bdrv_open_blockdev_ref(), which is a GS function.
> 
> (VMDK even calls blk_new_open(), blk_new_with_bs(), and blk_unref(), 
> none of which can ever be I/O functions, I think.)
> 
> I believe in practice the best is to for now classify all create-related 
> functions as GS functions.  This is supported by the fact that 
> qmp_blockdev_create() specifically creates the create job in the main 
> context (with a TODO comment) and requires block drivers to error out 
> when they encounter a node in a different AioContext.
> 

Ok after better reviewing this I agree with you:
- .bdrv_co_create_opts is for sure a GS function. It is called by 
bdrv_create and it is asserted to be under BQL.
- .bdrv_co_create should also be a GS, and the easiest thing to do would 
be to follow the existing TODO and make sure we cannot run it outside 
the main loop. I think that I will put it as GS, and add the BQL 
assertion to blockdev_create_run, so that if for some reasons someone 
tries to do what you did above, will crash because of the assertion, and 
not because of the aiocontext lock missing.

Emanuele


