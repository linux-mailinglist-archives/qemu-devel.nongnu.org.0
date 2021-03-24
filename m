Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75697347E25
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:47:54 +0100 (CET)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6fh-0005to-Ev
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP6bD-000596-RM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP6bB-0001K6-CQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616604190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiogCbPOKdQAGZpwJpWn0ANqZTJuIE4aJd2G0ZBIEQ0=;
 b=fBpCDy0m5Kgvl6K689QTpflDngPl+OGupzP7YIf28uNBWxldUO92AVMXcVPJqXa9bEtqa0
 ecxh6S7h6t/WOUYmhCaJvcbuMun3qa4YR18UT3hkxpSBh9pxJi8Z4xjSNCIr+Pza1rO4yu
 4WoFs52o1c3xeAM4uiBdm8Fudf7XxOQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-odKYF5w_O5S_S5osnlb-8g-1; Wed, 24 Mar 2021 12:43:07 -0400
X-MC-Unique: odKYF5w_O5S_S5osnlb-8g-1
Received: by mail-wr1-f70.google.com with SMTP id r12so1319195wro.15
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiogCbPOKdQAGZpwJpWn0ANqZTJuIE4aJd2G0ZBIEQ0=;
 b=hJSnQ3w8QD63R6/cC6q2fGOHK7bJA3lsfT+4Z6KlUH5hRj9QCPGbWd49Lz4/buwpEO
 Cpb3G5l4EHLyo6rouAVw+CUUZAzC9W1dXORYwgN5PUUXrLNGX2wntUCUUoqnpncDiIRq
 lpjOpoyfEjXLkoy2lcPDUL8w7HgQEvCOh2lbIyTzNVW94UnxEUzNEzt+R0fMGmNRlKU7
 fATnNEfXOgcPnuWKXSliFapRmjtfJl6MM5AsFXxBbX7rCu3h17bHKpQfxscByOvwyYVW
 KmHWtJYP/sOxYCmj138LJWKnkhtjohBeQphWz7GVUrmSrOVeyK7Ndm2c3cNVSWpVPabO
 IyRQ==
X-Gm-Message-State: AOAM530D7WtANZAZtL5pRgcnbxe5ZJLvUEiSnxinG4RJvFCogyJOOgKU
 bYoQTVSwG8U4bRozlaRYrmBJBJDmSjW10FKf3xK9iwSfNgyB2RUmOBMa+cLqJJBip5fhAZ9tGkU
 q8auVM5je4gvAyQM=
X-Received: by 2002:a1c:bc06:: with SMTP id m6mr3778839wmf.18.1616604186554;
 Wed, 24 Mar 2021 09:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQHpip4vjhRtYbGDn+LNiYJHVHLuvzKUp5JzHEf2sb5vUQ4fxLqMf60Jv3fDfbojonrHgYBA==
X-Received: by 2002:a1c:bc06:: with SMTP id m6mr3778826wmf.18.1616604186359;
 Wed, 24 Mar 2021 09:43:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm3124161wmh.45.2021.03.24.09.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 09:43:05 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] coroutine rwlock downgrade fix, minor VDI changes
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
 <YFtnhusysS2c8f6D@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <601807d3-1554-051c-e44f-b50ca6578f5f@redhat.com>
Date: Wed, 24 Mar 2021 17:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFtnhusysS2c8f6D@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/21 17:23, Stefan Hajnoczi wrote:
> On Wed, Mar 17, 2021 at 07:00:07PM +0100, Paolo Bonzini wrote:
>> This is a resubmit of David Edmondson's series at
>> https://patchew.org/QEMU/20210309144015.557477-1-david.edmondson@oracle.com/.
>> After closer analysis on IRC, the CoRwlock's attempt to ensure
>> fairness turned out to be flawed.  Therefore, this series
>> reimplements CoRwlock without using a CoQueue.  Tracking whether
>> each queued coroutine is a reader/writer makes it possible to
>> never wake a writer when only readers should be allowed and
>> vice versa.
>>
>> v2->v3: new CoRwlock implementation
>>
>> v3->v4: fix upgrade and add a test for that, too
>>
>> v4->v5: typo
>>
>> David Edmondson (4):
>>    block/vdi: When writing new bmap entry fails, don't leak the buffer
>>    block/vdi: Don't assume that blocks are larger than VdiHeader
>>    coroutine/mutex: Store the coroutine in the CoWaitRecord only once
>>    test-coroutine: Add rwlock downgrade test
>>
>> Paolo Bonzini (2):
>>    coroutine-lock: reimplement CoRwlock to fix downgrade bug
>>    test-coroutine: add rwlock upgrade test
>>
>>   block/vdi.c                 |  11 ++-
>>   include/qemu/coroutine.h    |  17 ++--
>>   tests/unit/test-coroutine.c | 161 ++++++++++++++++++++++++++++++++++++
>>   util/qemu-coroutine-lock.c  | 149 +++++++++++++++++++++------------
>>   4 files changed, 274 insertions(+), 64 deletions(-)
> 
> I had questions about the rwlock implementation. The other patches look
> ready to go.

Cool, none of them seem to be blockers but you raised good points.  I'll 
send v6 tomorrow.

Paolo


