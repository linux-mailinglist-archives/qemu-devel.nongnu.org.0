Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542D406E1E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:23:04 +0200 (CEST)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiMp-0000UC-NO
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOiLW-00085B-A5
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOiLU-00050t-ID
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631287299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5pp9hpJrrABHaOW5cf7nNDfqfhU3Z1vMzmfHbu8Nt4=;
 b=Ec7w1HHHclotf9leoe2b3X+BpXYdF7wE1mstJ89+Xxj946DEev4shdEV+oPYbQz9v4AzIQ
 TeqxySrUE2Iu7SzlBzSeem0AqktPsoJQe0evbsqK0TW6jOi3+peHqvxhH2c3H8+nPz74sS
 yg0BECVOwrRV9rnorxKVLXxeQihppsA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-a7p1sUedOeyGYqtFUB9Skw-1; Fri, 10 Sep 2021 11:21:36 -0400
X-MC-Unique: a7p1sUedOeyGYqtFUB9Skw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so974743wmc.9
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v5pp9hpJrrABHaOW5cf7nNDfqfhU3Z1vMzmfHbu8Nt4=;
 b=gEPRFwgP+kXFa7mRfaGsuRslB3z8tDkAQ2EKsCp6p1BA3C4Wvc52t2gFHAAnYgzfCN
 LK5UTwQZEMXbNTW+vlmji7GaxzoMKh/9lNVpt8sRTS37VmVyIoV17DjW2UhvYbs0wT/3
 NVKToPcNx9U13KILUznLwxODWgvKg33hIvAP0nl5fBq0M1PkelLW3TuIQi1iYuwQhkXP
 mhCp1EZeJIxvBaHDyb8cAb1l4EN7rRX85Lvh6emOlNRP5RE8fmcwBykcAlDxZYxw5k5h
 vzALC/WfLLfIroIR1IfxxQmWYu/NA5nWFXCKRoVQOZfLOYLXHZOtoVxxQGmhfKB2a+rt
 8zgw==
X-Gm-Message-State: AOAM532UDqRv1R1T9VhhB6VTwmvRf/iY/WzJpektg+kJ72gmt/R5tXst
 seexHxFQawttpU6ovj1FjAu4u/busElEchkCjMWF0cfgZ6mfSEnIeNWjGfCHELfcPJZxPkCZxGN
 kEbrbwFEQ7etqxKY=
X-Received: by 2002:a1c:234a:: with SMTP id j71mr8887243wmj.11.1631287295274; 
 Fri, 10 Sep 2021 08:21:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoxrn3IbUQVJoaXn/k2daW7OqK0p0E/Zj+Ajk8ZXnLaugpXIIWuaD5P4BnQupThfkWwg9DhA==
X-Received: by 2002:a1c:234a:: with SMTP id j71mr8887232wmj.11.1631287295120; 
 Fri, 10 Sep 2021 08:21:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t126sm927467wma.4.2021.09.10.08.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:21:34 -0700 (PDT)
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
 <YTirnLv70qtYZPkg@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <20df9a4e-cd9e-0524-1681-a84cf52cc513@redhat.com>
Date: Fri, 10 Sep 2021 17:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTirnLv70qtYZPkg@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 2:25 PM, Stefan Hajnoczi wrote:
> On Fri, Aug 27, 2021 at 01:53:20PM -0400, Jagannathan Raman wrote:

>> diff --git a/.gitmodules b/.gitmodules
>> index 08b1b48..cfeea7c 100644
>> --- a/.gitmodules
>> +++ b/.gitmodules
>> @@ -64,3 +64,6 @@
>>  [submodule "roms/vbootrom"]
>>  	path = roms/vbootrom
>>  	url = https://gitlab.com/qemu-project/vbootrom.git
>> +[submodule "subprojects/libvfio-user"]
>> +	path = subprojects/libvfio-user
>> +	url = https://github.com/nutanix/libvfio-user.git
> 
> Once this is merged I'll set up a
> gitlab.com/qemu-project/libvfio-user.git mirror. This ensures that no
> matter what happens with upstream libvfio-user.git, the source code that
> QEMU builds against will remain archived/available.

Can we do it the other way around? When the series is OK to be merged,
setup the https://gitlab.com/qemu-project/libvfio-user.git mirror and
have the submodule point to it?


