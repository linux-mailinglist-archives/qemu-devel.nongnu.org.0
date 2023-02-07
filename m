Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF768DA5D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOnw-0002lN-7P; Tue, 07 Feb 2023 09:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPOn4-0002bK-Ps
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:18:20 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPOn2-0004Iv-56
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:17:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E1B73F911;
 Tue,  7 Feb 2023 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675779461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWFMlJDn5JGIba3H29YsZy2vBiSf3CkNmj1tziavYS8=;
 b=W4zJq6t1JP3x8NwsWgrW71lww9SA8hwkjy11R7pRar4vhQJUp781yk25NPt8LqPBKzPCE0
 5blRKKc2xbltUNhDjhehC2rRSN3OWajhObG/tPBewOLa92JRYlScMoBn3hbeMEwPcxdgiV
 HIZbLkW7ido6ROzdNUIyBJxrJ5zQKvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675779461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWFMlJDn5JGIba3H29YsZy2vBiSf3CkNmj1tziavYS8=;
 b=4PsuF/vU+hzA/XPREbC0ECwv9VYMphZILGwroS4yGH+vB9IB0WbKiJ0Y7HyYTbpg7vVtyD
 Dq8uBVE3ZykF/HCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9AC54139ED;
 Tue,  7 Feb 2023 14:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SmU3GIRd4mMaCgAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 14:17:40 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 06/12] tests/qtest: Skip unplug tests that use missing
 devices
In-Reply-To: <7d61db17-d0f1-3f9f-8bf6-bf9b0d33a063@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-7-farosas@suse.de>
 <7d61db17-d0f1-3f9f-8bf6-bf9b0d33a063@redhat.com>
Date: Tue, 07 Feb 2023 11:17:38 -0300
Message-ID: <874jrxo8zh.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

> On 06/02/2023 16.04, Fabiano Rosas wrote:
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>> 
>> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
>> index 5a6afa2b57..931acbdf50 100644
>> --- a/tests/qtest/device-plug-test.c
>> +++ b/tests/qtest/device-plug-test.c
>> @@ -67,6 +67,11 @@ static void test_pci_unplug_request(void)
>>       const char *arch = qtest_get_arch();
>>       const char *machine_addition = "";
>>   
>> +    if (!qtest_has_device("virtio-mouse-pci")) {
>> +        g_test_skip("Device virtio-mouse-pci not available");
>> +        return;
>> +    }
>> +
>>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>           machine_addition = "-machine pc";
>>       }
>> @@ -81,6 +86,10 @@ static void test_pci_unplug_request(void)
>>   
>>   static void test_q35_pci_unplug_request(void)
>>   {
>> +    if (!qtest_has_device("virtio-mouse-pci")) {
>> +        g_test_skip("Device virtio-mouse-pci not available");
>> +        return;
>> +    }
>>   
>>       QTestState *qtest = qtest_initf("-machine q35 "
>>                                       "-device pcie-root-port,id=p1 "
>
> This seems to break the QEMU coding style ("Mixed declarations (interleaving 
> statements and declarations within blocks) are generally not allowed; 
> declarations should be at the beginning
> of blocks.") ... could you separate the declaration of qtest from its 
> initialization now, please?

Ah well spotted, I got thrown off because some of these tests already
have a:

    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
        machine_addition = "-machine pc";
    }

    QTestState *qtest = qtest_initf...

I'll fix those as well.

