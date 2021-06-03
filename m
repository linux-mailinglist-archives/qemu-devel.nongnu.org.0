Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D118339AAA3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 21:04:18 +0200 (CEST)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1losdd-0000XI-IZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 15:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loscg-00089s-O8
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loscd-00008j-PS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622746994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpxzaNXlyfmPAOHCq3xOpbFtIdYWG8MfZzDuFtuHMJQ=;
 b=byZVa8f51hIbbgtQVJcfACxW+Xu5clmrwz4bso/h+T1dXl7UxmS6mUOzE88jlnkyzNAiba
 9zG5mcd6vYmnp075P6g9BZv7rIJkU20dW/Pk3tgFvsIRJj+mxF7xY+ej+UgT6FCOofd8Tv
 SX+tIMGDK9EcZI/N6NSHR/hVpzle3wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-mIXsRHZqOVSdF2Q_y6rIgg-1; Thu, 03 Jun 2021 15:03:09 -0400
X-MC-Unique: mIXsRHZqOVSdF2Q_y6rIgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36352C7476;
 Thu,  3 Jun 2021 19:02:46 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3554360D06;
 Thu,  3 Jun 2021 19:02:45 +0000 (UTC)
Subject: Re: [PATCH v4 01/15] python: qemu: add timer parameter for qmp.accept
 socket
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-2-eesposit@redhat.com>
 <dd207fcf-f31c-d580-4877-72f017846ae7@redhat.com>
 <5b53f903-1a11-7dec-fe4c-6dc16c066056@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e8bd693e-99af-a8db-b237-097f62b6415f@redhat.com>
Date: Thu, 3 Jun 2021 15:02:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5b53f903-1a11-7dec-fe4c-6dc16c066056@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 4:06 AM, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 03/06/2021 01:23, John Snow wrote:
>> On 5/20/21 3:52 AM, Emanuele Giuseppe Esposito wrote:
>>> Alsp add a new _qmp_timer field to the QEMUMachine class.
>>>
>>> Let's change the default socket timeout to None, so that if
>>> a subclass needs to add a timer, it can be done by modifying
>>> this private field.
>>>
>>> At the same time, restore the timer to be 15 seconds in iotests.py, to
>>> give an upper bound to qemu-iotests execution.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> Hi Emanuele: I'm sorry, but with the recent Python PR this no longer 
>> applies to origin/master -- the python files got shuffled around a bit 
>> when I added the new CI tests.
>>
>> May I please ask you to rebase? You don't have to re-spin just yet, 
>> just pointing me to the rebase would help me out.
> 
> Hi John, no problem. I rebased here:
> https://gitlab.com/eesposit/qemu/-/commits/qemu_iotests_io
> 
> Let me know if I need to do anything else.
> I will re-spin later today.
> 
> Thank you,
> Emanuele
> 

Hi Emanuele:

https://gitlab.com/jsnow/qemu/-/commits/review

I added in a pylint ignore for you and these patches are clean now.

--js


