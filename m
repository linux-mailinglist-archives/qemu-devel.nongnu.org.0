Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0E35A03F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:46:51 +0200 (CEST)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrTG-0007AX-Pc
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrRq-0006ZE-Ei
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrRm-00073J-Tn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617975917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbftGy5ECkwDMmy8u436gsb2zllhSUC9w5WSdiLGwL4=;
 b=d7nP4i8fBqyhvv4u7fWiwnKUJT7GaDeBOEXdsQRZ3rWP/EwTWvzYGtH2ahOCIBGlWCQ9fR
 u2Gqs4T4NbWT896IvUbf5krzUXwoGJ+/EWpwqNGb1BAOV+ChjyzstGwlZmltyfYNaUhf35
 CzII9S+jeCIDwm05Fdsj1E62dC0P9lQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-oo1NJrqcP0mDUjzDIU4Ogw-1; Fri, 09 Apr 2021 09:45:15 -0400
X-MC-Unique: oo1NJrqcP0mDUjzDIU4Ogw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B41C6414C;
 Fri,  9 Apr 2021 13:45:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-67.ams2.redhat.com
 [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E427660BE5;
 Fri,  9 Apr 2021 13:45:12 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] iotests/041: block-job-complete on user-paused job
To: qemu-block@nongnu.org
References: <20210409132948.195511-1-mreitz@redhat.com>
 <20210409132948.195511-4-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <93dc20cf-0ae0-40c1-e0d4-502a351f407a@redhat.com>
Date: Fri, 9 Apr 2021 15:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210409132948.195511-4-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.04.21 15:29, Max Reitz wrote:
> Expand test_pause() to check what happens when issuing
> block-job-complete on a job that is on STANDBY because it has been
> paused by the user.  (This should be an error, and in particular not
> hang job_wait_unpaused().)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/041 | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
> index 5cc02b24fc..d2c9669741 100755
> --- a/tests/qemu-iotests/041
> +++ b/tests/qemu-iotests/041
> @@ -120,7 +120,18 @@ class TestSingleDrive(iotests.QMPTestCase):
>           result = self.vm.qmp('block-job-resume', device='drive0')
>           self.assert_qmp(result, 'return', {})
>   
> -        self.complete_and_wait()
> +        self.wait_ready()
> +
> +        # Check that a job on STANDBY cannot be completed
> +        self.pause_job('drive0')
> +        result = self.vm.qmp('block-job-complete', device='drive0')
> +        self.assert_qmp(result, 'error/desc',
> +                        "Job 'drive0' has been paused by the user")

Oops.  Should now be

"Job 'drive0' has been paused and needs to be explicitly resumed"

of course.

Max

> +
> +        result = self.vm.qmp('block-job-resume', device='drive0')
> +        self.assert_qmp(result, 'return', {})
> +
> +        self.complete_and_wait(wait_ready=False)
>           self.vm.shutdown()
>           self.assertTrue(iotests.compare_images(test_img, target_img),
>                           'target image does not match source after mirroring')
> 


