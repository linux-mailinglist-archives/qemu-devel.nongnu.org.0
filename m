Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80548EB0E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:49:17 +0100 (CET)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Mx9-0005me-V8
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n8Mn7-0002qh-Fi
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:38:54 -0500
Received: from [2607:f8b0:4864:20::1029] (port=39600
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n8Mn3-0005Yr-Q3
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:38:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso21954791pjm.4
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:in-reply-to:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=G6Ld0UJ7i7x/mg6hxyNTvszjVbNXMf6e6KdzsnKGJTg=;
 b=FOVh1URjClMufFEh9Lolb5Ki4tRbRiyu+lcK30x0Di5z0SXnQb0rYVggi31NIgWi27
 YUJT06r2zlg6+ODJ7aAtlqBgrO4i4Nohp45bz/4Wlec5MutaLFU9AZ8yxgUSAFRqcLn2
 3/504etgWcwbM2eFz+YU6Q8irF6VJaa2rlnkSewpUHXyDrRlHbmZ4TnHIGMeP/BTrQVm
 aisJ9m643wdyTPQVarZkV4Z+Trjipc1FXLSrwW7dwD0I083Qhzom3zDpHtyQVc7eePkM
 A93UeHSEnS9lIBeThQokCtJ+Ti+H8ihr0VEmeaOijALZFhIBGr425Oq/i08tlZtkk9xA
 0zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:in-reply-to
 :message-id:date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=G6Ld0UJ7i7x/mg6hxyNTvszjVbNXMf6e6KdzsnKGJTg=;
 b=Lei/IYwQBiYTH0kwWbdHzhUSPSMa+9O9egq1YSW5Ac7XxGqvid5Eoj8ICMhlHNGh7E
 M8Fx5NJtiQ7T9MHKbSwSmxl7X4yQwdoQgtcBu8YhIVwMgebdSLoLPicrczdtQXMaO8tE
 M3GA4/09s16je+UsQ1ZpSoVulx0SlzrjBRU6BAxiNzwcYSafnQ3VrPLHEpWQwhu7mV4M
 CKD8Y4+4zP+0DhCvY6rI6yyj01Ruz3v8Kfu7FaQnzBISOIxFj2XeBBQ5pVpohwFwE3V8
 4RskOqLupfrz/n/eIgpSyGst6/tm2MIQcKpOgohSBPQ279D2PPAy3G4gEV5a1cIkDUNj
 rofQ==
X-Gm-Message-State: AOAM532JcJjtYX1DXJt+CyDErbzPnQTYJnorI2cT07HUydjUEZMOKnyn
 tQUA895D+uuma7/y8R8vF0hSbaaE3HaqMQ==
X-Google-Smtp-Source: ABdhPJxWqTNgS/Bvtdqn2PuJ+XNMY1Yc3/cPvsbmDcME2UNt8KUB3QKcxGqTDTgeefklu+TGbp9KdA==
X-Received: by 2002:a17:90a:df11:: with SMTP id
 gp17mr10765116pjb.174.1642167516064; 
 Fri, 14 Jan 2022 05:38:36 -0800 (PST)
Received: from Ryans-MacBook-Pro-2.local ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id ga4sm2573509pjb.35.2022.01.14.05.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 05:38:35 -0800 (PST)
Subject: Re: [PATCH 0/2] Introduce printer subsystem and USB printer device
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220113115659.72788-1-zhangruien@bytedance.com>
 <20220114093216.aqrh6h3ukzavtasq@sirius.home.kraxel.org>
From: Ruien Zhang <zhangruien@bytedance.com>
In-Reply-To: <20220114093216.aqrh6h3ukzavtasq@sirius.home.kraxel.org>
Message-ID: <df772eaf-b042-d44d-392d-5f9204b3f5b2@bytedance.com>
Date: Fri, 14 Jan 2022 21:38:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=zhangruien@bytedance.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 5:32 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> This patchset introduces:
>>
>> 1) Skeleton of QEMU printer subsystem with a dummy builtin driver.
>>
>> 2) USB printer device emulation, with definitions in the extension of IPP-over-
>>     USB [3].
>>
>> WIP:
>>
>> 1) QEMU printer subsystem interfaces, which will be finalized with a concrete
>>     backend driver.
>>
>> 2) IPP-over-USB implementation.
> 
> Hmm, I'm wondering what uses cases you have in mind and whenever
> it makes sense to introduce a printer subsystem?
> 

Simply for the "potential" backend diversity. I have to admit that I 
haven't figured out another backend which would be commonly-seen either, 
which is also one part of the reason why the interfaces are not firming 
up right now.

> Having an ipp-over-usb device looks useful, but the only use case I can
> see is to allow guests access a network printer.  I can't see the
> benefits of a printer subsystem, especially in a world where non-ipp
> printers are going extinct.  We would most likely have just a single
> kind of printer backend, where the only job qemu will have is to
> forwarding requests and replies, maybe with some http header rewriting.
> 
> Likewise usb would be the one and only device (parallel ports are long
> gone in printers).  So the indirection added by a printer subsystem
> doesn't buy us anything because we just don't need that flexibility.
> I'd suggest to pass the url directly to the device instead:
> 
> qemu -device usb-ipp-printer,url=ipp://hostname/ipp/printer
> 
> take care,
>    Gerd
> 

Indeed, the subsystem is an over-abstraction. The forwarding way is much 
neater, considering how things really work nowadays.

Anyway, thanks for the practical suggestion, it will be revised, along 
with other designs around the path I'm currently working on.

Regards,
Ruien



