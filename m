Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F1323110
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:56:25 +0100 (CET)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcrA-0004eC-Kv
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcqF-000483-0C
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:55:27 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcqD-0003Z8-4V
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:55:26 -0500
Received: by mail-ed1-x533.google.com with SMTP id d2so26991342edq.10
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpznWoHiWLOsVaqi2czeddshrPJGaEndL5LQI46StP8=;
 b=ZTGM3way9qii7pJQgsVHT0VtpQQTZ8Wth+AYUL2Znm0jtzlBzi3xlSkNjZ7rYya0Z/
 SlUZAbytAHAsZ6aZxmI3D20sK5/IgJ+xZC/ldu39SuANfVKhmYXMW4zo8V2ww7l1drZI
 EmfdCriQoVXWQWnz7r3SUzhoI4mAi1pN3z+S5EwBOYqzOPJySFyFd31mkKWG0Mn+zURR
 Pl3e60KHge4ie5mQXbOjo0TXo5CrDyhslK29ftSRIjUDc1uy+DxtODw0OCPjxozvRNIn
 nQjOw9cFGbBy0NdTc6N0zSxTBKxacE7xMPrMAXErzaGFBCwp+So3J5bqyF9z7aRmrl4C
 c32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpznWoHiWLOsVaqi2czeddshrPJGaEndL5LQI46StP8=;
 b=V0nWjtG/avWKqGl1GyMS/1Yq0fBBVNpHWd13V/pgVJloCE1Yac8IDFRCNxk6ueXRTO
 0JwU5ldaI3pmFtuizsy/LS+GKBAlcvBForo+nFGWdM5URBBxKfr+tFzLISj4zADpfaPB
 E2I3Vp6BEYI3EuAfVJbtvIpkYXzYeuaCTHwjrB/kY57At2FL/Rq4332q6PuzQb3y/fcI
 R1sVskDOLU45IhQdjoscEODKdadvJh0+0MxfIC3pVYU1MFMa3amlxzM8iSa25tS9Mn0Q
 KV8/Jxay2Ta0+hoAOFdl6yMi2LJ8fvBmKRn2lSzPiUidTD3nzAPUcwiIa0qgyj/lUJdr
 K53Q==
X-Gm-Message-State: AOAM533rxcEtCK1DnFO4iZ/3BhtZviOTzZxC9BSmYA7Dl3vGtgWDRRX7
 p7WXnqXjNouJOHETkzE3dRs=
X-Google-Smtp-Source: ABdhPJxnBgyWFIjm5rTDfuQ0U67Uu2PMP83nI4dbfzet1RQLLtPnAARVdJV/06mEf/CTZS9ETbLQAQ==
X-Received: by 2002:aa7:c542:: with SMTP id s2mr9571354edr.369.1614106523472; 
 Tue, 23 Feb 2021 10:55:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm16138052edj.89.2021.02.23.10.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:55:22 -0800 (PST)
Subject: Re: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
 <0978e91b-d2e8-ce30-87de-cba2896ecc16@amsat.org>
 <ce56bbc6-8467-db6d-599d-c52c56ad6f5f@ilande.co.uk>
 <e86ba2e0-c023-b2fa-6c38-d9fe762bba50@amsat.org>
 <73445020-bb50-e3d6-07b1-a72b6b5e80bf@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3480d37c-741a-89ad-1a9a-8a4acddad19c@amsat.org>
Date: Tue, 23 Feb 2021 19:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <73445020-bb50-e3d6-07b1-a72b6b5e80bf@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: fam@euphon.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 9:24 AM, Mark Cave-Ayland wrote:
> On 16/02/2021 07:30, Philippe Mathieu-Daudé wrote:
> 
>>> Are you planning to review any more of this series? I'm keen to put out
>>> a (hopefully final) v3 soon, but I'll hold off for little while if you
>>> want more time to look over the remaining patches.
>>
>> I talked about this series with Laurent on Sunday, asking him for
>> review help ;) I don't remember if there is any big comment to
>> address in patches 1-14. If not I can review the missing ones
>> there today and you could send directly a pull request for this
>> first set, then send the rest as v3. Does that help?
>> For the rest I doubt having time to focus before Friday.
> 
> Hi Phil/Laurent,
> 
> I know you're both really busy, but gentle ping to ask if anyone is
> still planning to review the second half of this patchset? :)

At this point I reviewed more than half of the series :)

Laurent, can you have a look at the upper half?

