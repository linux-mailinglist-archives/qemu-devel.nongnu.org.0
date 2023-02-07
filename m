Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0C68DA0D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOYp-0002VG-Kl; Tue, 07 Feb 2023 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPOYe-0002PQ-AU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:02:58 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPOYc-0001n4-Bd
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:02:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1708338AF0;
 Tue,  7 Feb 2023 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675778569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b2huS8bwIr/sm1rPk3MJJiffMi/Otnu/VfYUGL3sq1Q=;
 b=V8mUqucpPZGtbxKTkPKSVwL94KnAY7dK+3dQsmBSIVhIesT4eKMhJo3hTMqmRHw2vl147t
 6IODND7yhgzoBc3LI3AFSoM8MI7+PJCCrPH3JuPpQ7l/nvBB4HU/5IaW3cTOl86eAzTydS
 70AsaAp95xVFG7/fHNTjmkTNl2sdR/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675778569;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b2huS8bwIr/sm1rPk3MJJiffMi/Otnu/VfYUGL3sq1Q=;
 b=OmHwn28mNM1BJcWKYjxrVrt0jrmAiWaMNAV6HguFzrSOLmWX2pE6IlQQW89/+OtJyEppk4
 npj97l9hnICIh7Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98525139ED;
 Tue,  7 Feb 2023 14:02:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x95sGAha4mMUAwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 14:02:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 02/12] tests/qtest: Do not run lsi53c895a test if device
 is not present
In-Reply-To: <c612ab5f-157b-264b-31e5-94b16b3c30b3@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-3-farosas@suse.de>
 <c612ab5f-157b-264b-31e5-94b16b3c30b3@redhat.com>
Date: Tue, 07 Feb 2023 11:02:46 -0300
Message-ID: <878rh9o9o9.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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
>> The tests are built once for all the targets, so as long as one QEMU
>> binary is built with CONFIG_LSI_SCSI_PCI=y, this test will
>> run. However some binaries might not include the device. So check this
>> again in runtime.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
>> index 392a7ae7ed..a9254b455d 100644
>> --- a/tests/qtest/fuzz-lsi53c895a-test.c
>> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
>> @@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
>>   
>>   int main(int argc, char **argv)
>>   {
>> +    if (!qtest_has_device("lsi53c895a")) {
>> +        return 0;
>> +    }
>
> I'm a little bit confused right now ... We're already checking 
> CONFIG_LSI_SCSI_PCI in meson.build, and we're only adding the test to 
> qtests_i386 there ... so how did you end up in a situation where you needed 
> this change?

I building with
--target-list=i386-softmmu,x86_64-softmmu,aarch64-softmmu,arm-softmmu
and the arm machines are selecting the CONFIG. That goes into
config_all_devices and meson can't tell the difference. In theory that
could be try for any CONFIG out there. Here's the output:

$ (...) qemu/build/tests/qtest/fuzz-lsi53c895a-test --tap -k
# random seed: R02Sfd8259d54ecdb6bdd8187b52e1a921c4
1..2
# Start of i386 tests
# Start of fuzz tests
# Start of lsi53c895a tests

# starting QEMU: exec ./qemu-system-i386 -qtest
  unix:/tmp/qtest-5629.sock -qtest-log /dev/null -chardev
  socket,path=/tmp/qtest-5629.qmp,id=char0 -mon
  chardev=char0,mode=control -display none -M q35 -nographic -monitor
  none -serial none -drive
  if=none,id=drive0,file=null-co://,file.read-zeroes=on,format=raw
  -device lsi53c895a,id=scsi0 -device
  scsi-hd,drive=drive0,bus=scsi0.0,channel=0,scsi-id=0,lun=0 -accel
  qtest

qemu-system-i386: -device lsi53c895a,id=scsi0: 'lsi53c895a' is not a valid device model name
Broken pipe
../tests/qtest/libqtest.c:181: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)

$ find build -name "*.mak" -exec grep -H LSI_SCSI_PCI {} \;
./aarch64-softmmu-config-devices.mak:CONFIG_LSI_SCSI_PCI=y
./arm-softmmu-config-devices.mak:CONFIG_LSI_SCSI_PCI=y

hw/arm/Kconfig has:

config REALVIEW
    ...
    select LSI_SCSI_PCI

config VERSATILE
    ...
    select LSI_SCSI_PCI

