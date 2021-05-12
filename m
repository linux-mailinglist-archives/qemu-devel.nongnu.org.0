Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68737C023
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:29:10 +0200 (CEST)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgprJ-00064W-I1
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgpZ4-0005rP-TI
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgpYw-0000OG-Nw
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620828609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7XG6VeUE2ISP1jquz33ukRckbn8iBy+LY+K/CNk6u8=;
 b=UE/57BmLsvO6mxhAykYxFzWqv5dxV9qMhmdV6sIaoOJp3BN3ressTKlxMdNR4uMRKCtyzV
 3KKJpho3IuNRUKUNCcCAMsW3YHMRtzikB8WQWW4sf/ui2jSFzam9YGGW5gHknVN04+DJ/+
 ZUHWMvzjQUEp/88EmZZwGwRccBE2YqA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-1pkzRB_sOp24NbNN0sk2-g-1; Wed, 12 May 2021 10:10:06 -0400
X-MC-Unique: 1pkzRB_sOp24NbNN0sk2-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 f8-20020a1c1f080000b0290169855914dfso698996wmf.3
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 07:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y7XG6VeUE2ISP1jquz33ukRckbn8iBy+LY+K/CNk6u8=;
 b=NpOUsUsYoR1kitJyfXmWKDNdRiT10ch0vb+ZgaD2/G6YK5WWnC9t+3f9Ur567anz/G
 8dHNX4/3VV5BtopnklQfwKu2jJrzahVOKFx51EAGg1eRyTtUShpR46F/QXB2ubDJLVeD
 p+y2PJHkyjMnxLk+YwQelbosN19pjcqSIVTVYCNobREC7pe567Nh5exohOH4IDlHeiaK
 Mn/qwZkunDfflbOOLT25mF445B6mHSsn/iOnpMA9O0UJknZ5Pv1FlJame6U1vYRZjVMN
 NHScZa1KZhVBRwy8s68JbQFDiMSHOvzpHrCjO2BpO0A+NjfSDG4nSFuXfS9IQoCyFS2Z
 +pKA==
X-Gm-Message-State: AOAM53253Lxh4sBBbgOHZfdm5yFmroQ/szvoTBJ27tlC9x/ujkv6+cbV
 M/jknhJTlRoZSvVpw0LOgZSgXvrWJvgzKOmMirQTY0CtBn5UElL9u7TZD07KSNv0KUkuf/7YjMV
 fe2nDzqN89uI5xBs=
X-Received: by 2002:adf:f90c:: with SMTP id b12mr23737614wrr.409.1620828604918; 
 Wed, 12 May 2021 07:10:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBv/YhJJc0ErPLyasviuAh52ObGx+ASWeI2KNaQVWeHE1kzlxmgWcW8jafSv+hsXi2ZyYynA==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr23737569wrr.409.1620828604742; 
 Wed, 12 May 2021 07:10:04 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b8sm32023846wrx.15.2021.05.12.07.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 07:10:04 -0700 (PDT)
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 / XCode
 10.2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
 <YJvJNdsGmp+cCPuZ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0e2fce4c-c8fb-de53-7529-93e8a9d667b7@redhat.com>
Date: Wed, 12 May 2021 16:10:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJvJNdsGmp+cCPuZ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 2:25 PM, Daniel P. Berrangé wrote:
> On Wed, May 12, 2021 at 01:44:51PM +0200, Philippe Mathieu-Daudé wrote:
>> On 5/11/21 3:26 PM, Daniel P. Berrangé wrote:
>>> Several distros have been dropped since the last time we bumped the
>>> minimum required CLang version.
>>>
>>> Per repology, currently shipping versions are:
>>>
>>>              RHEL-8: 10.0.1
>>>      Debian Stretch: 7.0.1
>>>       Debian Buster: 7.0.1
>>>  openSUSE Leap 15.2: 9.0.1
>>>    Ubuntu LTS 18.04: 10.0.0
>>>    Ubuntu LTS 20.04: 11.0.0
>>>          FreeBSD 12: 8.0.1
>>>           Fedora 33: 11.0.0
>>>           Fedora 34: 11.1.0
>>>
>>> With this list Debian Stretch is the constraint at 7.0.1
>>>
>>> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
>>> which dates from March 2019.
>>
>> But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
>> for non-x86 targets until we have figured out who is willing
>> to share/maintain such non-x86 native runners on Gitlab.
>>
>> There:
>>
>> $ clang --version
>> clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
>>
>> If we don't use Travis-CI, then your patch is fine, but we
>> need a previous patch removing .travis.yml.
> 
> Bioic has clang 10 available so not sure why you're seeing
> version 6 there
> 
>   https://packages.ubuntu.com/bionic/clang-10

But only i386/amd64 are listed there.

However s390x is indeed in the bionic-updates stream:

https://packages.ubuntu.com/bionic-updates/clang-10

Thanks,

Phil.


