Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6650E68DB8D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP1L-0000Wu-Or; Tue, 07 Feb 2023 09:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPP1H-0000UY-KB
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:32:28 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPP1F-0007oz-W6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:32:27 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 959735F827;
 Tue,  7 Feb 2023 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675780344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FxWTpUNCGmxFpUfc3LZaazwYjDCEfP4z5RUD+H1oG+k=;
 b=BdiAGKPmSVdPsktHaD4eEuLDafWpH8YnH8aPEomBxwI0fNWzQQ7QU7aDZXP682pHCZ2qBM
 X9+4WeQhjyEM9GszqrF6KnVcbRTLzLwq2KQ/tzbF3LzjEO/QE+Da+RW5d0ON4sDu4yyU9F
 3RtGCHGNYPxIwxDIusbzO0wtB8aoZCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675780344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FxWTpUNCGmxFpUfc3LZaazwYjDCEfP4z5RUD+H1oG+k=;
 b=tdCC4ufnOHJlgz362EWnNQS5bEiwCecCMcsgsKORgPy25X012p1gYm1+xCzHBRrfUhWHnd
 CPaNFAD5gVPOdpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2178D139ED;
 Tue,  7 Feb 2023 14:32:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cXBmNvdg4mOlEAAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 14:32:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/12] tests/qtest: drive_del-test: Skip tests that
 require missing devices
In-Reply-To: <2d31e4e9-b5b5-fe98-417d-73920ef2b9e7@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-8-farosas@suse.de>
 <2d31e4e9-b5b5-fe98-417d-73920ef2b9e7@redhat.com>
Date: Tue, 07 Feb 2023 11:32:21 -0300
Message-ID: <871qn1o8ay.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

> On 06/02/2023 16.04, Fabiano Rosas wrote:
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/drive_del-test.c | 70 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>> 
>> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
>> index 9a750395a9..6fa96fa94a 100644
>> --- a/tests/qtest/drive_del-test.c
>> +++ b/tests/qtest/drive_del-test.c
>> @@ -16,6 +16,21 @@
>>   #include "qapi/qmp/qdict.h"
>>   #include "qapi/qmp/qlist.h"
>>   
>> +static const char *qvirtio_get_dev_type(void);
>> +
>> +/*
>> + * This covers the possible absence of a device due to QEMU build
>> + * options.
>> + */
>> +static bool look_for_device_builtin(const char *prefix, const char *suffix)
>> +{
>> +    gchar *device = g_strdup_printf("%s-%s", prefix, suffix);
>> +    bool rc = qtest_has_device(device);
>> +
>> +    g_free(device);
>> +    return rc;
>> +}
>
> I think I'd rather merge the above code into the has_device_builtin() 
> function below ... or is there a reason for keeping this separate?

No reason, I'll merge them.

>>   static bool look_for_drive0(QTestState *qts, const char *command, const char *key)
>>   {
>>       QDict *response;
>> @@ -40,6 +55,11 @@ static bool look_for_drive0(QTestState *qts, const char *command, const char *ke
>>       return found;
>>   }
>>   
>> +static bool has_device_builtin(const char *dev)
>> +{
>> +    return look_for_device_builtin(dev, qvirtio_get_dev_type());
>> +}
>> +
>>   static bool has_drive(QTestState *qts)
>>   {
>>       return look_for_drive0(qts, "query-block", "device");
>> @@ -208,6 +228,11 @@ static void test_drive_del_device_del(void)
>>   {
>>       QTestState *qts;
>>   
>> +    if (!has_device_builtin("virtio-scsi")) {
>> +        g_test_skip(NULL);
>
> Having a short message for the skip would be nice.

ok.

