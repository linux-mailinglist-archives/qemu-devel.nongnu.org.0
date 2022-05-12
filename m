Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29257525000
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 16:32:01 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np9r9-00050s-8D
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 10:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np9pm-0004Ga-0y
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np9ph-0001pm-QF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652365824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zEeAjr8+FecI6xSfZ2l6k3OK+vGZI4I3TeG5sSyslA=;
 b=OCl86EEKEUc4I9BxP87cnu6ccHPWMHEx/Gi4/l4wik7z9c+jJstb5p0Q5DIV/HRXW47tIO
 //kbn5LdY5Ou3AZ5iBhzKvtkaKkCzTkhAoHth+T2mTf4+Y2frmOsaWJXdY2WBRW1WdbtgM
 2CV0c1x2FGTxwbxh2BuNTF6FgUjqT8k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-7sbU61bPN6eWiUp65TETgQ-1; Thu, 12 May 2022 10:30:22 -0400
X-MC-Unique: 7sbU61bPN6eWiUp65TETgQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so2141336wrv.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 07:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7zEeAjr8+FecI6xSfZ2l6k3OK+vGZI4I3TeG5sSyslA=;
 b=YMgHFE/UApnHRHSljYUzFaYGDqmtAMrR1hsLSCQaCUzBnBRw+zDfnoOZ0QbACBVrTb
 4KFxpPBmzl7zbedtjuEXwBJP8cdEN3mU0z9ZS382+vtnVjQKPgs7UdGuAqSLU4A4aLg8
 93Fzn1g4tDvdGHlg67w2bR+ZOFxCOyFI6ZixN3m5ZHt3nvop9+BRpJ/XkrG0eM/tUFKO
 ghjKT654N90J6Kg+q2MIZFQuYKm4HxR7NdzutoVlJHlqeROhPbBCZUni2QJvmc5n4mfW
 ndLHVJ4dD+zSIf1EiCHf7p86qwaVBQRJ6jZfV5ftzPPerAXpN7IZiJARgiEz13ptZFml
 luwQ==
X-Gm-Message-State: AOAM531dNAGETVBKO7ESFQmTpQk8dLI1pku0Z/dWHP4CL4dJ2n9p9Cmv
 REMvr2ErOqAO9/GA1f9JRpj3vualHJELuLjWZaCLIDdyEqhj6/ucQLELC+FJNxQtnZ/b7uLPAbB
 uaXeqGI0Itmr8nsc=
X-Received: by 2002:a5d:6102:0:b0:20a:db89:724f with SMTP id
 v2-20020a5d6102000000b0020adb89724fmr27351352wrt.59.1652365821559; 
 Thu, 12 May 2022 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ1K1dfoSk8ge/WU064yyp7TkO5mHORzYxHpi6gHONqvJtuNqkhYeu3yg9UvOK8MnaXQOArA==
X-Received: by 2002:a5d:6102:0:b0:20a:db89:724f with SMTP id
 v2-20020a5d6102000000b0020adb89724fmr27351332wrt.59.1652365821295; 
 Thu, 12 May 2022 07:30:21 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 p39-20020a05600c1da700b003942a244f4esm2993232wms.39.2022.05.12.07.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:30:20 -0700 (PDT)
Message-ID: <2f53f9ad-afaf-4509-9a4f-335addc9b6b4@redhat.com>
Date: Thu, 12 May 2022 16:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] docs/about: Update the support statement for Windows
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20220512073929.988220-1-thuth@redhat.com>
 <YnzHY9qppyhu+fx2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YnzHY9qppyhu+fx2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2022 10.37, Daniel P. Berrangé wrote:
> On Thu, May 12, 2022 at 09:39:29AM +0200, Thomas Huth wrote:
>> Our support statement for Windows currently talks about "Vista / Server
>> 2008" - which is related to the API of Windows, and this is not easy
>> to understand for the non-technical users. Additionally, glib sets the
>> _WIN32_WINNT macro to 0x0601 already, which indicates the Windows 7 API,
>> so QEMU effectively depends on the Windows 7 API, too.
>>
>> Thus let's bump the _WIN32_WINNT setting in QEMU to the same level as
>> glib uses and adjust our support statement in the documentation to
>> something similar that we're using for Linux and the *BSD systems
>> (i.e. only the two most recent versions), which should hopefully be
>> easier to understand for the users now.
>>
>> And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
>> itself, I think we could mention this build environment here, too.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Rephrase and update the _WIN32_WINNT macro, too
>>
>>   docs/about/build-platforms.rst | 14 +++++++++-----
>>   include/qemu/osdep.h           |  2 +-
>>   2 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
>> index e9163ba556..1958edb430 100644
>> --- a/docs/about/build-platforms.rst
>> +++ b/docs/about/build-platforms.rst
>> @@ -86,11 +86,15 @@ similar versions.
>>   Windows
>>   -------
>>   
>> -The project supports building with current versions of the MinGW toolchain,
>> -hosted on Linux (Debian/Fedora).
>> -
>> -The version of the Windows API that's currently targeted is Vista / Server
>> -2008.
>> +The project aims to support the two most recent versions of Windows that are
>> +still supported by the vendor. The minimum Windows API that is currently
>> +targeted is "Windows 7", so theoretically the QEMU binaries can still be run
>> +on older versions of Windows, too. However, such old versions of Windows are
>> +not tested anymore, so it is recommended to use one of the latest versions of
>> +Windows instead.
>> +
>> +The project supports building QEMU with current versions of the MinGW
>> +toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
>>   
>>   .. _Homebrew: https://brew.sh/
>>   .. _MacPorts: https://www.macports.org/
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index 1c1e7eca98..e2f88597b6 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -75,7 +75,7 @@ QEMU_EXTERN_C int daemon(int, int);
>>   #ifdef _WIN32
>>   /* as defined in sdkddkver.h */
>>   #ifndef _WIN32_WINNT
>> -#define _WIN32_WINNT 0x0600 /* Vista */
>> +#define _WIN32_WINNT 0x0601 /* Windows 7 API */
>>   #endif
>>   /* reduces the number of implicitly included headers */
>>   #ifndef WIN32_LEAN_AND_MEAN
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> but how about also adding a comment before 'glib_req_ver' in
> configure reminding us to bump _WIN32_WINNT and adding a
> comment here reminding us to set this to match the _WIN32_WINNT
> in our min glib ?

Can do. Will send a v3.

  Thomas


