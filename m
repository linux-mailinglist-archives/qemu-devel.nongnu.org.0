Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA932841C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:30:44 +0100 (CET)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlRT-0003wg-BZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGlQ3-0002d0-Ux
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGlQ2-0000ha-Cl
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614616153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4mxF17IM2/EegLQb8qJBhH5x8BCrvUOToNGOKn4xvg=;
 b=OX21yyA1CjhGxB5L7sCjRItFJHa3wLpfPHMRkApnxGbVWI/f44lgT0ZJ76Pc38r9Bc/qpp
 j2LTH7ZxEamegIVtB7V/2ZkD6ouC1++uhtc1MPPebbFCEX+edrDaCBeSWRPwP1lwwU7ys2
 vjreO3CAd/vlF3A3GC6B5RfHuWB2FQI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-1R9OPbONNue8qLXNIW-ySA-1; Mon, 01 Mar 2021 11:29:11 -0500
X-MC-Unique: 1R9OPbONNue8qLXNIW-ySA-1
Received: by mail-wr1-f72.google.com with SMTP id g2so2824244wrx.20
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d4mxF17IM2/EegLQb8qJBhH5x8BCrvUOToNGOKn4xvg=;
 b=Crlqgi/LJY9Dn6rNKqQ/Ejcc/S6lqNAgQxWiD7bHHmaV8FxLxrZDQf2V5ivn1fXGJz
 kW3DEMWZptqm3VLxErPprpH3k/JB7IvvniPQukyZAT9q0jXA9wt5plZSbJXs9bVIbrKS
 a02MdnuNNYqiGehwDknlxOH8Tve5Y8yE+pckWJdFTjUdBRZNsEi4e9vvmyDlft1EqbIm
 tqHF26U4ZXZzctMjQL71QrSUHZFL2bGC11NxlJCFmsr1tRW3qG2s/7TRANhh9JoRFV5Z
 4+WSYuO4gMTa9TwAVb5EDkrcVg1sgwB3F1vBimKockOT9SBJfrBZqKqFyk3bqGk2igJS
 Vm2g==
X-Gm-Message-State: AOAM530up8px4FLobYhMLC+B5UQRTmRHHTQsQWMHRaWMbeBEjqo+2UNx
 ADsrfMekatoCF6bABnnP5vVi1Y0xyFjGFn8AY4lbKqlLKuCnd3/mBtSkDzr+qndLYPi5KyCMoJ5
 R1q8U5vu0cTheHRg=
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr16529144wmk.27.1614616150718; 
 Mon, 01 Mar 2021 08:29:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHEpTwiziTwswU6w2yo+CqgyN9LMcMWb+F9cfD8PR/1QvEvfEgCpuYFebKjWpXAyqaaLCYuw==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr16529129wmk.27.1614616150559; 
 Mon, 01 Mar 2021 08:29:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p18sm16741384wro.18.2021.03.01.08.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 08:29:09 -0800 (PST)
Subject: Re: [PATCH v2 1/2] storage-daemon: report unexpected arguments on the
 fly
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210301152844.291799-1-pbonzini@redhat.com>
 <20210301152844.291799-2-pbonzini@redhat.com>
 <b7b29e6a-4fe6-ab6a-87d9-e2e794b2b5d0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <23373c2e-e6f1-cbff-ffa7-b79cf6d2b97d@redhat.com>
Date: Mon, 1 Mar 2021 17:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b7b29e6a-4fe6-ab6a-87d9-e2e794b2b5d0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 16:38, Eric Blake wrote:
> On 3/1/21 9:28 AM, Paolo Bonzini wrote:
>> If the first character of optstring is '-', then each nonoption argv
>> element is handled as if it were the argument of an option with character
>> code 1.  This removes the reordering of the argv array, and enables usage
>> of loc_set_cmdline to provide better error messages.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   storage-daemon/qemu-storage-daemon.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> Nice.  The man page for 'getopt_long' is unclear whether setting
> POSIXLY_CORRECT in the environment would break this

It doesn't.  In fact, with this patch the behavior is the same as for 
POSIXLY_CORRECT, though for unrelated reasons, and interestingly enough 
I think the POSIXLY_CORRECT behavior is an improvement for 
qemu-storage-daemon.

Unpatched:

$ qemu-storage-daemon foo --object iothread
qemu-storage-daemon: Parameter 'id' is missing

$ POSIXLY_CORRECT=1 qemu-storage-daemon foo --object iothread
qemu-storage-daemon: Unexpected argument: foo

Patched:

$ storage-daemon/qemu-storage-daemon foo --object iothread
qemu-storage-daemon: foo: Unexpected argument
$ POSIXLY_CORRECT=1 storage-daemon/qemu-storage-daemon foo --object iothread
qemu-storage-daemon: foo: Unexpected argument

Paolo


