Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E634133F271
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:20:23 +0100 (CET)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMX26-0002uV-Sp
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMWzz-0002I9-10
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:18:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMWzw-0004Qr-3L
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:18:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x13so2000166wrs.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aSiVUjU+bzXVzbzMBHupiWrTUCdOmYeM9oN+jgPpbic=;
 b=EFM+AQWi0DY6PFDgGRRtGGN2bNGtoEt7+zZPd84mZzrOvcPnMQGYzKhqfn2Bgx0vkd
 xcMx2DoSh+8fZt60fUD66M8BAOPk3z/1x7nMAw+IT/9XgxCvqhSmCUzQiIHK+qlPIEYo
 vTYMbW73uoNti7bbeBqX5LglhbnCwm2jBV5PdrCfEaJf4SKDCIfXcFHszeV48BXziT8p
 SMOIacQtjnDPFgWWHdcX2Fp9of4Z7kTT1jOFHkfrSj6mWSBttibEZFAtpanRxdBmUZ/m
 TpP5JjIXMDhwo+MnH15VMy9536AAd1qVOUYS/TABGAGonjhqHMpOOsxswJl0fHfhE78t
 PpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aSiVUjU+bzXVzbzMBHupiWrTUCdOmYeM9oN+jgPpbic=;
 b=DoonHEQWqEdp2gs1DgUHOYhmATarwtdbocR8KH9w4+M33HEHQ755Wl6hb5cSwFYl5O
 p62fhM0L8RVD3YXgrzdeoAl01grKAkKMc8jMTGgEY7ahDhr1kPZt3tvq5XvU0o8NJzhv
 elM+Pd5vCZcgWbK8IhAeK10nja2HyybQwL18BjGzUMQLYX2gDnhmZZ6mmFOOAKjPGLbV
 lJLuIEuDYbMsSJBUfgVRJrEFH3a+ykU61W38f4n09yjY+huEIidmTEKHy/h6Vzft0/8V
 TGJKiuMVTAxbylQK1fLi1Xn/bU2uVpit77iJfec6gYlvQ2rAikbRGxcCNTqGXPuGj6ub
 dOPQ==
X-Gm-Message-State: AOAM532T/MWxxyEFjiTBJw4+Rawz+Ep5HmvKkFinNJvNHRthLeCahav1
 mkp1sVEptIBXqjhZ+w3TgNk=
X-Google-Smtp-Source: ABdhPJzpbpd9kNRBmvz84xxEALeCXCpW9xbEACTC633JVT3oWXKe/As2S5dkcrmtDvQbeUnpLwMzeg==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr4657308wrj.391.1615990686873; 
 Wed, 17 Mar 2021 07:18:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e13sm5813554wrg.72.2021.03.17.07.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 07:18:04 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] tests/acceptance: Extract QemuBaseTest from Test
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210315230838.2973103-1-f4bug@amsat.org>
 <20210315230838.2973103-2-f4bug@amsat.org>
 <7d97e67e-e09d-a3cd-8b54-49d7fe51fc15@redhat.com>
 <f66ad969-2648-b599-f1b5-b9d01e4146ca@amsat.org>
 <9391ac87-4b6a-a785-b1ed-c4f796d71826@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24efd45f-3fe6-95cb-ceef-f0ca44472a26@amsat.org>
Date: Wed, 17 Mar 2021 15:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9391ac87-4b6a-a785-b1ed-c4f796d71826@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:44 PM, Wainer dos Santos Moschetta wrote:> On 3/17/21 10:26
AM, Philippe Mathieu-Daudé wrote:
>> On 3/17/21 2:08 PM, Wainer dos Santos Moschetta wrote:> On 3/15/21 8:08
>> PM, Philippe Mathieu-Daudé wrote:
>>>> The Avocado Test::fetch_asset() is handy to download artifacts
>>>> before running tests. The current class is named Test but only
>>>> tests system emulation. As we want to test user emulation,
>>>> refactor the common code as QemuBaseTest.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>    tests/acceptance/avocado_qemu/__init__.py | 23
>>>> ++++++++++++++++++++---
>>>>    1 file changed, 20 insertions(+), 3 deletions(-)

>>>> +# a.k.a. QemuSystemTest for system emulation...
>>> Above comment could become the class docstring.
>> No, there should be no comment at all. We have to see if we are OK to
>> rename or not. You suggested this change:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg659843.html
>> But the there was more discussion and we never agreed on anything.
>> I don't want to restart doing this change if it is ignored again,
>> as it was a waste of time.
> 
> I stand my suggestion to rename the Test class. However, IMO this could
> be done on a separate series later after we get this merged, so to avoid
> more discussion. I can work on it myself. Sound as a good plan for you?

Sure, certainly! Thanks.

