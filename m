Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEB768C511
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP5ZN-00087f-Ho; Mon, 06 Feb 2023 12:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP5ZF-00087V-ET
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:46:13 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP5ZE-0000cW-0k
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:46:13 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DEADB3EC70;
 Mon,  6 Feb 2023 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675705568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgDsmbk/JsbY5hv9jVXruFQLTF0RXwJfKzMdj3G7/10=;
 b=XX1YHChkYKNEp3CIFFicwJOL3lVSTIzPmr8jXtiqR49HtARVLljIMMLzwLSVNUuYLsYyzA
 ieqPcc3wNXD79joWVd0uenh5LEa9wgI90ssbGQ7IPtMXkWe6Y3zQMBw1NbCdixQ5Q6cJLX
 qCUasLa9u2tzlpR+ouV3sr+krHnSIC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675705568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgDsmbk/JsbY5hv9jVXruFQLTF0RXwJfKzMdj3G7/10=;
 b=YQiQy33ISmygP65ljuYiHyEDx0IOSrcjOXh7rtfHA12npWnPZvQhD9axDkLLVaH6F1+lDD
 ah4cVxTayIuL8nAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60BA9138E8;
 Mon,  6 Feb 2023 17:46:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MIGaCuA84WOXNwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 17:46:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Fam
 Zheng <fam@euphon.net>, Alexander Bulekov <alxndr@bu.edu>, Bandan Das
 <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 02/12] tests/qtest: Do not run lsi53c895a test if device
 is not present
In-Reply-To: <4ea8eec3-1d4e-0d09-4bf4-eb2987238594@linaro.org>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-3-farosas@suse.de>
 <4ea8eec3-1d4e-0d09-4bf4-eb2987238594@linaro.org>
Date: Mon, 06 Feb 2023 14:46:05 -0300
Message-ID: <877cwuadr6.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 6/2/23 16:04, Fabiano Rosas wrote:
>> The tests are built once for all the targets, so as long as one QEMU
>> binary is built with CONFIG_LSI_SCSI_PCI=3Dy, this test will
>> run. However some binaries might not include the device. So check this
>> again in runtime.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>=20
>> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53=
c895a-test.c
>> index 392a7ae7ed..a9254b455d 100644
>> --- a/tests/qtest/fuzz-lsi53c895a-test.c
>> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
>> @@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
>>=20=20=20
>>   int main(int argc, char **argv)
>>   {
>> +    if (!qtest_has_device("lsi53c895a")) {
>> +        return 0;
>> +    }
>
> Shouldn't we update Kconfig to now add the test unconditionally?
> Squashing:

I think we'd still want to not build this test if nothing selected
CONFIG_LSI_SCSI_PCI.

