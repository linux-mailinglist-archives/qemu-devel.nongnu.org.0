Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AE867897A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 22:23:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK4Ge-00072O-0t; Mon, 23 Jan 2023 16:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pK4Gb-00072B-OK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:22:13 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pK4GZ-0000p3-Q2
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:22:13 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F79D1F38D;
 Mon, 23 Jan 2023 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674508929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ChQNQ/gADwF8YZKNuxPZNNdLtnrYoLJtsO4nsgMBJ14=;
 b=ehjy2O0qZ4Mb8ZT8QUIOW5Dw4uD+IXWD+Ooov0+WqtCSGNPkvWpXF1wETjThJWSdLh0J4Y
 770LpTOpFksCUY9IsrNgMcVO1AFU6ECjq7GcoMF3qsmx6BGTBHP3qnxuOtI5U57Lq+DsfF
 IKt+m4r8ga426XItRP9CIyCdOGu53kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674508929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ChQNQ/gADwF8YZKNuxPZNNdLtnrYoLJtsO4nsgMBJ14=;
 b=HahiTYazCFhMwYB/zQBwdaclCsAidD2kojljwIyPpFpc4Qo/gM89/TDtmN0C8zk5CDQ/Cf
 bQQ8/fKbHelGTjDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14E101357F;
 Mon, 23 Jan 2023 21:22:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N+OHMoD6zmMBDwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 23 Jan 2023 21:22:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
In-Reply-To: <4dd2d0d8-d2a3-7636-a422-6b99b7e24e07@redhat.com>
References: <20230120194435.29796-1-farosas@suse.de>
 <77fcbf0a-0f9a-d3bc-c1cf-0ec3e21399c9@redhat.com> <877cxdcr5l.fsf@suse.de>
 <4dd2d0d8-d2a3-7636-a422-6b99b7e24e07@redhat.com>
Date: Mon, 23 Jan 2023 18:22:06 -0300
Message-ID: <87r0vleykh.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 23/01/2023 14.32, Fabiano Rosas wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> On 20/01/2023 20.44, Fabiano Rosas wrote:
>>>> These leaks can be avoided:
>>>>
>>>>    759 bytes in 61 blocks are still reachable in loss record 56 of 60
>>>>       at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>       by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>       by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>       by 0x12083E: qtest_get_machines (libqtest.c:1323)
>>>>       by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>       by 0x11556C: main (test-hmp.c:160)
>>>>
>>>>    992 bytes in 1 blocks are still reachable in loss record 57 of 60
>>>>       at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>       by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>       by 0x120725: qtest_get_machines (libqtest.c:1313)
>>>>       by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>       by 0x11556C: main (test-hmp.c:160)
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> ---
>>>>    tests/qtest/libqtest.c | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>>> index 6b2216cb20..65abac5029 100644
>>>> --- a/tests/qtest/libqtest.c
>>>> +++ b/tests/qtest/libqtest.c
>>>> @@ -1285,6 +1285,18 @@ struct MachInfo {
>>>>        char *alias;
>>>>    };
>>>>    
>>>> +static void qtest_free_machine_info(gpointer data)
>>>> +{
>>>> +    struct MachInfo *machines = data;
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; machines[i].name != NULL; i++) {
>>>> +        g_free((void *)machines[i].name); > +        g_free((void *)machines[i].alias);
>>>
>>> I'd suggest setting .name and .alias to NULL after freeing them, to avoid
>>> that danling pointers are left behind.
>>>
>>>> +    }
>>>> +    g_free(machines);
>>>> +}
>>>> +
>>>>    /*
>>>>     * Returns an array with pointers to the available machine names.
>>>>     * The terminating entry has the name set to NULL.
>>>> @@ -1336,6 +1348,8 @@ static struct MachInfo *qtest_get_machines(void)
>>>>        qobject_unref(response);
>>>>    
>>>>        memset(&machines[idx], 0, sizeof(struct MachInfo)); /* Terminating entry */
>>>> +    g_test_queue_destroy(qtest_free_machine_info, machines);
>>>
>>> So this frees the machines structure...
>>>
>>>>        return machines;
>>>
>>> ... but here it gets returned, too? ... that looks wrong. Did you maybe
>>> rather want to free it at the end of qtest_cb_for_every_machine() and
>>> qtest_has_machine ?
>> 
>> g_test_queue_destroy will only call qtest_free_machine_info during the
>> test teardown phase:
>> 
>> #0  qtest_free_machine_info (data=0x555555677870) at ../tests/qtest/libqtest.c:1289
>> #1  0x00007ffff7b1d9d1 in ?? () from /usr/lib64/libglib-2.0.so.0
>> #2  0x00007ffff7b1d8b3 in ?? () from /usr/lib64/libglib-2.0.so.0
>> #3  0x00007ffff7b1d8b3 in ?? () from /usr/lib64/libglib-2.0.so.0
>> #4  0x00007ffff7b1de82 in g_test_run_suite () from /usr/lib64/libglib-2.0.so.0
>> #5  0x00007ffff7b1deab in g_test_run () from /usr/lib64/libglib-2.0.so.0
>> #6  0x0000555555561221 in main (argc=<optimized out>, argv=<optimized
>> #out>) at ../tests/qtest/qom-test.c:12
>> 
>> As long as 'machines' is static and not being exposed to the tests, I
>> think this should be fine.
>
> Ah, thanks for the explanation, I really got that wrong.
>
> But I think g_test_queue_destroy() might still be the wrong thing to use 
> here. I added a fprintf() to your new qtest_free_machine_info() funcion, and 
> it seems to be called once at the end of the very first test already.

Yes, because we currently only use qtest_get_machines to construct the
test paths. So it is only needed before the tests.

The g_test_queue_destroy function is actually attaching the callback to
the first test.

> So if anything else calls qtest_get_machines() again after the first
> test finished, it will crash due to the dangling static machine
> pointer.

Ah, my reply about it being fine was while looking at the v2 which sets
'machines' to NULL. So we would go around qtest_get_machines once more and
register qtest_free_machine_info a second time. Every time we have to
fetch the machines, we register the cleanup callback.

> So maybe the static machine pointer should be moved outside of the function 
> and then be released from qtest_quit() instead?

Hm.. let me give it a try. I'm not sure if it works because we call
qtest_quit while still using the machines array. Maybe if I move it out
and do the cleanup in qtest_cb_for_every_machine...

> (Also, it's valgrind that you used, isn't it? - I wonder why it's 
> complaining here at all since the pointer to the memory should still be 
> valid at the end?)

valgrind is complaining about the memory not being explicitly freed at
any point. I guess "leak" was not the most precise term to use in the
commit message.


