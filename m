Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CE6786D4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 20:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK2or-0007SA-1o; Mon, 23 Jan 2023 14:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pK2oo-0007Ry-3p
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pK2om-0003Io-Fi
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674503363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5f2REwpmOKWncC1SZmmk4t/V7i7q5HMApIaddzCMFs=;
 b=ShrrLPKVEE33tWc++ADRXOh2+9rAYWRiewUafV6KDplyMESoX7i2K+I6pg4mBeBDon2p3C
 /G1OBKh6xki+kizwVtA+rE/woIi/1tCmoUePOrKhCIWEU9Pvd/nHZadWrc8dBbQEiF7iU0
 P79lwqTEyV1zMcGJOi1OW8NP+xdKpHU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256--Ut8mnkUM1eOxm_8diYrPQ-1; Mon, 23 Jan 2023 14:49:21 -0500
X-MC-Unique: -Ut8mnkUM1eOxm_8diYrPQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso9569862qko.11
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 11:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b5f2REwpmOKWncC1SZmmk4t/V7i7q5HMApIaddzCMFs=;
 b=kCX1KCj60yUDrzSoVUxIbi/2w9z4zVBWBNdm+L7ASv6qs8dGd0Xm8gkZe6SQP5hnrA
 BNJf7eKeL2yOBrQzVjUhas2sJqJsf9LWQMXBITMaxUNlY9owsCRWq3nR7OAKmHGtVyB3
 JX17di24OM01zMTvsBEIbJPyn3hWCsSj95a+g6V1wqR8gaoWI0bXp2v4TkfXRJiV40ze
 YTvGfwD3UaNIlW0o0Bjf1U7TnvIWfjW5tFadmrDrUDoUDypNSjJfZNVtfeJwrmTOo2GD
 +9O0SuqafZRYVvseMg7umVk4IvlMQUGR1sVTOUwWeEse2YT5RJ89WGSeZQKTgh5TYWYA
 5XgQ==
X-Gm-Message-State: AFqh2kpX8pPoyfmzdETKo8BRd5tfz8wDs+D1S0S/q41zuknTeHTlaNGN
 /SjrkbJOU+mt2qEVU0hv3YvY3YP4b477gja/o300IkqsDb81xmskqWkcJdG8/JlHk5d2U4ugg3f
 c5Ut6az9Ha20UsqE=
X-Received: by 2002:ac8:7605:0:b0:3ab:7d29:2f96 with SMTP id
 t5-20020ac87605000000b003ab7d292f96mr39957183qtq.40.1674503360944; 
 Mon, 23 Jan 2023 11:49:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxofM+WhQV7feLG393HvIM1AEtEzHjwACP1mhGJSGpJp1FoxOK5DLu6LrQ3Cx9N4LStZL6RQ==
X-Received: by 2002:ac8:7605:0:b0:3ab:7d29:2f96 with SMTP id
 t5-20020ac87605000000b003ab7d292f96mr39957166qtq.40.1674503360669; 
 Mon, 23 Jan 2023 11:49:20 -0800 (PST)
Received: from [192.168.8.105] (tmo-097-201.customers.d1-online.com.
 [80.187.97.201]) by smtp.gmail.com with ESMTPSA id
 o24-20020a05620a229800b006eeb3165565sm48202qkh.80.2023.01.23.11.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 11:49:20 -0800 (PST)
Message-ID: <4dd2d0d8-d2a3-7636-a422-6b99b7e24e07@redhat.com>
Date: Mon, 23 Jan 2023 20:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230120194435.29796-1-farosas@suse.de>
 <77fcbf0a-0f9a-d3bc-c1cf-0ec3e21399c9@redhat.com> <877cxdcr5l.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
In-Reply-To: <877cxdcr5l.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23/01/2023 14.32, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 20/01/2023 20.44, Fabiano Rosas wrote:
>>> These leaks can be avoided:
>>>
>>>    759 bytes in 61 blocks are still reachable in loss record 56 of 60
>>>       at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>       by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>       by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>       by 0x12083E: qtest_get_machines (libqtest.c:1323)
>>>       by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>       by 0x11556C: main (test-hmp.c:160)
>>>
>>>    992 bytes in 1 blocks are still reachable in loss record 57 of 60
>>>       at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>       by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>       by 0x120725: qtest_get_machines (libqtest.c:1313)
>>>       by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>       by 0x11556C: main (test-hmp.c:160)
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>    tests/qtest/libqtest.c | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>> index 6b2216cb20..65abac5029 100644
>>> --- a/tests/qtest/libqtest.c
>>> +++ b/tests/qtest/libqtest.c
>>> @@ -1285,6 +1285,18 @@ struct MachInfo {
>>>        char *alias;
>>>    };
>>>    
>>> +static void qtest_free_machine_info(gpointer data)
>>> +{
>>> +    struct MachInfo *machines = data;
>>> +    int i;
>>> +
>>> +    for (i = 0; machines[i].name != NULL; i++) {
>>> +        g_free((void *)machines[i].name); > +        g_free((void *)machines[i].alias);
>>
>> I'd suggest setting .name and .alias to NULL after freeing them, to avoid
>> that danling pointers are left behind.
>>
>>> +    }
>>> +    g_free(machines);
>>> +}
>>> +
>>>    /*
>>>     * Returns an array with pointers to the available machine names.
>>>     * The terminating entry has the name set to NULL.
>>> @@ -1336,6 +1348,8 @@ static struct MachInfo *qtest_get_machines(void)
>>>        qobject_unref(response);
>>>    
>>>        memset(&machines[idx], 0, sizeof(struct MachInfo)); /* Terminating entry */
>>> +    g_test_queue_destroy(qtest_free_machine_info, machines);
>>
>> So this frees the machines structure...
>>
>>>        return machines;
>>
>> ... but here it gets returned, too? ... that looks wrong. Did you maybe
>> rather want to free it at the end of qtest_cb_for_every_machine() and
>> qtest_has_machine ?
> 
> g_test_queue_destroy will only call qtest_free_machine_info during the
> test teardown phase:
> 
> #0  qtest_free_machine_info (data=0x555555677870) at ../tests/qtest/libqtest.c:1289
> #1  0x00007ffff7b1d9d1 in ?? () from /usr/lib64/libglib-2.0.so.0
> #2  0x00007ffff7b1d8b3 in ?? () from /usr/lib64/libglib-2.0.so.0
> #3  0x00007ffff7b1d8b3 in ?? () from /usr/lib64/libglib-2.0.so.0
> #4  0x00007ffff7b1de82 in g_test_run_suite () from /usr/lib64/libglib-2.0.so.0
> #5  0x00007ffff7b1deab in g_test_run () from /usr/lib64/libglib-2.0.so.0
> #6  0x0000555555561221 in main (argc=<optimized out>, argv=<optimized
> #out>) at ../tests/qtest/qom-test.c:12
> 
> As long as 'machines' is static and not being exposed to the tests, I
> think this should be fine.

Ah, thanks for the explanation, I really got that wrong.

But I think g_test_queue_destroy() might still be the wrong thing to use 
here. I added a fprintf() to your new qtest_free_machine_info() funcion, and 
it seems to be called once at the end of the very first test already. So if 
anything else calls qtest_get_machines() again after the first test 
finished, it will crash due to the dangling static machine pointer.

So maybe the static machine pointer should be moved outside of the function 
and then be released from qtest_quit() instead?

(Also, it's valgrind that you used, isn't it? - I wonder why it's 
complaining here at all since the pointer to the memory should still be 
valid at the end?)

  Thomas



