Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C716430EF3D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:10:16 +0100 (CET)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aeV-00048m-TQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7add-0003aI-Pj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7adb-0002gg-Jc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612429758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMWpVk3aYmovOv5BRUp7PSXHyR+f7dVyRZWmCWElF5g=;
 b=PDJtEt81ovhWUJj+zdrAaUaDB7RceAu1XlDQbmxUeLJ4pflQWqU/K4nKGXgxyZHPNlWZi0
 +WFmqd02+bAxweQ1AhtnkL9eNzzy0aIDxx1lI8/sbEMobID0d01dz2rtRiGh5kmnz6Pxop
 ct9geGHUnYtzsvAeZPoPz+h2Z2lRpTo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-cdszzDLjP1Oo8VUhD_uAGQ-1; Thu, 04 Feb 2021 04:09:15 -0500
X-MC-Unique: cdszzDLjP1Oo8VUhD_uAGQ-1
Received: by mail-wm1-f69.google.com with SMTP id y138so1430788wmd.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WMWpVk3aYmovOv5BRUp7PSXHyR+f7dVyRZWmCWElF5g=;
 b=mSHqq0njseZKfaV5ph0cZUgnZ3z6oZbWoco0ZDIsP1aArMlxGyh7PALMgpcFxF7A5K
 R3VoRyBTDHuByS5S6CjkQ6zFXf+PSzX+CWK7/qQ4gOejat+AZkK8kM01nr8+GN6oxRQC
 q1w9+oOhHIS5xuYn8MoIwThwIAWbsgB1tTnTgxtuBCmr74/PwUUDKHyTV4hUAQxGTfI6
 QI5OvPPS7pm1wgnqccCTQRM78rTyCFt3yiBaUWIQYPD8wjh8E+6vtOZdMCRUPcVMVb3w
 dUUIIfpuweZHkG+A3cTtqrf2DACkr6EJZIsyI+H6Zjr/vbIwReRotk4kYtjuIyGfhThU
 CpAg==
X-Gm-Message-State: AOAM532dU6z8nK8exm2cAi1QnKLi/K69OYMIxGiDYWHxgC6ljDq9iWOk
 sU7P+k217/eHfzoyDn8Jjs0GEVzctnagsGZJJsMVCCGbpdIjn1q1wR92FAdugb8vYvcowa6cK7z
 sjJxM1bHBD+tBQC8=
X-Received: by 2002:adf:f182:: with SMTP id h2mr8120771wro.355.1612429753922; 
 Thu, 04 Feb 2021 01:09:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/MKUQsH2gkVfA8ioNvD5UHqHJu3mWS6SbOP4gtJGwsrHMYAYH2467vS3hOG83CFttN8po/A==
X-Received: by 2002:adf:f182:: with SMTP id h2mr8120733wro.355.1612429753612; 
 Thu, 04 Feb 2021 01:09:13 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id s4sm6816041wrt.85.2021.02.04.01.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 01:09:12 -0800 (PST)
Subject: Re: [PATCH 09/12] qemu-options: Replace the word 'blacklist'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-10-philmd@redhat.com>
 <20210203102558.GK300990@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <562ca6ca-3562-8465-5bda-cc69ac4ae340@redhat.com>
Date: Thu, 4 Feb 2021 10:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203102558.GK300990@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 11:25 AM, Daniel P. Berrangé wrote:
> On Tue, Feb 02, 2021 at 09:58:21PM +0100, Philippe Mathieu-Daudé wrote:
>> Follow the inclusive terminology from the "Conscious Language in your
>> Open Source Projects" guidelines [*] and replace the word "blacklist"
>> appropriately.
>>
>> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  qemu-options.hx | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index d0410f05125..75997ee2ea6 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4275,11 +4275,11 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
>>      "                    by the kernel, but typically no longer used by modern\n" \
>>      "                    C library implementations.\n" \
>>      "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
>> -    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
>> +    "                    its privileges by denylisting all set*uid|gid system calls.\n" \
> 
> The original description is a bit wierd in how it reads/explains it, so
> I think it needs bigger changes:
> 
>     "                use 'elevateprivileges' to allow or deny the QEMU process ability
>     "                to elevate privileges using set*uid|gid system calls.\n" \
> 
>>      "                    The value 'children' will deny set*uid|gid system calls for\n" \
>>      "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
>>      "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
>> -    "                     blacklisting *fork and execve\n" \
>> +    "                     denylisting *fork and execve\n" \
> 
> denylisting is a very strange term to use - its not really a word IMHO.
> Better as
> 
>     "                     preventing *fork and execve\n" \
> 
> or
> 
>     "                     blocking *fork and execve\n" \

While 'preventing' sounds nicer, 'blocking' is simpler to understand
from a technical English speaker, so I took your 2nd suggestion, thanks.


