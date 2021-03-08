Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E833167F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:47:47 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKuw-0003Bj-Nw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJK0I-0000De-JB
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJK0A-0005D7-S1
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615225745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9UCNGaouCffr+IFjbGZkFpkEJ4aC5u+JGbZe7VOaKU=;
 b=fb6AwmKv9FrO5/UPq2oMvJCROjiHimeTXWzHNXIq1UScEfXLtu59Wib5dSTr1DcsrhbXoc
 q/geE4rVdcz6ok/UDHmV/7qTyyTqHE91Sun/2bIB4+2L4DRsWfsoOLgFdYI6lSDbzwunyE
 edwqi0FLgHbE3KdSYDKX15iV1/Ycqhg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-sNmhtnSeOgiUIVQ28-zMIw-1; Mon, 08 Mar 2021 12:49:01 -0500
X-MC-Unique: sNmhtnSeOgiUIVQ28-zMIw-1
Received: by mail-ej1-f71.google.com with SMTP id r26so4421637eja.22
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9UCNGaouCffr+IFjbGZkFpkEJ4aC5u+JGbZe7VOaKU=;
 b=Fwxyi3WBf5plL4+t4um2POjWQjGWfdkFi2BAJ0w29JvTeXaiAWFOPVaKofnWbCYMp1
 J00uf5x5ZxITv4nNboB2hfyxINr6p/nRD/JBIv/vzIYqokS8y/KFptl1gfyGXk2ULYV+
 e86iIkXa2k3ZVbZL5w9xp9CkJgRqbd8Ee7ZRM/UchU0hRIFrOMwhCiqaYVKUT/W6r9RZ
 Regtt9NKSy3x/99cOnQmfo0sNw6explApnaDrK0cbuZnodkBh3B5OSawJhHq/n0qFvpM
 47++8GbYCIgg2QUGIGgC9VszfIQra4FjU2ekGWglcmhsYdRmGHNqhmSNSe0dRe7w1gCo
 JUmQ==
X-Gm-Message-State: AOAM5324VOtDZHT5ynYY28mMz//MFW6aQ+Mkjz7xk8SbadWmAbfvGIPC
 KmTRcMDsc+XczKGJiWUbImWGC7FRjmbi/JHt8vSRcM4Lk6hOZ+aX73jb53v8YGKs99IWj1mCo5/
 d5ozec3zX65DgBuk=
X-Received: by 2002:aa7:c345:: with SMTP id j5mr22769562edr.338.1615225740450; 
 Mon, 08 Mar 2021 09:49:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGy2Y6xWPUQu5QKDb5h1x4XR+NHI6MHzmYFOD0ub8r9Qqze7CNeDEGvwG5FTITpG2jBjYqIw==
X-Received: by 2002:aa7:c345:: with SMTP id j5mr22769548edr.338.1615225740299; 
 Mon, 08 Mar 2021 09:49:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k18sm3092305ejo.91.2021.03.08.09.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 09:48:59 -0800 (PST)
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
To: Stefan Hajnoczi <stefanha@redhat.com>, Claudio Fontana <cfontana@suse.de>
References: <20210224213515.3331631-1-philmd@redhat.com>
 <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
Date: Mon, 8 Mar 2021 18:48:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 5:46 PM, Stefan Hajnoczi wrote:
> On Wed, Feb 24, 2021 at 10:35:15PM +0100, Philippe Mathieu-Daudé wrote:
>> We don't need to generate trace files for targets we
>> are not building. Restrict the the ones selected.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 05a67c20d93..8503aa1b628 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1826,16 +1826,16 @@
>>    trace_events_subdirs += [
>>      'accel/tcg',
>>      'hw/core',
>> -    'target/arm',
>> -    'target/hppa',
>> -    'target/i386',
>>      'target/i386/kvm',
> 
> Please add a comment explaining why an exception is needed here and the
> rest of the target directories are handled by the loop below when you
> send a non-RFC patch.

Better would be a recursive function that adds the directory if
necessary. But I'm happy adding a simple comment =)

> 
> That will help people who add sub-directories in the future.

Yes. Anyhow I expect this to clash with Claudio's work in progress
(which split target/ and add multiple subdirectories).


