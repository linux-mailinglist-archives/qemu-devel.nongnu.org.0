Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0B2EBD88
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:14:34 +0100 (CET)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7hx-0002hs-Co
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx7fW-0001IT-Cz
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:12:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx7fT-0004wa-4r
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609935116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaBQlCyRZMlEBH527KoOGBiFVbhED2wboGoQCu7D0Wk=;
 b=CINP3jSa99ctcVzmuF/iXryJOHWjzhi+PoQy+Pe8mgmf0NuTYaN9SOS56qPAmbYVyha5vq
 TGfRhXae+jkd5Gv2/O80Q+rHJWLBYv3y5yfpln7NF1t1sEPjctAGQVZfK1pBDmv137w6zi
 X9wyqQ8zVyUe0YPcJvwisKSLE52zKFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-rBUm7b0cMNCNxhXm6UdwMw-1; Wed, 06 Jan 2021 07:11:55 -0500
X-MC-Unique: rBUm7b0cMNCNxhXm6UdwMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 011AD100C602;
 Wed,  6 Jan 2021 12:11:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB5D19C44;
 Wed,  6 Jan 2021 12:11:48 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: bound the size of readline in
 s390_ccw_virtio
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210105124405.15424-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d3d84576-b6bb-5697-7dd4-37a0c672cbb8@redhat.com>
Date: Wed, 6 Jan 2021 13:11:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210105124405.15424-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2021 13.44, Alex Bennée wrote:
> The read binary data as text via a PPM export of the frame buffer
> seems a bit sketchy and it did blow up in the real world when the
> assertion failed:
> 
>    https://gitlab.com/qemu-project/qemu/-/jobs/943183183
> 
> However short of cleaning up the test to be more binary focused at
> least limit the attempt to dump the whole file as hexified zeros in
> the logs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 0f81af9950..5141d6abb2 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -241,7 +241,7 @@ class S390CCWVirtioMachine(Test):
>               self.assertEqual(line, b"1024 768\n")
>               line = ppmfile.readline()
>               self.assertEqual(line, b"255\n")
> -            line = ppmfile.readline()
> +            line = ppmfile.readline(size=256)
>               self.assertEqual(line, b"The quick fox jumps over a lazy dog\n")
>   
>           # Hot-plug a virtio-crypto device and see whether it gets accepted
> 

Acked-by: Thomas Huth <thuth@redhat.com>


