Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D738732E4FE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:36:55 +0100 (CET)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6tC-0002uU-4y
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6rH-00022o-Ai
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:34:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6rD-00022A-NZ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:34:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u187so817298wmg.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=56gB03W0oVUFLe09yELsjDesewKsGTugTU2Tos+3FVo=;
 b=mO3YxI7tZ0fLRS9QD5L2X7xbqa0Idkt4hFn9pA6AQD/yzyHqcMoFxyXvWc9xnoh5eF
 NLFuCTkIqSjjPLfxYO1Ez/ghCsd49aCpPi+Z0o7npD2ikq1jyHDVrzXetie99UoGKiDL
 0hzFh72gpkwhVE064L0IqR7zFe9B+iQi+SWnB0X3955G/HEF8gYHyklatYvDc95GFWc2
 vkLGSbz00mSeamKq67kBCThFSx2vSuxIsWW3u6B1736ghGkP6gh7d/fSci+8rOTSYSK7
 gdAmc7wvDuY61lqZck6O4tFCAdWa4I40kK4wP2MUAABujxW5TYsKZyV1If1KcTAJqRpH
 rgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56gB03W0oVUFLe09yELsjDesewKsGTugTU2Tos+3FVo=;
 b=l/8UEnqDAIStBjQ6Lo0HE4RChQJ8wmHxOr67JGnGmM2Z4/qjmRqXbabEl7KxyDw1e3
 DbXSbNMCdX4Mr+r9dP4hY5A8EiNlXWIqMW2iHey667ELCsUVM0E9bGVr94BMZVpquPgv
 /rUhb+E40YIGnbltrc3Ne9dSXzgLuKhGtstlGxZwqHpoIxVxi95CSquxKXNoBlRQ+YzD
 m8oo5lOKuWI2owQiqaxh3AIAQdRvCGtRXtTWUz9dFvpb3EHKkOWtkiEyNVLdX1KMrIGa
 /iDzGIHFFORIbUGOl8MK54AUhrrKWz4kOhMfoIZQ0Zv9ahygiXbh1W5AJVQwe0BQFJ4S
 G4OQ==
X-Gm-Message-State: AOAM530N2LiNW+9ZrTqGnu7A6jz+1QCklaIRCrZBNgpsNL/BwNBKkHTG
 E7st6ZZ3ky3aqtvIEupjDtNlDT6wtaY=
X-Google-Smtp-Source: ABdhPJy0ygfBKzMVU2g0qW1BxOlnxkv8JD+LHZyAtIVW32l8fjbgUMCM95FaQH2t0XQQ1YA02uGlwA==
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr8144267wmf.12.1614936888563;
 Fri, 05 Mar 2021 01:34:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o2sm3864576wme.16.2021.03.05.01.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:34:47 -0800 (PST)
Subject: Re: [PATCH] linux-user: add missing MULTICAST_IF get/setsockopt option
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, laurent@vivier.eu
References: <20210305033510.8600-1-jiaxun.yang@flygoat.com>
 <b699536d-e2e6-0e7b-a883-4ba5de067e9f@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c51f9694-030f-597e-2ec8-ea901c1a4f5d@amsat.org>
Date: Fri, 5 Mar 2021 10:34:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b699536d-e2e6-0e7b-a883-4ba5de067e9f@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Yunqiang Su <syq@debian.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:46 AM, Jiaxun Yang wrote:
> 在 2021/3/5 上午11:35, Jiaxun Yang 写道:
> 
>> {IP,IPV6}_MULTICAST_IF was not supported.
> 
>>
> 
>> Reported-by: Yunqiang Su <syq@debian.org>
> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
>> ---
> 
>>   linux-user/syscall.c      |     4 +
> 
>>   linux-user/syscall.c.orig | 13305
> ++++++++++++++++++++++++++++++++++++^ Sorry ^ ^ sorry for the noise...
> 
> I'm drunk today.

Suggestions:

- it might be OK to commit being drunk, but always better post the
  next day after reviewing the previous commits ;)
- use 'git-add -p' instead of 'git-add .'

Regards,

Phil.

