Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4BA35A38E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:40:33 +0200 (CEST)
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuBM-0001ie-N7
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUu8a-0000Hm-04
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUu8Y-0002mH-36
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617986257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmZerw2TVxa2UUw04bsdzjjiQv2ZnX+bZ6FJkkyF9Fc=;
 b=WSaPkui9x/FD3ZAY8HukZa/A6btXUZhXGLFhKnW27lkBlpH5H2m9YEZxqho2rnA3dTYbua
 EafP8CuSrd06ME4lhs5dJ7bD/WwZ74mKgZJFqVY0FB5O8ItYGLpRXRLPxFEGDR3iMBJR1J
 9JiB8lMnTxXXgBSww2/heFPS8SNDyz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-H0PwuAzuN3erPD-ura-g8Q-1; Fri, 09 Apr 2021 12:37:33 -0400
X-MC-Unique: H0PwuAzuN3erPD-ura-g8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 440A1107ACCD;
 Fri,  9 Apr 2021 16:37:32 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7177610074F1;
 Fri,  9 Apr 2021 16:37:31 +0000 (UTC)
Subject: Re: [RFC PATCH v2 02/11] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-3-eesposit@redhat.com>
 <4d920857-c398-3527-d71e-1f0f79be9034@redhat.com>
 <4a63b9bd-0716-b059-2ef0-a51e6e3d2328@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <95ddd1b4-4af4-d134-c419-34bf188d519b@redhat.com>
Date: Fri, 9 Apr 2021 12:37:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4a63b9bd-0716-b059-2ef0-a51e6e3d2328@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 12:07 PM, Emanuele Giuseppe Esposito wrote:
> 
>>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>>> index c721e07d63..18d32ebe45 100644
>>> --- a/python/qemu/machine.py
>>> +++ b/python/qemu/machine.py
>>> @@ -109,7 +109,7 @@ def __init__(self,
>>>           self._binary = binary
>>>           self._args = list(args)
>>> -        self._wrapper = wrapper
>>> +        self._wrapper = list(wrapper)
>>>
>>
>> Unrelated change?
>>
>> (I'm assuming you want to copy the user's input to explicitly avoid 
>> sharing state. Commit message blurb for this would be good.)
> 
> Yes, unrelated change. I do not see the benefit of copying the user 
> state. I will drop it.
> 
>>>
>>
>> ACK
> 
> (Apologies for the ignorance, is this an Acked-by?)
> 
> Emanuele
> 

Ah, yes. I just mean to say: "Minor style stuff, but looks good to me 
and I'll [likely] approve the non-RFC versions of these."

(Pending tests passing via flake8/pylint/mypy. Sorry those aren't 
formalized in the tree yet.)

--js


