Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6F381038
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:03:18 +0200 (CEST)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhd5h-0007EY-SS
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhd3G-0005kM-NY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhd3C-0004hH-SS
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621018841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqFwIEcfZdDazX6s5ygyB/93uW9I7SxJaCi7b1MQr/4=;
 b=jV6tpn3rH32S4wpbScSJ8XRBbr2zeTqu+cykDFyH7H8gK7V7VTYS5JgKS04IM3d4gQ1tS4
 GOv/aBtRi3tnIlUEMwKvKBhDlFxEwanZpjrSAtmnJmaRQF9LLTrSK3vkE0xON2a2auG/RC
 +ScW1XZWCmQCzYf76x92RWsm0/2jUBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-IrECz6PONc2_cDYk4yn8tQ-1; Fri, 14 May 2021 15:00:37 -0400
X-MC-Unique: IrECz6PONc2_cDYk4yn8tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20209101371D;
 Fri, 14 May 2021 19:00:37 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA2A45D9CD;
 Fri, 14 May 2021 19:00:33 +0000 (UTC)
Subject: Re: [PATCH 03/10] python/machine: use subprocess.run instead of
 subprocess.Popen
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <20210512214642.2803189-4-jsnow@redhat.com>
 <03a2e3c2-d5e6-de83-dc44-b9c9a4e4923f@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ec301577-1f44-4ab2-ee12-bd5fc636d010@redhat.com>
Date: Fri, 14 May 2021 15:00:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03a2e3c2-d5e6-de83-dc44-b9c9a4e4923f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 10:08 AM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 5/12/21 6:46 PM, John Snow wrote:
>> use run() instead of Popen() -- to assert to pylint that we are not
>> forgetting to close a long-running program.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/qemu/machine.py | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index 41f51bd27d0..c13ff9b32bf 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -223,13 +223,16 @@ def send_fd_scm(self, fd: Optional[int] = None,
>>               assert fd is not None
>>               fd_param.append(str(fd))
>> -        proc = subprocess.Popen(
>> -            fd_param, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
>> -            stderr=subprocess.STDOUT, close_fds=False
>> +        proc = subprocess.run(
>> +            fd_param,
>> +            stdin=subprocess.DEVNULL,
>> +            stdout=subprocess.PIPE,
>> +            stderr=subprocess.STDOUT,
>> +            check=True,
>> +            close_fds=False,
>>           )
> 
> Now it might throw a CalledProcessError given that `check=True`. 
> Shouldn't it capture the exception and (possible) re-throw as an 
> QEMUMachineError?
> 
> - Wainer
> 

I suppose I ought to so that it matches the other errors of this method, 
yes.

Setting it to false and checking manually may be less code, but yeah. 
I'll change this.

Thanks!


