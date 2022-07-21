Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C473C57C6E6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:53:43 +0200 (CEST)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oERwE-0006Eh-Q9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oERtB-000260-Iq
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:50:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oERt7-0001Rn-FF
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658393428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BW4yJCP/Qb3Gv0oslWObWSVDHRAEVuyXJMAHob4rngQ=;
 b=H5qsZLkXeZJejWOsdfTt2gKID62xYY/lk+V7ShiVqS9yDJaC7eM1VUZNvaDNOKOoopO7Oh
 zVgWn3RcH4jBETMvJ/HpOIMq+hyAH48tf3bosgHV01IuMh+inG5ZhddyqRRgcA5zj2r1ew
 o7UYca8XJ0x3ER+Om1Zfu/Cf5MNj8qU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-VF2pZ3_CPtCVwGGf075DPw-1; Thu, 21 Jul 2022 04:50:21 -0400
X-MC-Unique: VF2pZ3_CPtCVwGGf075DPw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso2516479wme.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BW4yJCP/Qb3Gv0oslWObWSVDHRAEVuyXJMAHob4rngQ=;
 b=8DcFPNLEBtQ6zHRFo05E9DZheqJDHjJ0/gsRB7eel9ENAACGXBb+fSsDSoHuCqBIku
 uRESWsqKjp6fx7IgpIrq93wbAw3BC3mj83t0CEtsxswEf+KftGBGBU2/D+3Ag1Ssmzy+
 OMnfY6Qh44e+20VGNIJkSQkjGdORuHTiJ2wzk2tksSm0Bwmm8KmvgCvbKDvv0471pdul
 wOicFhGXRN2/rv/d2/iVZrFIsklExLx1aMKZcLFg1SDu23rzR34dQFNuZCKvyrbBLZkQ
 HKAsslQPDozXpT9mzs/zWy5jYtlMvjkHyYHsi5q3cF/QD6OOT31JO472f8THDhq3AaTJ
 XZOQ==
X-Gm-Message-State: AJIora90Ld54cAPRCr/YfXSzARrITeFMAPGDBOoqLFt+Jc+1o2RpTZxY
 PA8KbSIzVmuOYxvlYlZuBfMktbwHuWR+UeMtP03G9MlqY5iEqdNRcVcigTAN+3ZG481AV/+g1kj
 2TdFEF5klEVZxeRQ=
X-Received: by 2002:a05:600c:4f43:b0:3a2:ee79:2dd5 with SMTP id
 m3-20020a05600c4f4300b003a2ee792dd5mr7126974wmq.143.1658393419911; 
 Thu, 21 Jul 2022 01:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcMqUrhC/otk4sQst57imFd3FBbz65q9nrLvJvFQRtSrAzajtjfQP95TayynAXHsTdllg+Ow==
X-Received: by 2002:a05:600c:4f43:b0:3a2:ee79:2dd5 with SMTP id
 m3-20020a05600c4f4300b003a2ee792dd5mr7126953wmq.143.1658393419607; 
 Thu, 21 Jul 2022 01:50:19 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-217.web.vodafone.de.
 [109.43.179.217]) by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b003a320e6f011sm1274162wme.1.2022.07.21.01.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 01:50:19 -0700 (PDT)
Message-ID: <2b67285d-b824-6552-d6a7-0e0d79ab30e2@redhat.com>
Date: Thu, 21 Jul 2022 10:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 08/10] iotests/264: add mirror-cancel test-case
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
 <20210205163720.887197-9-vsementsov@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210205163720.887197-9-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05/02/2021 17.37, Vladimir Sementsov-Ogievskiy wrote:
