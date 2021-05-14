Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BB381048
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:06:51 +0200 (CEST)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhd98-0003Rw-1J
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhd6Z-0000kE-Mw
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhd6X-0006Kk-0c
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621019045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK4Wh+uYnF6o3hyoetGY8K6JNLZ6UFzp3T404hS+7Ck=;
 b=J0rYso/v0Mok07DuRKTJXeSQU1trj75xH5rD0KOfBe9v9HAIN58VzG9H9gGm20gBludjE6
 4aLF69TU0wCNstMHQ5hJj5BR0FDXt0w0mSJpL+3us24v9LBjCVRpYrHwZ0mLZ7vjbp7prG
 a6lrj+Y4K/cIFvWGMDNHxp28+e8bTtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-SOxGIAMbNQSzd7iD7KQXpg-1; Fri, 14 May 2021 15:04:03 -0400
X-MC-Unique: SOxGIAMbNQSzd7iD7KQXpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EB5980DDEF;
 Fri, 14 May 2021 19:04:02 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 585A760CC6;
 Fri, 14 May 2021 19:03:58 +0000 (UTC)
Subject: Re: [PATCH 05/10] python/machine: Disable pylint warning for open()
 in _pre_launch
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <20210512214642.2803189-6-jsnow@redhat.com>
 <bdd7152d-5000-94a6-689c-2e527d3f5166@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <88a384db-2163-d549-a745-68a437b72962@redhat.com>
Date: Fri, 14 May 2021 15:03:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bdd7152d-5000-94a6-689c-2e527d3f5166@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 10:42 AM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 5/12/21 6:46 PM, John Snow wrote:
>> Shift the open() call later so that the pylint pragma applies *only* to
>> that one open() call. Add a note that suggests why this is safe: the
>> resource is unconditionally cleaned up in _post_shutdown().
> 
> 
> You can also put it in a pylint disable/enable block. E.g.:
> 
>      # pylint: disable=consider-using-with
> 
>      self._qemu_log_file = open(self._qemu_log_path, 'wb')
> 
>      # pylint: enable=consider-using-with
> 
> However I don't know if this is bad practice. :)
> 

I learned a new trick!

> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> 

Thanks. In this case I will probably leave this alone unless someone 
else voices a strong opinion. I figure the comment protects us against 
future oopses well enough.

>>
>> _post_shutdown is called after failed launches (see launch()), and
>> unconditionally after every call to shutdown(), and therefore also on
>> __exit__.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/qemu/machine.py | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index c13ff9b32bf..8f86303b48f 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -308,7 +308,6 @@ def _pre_launch(self) -> None:
>>           self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
>>                                             dir=self._test_dir)
>>           self._qemu_log_path = os.path.join(self._temp_dir, 
>> self._name + ".log")
>> -        self._qemu_log_file = open(self._qemu_log_path, 'wb')
>>           if self._console_set:
>>               self._remove_files.append(self._console_address)
>> @@ -323,6 +322,11 @@ def _pre_launch(self) -> None:
>>                   nickname=self._name
>>               )
>> +        # NOTE: Make sure any opened resources are *definitely* freed in
>> +        # _post_shutdown()!
>> +        # pylint: disable=consider-using-with
>> +        self._qemu_log_file = open(self._qemu_log_path, 'wb')
>> +
>>       def _post_launch(self) -> None:
>>           if self._qmp_connection:
>>               self._qmp.accept()


