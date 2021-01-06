Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7FA2EC176
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:51:26 +0100 (CET)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxC1t-0006dj-4L
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxC0C-0006E4-LG
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxC0A-0003KF-Mg
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609951777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lQmbfXFmytRAdkjGvQvAd0+xioEEMPw3e8JYE59wug=;
 b=M+aCjaGmf3tJ46UmV+27Vs7OhboosvgoqiCNDrpRZQ7sj/7Zdtsq3vKx5gltRZV0wR/aAs
 5TE0vBSuMtOn9nub1A8vygmXTvnO4nCZkCIsCLsLKz7UB0NqXkhRWAM/ndoLAFMRDOPBeL
 xg2RxNZKhRf6RJ9mHz6Do6R2AGfJiiA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-NWmI-Qm4NIKuLXoCIHXIlg-1; Wed, 06 Jan 2021 11:49:35 -0500
X-MC-Unique: NWmI-Qm4NIKuLXoCIHXIlg-1
Received: by mail-wr1-f71.google.com with SMTP id u29so1562143wru.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 08:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6lQmbfXFmytRAdkjGvQvAd0+xioEEMPw3e8JYE59wug=;
 b=fBtXJlaXUJmTceB84oyl1wKBN2l+GBdaIDU9UgQ4PGpz793R/rINJ7K8W6uLI6bc8O
 46G5eNDW0wHOioXnQP5/LqK7UtwVp1IkCTXYObjPUatZq8rxYajUSjRSTF2jEVUrJ/d2
 8qZdq+cFEpfKYJ08LcDoSKWw+VbkUmb/mTULpOrzCjxp6P5ahnOoVyXK8iQiAQcAVqwg
 RNsBi0K5f1qTeSPQh5EBpBKMS6TqVOQLP/lS6FZTiKlIibYScafB7Pdxn6zcZ9pDXPbs
 mKai4doM6zDw1F1wWRUOyTVrEZTfHGNFXZ7QLETHgkPrzM6/tuwvvvvnwCDqUAdw8fxo
 Crrw==
X-Gm-Message-State: AOAM533y7QBCgQROaZnDi2siy2w3LpT7YwxKK+ouK/nf3RroF9XgNg2w
 h8hDaLSZwpTOxDTI77kuRJYuRPdNQkCBTMgeotHbD142WElnaaRbSKlaN4oGxd+tI4d99NJp4el
 LbRi15UlN4xcib3U=
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr4359823wma.141.1609951774647; 
 Wed, 06 Jan 2021 08:49:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPzBcOlNC8+GL6N86HK/PXMLAbr7EU3KW1pvFhGHKhqIcDGx3sCPCYb2vZoPwZJDZPertAdQ==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr4359813wma.141.1609951774479; 
 Wed, 06 Jan 2021 08:49:34 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id t16sm4087177wmi.3.2021.01.06.08.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 08:49:33 -0800 (PST)
Subject: Re: [PATCH v2] tracetool: also strip %l and %ll from systemtap format
 strings
To: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210106130239.1004729-1-berrange@redhat.com>
 <23d0604e-bc89-ec16-c884-9252b3a6070f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2e0e5076-52cd-66f9-33c7-50f22c40fb53@redhat.com>
Date: Wed, 6 Jan 2021 17:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <23d0604e-bc89-ec16-c884-9252b3a6070f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: William Cohen <wcohen@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/21 3:36 PM, Laurent Vivier wrote:
> On 06/01/2021 14:02, Daniel P. Berrangé wrote:
>> All variables are 64-bit and so %l / %ll are not required, and the
>> latter is actually invalid:
>>
>>   $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
>>   parse error: invalid or missing conversion specifier
>>           saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
>>        source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu
>> refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)
>>
>>                        ^
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  scripts/tracetool/format/log_stap.py | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> In v2:
>>
>>  - Change existing logic that stripped %z to handle %l/%ll too
>>
>> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
>> index b486beb672..fac911a0f4 100644
>> --- a/scripts/tracetool/format/log_stap.py
>> +++ b/scripts/tracetool/format/log_stap.py
>> @@ -77,7 +77,12 @@ def c_fmt_to_stap(fmt):
>>      elif state == STATE_LITERAL:
>>          bits.append(literal)
>>  
>> -    fmt = re.sub("%(\d*)z(x|u|d)", "%\\1\\2", "".join(bits))
>> +    # All variables in systemtap are 64-bit in size
>> +    # The "%l" integer size qualifier is thus redundant
>> +    # and "%ll" is not valid at all. Simiarly the size_t
> 
> Didn't see the typo the first time:
> 
> s/Simiarly/Similarly/

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


