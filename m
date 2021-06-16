Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A253AA592
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:48:31 +0200 (CEST)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcSc-0007jQ-4V
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcNF-00070u-Ij
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:42:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcNB-0008QU-Ca
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjPCGxvfDLm81SZmZJip9npBl1mBXlG//XK02uwUKAM=;
 b=byqJc9RJ749UnJrwnYtgF9UBT9LQPNclNAjsKArJyvAD1RFxKG9bzMfoynPe/8piQHuZnU
 75zOvPlSYnM+J3xoBMtrXYL51/T9i9/c+hscPODfEwff6uJr9Fon0q8ISTF6XlnIE2rHFE
 d7mhDZoGYL85wqlWpAFpF3G4uYHu4qo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-IZnxfC1NN_an-t7ycHRLbQ-1; Wed, 16 Jun 2021 16:42:51 -0400
X-MC-Unique: IZnxfC1NN_an-t7ycHRLbQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so1859806wrs.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gjPCGxvfDLm81SZmZJip9npBl1mBXlG//XK02uwUKAM=;
 b=DjPjpGIPB8URAzW/yMSTmpf4j+F5C/vLLziD9Yp4HlfhFAAac8ftOSLeprTtqyCBXf
 tsEJqka/9HdPiH2t6jXz7NvaJUfkCaVY+W4d7GddZkjZwqAvW2OwUimnoNb1Ks2wyMv9
 l/HsNj3rFKOoaCxEF26HBcpxmxZJMNngegdprVDKpb57DXiF3CNTHKIW9JuOvdU/2jT9
 08TErhyc/RuYof9ON4R8Nn0eYuQtfjI0nm5MI5Q+nGZbmqBey/+hkMBuDEWOwo+rj3EC
 8qJ89gBgIQ1maurIcQdAomZOyTlahFvO3aoNc5GRwMuHUI8c4gY1Qw8jZnvfgxKyyp3H
 EaiA==
X-Gm-Message-State: AOAM530DSVyz6cZTBGdoKff56S/xvsdiB+ymr0sHLke10etYgNmocm25
 bPJ5SJc2SqqitCIWQ1Je7O5+QlbIitaHc2lXRUqOmCdIQ/SKlcMtETM+hwM4FZwHJkjKwhHyR26
 CZWWGHhRpFHnuPoA=
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr1160209wry.120.1623876170298; 
 Wed, 16 Jun 2021 13:42:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzvJccbGm3HSax2x/0fDkqZPJVdZF2C6lRx4TUHOPiTahMGCPtSbKvIwzHdYIgCAzDNow0Kw==
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr1160186wry.120.1623876170079; 
 Wed, 16 Jun 2021 13:42:50 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z5sm3142905wrp.92.2021.06.16.13.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 13:42:49 -0700 (PDT)
Subject: Re: [PATCH 10/11] target/i386/monitor: Move SEV specific commands to
 sev.c
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-11-philmd@redhat.com>
 <0d8406ad-5f64-8add-9b05-4970ba1a14b8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <45d5f1a7-68cf-bf60-4a1b-8a012dbeb022@redhat.com>
Date: Wed, 16 Jun 2021 22:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0d8406ad-5f64-8add-9b05-4970ba1a14b8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 5:19 PM, Connor Kuehl wrote:
> On 6/10/21 1:45 AM, Philippe Mathieu-Daudé wrote:
>> Having the HMP/QMP commands defined in monitor.c makes the stubs
>> rather complicated when SEV is not built in. To simplify, move the
>> SEV functions to sev.c, and remove a layer of stubs.
>>
>> Also make it clearer when SEV is not built in, so developers don't
>> try to enable it when it is not enablable:
>>
>>  - before:
>>
>>   (qemu) info sev
>>   SEV is not enabled
>>
>> - after:
>>
>>   (qemu) info sev
>>   SEV is not available in this QEMU
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/i386/monitor.c         | 96 ----------------------------------
>>  target/i386/sev-sysemu-stub.c | 29 +++++++----
>>  target/i386/sev.c             | 97 +++++++++++++++++++++++++++++++++++
> 
> Hi Philippe,
> 
> I agree that the split from monitor.c makes it easier to follow. Instead
> of putting the QMP entry points in sev-sysemu-stub. and sev.c, what do
> you think of placing them in sev-qmp-stub.c and sev-qmp.c, respectively?
> 
> I find that appealing from a code organization/module boundary
> perspective.

I tried but this makes the code more complex since sev-qmp.c calls
functions defined in sev.c, we have to keep them declared in a local
header (sev_i386.h). So for v2 I choose to keep the same organization
but exploded the patch for easier review.


