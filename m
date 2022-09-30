Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBD5F0BAA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 14:24:35 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeF4E-0000yV-4j
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 08:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oeExh-0006U6-7T
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oeExd-0000US-76
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664540264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JPycV5ZBkxpTP+XunwnARJ0smTZnHWPmjHnDA7Djv4=;
 b=jQm7VyWs6K4h7cIiiWilkiZG422Z68bAEhkKVH9dAGHf9CAImydOVOQelAs++cOn9crBUT
 ZAHlLK6W/r95a/8RxI2vntyGzDv8BjnsOhBm1mIfe1p2MBFAoQL4mX/GwZCV260TUO8+jk
 fH5CBa5f373htcvm2HmU2HgVpghEFUU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-AQ1JOKRjPgmQI1Zpfj8gug-1; Fri, 30 Sep 2022 08:17:43 -0400
X-MC-Unique: AQ1JOKRjPgmQI1Zpfj8gug-1
Received: by mail-wr1-f69.google.com with SMTP id
 e28-20020adfa45c000000b0022cc7d071b4so1494778wra.23
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 05:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0JPycV5ZBkxpTP+XunwnARJ0smTZnHWPmjHnDA7Djv4=;
 b=KjA/0FKbpd6W/jEdkzpaqzt8cJyWiDwTcWLcbOzDWiM73K+KP33g5VftAdMODpkNff
 mkjiMBJWDEl1Yi4mslOCIJak+ayG2n/T2vnDqtnYcM7QgQisckSKcL/pskmI+qtzdgKB
 Rua9j12YAYtJRqf4lSl3Yfih6Gg7UzaqBgJ2Mo6dhQNIgdLDW2uxu8sQf/ZUcZU3vo3m
 WyutJGA6CVdpweQuz3DSd40jYvs30SlDohUja1EQG9XgWo5vEEHEjyK0lQbCmi9rKY2G
 v8zqjucK+Z1kITVxdyAUPswWp61xyklY7BE1aEFWj+HiJqSlaQUJRj0ji/T7DQwrTqTL
 O2/A==
X-Gm-Message-State: ACrzQf3DNBNkb4E7ulHDN2mOaGdlDmSAc4To93ldK8/fk5BpfEB0SLNR
 rhqL/0cTv3mxYVot8kM0pOtQEejEmt2fh4iBnQ1CbHEFxHMCUJ2xIUvA7sOPCwA/sGtS3ELXe6A
 4KBFjgTtmrYvC3P8=
X-Received: by 2002:a05:600c:35cf:b0:3b4:c0c2:d213 with SMTP id
 r15-20020a05600c35cf00b003b4c0c2d213mr14517236wmq.162.1664540260789; 
 Fri, 30 Sep 2022 05:17:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Sq2LEgDIdzZYRQa8/BfXAlJ5YtpjW0HAdhoMKST28S81WD0cQj+brjHcEpGJaOM4RlOiiaQ==
X-Received: by 2002:a05:600c:35cf:b0:3b4:c0c2:d213 with SMTP id
 r15-20020a05600c35cf00b003b4c0c2d213mr14517212wmq.162.1664540260423; 
 Fri, 30 Sep 2022 05:17:40 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d4e03000000b002238ea5750csm937637wrt.72.2022.09.30.05.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 05:17:39 -0700 (PDT)
Message-ID: <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
Date: Fri, 30 Sep 2022 14:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com> <YzW6FkfT9LT7aE7d@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YzW6FkfT9LT7aE7d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
>> Remove usage of aio_context_acquire by always submitting work items
>> to the current thread's ThreadPool.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> The thread pool is used by things outside of the file-* block drivers,
> too. Even outside the block layer. Not all of these seem to submit work
> in the same thread.
> 
> 
> For example:
> 
> postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
> qemu_loadvm_section_start_full() -> vmstate_load() ->
> vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
> 
> ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
> ...
> thread_pool_submit_aio(pool, flush_worker_cb, state,
>                        spapr_nvdimm_flush_completion_cb, state);
> 
> So it seems to me that we may be submitting work for the main thread
> from a postcopy migration thread.
> 
> I believe the other direct callers of thread_pool_submit_aio() all
> submit work for the main thread and also run in the main thread.
> 
> 
> For thread_pool_submit_co(), pr_manager_execute() calls it with the pool
> it gets passed as a parameter. This is still bdrv_get_aio_context(bs) in
> hdev_co_ioctl() and should probably be changed the same way as for the
> AIO call in file-posix, i.e. use qemu_get_current_aio_context().
> 
> 
> We could consider either asserting in thread_pool_submit_aio() that we
> are really in the expected thread, or like I suggested for LinuxAio drop
> the pool parameter and always get it from the current thread (obviously
> this is only possible if migration could in fact schedule the work on
> its current thread - if it schedules it on the main thread and then
> exits the migration thread (which destroys the thread pool), that
> wouldn't be good).

Dumb question: why not extend the already-existing poll->lock to cover
also the necessary fields like pool->head that are accessed by other
threads (only case I could find with thread_pool_submit_aio is the one
you pointed above)?

Thank you,
Emanuele


