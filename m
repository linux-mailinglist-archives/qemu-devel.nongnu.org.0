Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACFB3917D9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:49:33 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsya-0001Df-5q
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1llsxN-0000N9-Fc
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1llsxK-0003vo-Ob
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622033292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CL4tK7Uix87XNcmC+w+rjEBvjZAm/Wtofscb5nLl+E=;
 b=XRkx/oxBLE93lFnIRSM6Dq+5lGkexi0ufuETsd4/DyvQofhixCkZsJhr9Nngh2lr/rVb6G
 KItS0RU9QdLX2/nD0eh5NVnH3lOYRfZBI0ULcTUOwZ8MlUiU/Qg/JTgLmPt23lqKD4M0Xz
 G9RYljAqzjzzV9aHtm5KzjYdj0foQ48=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-uYoCV-RaP260eyB8TKgqMQ-1; Wed, 26 May 2021 08:48:10 -0400
X-MC-Unique: uYoCV-RaP260eyB8TKgqMQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so526392edc.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4CL4tK7Uix87XNcmC+w+rjEBvjZAm/Wtofscb5nLl+E=;
 b=sNlD2Krn6RNm8Y+6kg4hFx47Sw+me2UtI/ZIDEx3oGZ55bw9V/l9dGXo1lvgFfBfD6
 XQIF9BnKjB2w6uFekleE+phCkPRWKIUDYUOJ+BEVM0y82yTFGyMjoutJnsIH7W8+YIaN
 UVeVSqtDBz7cvPQRkYSCuqCO2eHSpisNyAJj9MasAZQzzY7l/4jHrweuIfQ8GmhYm+XR
 2EwA+my3f+AKXR95dDjXrkdmfYmhK0txozEIRAiS8pwHMQRglycvauX86zIPJ/l5GW1F
 4s0zw/fSg4pXC+qz71XMiRbKjAdo8Uwx61hvH29zXJ/B3yEk/wHDKZwOM8TkqNAHeI0V
 iLpw==
X-Gm-Message-State: AOAM533rfvcPjTglJscC5AjU+H2JCc+Dyzze01bIGnyxYxmJAQsxMlRW
 Zay3JbuvqwAp9R9RinLC/3NNCZnhjUm5pUNX338VMkm7sHcfXgym8tlyRBhf/b/K4BrJgut2mAo
 JVbwyXx4F4P9D4pY=
X-Received: by 2002:aa7:d94f:: with SMTP id l15mr38910381eds.235.1622033289132; 
 Wed, 26 May 2021 05:48:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2wNFSFQIqq69NAyvrNEkCVtYhoPqtBwfn03gU3SvmG3XaUQEluit1WOjPT2blJN4LBqX7wg==
X-Received: by 2002:aa7:d94f:: with SMTP id l15mr38910362eds.235.1622033288952; 
 Wed, 26 May 2021 05:48:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q18sm12202172edd.3.2021.05.26.05.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 05:48:07 -0700 (PDT)
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
 <becc0bde-5de8-7cd3-0b5e-76bdb830af11@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e0162706-db5f-0f1e-2c65-5291fca26eab@redhat.com>
Date: Wed, 26 May 2021 14:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <becc0bde-5de8-7cd3-0b5e-76bdb830af11@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/21 13:24, Vladimir Sementsov-Ogievskiy wrote:
> 
>> Define -gdb flag and GDB_OPTIONS environment variable
> 
> Let's use --option notation for new long options

Why make a mix of two styles? -- suggests that single-character options 
like -d and -v can be combined, is that the case?

>> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
>> environment variable.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   tests/qemu-iotests/check      |  6 +++++-
>>   tests/qemu-iotests/iotests.py |  5 +++++
>>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>>   3 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index d1c87ceaf1..b9820fdaaf 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check
>> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>>                      help='pretty print output for make check')
>>       p.add_argument('-d', dest='debug', action='store_true', 
>> help='debug')
>> +    p.add_argument('-gdb', action='store_true',
>> +                   help="start gdbserver with $GDB_OPTIONS options \
>> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")
> 
> Hmm.. Why not just make --gdb a string option, that defaults to 
> GDB_OPTIONS? This way it will more similar with other options.

I think then something like "./check -gdb 030" would not work, right?

Paolo


