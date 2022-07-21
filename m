Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777457D40C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:23:12 +0200 (CEST)
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEblP-0006jo-Hf
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oEbjp-0005Fd-DE; Thu, 21 Jul 2022 15:21:33 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:49068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oEbjj-0001Ql-A9; Thu, 21 Jul 2022 15:21:32 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6F6DF2E12A0;
 Thu, 21 Jul 2022 22:21:14 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b49f::1:a] (unknown
 [2a02:6b8:b081:b49f::1:a])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dmsLKHmAZu-LCOmduDm; Thu, 21 Jul 2022 22:21:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658431273; bh=UAbTt1ypB49u6OgcqMW4Gw/mWsMyVWMV8JHq95gvlCU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Tu1lQEU8LMv2+nMCpSCrs5faZ0Wy6/TZDllOLPvkQlMfv5iwYXIDiRfg5ngklw4ff
 p9bJhd/foN2Hd3qEmD3XNh6yiM/bYoCYnCGty1zlC6TOdaEijiD6B7dilAn/NAAuaq
 M+KaYvoJH+r9Hc9J63RHelicSEWWxCVVxxP+4DCs=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <06243e0a-c578-ea3c-7a27-959dbc358823@yandex-team.ru>
Date: Thu, 21 Jul 2022 22:21:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 08/10] iotests/264: add mirror-cancel test-case
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
 <20210205163720.887197-9-vsementsov@virtuozzo.com>
 <2b67285d-b824-6552-d6a7-0e0d79ab30e2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <2b67285d-b824-6552-d6a7-0e0d79ab30e2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/21/22 11:50, Thomas Huth wrote:
> On 05/02/2021 17.37, Vladimir Sementsov-Ogievskiy wrote:
>> Check that cancel doesn't wait for 10s of nbd reconnect timeout.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>   tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
>>   tests/qemu-iotests/264.out |  4 ++--
>>   2 files changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
>> index 6feeaa4056..347e53add5 100755
>> --- a/tests/qemu-iotests/264
>> +++ b/tests/qemu-iotests/264
>> @@ -27,25 +27,26 @@ from iotests import qemu_img_create, file_path, qemu_nbd_popen
>>   disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
>>   nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
>> -size = 5 * 1024 * 1024
>>   wait_limit = 3.0
>>   wait_step = 0.2
>>   class TestNbdReconnect(iotests.QMPTestCase):
>> -    def setUp(self):
>> -        qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
>> -        qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
>> +    def init_vm(self, disk_size):
>> +        qemu_img_create('-f', iotests.imgfmt, disk_a, str(disk_size))
>> +        qemu_img_create('-f', iotests.imgfmt, disk_b, str(disk_size))
>>           self.vm = iotests.VM().add_drive(disk_a)
>>           self.vm.launch()
>> -        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
>> +        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(disk_size))
>>       def tearDown(self):
>>           self.vm.shutdown()
>>           os.remove(disk_a)
>>           os.remove(disk_b)
>> -    def test(self):
>> +    def start_job(self, job):
>> +        """Stat job with nbd target and kill the server"""
>> +        assert job in ('blockdev-backup', 'blockdev-mirror')
>>           with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
>>               result = self.vm.qmp('blockdev-add',
>>                                    **{'node_name': 'backup0',
>> @@ -55,7 +56,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
>>                                                           'path': nbd_sock},
>>                                                'reconnect-delay': 10}})
>>               self.assert_qmp(result, 'return', {})
>> -            result = self.vm.qmp('blockdev-backup', device='drive0',
>> +            result = self.vm.qmp(job, device='drive0',
>>                                    sync='full', target='backup0',
>>                                    speed=(1 * 1024 * 1024))
>>               self.assert_qmp(result, 'return', {})
>> @@ -73,7 +74,8 @@ class TestNbdReconnect(iotests.QMPTestCase):
>>           jobs = self.vm.qmp('query-block-jobs')['return']
>>           # Check that job is still in progress
>> -        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
>> +        self.assertTrue(jobs)
>> +        self.assertTrue(jobs[0]['offset'] < jobs[0]['len'])
>>           result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
>>           self.assert_qmp(result, 'return', {})
>> @@ -81,12 +83,32 @@ class TestNbdReconnect(iotests.QMPTestCase):
>>           # Emulate server down time for 1 second
>>           time.sleep(1)
>> +    def test_backup(self):
>> +        size = 5 * 1024 * 1024
>> +        self.init_vm(size)
>> +        self.start_job('blockdev-backup')
>> +
>>           with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
>>               e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
>>               self.assertEqual(e['data']['offset'], size)
>>               result = self.vm.qmp('blockdev-del', node_name='backup0')
>>               self.assert_qmp(result, 'return', {})
>> +    def test_mirror_cancel(self):
>> +        # Mirror speed limit doesn't work well enough, it seems that mirror
>> +        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
>> +        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
>> +        self.init_vm(20 * 1024 * 1024)
>> +        self.start_job('blockdev-mirror')
>> +
>> +        result = self.vm.qmp('block-job-cancel', device='drive0')
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        start_t = time.time()
>> +        self.vm.event_wait('BLOCK_JOB_CANCELLED')
>> +        delta_t = time.time() - start_t
>> +        self.assertTrue(delta_t < 2.0)
> 
>   Hi!
> 
> For what it's worth, I've just run into this assert while running "make check -j8 SPEED=slow":
> 
> --- /home/thuth/devel/qemu/tests/qemu-iotests/264.out
> +++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/264/264.out.bad
> @@ -1,5 +1,15 @@
> -...
> +..F
> +======================================================================
> +FAIL: test_mirror_cancel (__main__.TestNbdReconnect)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/264", line 112, in test_mirror_cancel
> +    self.cancel_job()
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/264", line 104, in cancel_job
> +    self.assertTrue(delta_t < 2.0)
> +AssertionError: False is not true
> +
>   ----------------------------------------------------------------------
>   Ran 3 tests
> 
> -OK
> +FAILED (failures=1)
> 
> (test program exited with status code 1)
> 
> Maybe 2.0 is not enough on loaded systems? Should we increase the value there?
> 

Yes I think we can increase it. We have speed set to 1MB/s in the test. Mirror (due to implementation) will copy 16MB at once.. and then it should wait 16 seconds to copy next 4M. So, if fast-cancelling not work, we'll cancel in 19+ seconds. I think, we can safely increase our bound from 2 to 5-7 seconds.

-- 
Best regards,
Vladimir

