Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F312C4710
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 18:52:38 +0100 (CET)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khyy5-0006p5-QI
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 12:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khywe-0005kO-Jo
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 12:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khywc-0004sR-Vv
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 12:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606326666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMYL2lSCqVi2UruegtWz5kDARaAjGnaLDBwI8zbfZBU=;
 b=SMg01nvyM5uVCBaZpR90hE4TYTzfkvomrK+/2JKyfdy+JehS3t4eD26PObHltt7AnI77X2
 TBAFSXbMZcsPXUWAjsbBnvSNrI4NpBETSE/MRcNkAQsbGNpmt62eJTlW/Y2JqSvW9Mu38M
 868oJFKD9dqRjV/tmRWdSqx9zG6ZYGE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-6alHFsr8PMKmxEZHHk52ig-1; Wed, 25 Nov 2020 12:51:04 -0500
X-MC-Unique: 6alHFsr8PMKmxEZHHk52ig-1
Received: by mail-ej1-f72.google.com with SMTP id f12so1052490ejk.2
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 09:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RMYL2lSCqVi2UruegtWz5kDARaAjGnaLDBwI8zbfZBU=;
 b=cnSd0sxOFJ8XA6uABwZNGnyFAtyBZFC3PdDoSZVdTM370x92Es+sQxg2YJAdHAnmOs
 Z4X6uUm5O2oF3XUD10+81mYg7qIY2i4Jb/k7f+4buKzChLxdD+/0KFwWZBvBWBxwlHjs
 2GYnr7a97ObU+QnXHUKTVP0dXs+8VE2i+wTHTZPco9CM54D4l22Tit2nu5KSDWiEKqCX
 pV4fRLmsjqZwQ2IW+sWR6MCHSseP8C+rpphQfl3ujjrcf/kr8rndpNWynfcTBm6Mopsg
 pZMJ1nMhtMnQizgfGp5RkpFiGi8nmqXUs3MCq8VwzBUPXCmjcojRWTklOyUBa26TCQV9
 CyrQ==
X-Gm-Message-State: AOAM533/0n/6ar3XzU33d/KwklhS3b94u69cOYZbr7bqyQpO9OjZKSh+
 pnR1oYJ0UwcGc4pv0Z5whe1pqWyu7SgYJNbKoMwo82/XaKVkmQjeHGQ7bp+z4OuzY04ZlakpQQ+
 xREwt9Z1Xs1lqIHI=
X-Received: by 2002:a17:906:dbd6:: with SMTP id
 yc22mr4223879ejb.252.1606326663187; 
 Wed, 25 Nov 2020 09:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJXt5BCbUD2+PbbNVOcncYRGn48YSuOsYWfS7zMcf4Ph6wy2h7SJKiizzzzozPlha9Dl7uRw==
X-Received: by 2002:a17:906:dbd6:: with SMTP id
 yc22mr4223865ejb.252.1606326662979; 
 Wed, 25 Nov 2020 09:51:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u18sm1707312edd.60.2020.11.25.09.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 09:51:02 -0800 (PST)
Subject: Re: [PATCH v1] configure: remove python pkg_resources check
To: Thomas Huth <thuth@redhat.com>, Olaf Hering <olaf@aepfle.de>,
 qemu-devel@nongnu.org
References: <20201124211925.4194-1-olaf@aepfle.de>
 <055163a8-9c26-4454-89e8-9b40c31d79a0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <15bc839d-5022-d047-7f6b-dbc9d5961f27@redhat.com>
Date: Wed, 25 Nov 2020 18:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <055163a8-9c26-4454-89e8-9b40c31d79a0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/20 05:19, Thomas Huth wrote:
> On 24/11/2020 22.19, Olaf Hering wrote:
>> Since meson.git#0240d760c7699a059cc89e584363c6431cdd2b61 setuptools is not required anymore.
> 
> That commit was part of meson 0.55.1. We require at least meson 0.55.3. So
> right, this should be fine.
> 
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> ---
>>   configure | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 8c5d2f9a69..ce9b3c0a33 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1913,9 +1913,6 @@ fi
>>   
>>   case "$meson" in
>>       git | internal)
>> -        if ! $python -c 'import pkg_resources' > /dev/null 2>&1; then
>> -            error_exit "Python setuptools not found"
>> -        fi
>>           meson="$python ${source_path}/meson/meson.py"
>>           ;;
>>       *) meson=$(command -v "$meson") ;;
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I guess we could now also remove the corresponding package from the docker
> and vm files?
> 
> $ grep -r setuptool tests/
> tests/docker/dockerfiles/debian10.docker:     python3-setuptools \
> tests/docker/dockerfiles/fedora-win32-cross.docker:    python3-setuptools \
> tests/docker/dockerfiles/fedora-win64-cross.docker:    python3-setuptools \
> tests/vm/freebsd:        "py37-setuptools",
> tests/vm/openbsd:        "py3-setuptools",
> tests/vm/haiku.x86_64:        "setuptools_python3"
> tests/vm/netbsd:        "py37-setuptools",
> 

Yes, it should.  I sent a patch for this.

Paolo


