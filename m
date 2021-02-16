Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1131C6D5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:32:19 +0100 (CET)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBuqI-0001xh-0K
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBuog-0001UN-LG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:30:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBuoe-0002Qe-GB
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:30:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id n10so13458071wmq.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t5uzfzgTuDgSmurHuTOZFv2xcR/SlHJOGDPMktlbfZg=;
 b=HP6SWowmbj61D/2Ep7eCMBatX1I6gmUbdpT1BmBXOyUp1tAL6znWwR9ZNEsGnqZJPH
 cxRcds2oG7yniGWeBPonmyRCrgbZKo7AOzj4SPkqGe5CYsG3r8NEYk5ZW18hv20eYb6X
 Z9PqMcLSMwvSNQbV6hH7kqKyQ/ohWUTBsLJgsAJ+V82M1XndGs1oMtSr6Xa23Q6ibZ2q
 KO3zd9CNTxKwFSPyYg5A1yHuoxLFOju/szf7K8bV8AX+3XQJ0UFPjb1ES+Aty6AZMKFu
 Z/apYkMki03BCH9/ypJ2v4mSDFt1on4giYjNxKVD7eNBffbuNTc3bY44C1Zi44Mu2ozG
 GHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t5uzfzgTuDgSmurHuTOZFv2xcR/SlHJOGDPMktlbfZg=;
 b=MYBpmYqIGQC3TrEf8xpfPSMBdrweawELPQyqtsTRVGN0m2v0hUWpl626OKbAQWpUrA
 s/oV3N87BceVgjpQeeeJOjZ35aTwzpWtsianofM0pZm5/DTs3guBKHpb2LLbIcI2U0on
 0NPS8GMHBxvW+rwWkXxUixyGZair0aNrGCgO+wPyh/8MRiCJmjFuKvakH2LZUt3CHRxr
 E2t8aC0n2bEFs0uKT5T4ZqVzsMHpir9XPBdZ8KwbGmrpBws2cbBvOgnDoHpPIDpx3rRk
 BN55+ZdUMzcYLEeuvxFkT+NjcDsDjZDeYI+DjkPVxnjU1QhaHdypMgnohbcaMGC1pYGl
 Vfbg==
X-Gm-Message-State: AOAM532uW0BXkDmgJ53tbwSfgtvGvzkARvn1zZweg2LdG2I2DsZmHTuk
 JoWDDU+eT1vSYzGwZqS5p8s=
X-Google-Smtp-Source: ABdhPJx/YDcREwMy5QjIxrxpUYBTT8wm4ZEcD8eWioXeJ6bS9bpAKtfWHSjajqAg3934fw40Iz7X6w==
X-Received: by 2002:a1c:5584:: with SMTP id j126mr2045781wmb.153.1613460633949; 
 Mon, 15 Feb 2021 23:30:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d5sm18218168wrp.39.2021.02.15.23.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:30:33 -0800 (PST)
Subject: Re: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
 <0978e91b-d2e8-ce30-87de-cba2896ecc16@amsat.org>
 <ce56bbc6-8467-db6d-599d-c52c56ad6f5f@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e86ba2e0-c023-b2fa-6c38-d9fe762bba50@amsat.org>
Date: Tue, 16 Feb 2021 08:30:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ce56bbc6-8467-db6d-599d-c52c56ad6f5f@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: fam@euphon.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 2/15/21 11:35 PM, Mark Cave-Ayland wrote:
> On 12/02/2021 18:56, Philippe Mathieu-Daudé wrote:
> 
>> On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
>>> The MacOS toolbox ROM performs 4 byte reads/writes when transferring
>>> data to
>>> and from the target. Since the SCSI bus is 16-bits wide, use the
>>> memory API
>>> to split a 4 byte access into 2 x 2 byte accesses.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Out of curiosity, what is the bus used?
> 
> AFAICT it's a custom logic chip that sits on the CPU address/data buses
> that does the decoding between the CPU and ESP chip. Other than a simple
> block diagram of the Quadra there isn't much official documentation out
> there :/

OK.

> Are you planning to review any more of this series? I'm keen to put out
> a (hopefully final) v3 soon, but I'll hold off for little while if you
> want more time to look over the remaining patches.

I talked about this series with Laurent on Sunday, asking him for
review help ;) I don't remember if there is any big comment to
address in patches 1-14. If not I can review the missing ones
there today and you could send directly a pull request for this
first set, then send the rest as v3. Does that help?
For the rest I doubt having time to focus before Friday.

Regards,

Phil.

