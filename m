Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC03E4158
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:07:21 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0Jc-0006kP-I9
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD0Il-0005pz-JL
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD0Ih-0004yJ-Hw
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628496382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwW4vkyBRGws0YG0WzJRo8NrjHUANqgyGkQkohZCosI=;
 b=Kxf9sK67a0VZptfnCZzf7q9fVW40Z73teQ7fM/LYXvc4R/mXu2I2E9yqj2q2y3loHGO5KU
 i91ouVgTMEHrSEyLVCref/+5a5O1E5jwrwAfp26+i2+0wOP2FEvE58yxZeQXJlJ0IpzwS7
 5iSIQjXB1Ixt8WferHjCSiM+vvKmIPI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-VeNXPH7CPMqn83ssknrTMg-1; Mon, 09 Aug 2021 04:06:21 -0400
X-MC-Unique: VeNXPH7CPMqn83ssknrTMg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so840164wru.19
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 01:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gwW4vkyBRGws0YG0WzJRo8NrjHUANqgyGkQkohZCosI=;
 b=d/fnbgbN6k3DAkTo35Z5pQ7Poe00sr3l7WcMVtELY265NiAfpLjiTdGebgH2W43pOU
 WsbKW1mig9AxBsIV5swsxAnwYLQKCJ6nN5S0IWlPTIut5ss1mpvL4WJMbksqqffCqu6T
 iHV6HOwDywsgdoLL4QZIblqJGX/15yYWtN3EEuvl6TmSqyFvBjk3hQKYqVibbKh4nfuZ
 J/BvThtSvmP6y78BtLCxHCkIT3ZSY+bzBtPdx3c7g//J9nRZnAAz8HeKr3rGF/V+Amnc
 nG5RN6/exPdCXnEqo8shVjC85Asb0i89JqUOqqENEC8ymrkhUxB4iP7+2fAdAoLkV789
 gpJQ==
X-Gm-Message-State: AOAM533VRL61F+f4hEVM+tP4lO7372cVUUEsMDX1oCr9RibdTNIcfO27
 t1g2rFwKTYCgmPfOjMRismsOpX/zm6Y8JeillnkWok+O8vipX1iBpk/1iIzfghSM5+9LIbxnjSW
 NGAGLxSApCrt0al0knyYVMLA+EVZNbdNqC9k07gchf6ZfkfAImyLbfcRUEKzQeCYs
X-Received: by 2002:a1c:2602:: with SMTP id m2mr14997973wmm.38.1628496380024; 
 Mon, 09 Aug 2021 01:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywn+apTeAPJX4ftdc5+wqH3FvTTY9WQNR8LqKpCK2kbMhAWjtWPeJKRVR+OP/loQNkkkuyFw==
X-Received: by 2002:a1c:2602:: with SMTP id m2mr14997942wmm.38.1628496379698; 
 Mon, 09 Aug 2021 01:06:19 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w9sm16480428wmc.19.2021.08.09.01.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 01:06:19 -0700 (PDT)
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
 <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4e7b51b8-8b77-3634-eab5-eccc2e01b7c7@redhat.com>
Date: Mon, 9 Aug 2021 10:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 9:55 AM, Cédric Le Goater wrote:
> Hello Phil,
> 
> On 8/9/21 9:06 AM, Philippe Mathieu-Daudé wrote:
>> Hi Cédric,
>>
>> On 8/6/21 8:00 PM, Cédric Le Goater wrote:
>>> It includes support for the POWER10 processor and the QEMU platform.
>>
>> 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?
> 
> OK. See attachement.

By "here" I meant in the commit description ;)

>>>
>>> Built from submodule.
>>
>> 2/ Could we have a CI job building this, during 6.2 cycle?
>>    (See .gitlab-ci.d/edk2.yml and .gitlab-ci.d/opensbi.yml)
> 
> Sure. It doesn't look too complex. 
> 
> I plan to add acceptance tests for the QEMU powernv machines also 
> once the OpenPOWER files (zImage.epapr and rootfs.cpio.xz) are 
> published on GH.
>  
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
>>>  roms/skiboot        |   2 +-
>>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
>>> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed5b1ddbed017ae8c0a9d0 100644
>>> GIT binary patch
>>> literal 2528128
>>
>> Consider using 'git-format-patch --no-binary' and a reference
>> to your repository to fetch a such big binary patch.
> 
> David would pull from my tree then ? So that's like doing a PR. 
> We can do that next time I send an update if David is OK with 
> that. I should send an update for v7.0 tag. 

As you wish. Big patches gave us troubles, i.e. they make crash
the 'patches' instance. 2.5MiB is probably borderline and I'm
being nit-picky.


