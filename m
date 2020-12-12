Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680152D853A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 08:16:43 +0100 (CET)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knz90-0002m5-Gl
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 02:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knz7l-0002LS-Cs
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 02:15:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knz7j-0003VQ-OA
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 02:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607757322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyx2thpZP1U16tXWTZbQgDZxoTvou9TZgNxasCqphvI=;
 b=WhjfMfBZLFLgMt8b15/4aJnckhXOcjpHq+31cLWN1DNNONh87YwEfLUbGfg45bCGlvNU1s
 IEfQfFvx4naXs4Ubt5Ti5oKLCjpdk+TL5+Jr++vIJvLTiB6H90mV2g/AinK0zpaS6klS5x
 4VmwYiaIJyJkFzKp61J/c7ZKOJIrMps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-Q1pmCvpANrmqNFLYk3dXNg-1; Sat, 12 Dec 2020 02:15:20 -0500
X-MC-Unique: Q1pmCvpANrmqNFLYk3dXNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C3D803622;
 Sat, 12 Dec 2020 07:15:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCAFB5D745;
 Sat, 12 Dec 2020 07:15:14 +0000 (UTC)
Subject: Re: [PATCH 0/3] tests/acceptance: Test virtio-rng and -balloon on
 s390x
To: Willian Rampazzo <wrampazz@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <15276695-1718-e3a9-907e-c6e145294a87@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ee0257d8-3b38-5baf-5552-8c0f3f09ce37@redhat.com>
Date: Sat, 12 Dec 2020 08:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <15276695-1718-e3a9-907e-c6e145294a87@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 21.10, Willian Rampazzo wrote:
> On 12/11/20 2:31 PM, Thomas Huth wrote:
>> Add two more simple tests to check that virtio-rng and virtio-balloon
>> are at least (very) basically working on s390x.
>>
>> Based-on: 20201204121450.120730-1-cohuck@redhat.com
>>
>> Thomas Huth (3):
>>    tests/acceptance: Extract the code to clear dmesg and wait for CRW
>>      reports
>>    tests/acceptance/machine_s390_ccw_virtio: Test virtio-rng via
>>      /dev/hwrng
>>    tests/acceptance/machine_s390_ccw_virtio: Test the virtio-balloon
>>      device
>>
>>   tests/acceptance/machine_s390_ccw_virtio.py | 59 +++++++++++++++------
>>   1 file changed, 43 insertions(+), 16 deletions(-)
>>
> 
> One observation, test_s390x_devices tends to get longer and difficult to
> debug in case of problems. If a test covers one specific device type, It
> will improve readability, flexibility, and debugging. In case you don't want
> to spend time breaking this into multiple tests, I'll be glad to do that
> after the whole series is merged.

Theoretically yes, but practically we also want to run the tests as fast as
possible. Quite a bit of time is used to boot the kernel, so if we add a new
test for each and every device, that would increase the test time quite a
bit. Thus I'd rather prefer to keep everything in one single test instead
for now.

> As far as code concerned,
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>

Thanks!

 Thomas


