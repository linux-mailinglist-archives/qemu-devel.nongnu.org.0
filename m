Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDF2F2EC8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:16:10 +0100 (CET)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIan-0000N8-GU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzIZU-00088S-Tx
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:14:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzIZR-0000RR-B9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610453684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1B9v0uurXZTvqRoPAgmDH2Cuz5XhJGgUxMsXHsHSqg=;
 b=FmPEOTOh/LsqjdnbeobU9aJR8UOLqVAAqPlCK24NYwsOHV64KqvGPy+TyDdebqzSpzHmpQ
 SheLBTV8wvRFAZXdJNz6TUCzlSfvMaWeocFqCJ0wwmdkbWKctKBao4zMFsq3etTLOavSGe
 J7B7pj6wJPI4lX6y9R7/cvVzqt1x4Oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-qMmWdmV5MBe3kjyDw-mmmw-1; Tue, 12 Jan 2021 07:14:40 -0500
X-MC-Unique: qMmWdmV5MBe3kjyDw-mmmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4168A1842144;
 Tue, 12 Jan 2021 12:14:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC14119746;
 Tue, 12 Jan 2021 12:14:35 +0000 (UTC)
Subject: Re: [PATCH v3 13/25] iotests: 129: prepare for backup over block-copy
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-14-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d510d1fb-5c1e-cbc8-0d68-9fa53c3bf8be@redhat.com>
Date: Tue, 12 Jan 2021 13:14:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-14-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
> After introducing parallel async copy requests instead of plain
> cluster-by-cluster copying loop, backup job may finish earlier than
> final assertion in do_test_stop. Let's require slow backup explicitly
> by specifying speed parameter.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/129 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 3c22f6448c..e9da0208c4 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -77,7 +77,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>       def test_drive_backup(self):
>           self.do_test_stop("drive-backup", device="drive0",
>                             target=self.target_img,
> -                          sync="full")
> +                          sync="full", speed=1024)
>   
>       def test_block_commit(self):
>           self.do_test_stop("block-commit", device="drive0")

I still don’t like this very much.  We write 128 MB of data, 
do_test_stop throttles the source to 1 kB/s, so even “a lot of parallel 
requests” shouldn’t finish immediately.

I feel like there’s a bigger problem here.

Then again, I have 129 disabled all the time anyway because its 
throttling simply doesn’t work, so I guess

Acked-by: Max Reitz <mreitz@redhat.com>


