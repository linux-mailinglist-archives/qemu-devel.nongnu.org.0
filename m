Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6C52B7C8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:42:04 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrH7z-0006Q0-6p
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrH3T-0005MV-JZ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:37:23 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrH3R-0001y8-Qe
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:37:23 -0400
Received: by mail-ej1-x635.google.com with SMTP id i27so2915231ejd.9
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b8GUXuHlwf34CLZcvE++GS5q/EbeYoLLXcXnye2vCJ0=;
 b=QVefqPEWk7vjhH/Zq1y/9iIis1WBwZiYo6r+NqUVEozNAOreMGRm7r1c4vLyCUCmhi
 mopcJJEx8n7i2c18d5EW0gAPdn7b1qzahwTEZC+fIjJUwpB4iSGYVDNCjeP4xwnUlv1t
 jRiXWL6LSl+XuP8kpk0F31elNVH/je0YzV2VgNb8SxGbyqQNSNdXVYo3nKHLyOHGYuCV
 qQADrG3oyaR/b8Qd1Z0mTp3iSsHKVasFeVBquTF5D4bSICBkUzUS/Sn32lWCJ1tK0cm2
 1TYHY78RBPURiiJULs8Z8WrzXfNm7WqDya5cJt1rzymCtXih1X1IWwzuEcR6aM2LG79q
 nX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b8GUXuHlwf34CLZcvE++GS5q/EbeYoLLXcXnye2vCJ0=;
 b=vQUda7Gi5KSG3T4gAWg/IPbsGZDcD8a4PqPTIOMjL6DG96vIq6U/DFV1g6bLbhobAB
 rzcTCLSIdLu59R78L+LBLy47vam+GstYjTFqx8kR3YiGQfjI6c/YJPnW/TXpkmOsOQjy
 z0TWumuwi5wZ5k4iUfk7sRVhTYAVPoOpvL1FUJcH5tTPFKATemJ5rg/KX2Gh/8nRVlUC
 pSJHz/Na/8/MEQ183ky+BpZs/7DVQvQXwtABh1lLSk/PtfNbdTIq4ipgzt0sddTA5Ki+
 /+JsewgIk+mzE0vrBXjA+Y64ql6ID4eECGBlQ+7iV4zTobn54Jy0QNk3+vJJp/zTUPjZ
 OJMw==
X-Gm-Message-State: AOAM53189643nIr+/e25SGyYYxPr95Hztqipg9vr4nuWUfUTsKYuUmM7
 kbEd3PREeJlNfFIxrR50hZ0=
X-Google-Smtp-Source: ABdhPJyOtkPtgINCWX0FQctNYRoxkgDB4hmYNd0PKEXGmnmVNGozr7VljjsOINpmwLI7aM5zFeG7LA==
X-Received: by 2002:a17:907:97d1:b0:6f8:5aa9:6f16 with SMTP id
 js17-20020a17090797d100b006f85aa96f16mr23472015ejc.587.1652870239996; 
 Wed, 18 May 2022 03:37:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214dc9sm778218ejc.47.2022.05.18.03.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 03:37:19 -0700 (PDT)
Message-ID: <204fa7f7-6b15-e77e-ecec-c06b1873ef5e@redhat.com>
Date: Wed, 18 May 2022 12:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/3] Misc AC97 clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1650706617.git.balaton@eik.bme.hu>
 <6ff58395-65a8-a50-90ee-571ccb131a8@eik.bme.hu>
 <255fbc8f-3b2d-f121-472-91f4d5e36b81@eik.bme.hu>
 <bc93f5ae-a9a-d9ef-4022-fcb0169863@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <bc93f5ae-a9a-d9ef-4022-fcb0169863@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/17/22 21:47, BALATON Zoltan wrote:
> On Mon, 9 May 2022, BALATON Zoltan wrote:
>> On Mon, 2 May 2022, BALATON Zoltan wrote:
>>> On Sat, 23 Apr 2022, BALATON Zoltan wrote:
>>>> During trying to implement via-ac97 I did some small clean ups to ac97
>>>> which is in this series. The via-ac97 is not working yet so that's not
>>>> included but these unrelated clean ups could be merged now.
>>>>
>>>> v3: Fixed misalignments and drop spaces before commas (Víctor Colombo)
>>>> v2: Added R-b and changes from Peter Maydell
>>>
>>> Ping?
>>>
>>> https://patchew.org/QEMU/cover.1650706617.git.balaton@eik.bme.hu/
>>
>> Ping2
>>
>> Gerd, are you getting these messages?
> 
> I got no reply to this so far so I think Gerd is not seeing my messages. 
> Could someone who can reach him bring it to his attention please?

I'll queue these in his stead.

Paolo


