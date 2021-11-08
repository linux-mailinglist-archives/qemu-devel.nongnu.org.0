Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B59449A00
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:35:56 +0100 (CET)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7ch-000265-GS
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:35:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk7Xk-0005vg-Ip
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:30:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk7Xh-0003x3-FB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636389044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZDBlQ39fCPVakygBAtV4IJ/soDoZQ3dmFvxVyVs92Q=;
 b=Dh30FJzsV+RtW2EHsUi/xPM403rkSwQPJc8LPSv93wsJxuo1Nlu29zs+KGt1vWXLy/cW25
 aeEwXcBFryQoYn8dz1U8MR3vLXlKa3jOMh9U13MwocKHcEtwaJBThzeMWACiIhJjeVvscO
 0GE5970qJ0DuHHYt8V68SsXIKPMNTrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-dVA9B8ViN4qZxbTtL0wLPg-1; Mon, 08 Nov 2021 11:30:43 -0500
X-MC-Unique: dVA9B8ViN4qZxbTtL0wLPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E6E824F83
 for <qemu-devel@nongnu.org>; Mon,  8 Nov 2021 16:30:40 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADEED10016F5;
 Mon,  8 Nov 2021 16:30:39 +0000 (UTC)
Message-ID: <092f8664-3f19-877a-0aa2-24fac5e0ba51@redhat.com>
Date: Mon, 8 Nov 2021 17:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Artificially target-dependend compiles
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <87czneyaw3.fsf@dusky.pond.sub.org>
 <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com>
 <87fss9u3zj.fsf@dusky.pond.sub.org> <87ilx3nk5p.fsf@dusky.pond.sub.org>
 <837be094-8a70-b364-3f85-5e6af8c05304@redhat.com>
 <b476ec65-46fd-7d8c-770d-0351c245df09@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b476ec65-46fd-7d8c-770d-0351c245df09@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/11/2021 17.23, Paolo Bonzini wrote:
> On 11/8/21 16:38, Thomas Huth wrote:
>>
>> Hmm, we used to have a config-all-devices.mak file in the past (see commit 
>> a98006bc798169e which removed it), maybe we could re-introduce something 
>> similar again, but producing a config-all.h header file instead? So that 
>> this header file contains switches like CONFIG_ANY_ACPI_VMGENID and 
>> CONFIG_ANY_ROCKER that are set if any of the targets uses the device ... 
>> and these switches would not get poisoned in common code... ?
> 
> That would work, however the schema would still not provide any more 
> information than it currently does.

Yeah, it's of limited use - you would only get a difference if none of the 
targets provided a feature (say if you did not build the x86 and arm 
targets, CONFIG_ANY_ACPI_VMGENID would likely not be set) ... not too 
useful, I guess.

  Thomas


