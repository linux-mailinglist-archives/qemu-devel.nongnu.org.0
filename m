Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD81628EDC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouipD-0001kj-Tk; Mon, 14 Nov 2022 18:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouigJ-00073v-0R
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouWSh-0004rL-K5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 05:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668420783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vp2oHZMce2TuMdQZj4CckjhZSKEA4QUM3oK4XsoGr+w=;
 b=PH2620L92sLev09iq+p7tHrv7Xmd0cFhQx8hzBDOw8BCQ1jDh/59mQnQBsEdktBQKQ0tmV
 dl5oGyQoTW4sMZGEXvu8ZlI9/YBk/bmgr5ig9tZWXpZvavXT0RFjrYzPMp5iueCa2nGt0z
 mHs3fZBeD1AVFE11ajGfWk4vAeohdUE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-25Ujd_4YP6qJqX-ItMwxzA-1; Mon, 14 Nov 2022 05:13:02 -0500
X-MC-Unique: 25Ujd_4YP6qJqX-ItMwxzA-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so8073306edb.22
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 02:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vp2oHZMce2TuMdQZj4CckjhZSKEA4QUM3oK4XsoGr+w=;
 b=FR/Tpj5FGOWlJyXZPzvMOW1OTHq6E1yDTQd365M+oLA2uyaJgD9jw/+7HTA5GeyJR0
 CBeYam79uHzayzqtiy6lp95JdinDirlMzPuMqauqoVaREm4bZzjTJY9b/k93fMoyqCHW
 J+6ZdLyk1wzpYZ/TsWakj3gayHl123nybLv18C4ltNjE44hUi/P0ziE0DBS2MlpIvjS8
 /dyoPksc0wCB1QOM1sDr2sgmjKRtTG2uspZNiSygFbBFwyxWRO5RZc6gIrKS1jx+c+ii
 +nrRis78UbxJmY48qhM0wX4g0Vz4uNRPTORrYMWY51cXMahIFTm5y5UUgW44UvqBnW2G
 ihLQ==
X-Gm-Message-State: ANoB5pnGr0LBTQzZCZiIXwqMwBL/7oDlJgXRf9ux0tok1hUsvT0kIbak
 I6DxkzlISb+OaC/12aNLPCRHuLqB5xeUgYqU8NXJBUu8g3RNHpKX1fmAjbHpXRB4PV3D1JckCcG
 qQ6SzZaAPMf0u2tI=
X-Received: by 2002:a17:906:b294:b0:7a0:b505:e8fb with SMTP id
 q20-20020a170906b29400b007a0b505e8fbmr9720040ejz.281.1668420781122; 
 Mon, 14 Nov 2022 02:13:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf72IA9jBGOAjHq/uHGY2kXe5ehLRWw4MwKfGgLo84WMmRMfwd1odZfQP+7/XzoLL2OLh20tgQ==
X-Received: by 2002:a17:906:b294:b0:7a0:b505:e8fb with SMTP id
 q20-20020a170906b29400b007a0b505e8fbmr9720026ejz.281.1668420780774; 
 Mon, 14 Nov 2022 02:13:00 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a50ec0d000000b0045b3853c4b7sm4591945edr.51.2022.11.14.02.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 02:13:00 -0800 (PST)
Message-ID: <17547090-80cc-4ead-d8f5-ef842048d2df@redhat.com>
Date: Mon, 14 Nov 2022 11:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/11] Block layer patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
References: <20221111152744.261358-1-kwolf@redhat.com>
 <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11.11.22 20:20, Stefan Hajnoczi wrote:
> On Fri, 11 Nov 2022 at 10:29, Kevin Wolf <kwolf@redhat.com> wrote:
>> The following changes since commit 2ccad61746ca7de5dd3e25146062264387e43bd4:
>>
>>    Merge tag 'pull-tcg-20221109' of https://gitlab.com/rth7680/qemu into staging (2022-11-09 13:26:45 -0500)
>>
>> are available in the Git repository at:
>>
>>    https://repo.or.cz/qemu/kevin.git tags/for-upstream
>>
>> for you to fetch changes up to b04af371af685c12970ea93027dc6d8bf86265aa:
>>
>>    tests/stream-under-throttle: New test (2022-11-11 13:02:43 +0100)
>>
>> ----------------------------------------------------------------
>> Block layer patches
>>
>> - Fix deadlock in graph modification with iothreads
>> - mirror: Fix non-converging cases for active mirror
>> - qapi: Fix BlockdevOptionsNvmeIoUring @path description
>> - blkio: Set BlockDriver::has_variable_length to false
>>
>> ----------------------------------------------------------------
>> Alberto Faria (2):
>>        qapi/block-core: Fix BlockdevOptionsNvmeIoUring @path description
>>        block/blkio: Set BlockDriver::has_variable_length to false
>>
>> Hanna Reitz (9):
>>        block/mirror: Do not wait for active writes
>>        block/mirror: Drop mirror_wait_for_any_operation()
>>        block/mirror: Fix NULL s->job in active writes
>>        iotests/151: Test that active mirror progresses
>>        iotests/151: Test active requests on mirror start
>>        block: Make bdrv_child_get_parent_aio_context I/O
>>        block-backend: Update ctx immediately after root
>>        block: Start/end drain on correct AioContext
>>        tests/stream-under-throttle: New test
> Hi Hanna,
> This test is broken, probably due to the minimum Python version:
> https://gitlab.com/qemu-project/qemu/-/jobs/3311521303

:(

I just took the exception name (asyncio.exceptions.TimeoutError) from 
the test output when a timeout occurred, seems indeed like that’s too 
new.  I’m not entirely sure when that was introduced, and what it’s 
relationship to asyncio.TimeoutError is – in 3.11, the latter is an 
alias for the former, but I have 3.10 myself, where the documentation 
says both are distinct.  Anyway, using either works fine here, and the 
existing scripts in python/qemu use asyncio.TimeoutError, so I’ve sent a 
v2 of the patch to do the same.

(For the record, this test isn’t vital for anything, so just dropping it 
from the pull request seems perfectly fine to me.)

Hanna


