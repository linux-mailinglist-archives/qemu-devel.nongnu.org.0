Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F32831C3FB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:21:02 +0100 (CET)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmEm-0007eN-RB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBmDy-0007AZ-5F
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBmDu-0005QP-GB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613427605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aILAuIKAyAK1eXzgAGG7oagN1Hfn97pwCMCEvxv1DDo=;
 b=aT9JHS+iu/6K0dSifRanzpDVhSIjX+2ryT/54nJ/5Bd6FeRCyn6Ufrym1vh83oYKa71dxA
 b2IgfJJSIKi7l4UigccRMc0pbPCaW3gRb1IQ/SUyU4ET250jth7Zkuqsx8Ol5ix9bblTCE
 6UxgYThSx08D/tmA+iW5xGhJ0UX52Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-yHEBpnjJPI601dfU0O-KJw-1; Mon, 15 Feb 2021 17:20:02 -0500
X-MC-Unique: yHEBpnjJPI601dfU0O-KJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AABB80196C;
 Mon, 15 Feb 2021 22:20:01 +0000 (UTC)
Received: from [10.3.112.50] (ovpn-112-50.phx2.redhat.com [10.3.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B9015D9CC;
 Mon, 15 Feb 2021 22:19:56 +0000 (UTC)
Subject: Re: [PATCH 1/6] Python: close the log file kept by QEMUMachine before
 reading it
To: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-2-crosa@redhat.com>
 <a6356c56-8652-e810-0f04-b0658912e8f6@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7e7a39b0-2bf5-a623-852c-a11de470c716@redhat.com>
Date: Mon, 15 Feb 2021 16:19:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a6356c56-8652-e810-0f04-b0658912e8f6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 4:04 PM, John Snow wrote:
> On 2/11/21 5:01 PM, Cleber Rosa wrote:
>> Closing a file that is open for writing, and then reading from it
>> sounds like a better idea than the opposite, given that the content
>> will be flushed.
>>
>> Reference: https://docs.python.org/3/library/io.html#io.IOBase.close
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   python/qemu/machine.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index 7a40f4604b..6e44bda337 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -337,12 +337,12 @@ class QEMUMachine:
> 
> Is there a way to improve context for python functions? What method is
> this in? etc.

'man gitattributes' suggests that having this line in .gitattributes
would help:
*.py diff=python

/me goes to play with it...

Does this look better to you?  It certainly does to me!  I'll go ahead
and propose the .gitattributes change as a formal patch...

 --- a/python/qemu/machine.py
 +++ b/python/qemu/machine.py
-@@ -337,12 +337,12 @@ class QEMUMachine:
+@@ -337,12 +337,12 @@ def _post_shutdown(self) -> None:
              self._qmp.close()

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


