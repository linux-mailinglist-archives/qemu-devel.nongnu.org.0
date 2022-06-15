Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88154C3B4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:41:17 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1OaP-0002Q4-0l
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o1OKZ-0005SI-FL
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o1OKW-0000Xr-Dg
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655281486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydi0jnoHBILNtdknejIZiQzGVD6PWVGV6R5nAHEWTbQ=;
 b=HrUSUIDznLdVgqdFhUomGgo61VW9iZ3jrij8tLgmydgIcsI9Dyc3yUa0MpQVTRuSqtIPre
 kbVbvHPMfQFiwG42Po+2ObxdwLPj9WJo1miqxFVgUkfiBLv/JZNsldyfDx+e76Qr0RQT66
 /jqbnwGEJTxSedC9thxpuMghNUwezf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-RVjy79lnPfSUtH5WseboWg-1; Wed, 15 Jun 2022 04:24:37 -0400
X-MC-Unique: RVjy79lnPfSUtH5WseboWg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j31-20020a05600c1c1f00b0039c481c4664so4787893wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ydi0jnoHBILNtdknejIZiQzGVD6PWVGV6R5nAHEWTbQ=;
 b=qmYXkM9UA1FJBvINArc6Y1XVOdtYPK+SXK+272B0NbUk4rKa+d3b8x6kcJAqEGa5xw
 m3EPaXjEUJpMyoaIYSLoEmyUdTuyB9HllQTAdbINiWiA7WKbZVSpO1GvbI7Cysng3mHG
 8smqD8vOfSaeudsxYdpgBJ2bbDvbZliJnitutgokVPn+rIYV0lTdALZwknrpWLsKHuQ/
 J4N1Mpb4pVDsIST6aAALiict9b/m/8TrsAe9ZN99zEhjotPsntMQgIX96FMdwlfkN1rW
 I8YdJNO7/TakjodCFnrRFkeUkbxNELZ6in8sbOlxrvZsetxizGyxXzIB9dvJZ+uZ7Mrc
 aPPg==
X-Gm-Message-State: AJIora8OAo+U44BKlAvsujWlQZjt0YSzo9BG3inuI9ZiVEYxfHsN4xW+
 VXzC4hx/AgBRyorbk2rlCBT5zc2lvH2CyTEA7AyHUJf2ANDv4zWhBmmMWhe8jPwTLJFyR/EMXF9
 ItUDP7uvWEfo+XXg=
X-Received: by 2002:a05:6000:1b03:b0:210:3372:2bd9 with SMTP id
 f3-20020a0560001b0300b0021033722bd9mr8916358wrz.704.1655281476485; 
 Wed, 15 Jun 2022 01:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uOCyvJQxkqLVxPoZw/CZMlDvTO2x7T4Z4H1im0g0wG3kSPitdJX4AKN3DGkNBCfWavhH+s0Q==
X-Received: by 2002:a05:6000:1b03:b0:210:3372:2bd9 with SMTP id
 f3-20020a0560001b0300b0021033722bd9mr8916334wrz.704.1655281476268; 
 Wed, 15 Jun 2022 01:24:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:2700:1d28:26c3:b272:fcc6?
 (p200300cbc70a27001d2826c3b272fcc6.dip0.t-ipconnect.de.
 [2003:cb:c70a:2700:1d28:26c3:b272:fcc6])
 by smtp.gmail.com with ESMTPSA id
 r66-20020a1c2b45000000b0039c97cc82fbsm1569762wmr.15.2022.06.15.01.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:24:35 -0700 (PDT)
Message-ID: <0fe9723a-620a-f388-68a8-c6a11f8aa3ca@redhat.com>
Date: Wed, 15 Jun 2022 10:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Content-Language: en-US
To: Julia Suvorova <jusual@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
 <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
 <CAMDeoFV3SEWv5gAUd-ZJ=pGw3=JkHR9pOztkytGr1tRhM_uBNw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMDeoFV3SEWv5gAUd-ZJ=pGw3=JkHR9pOztkytGr1tRhM_uBNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 14.06.22 14:13, Julia Suvorova wrote:
> On Tue, Jun 14, 2022 at 11:50 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 14.06.22 10:54, Igor Mammedov wrote:
>>> On Mon, 13 Jun 2022 16:09:53 +0100
>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>
>>>> On Mon, Jun 13, 2022 at 05:01:10PM +0200, Julia Suvorova wrote:
>>>>> On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>>
>>>>>> On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:
>>>>>>> In the ACPI specification [1], the 'unarmed' bit is set when a device
>>>>>>> cannot accept a persistent write. This means that when a memdev is
>>>>>>> read-only, the 'unarmed' flag must be turned on. The logic is correct,
>>>>>>> just changing the error message.
>>>>>>>
>>>>>>> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
>>>>>>>
>>>>>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>>>>>>> ---
>>>>>>>  hw/mem/nvdimm.c | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>>
>>>>> It seems like Xiao is not active, whose tree should this patch go to?
>>
>> Is that a temporary or a permanent thing? Do we know?
> 
> No idea. But his last signed-off was three years ago.

I sent a patch to Xiao, asking if he's still active in QEMU. If I don't
get a reply this week, I'll move forward with proposing an update to
MAINTAINERS as described.

-- 
Thanks,

David / dhildenb


