Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05676358AE0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:07:52 +0200 (CEST)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUY8E-0004d5-KN
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUY4u-000309-J2
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUY4q-0003RN-7f
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617901458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pNRBknvLTrl+uFIQ+6+j6cXEGmUdVv+MXgQGEHAp44=;
 b=FEJdnxJzzF31osCxwJmAjTGA29zS8FhO2WFP04M8dOblLAe7Zm/Jf+Wtkj+e5Dl+YfpsXu
 nWd75P3/JJmbwlMTh3nVDwv+UkzWOlsf1ESupXntNaDFtRjGfF6Gnl42R2qIjPBQ01jrAB
 CJkD125CTc0p7NxYYWUC4/K3N4/GMHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-cd8VbK5OOxWjoWKo7PLKWQ-1; Thu, 08 Apr 2021 13:04:15 -0400
X-MC-Unique: cd8VbK5OOxWjoWKo7PLKWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E13A6866;
 Thu,  8 Apr 2021 17:04:14 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25BA60BF1;
 Thu,  8 Apr 2021 17:04:13 +0000 (UTC)
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <505ba75a-996b-0c65-0c49-add50e55e3ce@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <66c60724-d3b5-383b-7a19-9e9498e1c132@redhat.com>
Date: Thu, 8 Apr 2021 13:04:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <505ba75a-996b-0c65-0c49-add50e55e3ce@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 12:58 PM, Vladimir Sementsov-Ogievskiy wrote:
> job-complete command is async. Can we instead just add a boolean like 
> job->completion_requested, and set it if job-complete called in STANDBY 
> state, and on job_resume job_complete will be called automatically if 
> this boolean is true?

job_complete has a synchronous setup, though -- we lose out on a lot of 
synchronous error checking in that circumstance.

I was not able to audit it to determine that it'd be safe to attempt 
that setup during a drained section -- I imagine it won't work and will 
fail, though.

So I thought we'd have to signal completion and run the setup *later*, 
but what do we do if we get an error then? Does the entire job fail? Do 
we emit some new event? ("BLOCK_JOB_COMPLETION_FAILED" ?) Is it recoverable?

So on and so forth. Seems like a lot of things to consider, unless I am 
making a giant fuss about nothing again, not like that's ever happened. O:-)

--js


