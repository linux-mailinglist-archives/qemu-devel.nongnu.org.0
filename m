Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8909121F42E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 16:36:52 +0200 (CEST)
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvM39-0004Y4-BE
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 10:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jvM2B-0003wp-VU
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 10:35:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53955
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jvM2A-0001EW-CQ
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 10:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594737349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=rYWocoJiBBXQsA+vaSo937rP5rkuZue+Rsy3iqOtFuQ=;
 b=f4NFdUpB/P3OhHUOpdKgmkWxv/wIljSmZRGYYYNdJCh67Nm6SDbBbCup8d4Xa+FGGtc7Rh
 f4mEp1ldhQmwV5A2/RNTx8P8H6GwfbIGbpAmCW8g4/g7CX5K6wbCx6H/IrR+fDoxYfQHEF
 st9eczRxcvNDsORYeQhk4iarpK0Jc/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-niR0eWUZPp6xyfSSio6SRw-1; Tue, 14 Jul 2020 10:35:47 -0400
X-MC-Unique: niR0eWUZPp6xyfSSio6SRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E48CF107B7ED;
 Tue, 14 Jul 2020 14:35:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0EC5C679;
 Tue, 14 Jul 2020 14:35:29 +0000 (UTC)
Subject: Re: migration: broken snapshot saves appear on s390 when small fields
 in migration stream removed
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <8bbafdec-836d-b7de-cab8-7a325b6e238d@suse.de>
 <55c406cd-b9ca-4e9b-0acd-d33cfe2a70e3@redhat.com>
 <bf074240-8cc3-96ff-e95e-bd301822b756@suse.de>
 <ea3b617f-c2ea-534c-06ba-f5f9f43828a7@suse.de>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8125b1ff-373a-aadc-eccf-27c567007a27@redhat.com>
Date: Tue, 14 Jul 2020 16:35:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ea3b617f-c2ea-534c-06ba-f5f9f43828a7@suse.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:57:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/07/2020 16.29, Claudio Fontana wrote:
> Hello,
> 
> I have some tiny progress in narrowing down this issue, possibly a qcow2 issue, still unclear,
> but involving Kevin Wolf and Max Reitz.
> 
> 
> The reproducer again:
> 
>> --------------------------------------------cut-------------------------------------------
>> diff --git a/cpus.c b/cpus.c
>> index 41d1c5099f..443b88697a 100644
>> --- a/cpus.c
>> +++ b/cpus.c
>> @@ -643,7 +643,7 @@ static void qemu_account_warp_timer(void)
>>  
>>  static bool icount_state_needed(void *opaque)
>>  {
>> -    return use_icount;
>> +    return 0;
>>  }
>>  
>>  static bool warp_timer_state_needed(void *opaque)
>> --------------------------------------------cut-------------------------------------------
> 
> This issue for now appears on s390 only:
> 
> On s390 hardware, test 267 fails (both kvm and tcg) in the qcow2 backing file part, with broken migration stream data in the s390-skeys vmsave (old style).
[...]
> If someone has a good idea let me know - first attempts to reproduce on x86 failed, but maybe more work could lead to it.

Two questions:

1) Can you also reproduce the issue manually, without running iotest
267? ... I tried, but so far I failed.

2) Since all the information so far sounds like the problem could be
elsewhere in the code, and the skeys just catch it by accident ... have
you tried running with valgrind? Maybe it catches something useful?

 Thomas


