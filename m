Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223B30AC8E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:29:32 +0100 (CET)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c4w-00054i-RY
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6c38-0003f1-Rj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6c34-0000J6-2u
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612196851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdpZ3t5q6mE9anJAJoSI3jGz/yiWJQ1PkRqyFXk4ug8=;
 b=cy6hD+dbAdop2fuXYftTaciw7EBh00xk7F9JN16R+Id6bqu/9s364Q2n1zasCLiPkn6lsK
 PWDE+UZmG2fN2Ar6Jc76OLfO1k/FkpAjcLwj9/w0iLrIAMk9KI8mIcZiq7zRwTmp4kEXb0
 pH0k8HEbnndWPoHJWL/m8RQ4qY+zaaM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-7lQEYBKkPLyVl_d5muwMIw-1; Mon, 01 Feb 2021 11:27:30 -0500
X-MC-Unique: 7lQEYBKkPLyVl_d5muwMIw-1
Received: by mail-ed1-f71.google.com with SMTP id i4so2172310edt.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 08:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdpZ3t5q6mE9anJAJoSI3jGz/yiWJQ1PkRqyFXk4ug8=;
 b=gVjaOZduLZJvNwkKM7iX0FQ0spH8e3wZHqBwG708T4SB1qLVBB+P4x/YXoEHydTD/Z
 AI29M60azCxJEu2/G882+aDhRpqg42DqVr12lTuTL7SwjNtwiq68zxdHWAg8MeUNSOyu
 bm56RBet9dqfz25dlXMNDn9wna+D9Xf3uj9YjDHSe3mAUFsH0FmfZx744TL0EDR9tGKA
 hpFvRZeOmp5goOv7ZbPdme685BLE6d4zKvW0QxWfH2cI969LQ7OYu21dM5FdoFslyK5h
 VUX16hlTuj3oCG2Xi65b96U7i+pMXZRkSIZbAT34bvg15k5SyDCKyoAAI4KJxrISV7dU
 gW+A==
X-Gm-Message-State: AOAM530ByhqcvDMLU7aAKz6hQ9ucSjOHamTr89BXZbubYDtjOqtbfFYG
 AWjdggE+h9peKVx86/MtsGOoTvzTxXSiyJ4GNPeqyXP8BfPWvdk4LsOdgyVNEHRX4dtTl0qko+W
 ksVdCRozem1WskS4=
X-Received: by 2002:a05:6402:1a56:: with SMTP id
 bf22mr19937921edb.284.1612196848984; 
 Mon, 01 Feb 2021 08:27:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2Wd04KggGFmxp17oaw0GVfaQI8A5yMZej+7x0xPzROL/F+DQKoTWz2FqzoUvRImO3FDnp1g==
X-Received: by 2002:a05:6402:1a56:: with SMTP id
 bf22mr19937885edb.284.1612196848609; 
 Mon, 01 Feb 2021 08:27:28 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u17sm869956ejr.59.2021.02.01.08.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 08:27:27 -0800 (PST)
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
To: Kevin Wolf <kwolf@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2404d67a-bf48-7f14-0712-f5c71787615c@redhat.com>
Date: Mon, 1 Feb 2021 17:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201161352.GH13157@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 5:13 PM, Kevin Wolf wrote:
> Am 01.02.2021 um 17:05 hat BALATON Zoltan geschrieben:
>> On Mon, 1 Feb 2021, Stefan Hajnoczi wrote:
>>> It is possible to repeat the --trace option to specify multiple
>>> patterns. This may be preferrable to users who do not want to create a
>>> file with a list of patterns.
>>>
>>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Message-id: 20210112165859.225534-2-stefanha@redhat.com
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> docs/devel/tracing.rst | 9 +++++++--
>>> 1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
>>> index af395e957d..e8f9b82c5e 100644
>>> --- a/docs/devel/tracing.rst
>>> +++ b/docs/devel/tracing.rst
>>> @@ -22,10 +22,15 @@ events::
>>> This output comes from the "log" trace backend that is enabled by default when
>>> ``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
>>>
>>> -More than one trace event pattern can be specified by providing a file
>>> -instead::
>>> +Multiple patterns can be specified by repeating the ``--trace`` option::
>>> +
>>> +    $ qemu --trace "kvm_*" --trace "virtio_*" ...
>>
>> Does that actually work? I've always used -trace enable="pattern1" -trace
>> enable="pattern2" Not sure if omitting enable= is the same.
> 
> qemu_trace_opts has .implied_opt_name = "enable", so without having
> tested it, I assume this works.

I use -trace \*pci\* -trace memory\*, and Kevin said -trace and --trace
are the same.


