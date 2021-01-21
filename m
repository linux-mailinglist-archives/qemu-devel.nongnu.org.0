Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117A2FDECC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:31:51 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2OpC-0004QW-0B
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Okf-0001tq-1y
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2OkZ-0005dL-W8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611192422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEgEc52qL/mRUnos6sdcch24mp3eQbqkuk2RNBnT3sk=;
 b=GRth67Sayv+jj+426TvBd/REClMjCWKIf1jSKJoo4o8Oqpju41PYQLERx0VEzsF9UjIuLk
 hlgm0Vy0D979hquBbAUT2/1fQk1epkuwLo9Wo+RyEg5Lf+qGAPfAZ0yFb9vMYa2MOBfrXH
 XdbvDtyTCiAIVkrCep/OOdqKRh+CkLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-SLTpkqcGOTWTnmrDgeOErQ-1; Wed, 20 Jan 2021 20:27:00 -0500
X-MC-Unique: SLTpkqcGOTWTnmrDgeOErQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10AAC801FAE;
 Thu, 21 Jan 2021 01:26:59 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 520B65D9C2;
 Thu, 21 Jan 2021 01:26:55 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-10-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 09/11] iotests/264: add mirror-cancel test-case
Message-ID: <80374353-9ad2-0dbf-576f-9b37e342cda6@redhat.com>
Date: Wed, 20 Jan 2021 19:26:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> Check that cancel doesn't wait for 10s of nbd reconnect timeout.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
>  tests/qemu-iotests/264.out |  4 ++--
>  2 files changed, 32 insertions(+), 10 deletions(-)

>  
> +    def test_mirror_cancel(self):
> +        # Mirror speed limit doesn't work well enough, it seems that mirror
> +        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
> +        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
> +        self.init_vm(20 * 1024 * 1024)
> +        self.start_job('blockdev-mirror')

Is this comment still accurate given recent work on the mirror filter?
I'm fine taking the patch as-is and tweaking it with followups, though,
in order to make progress.

> +
> +        result = self.vm.qmp('block-job-cancel', device='drive0')
> +        self.assert_qmp(result, 'return', {})
> +
> +        start_t = time.time()
> +        self.vm.event_wait('BLOCK_JOB_CANCELLED')
> +        delta_t = time.time() - start_t
> +        self.assertTrue(delta_t < 2.0)

I hope this doesn't fail on CI platforms under heavy load.  It didn't
fail for me locally, but I hope we don't have to revisit it.  Is there
any way we can test this in a manner that is not as fragile?

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


