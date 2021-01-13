Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695642F50A6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:08:37 +0100 (CET)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjdM-0005az-Fc
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzjXR-0008Q8-Nh
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzjXN-0005v4-Il
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610557343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMdz1hehnyBDFmYX/EEFjdFyGHy7nfXGutnExxClPOM=;
 b=WA3C52HSaWCz7J/eBv/EzWIlQd5GAYgw1crozNyPaegQjleM3uBkYX047ximgt8MdgSowd
 0UU90W3F1Q7gZbq9d9SO0u+SImix/0xALKpxgMF0TM0KyFw/1Ei4Jq8GCAR0OrUbyN/rxY
 vhQp22Qd39nGj9dPkYW/iVfU6NjzDxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-JS2kSu6nOLGc6VZ8_jK5Ig-1; Wed, 13 Jan 2021 12:02:20 -0500
X-MC-Unique: JS2kSu6nOLGc6VZ8_jK5Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2E69CDAD;
 Wed, 13 Jan 2021 17:02:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-103.ams2.redhat.com
 [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7827919C47;
 Wed, 13 Jan 2021 17:02:18 +0000 (UTC)
Subject: Re: [PATCH 4/7] iotests/129: Use throttle node
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-5-mreitz@redhat.com>
 <e3aa08b0-940d-8ae7-c4ee-a132510c1c55@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0257a8ac-316f-6cd9-926c-921e7a26c7e1@redhat.com>
Date: Wed, 13 Jan 2021 18:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e3aa08b0-940d-8ae7-c4ee-a132510c1c55@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 17:46, Vladimir Sementsov-Ogievskiy wrote:
> 13.01.2021 17:06, Max Reitz wrote:
>> Throttling on the BB has not affected block jobs in a while, so it is
>> possible that one of the jobs in 129 finishes before the VM is stopped.
>> We can fix that by running the job from a throttle node.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/129 | 39 +++++++++++++++------------------------
>>   1 file changed, 15 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
>> index dd23bb2e5a..febc806398 100755
>> --- a/tests/qemu-iotests/129
>> +++ b/tests/qemu-iotests/129
>> @@ -32,20 +32,18 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
>>                            "-b", self.base_img, '-F', iotests.imgfmt)
>>           iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 
>> 128M', self.test_img)
>> -        self.vm = iotests.VM().add_drive(self.test_img)
>> +        self.vm = iotests.VM()
>> +        self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
>> +
>> +        source_drive = 'driver=throttle,' + \
>> +                       'throttle-group=tg0,' + \
>> +                      f'file.driver={iotests.imgfmt},' + \
>> +                      f'file.file.filename={self.test_img}'
> 
> python has a "c-like" string "concatenation", i.e., you may omit "+" 
> operators (I don't know is it a good practice, but I do so:)

OK, why not.

>> +
>> +        self.vm.add_drive(None, source_drive)
>>           self.vm.launch()
>>       def tearDown(self):
>> -        params = {"device": "drive0",
>> -                  "bps": 0,
>> -                  "bps_rd": 0,
>> -                  "bps_wr": 0,
>> -                  "iops": 0,
>> -                  "iops_rd": 0,
>> -                  "iops_wr": 0,
>> -                 }
>> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
>> -                             **params)
>>           self.vm.shutdown()
>>           for img in (self.test_img, self.target_img, self.base_img):
>>               iotests.try_remove(img)
>> @@ -53,33 +51,26 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>       def do_test_stop(self, cmd, **args):
>>           """Test 'stop' while block job is running on a throttled drive.
>>           The 'stop' command shouldn't drain the job"""
>> -        params = {"device": "drive0",
>> -                  "bps": 1024,
>> -                  "bps_rd": 0,
>> -                  "bps_wr": 0,
>> -                  "iops": 0,
>> -                  "iops_rd": 0,
>> -                  "iops_wr": 0,
>> -                 }
>> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
>> -                             **params)
>> -        self.assert_qmp(result, 'return', {})
>>           result = self.vm.qmp(cmd, **args)
>>           self.assert_qmp(result, 'return', {})
>> +
>>           result = self.vm.qmp("stop")
>>           self.assert_qmp(result, 'return', {})
>>           result = self.vm.qmp("query-block-jobs")
>> +
>>           self.assert_qmp(result, 'return[0]/status', 'running')
>>           self.assert_qmp(result, 'return[0]/ready', False)
>> +        self.vm.qmp("block-job-cancel", device="drive0", force=True)
> 
> won't hurt, but I'd drop it as unrelated to commit
> 
>> +
>>       def test_drive_mirror(self):
>>           self.do_test_stop("drive-mirror", device="drive0",
>> -                          target=self.target_img,
>> +                          target=self.target_img, format=iotests.imgfmt,
>>                             sync="full")
> 
> this doesn't seem need/related too..

It is, because without a @format parameter, the job uses the driver of 
@device as the output format.  That driver is now 'throttle', which 
doesn’t work as a format.

Max


