Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711BB307DCC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:22:03 +0100 (CET)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Bvd-0004Ol-QK
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l5Bsx-0002sk-Au
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:19:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l5Bsq-00055J-QZ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611857947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUi5r1hQyO+E8m5RsW0OGiVLbq8c6BMJ5A2fCKaDgZA=;
 b=as9wTsHRKYr1KmxcRX+FmgZKPMDw2qCjyvOCRaifPaOwpxULkasLd+zXtc2IdTPukQ0+dX
 GSPhfr6d3/0kTrWXUOXXVvZTvAYchVOuw85yzRw7CrF737Tg+xfTxJNa63KLIbeGuq27xD
 gbyKqwcHlhIe5Q2jUa1MMHwczig6qy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-FOwZUd6fPEiPLUTEomHBwg-1; Thu, 28 Jan 2021 13:19:05 -0500
X-MC-Unique: FOwZUd6fPEiPLUTEomHBwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789A51800D41
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 18:19:04 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ACA3100239F;
 Thu, 28 Jan 2021 18:19:00 +0000 (UTC)
Subject: Re: [PATCH] migration/qemu-file: Fix maybe uninitialized on
 qemu_get_buffer_in_place()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210128130625.569900-1-wainersm@redhat.com>
 <20210128171619.GF2951@work-vm>
 <b8f47501-0272-af87-8bb2-9074cdc1b51b@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <26ed58ff-3399-7cc1-f075-401eb28b0f89@redhat.com>
Date: Thu, 28 Jan 2021 15:18:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b8f47501-0272-af87-8bb2-9074cdc1b51b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/28/21 3:07 PM, Philippe Mathieu-Daudé wrote:
> On 1/28/21 6:16 PM, Dr. David Alan Gilbert wrote:
>> * Wainer dos Santos Moschetta (wainersm@redhat.com) wrote:
>>> Fixed error when compiling migration/qemu-file.c with -Werror=maybe-uninitialized
>>> as shown here:
>>>
>>> ../migration/qemu-file.c: In function 'qemu_get_buffer_in_place':
>>> ../migration/qemu-file.c:604:18: error: 'src' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>    604 |             *buf = src;
>>>        |             ~~~~~^~~~~
>>> cc1: all warnings being treated as errors
>>>
>>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Yes, I think I had a discussion with someone about this recently but
>> can't find it;
> Maybe with Thomas, he reported that 2 years ago when building with -O3:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg599522.html


I saw that error when compiling QEMU with -O3 as well.


>
>> the compiler is technically correct, but the only time
>> it's unitialised is the case where it's result doesn't matter.
>>
>> Still, to shut the compiler up:
>>
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Thanks David!


>>
>>> ---
>>> Passed on CI: https://gitlab.com/wainersm/qemu/-/pipelines/247801576
>>>
>>>   migration/qemu-file.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>>> index be21518c57..d6e03dbc0e 100644
>>> --- a/migration/qemu-file.c
>>> +++ b/migration/qemu-file.c
>>> @@ -595,7 +595,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
>>>   {
>>>       if (size < IO_BUF_SIZE) {
>>>           size_t res;
>>> -        uint8_t *src;
>>> +        uint8_t *src = NULL;
>>>   
>>>           res = qemu_peek_buffer(f, &src, size, 0);
>>>   
>>> -- 
>>> 2.28.0
>>>


