Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D588A3EA553
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:15:18 +0200 (CEST)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAYH-0007VG-Uw
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEAWg-0006kn-7c
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEAWZ-0001aB-71
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628774009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roZZANIYPTA731mv9oHvjzIftj3RkUf3tW8TVAl3GG4=;
 b=LaHPKCpu8IRWVUDK7pGtiVHprlT3Kyp2wtf2NmErknlFEi6j5sStxKVtHl20SC3UpuE9/T
 pBeGZISD+yVj2uKazAqs5ZF6ITCazA/uYRV+zqAoaHRIwKyY8xrTmKta8k5NdhfMHJDLVF
 p8IIQGJx1lEPWTRFYPK7tCqwjLl/ljA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Yd6EJPQgNd2GD3m9brFIyg-1; Thu, 12 Aug 2021 09:13:28 -0400
X-MC-Unique: Yd6EJPQgNd2GD3m9brFIyg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so1844735wrl.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=roZZANIYPTA731mv9oHvjzIftj3RkUf3tW8TVAl3GG4=;
 b=KjHukZt5bIRIMTXhh2DcxqqH8pHww2luz98sarb9izekMWrHfi3X427xF31v3DkeT/
 vDbpO3TZS+vbclTER86lb5G4DFphbtfGmR+95CXyq6Tq8/zyU60jGJCvZo9vKSwkP5eR
 2W+cBR1jaLzb65sE70t98H2q8agLjFuH3E1C4hdi0eWR/R1pmbpS24YH9qCOMre9Fykl
 RZKGoHZAYXyfZVR2z6Ey2zIoKseSNRLgMv08JWAYlBwUom79W0zxt4w4Yunjk8PRwZGK
 BpApwQQI9COY9tk5pQwDHruDTdSyA5dyuPN2LOFGQ+JInnTQw62Xth4Daex9dDcJa1I1
 0f5g==
X-Gm-Message-State: AOAM532cRjwbPnHYQM7BA68mCrnSjfgoDoW2YvB9hZFH1G+FkjMi2PNe
 lNVV6gFurZp3ZOEA29bPpZHIrl3A8F3AJGFQgDobKxjWAeblMljt7fb5er7gPWun4/EBgQsHv1o
 pIKb8fNFwaO6HXWGGNaz3Etqrz7dIVVgcDJBr07Dry+znAN1k0GutcJFbxbplJEo2
X-Received: by 2002:a7b:c102:: with SMTP id w2mr15536843wmi.133.1628774006346; 
 Thu, 12 Aug 2021 06:13:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9K3zpTYxJ9R15GlncRSlHjK1/DpvLlFcxjmu0c6Bqf2UUvxVVFvyz4W2HEPCf/rQ4KU3Ewg==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr15536812wmi.133.1628774006024; 
 Thu, 12 Aug 2021 06:13:26 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z5sm2675000wmi.36.2021.08.12.06.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 06:13:25 -0700 (PDT)
Subject: Re: [PATCH 3/7] MAINTAINERS: update audio entry.
To: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>, clamky@hotmail.com
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <VE1P192MB0733ED7BB482A45E5768464CDEF89@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
 <20210812084210.kbzoneze3izsrboa@sirius.home.kraxel.org>
 <77562211.GzqkouU55n@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a9ce32c-b6fb-91e5-efaf-82e883dd1796@redhat.com>
Date: Thu, 12 Aug 2021 15:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <77562211.GzqkouU55n@silver>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

On 8/12/21 2:24 PM, Christian Schoenebeck wrote:
> On Donnerstag, 12. August 2021 10:42:10 CEST Gerd Hoffmann wrote:
>>   Hi,
>>
>>>> On Tue, Aug 10, 2021 at 03:17:43PM +0300, clamky@hotmail.com wrote:
>>>>> Gerd Hoffmann <kraxel@redhat.com> writes:
>>>>>
>>>>> Hell Gerd.
>>>>>
>>>>>> New maintainer wanted. Downgrade status to "Odd Fixes" for now.
>>>>>
>>>>> I can try to retake it.
>>
>> Given your track record is zero contributions to qemu in recent years
>> I suggest you start getting involved in the development process as
>> reviewer.  Just send a patch adding a "R: Name <email>" line for
>> yourself to the MAINTAINERS file (best based on my pending pull
>> request to avoid conflicts).  scripts/get_maintainer.pl will Cc: you
>> on any audio-related patches then.
>>
>> I'd recommend to open an gitlab.com account (unless you already have
>> one of course) so you can help triage bugs + issues.  You can also
>> easily run qemu CI then (just push a branch to a qemu repo fork).
>>
>> HTH & take care,
>>   Gerd
> 
> I will add myself as reviewer for audio to help out a bit at least. I won't be 
> able to take over maintainership at this point though.

Thanks for volunteering :)

Following the overall thread, since I have been wondering about
this subsystem during the night.

As of v6.1.0-rc3:

$ find {,include/}audio -type f | xargs cat | wc -l
11412

$ find {,include/}hw/audio -type f | xargs cat | wc -l
14265

So the backends / frontends have almost the same size.

First idea, split the current entry in too, allowing developers
with different interests to add their contact to the relevant entries.

Then looking at the contribution over the last 10 years:

$ git shortlog -n -s --since=10years -- {,include/}audio | head -10
    70  Kővágó, Zoltán
    62  Volker Rümelin
    24  Gerd Hoffmann
    13  Markus Armbruster
    13  Paolo Bonzini
    10  Peter Maydell
     8  Geoffrey McRae
     8  Philippe Mathieu-Daudé
     8  Stefan Weil
     7  Marc-André Lureau

$ git shortlog -n -s --since=10years -- {,include/}hw/audio | head -10
    30  Gerd Hoffmann
    29  Juan Quintela
    29  Paolo Bonzini
    26  Markus Armbruster
    14  Andreas Färber
    13  Eduardo Habkost
    12  Philippe Mathieu-Daudé
     8  Peter Maydell
     6  Hervé Poussineau
     6  Xiaoqiang Zhao

The backend part is clearly where the activity is (almost no new sound
devices added), with Zoltán Kővágó and Volker Rümelin the most active
contributors. IMHO they certainly deserve an R: tag (but up to them).
Cc'ing them, reminding a R: tag is not about responsibility but more
to not forgot to Cc contributors with both knowledge and interests:

  Descriptions of section entries:

    M: Mail patches to: FullName <address@domain>
       Maintainers are looking after a certain area and must be CCed
       on patches. They are considered the main contact point.
    R: Designated reviewer: FullName <address@domain>
       These reviewers should be CCed on patches.
       Reviewers are familiar with the subject matter and provide
       feedback even though they are not maintainers.

Regards,

Phil.


