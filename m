Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5FC44BBE9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 08:02:43 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkhd4-0004nb-Du
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 02:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkhbv-00045D-I7
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 02:01:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkhbo-0003Xj-JT
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 02:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636527682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMD9UgIRDBBvz9oN6GwDclh4FqhC5mW1lgxzD6QSb4c=;
 b=PxT2RESb3nXaMslfQtHPB07PJwdJ6lKfJ+aCAqJA0zcgT/s+LQle/lesp3Jur4CVgmsLLq
 yDmoFB8eSkbAdz2og+Y37epeVCEmdqceHR0oNStfkUIIHjvs4zO78j/SFFR2daoMRE89ZR
 oujyfd5KEyywPKGF2LEsXoo40Xs0q7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-sJqIbliHOaWT__PoAjTPMg-1; Wed, 10 Nov 2021 02:01:21 -0500
X-MC-Unique: sJqIbliHOaWT__PoAjTPMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCD3871803;
 Wed, 10 Nov 2021 07:00:51 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C17511B4B8;
 Wed, 10 Nov 2021 07:00:33 +0000 (UTC)
Message-ID: <e25c33b5-4c0a-ced3-c8fb-079fe4333e6f@redhat.com>
Date: Wed, 10 Nov 2021 08:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 05/33] i386: Add 'sgx-epc' device to expose EPC sections to
 guest
To: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
 <20210928125116.183620-6-pbonzini@redhat.com>
 <32078e7f-608c-2c62-b92e-58efb6f6d241@redhat.com>
 <59c77978-a099-a25f-5d84-7ee3489ac3a3@redhat.com>
 <20211110064100.GA2950@yangzhon-Virtual>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211110064100.GA2950@yangzhon-Virtual>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, sean.j.christopherson@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2021 07.41, Yang Zhong wrote:
> On Tue, Nov 09, 2021 at 06:48:59PM +0100, Paolo Bonzini wrote:
>> On 11/9/21 15:25, Thomas Huth wrote:
>>> Our device-crash-test script reports that this new device can be
>>> used to crash QEMU:
>>>
>>> $ ./qemu-system-x86_64 -M none -device sgx-epc
>>> /home/thuth/devel/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object
>>> 0x55c80d332290 is not an instance of type generic-pc-machine
>>>
>>> Should it be marked with:
>>>
>>>      dc->user_creatable = false
>>>
>>> ?
>>
>> Yes, it should.  Thanks for the report!
>>
> 
>    Thanks Thomas reported this issue!
> 
>    I did not know we need do this test before. this test is not
>    covered into Qemu Gitlab CI build system? or what's kind of tests we
>    need do before we send the patches to Qemu community? If there is one
>    guide or CI build including this, which is much better. Thanks!

No worry, device-crash-test is not mandatory, I just have the habit to run 
it and report the new problems when QEMU enters the freeze period for the 
next release.

But you're right, we should ultimatively try to get this included in the CI, 
too, so that the script does not bit-rot so easily anymore...

  Thomas