> Check that cancel doesn't wait for 10s of nbd reconnect timeout.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
>   tests/qemu-iotests/264.out |  4 ++--
>   2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
> index 6feeaa4056..347e53add5 100755
> --- a/tests/qemu-iotests/264
> +++ b/tests/qemu-iotests/264
> @@ -27,25 +27,26 @@ from iotests import qemu_img_create, file_path, qemu_nbd_popen
>   
>   disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
>   nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
> -size = 5 * 1024 * 1024
>   wait_limit = 3.0
>   wait_step = 0.2
>   
>   
>   class TestNbdReconnect(iotests.QMPTestCase):
> -    def setUp(self):
> -        qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
> -        qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
> +    def init_vm(self, disk_size):
> +        qemu_img_create('-f', iotests.imgfmt, disk_a, str(disk_size))
> +        qemu_img_create('-f', iotests.imgfmt, disk_b, str(disk_size))
>           self.vm = iotests.VM().add_drive(disk_a)
>           self.vm.launch()
> -        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
> +        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(disk_size))
>   
>       def tearDown(self):
>           self.vm.shutdown()
>           os.remove(disk_a)
>           os.remove(disk_b)
>   
> -    def test(self):
> +    def start_job(self, job):
> +        """Stat job with nbd target and kill the server"""
> +        assert job in ('blockdev-backup', 'blockdev-mirror')
>           with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
>               result = self.vm.qmp('blockdev-add',
>                                    **{'node_name': 'backup0',
> @@ -55,7 +56,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
>                                                           'path': nbd_sock},
>                                                'reconnect-delay': 10}})
>               self.assert_qmp(result, 'return', {})
> -            result = self.vm.qmp('blockdev-backup', device='drive0',
> +            result = self.vm.qmp(job, device='drive0',
>                                    sync='full', target='backup0',
>                                    speed=(1 * 1024 * 1024))
>               self.assert_qmp(result, 'return', {})
> @@ -73,7 +74,8 @@ class TestNbdReconnect(iotests.QMPTestCase):
>   
>           jobs = self.vm.qmp('query-block-jobs')['return']
>           # Check that job is still in progress
> -        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
> +        self.assertTrue(jobs)
> +        self.assertTrue(jobs[0]['offset'] < jobs[0]['len'])
>   
>           result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
>           self.assert_qmp(result, 'return', {})
> @@ -81,12 +83,32 @@ class TestNbdReconnect(iotests.QMPTestCase):
>           # Emulate server down time for 1 second
>           time.sleep(1)
>   
> +    def test_backup(self):
> +        size = 5 * 1024 * 1024
> +        self.init_vm(size)
> +        self.start_job('blockdev-backup')
> +
>           with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
>               e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
>               self.assertEqual(e['data']['offset'], size)
>               result = self.vm.qmp('blockdev-del', node_name='backup0')
>               self.assert_qmp(result, 'return', {})
>   
> +    def test_mirror_cancel(self):
> +        # Mirror speed limit doesn't work well enough, it seems that mirror
> +        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
> +        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
> +        self.init_vm(20 * 1024 * 1024)
> +        self.start_job('blockdev-mirror')
> +
> +        result = self.vm.qmp('block-job-cancel', device='drive0')
> +        self.assert_qmp(result, 'return', {})
> +
> +        start_t = time.time()
> +        self.vm.event_wait('BLOCK_JOB_CANCELLED')
> +        delta_t = time.time() - start_t
> +        self.assertTrue(delta_t < 2.0)

  Hi!

For what it's worth, I've just run into this assert while running "make 
check -j8 SPEED=slow":

--- /home/thuth/devel/qemu/tests/qemu-iotests/264.out
+++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/264/264.out.bad
@@ -1,5 +1,15 @@
-...
+..F
+======================================================================
+FAIL: test_mirror_cancel (__main__.TestNbdReconnect)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/264", line 112, in 
test_mirror_cancel
+    self.cancel_job()
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/264", line 104, in cancel_job
+    self.assertTrue(delta_t < 2.0)
+AssertionError: False is not true
+
  ----------------------------------------------------------------------
  Ran 3 tests

-OK
+FAILED (failures=1)

(test program exited with status code 1)

Maybe 2.0 is not enough on loaded systems? Should we increase the value there?

  Thomas


