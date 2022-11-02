Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF4615C7D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 07:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq7b3-0005Pr-7h; Wed, 02 Nov 2022 02:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7az-0005PX-Ms
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 02:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7aw-0001uk-Cc
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 02:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667371868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HX3Gur57PAsm2IB2vnm030hSlEy+v7Mp+nt58xnRZtw=;
 b=TLZm5N9k10ZFqxn5dy2su0GxhKpETqptrKf9jIkXoSLum21TNWJvDwmFaY6yIiNUJQHkEI
 28yFuj805OWKsbT9p5TNYzgaGuGCx0K67D44VUoAU0qGr7M9xvxevFi9AilT++vbSa6iqY
 Cl3G6NZnx+d7El264ax0q3qvG8tjw0Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-IcmT7YQpPy2BmVe_iB5l3g-1; Wed, 02 Nov 2022 02:51:07 -0400
X-MC-Unique: IcmT7YQpPy2BmVe_iB5l3g-1
Received: by mail-qt1-f197.google.com with SMTP id
 fp9-20020a05622a508900b003a503ff1d4cso10241429qtb.22
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 23:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HX3Gur57PAsm2IB2vnm030hSlEy+v7Mp+nt58xnRZtw=;
 b=5ZzYgCvzJX5GPfVkU2yvJ7fOpfoRKUV9xCt/MmcXeXCA7HF4klg58dToswB5uivL53
 0S/eljHJ33Dp0DsodoDtMXVOSPRK4II8wVzAD/IKVkz6STuI+2wamkm6nNWiCIWdmLNg
 JD6iiU53S1r4IZTpFd/GdMF31ju7re94kfQ6/evCq/Rbt8fnvBIo1df9q+NjFDZTjyAK
 LOLRC+FdGKpVcamMwz8A2Nw9lH+yWLzDnLTbs3TuQlEgSgBkiZne0tqK86Oxx2/UfnZN
 jjymYqdUHhjiekCX2YrNMdSCUzbCpyqpWLS+xEGL88ww1ivdgaoRkJ2gNMxTm40/iHLs
 6Acw==
X-Gm-Message-State: ACrzQf2SwOBgi10xZVlec8vgY/a6y2IpJAC57jKwR9FV/5OpB2cja2FX
 rZOJfWsbzpRx4TSjHEDyKVcuTz/yjjkZgZJop+zK833eg7q+Ucw8IGcCOo6Rx10cpOyWQLwtPKM
 w4bctCnesqi8hMrs=
X-Received: by 2002:a05:622a:d4:b0:39c:c755:45bd with SMTP id
 p20-20020a05622a00d400b0039cc75545bdmr18242706qtw.112.1667371866742; 
 Tue, 01 Nov 2022 23:51:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5osNyycu3gByouoI2D4sv+u6I6kOGRDV2DYNfMqM/AcZP6jXgwZv//mcXnJ4UtvEazq8yxRg==
X-Received: by 2002:a05:622a:d4:b0:39c:c755:45bd with SMTP id
 p20-20020a05622a00d400b0039cc75545bdmr18242700qtw.112.1667371866530; 
 Tue, 01 Nov 2022 23:51:06 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 g4-20020ac81244000000b0039cb9b6c390sm6144398qtj.79.2022.11.01.23.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 23:51:05 -0700 (PDT)
Message-ID: <2cc4aef0-a177-c3a9-03a5-062935261a58@redhat.com>
Date: Wed, 2 Nov 2022 07:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/4] hw/usb: fix tab indentation
Content-Language: en-US
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Cc: berrange@redhat.com, vr_qemu@t-online.de
References: <cover.1666707782.git.amarjargal16@gmail.com>
 <6c993f57800f8fef7a910074620f6e80e077a3d1.1666707782.git.amarjargal16@gmail.com>
 <52cab5c6-ffa8-93fa-7080-e8d0fa7a5729@redhat.com>
 <bf18e166-4d9d-0371-5598-df54df1f9442@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bf18e166-4d9d-0371-5598-df54df1f9442@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/2022 20.10, Amarjargal Gundjalam wrote:
> 
> On 26/10/22 00:22, Thomas Huth wrote:
>> On 25/10/2022 16.28, Amarjargal Gundjalam wrote:
>>> The TABs should be replaced with spaces, to make sure that we have a
>>> consistent coding style with an indentation of 4 spaces everywhere.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
>>> ---
>>>   hw/usb/dev-hub.c           |   82 +-
>>>   hw/usb/dev-network.c       |  286 +++----
>>>   hw/usb/dev-wacom.c         |    4 +-
>>>   hw/usb/hcd-musb.c          |  328 ++++----
>>>   hw/usb/quirks-pl2303-ids.h |  180 ++--
>>>   include/hw/usb.h           |  100 +--
>>>   include/hw/usb/dwc2-regs.h | 1608 ++++++++++++++++++------------------
>>>   7 files changed, 1294 insertions(+), 1294 deletions(-)
...
>>>   diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
>>> index 8323650c6a..7177c17f03 100644
>>> --- a/hw/usb/dev-wacom.c
>>> +++ b/hw/usb/dev-wacom.c
>>> @@ -36,8 +36,8 @@
>>>   #include "qom/object.h"
>>>     /* Interface requests */
>>> -#define WACOM_GET_REPORT    0x2101
>>> -#define WACOM_SET_REPORT    0x2109
>>> +#define WACOM_GET_REPORT    0x2101
>>> +#define WACOM_SET_REPORT    0x2109
>>>     struct USBWacomState {
>>>       USBDevice dev;
>>> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
>>> index 85f5ff5bd4..6929b026b1 100644
>>> --- a/hw/usb/hcd-musb.c
>>> +++ b/hw/usb/hcd-musb.c
>>> @@ -28,227 +28,227 @@
>>>   #include "hw/hw.h"
>>>     /* Common USB registers */
>>> -#define MUSB_HDRC_FADDR        0x00    /* 8-bit */
>>> -#define MUSB_HDRC_POWER        0x01    /* 8-bit */
>>> -
>>> -#define MUSB_HDRC_INTRTX    0x02    /* 16-bit */
>>> -#define MUSB_HDRC_INTRRX    0x04
>>> -#define MUSB_HDRC_INTRTXE    0x06
>>> -#define MUSB_HDRC_INTRRXE    0x08
>>> -#define MUSB_HDRC_INTRUSB    0x0a    /* 8 bit */
>>> -#define MUSB_HDRC_INTRUSBE    0x0b    /* 8 bit */
>>> -#define MUSB_HDRC_FRAME        0x0c    /* 16-bit */
>>> -#define MUSB_HDRC_INDEX        0x0e    /* 8 bit */
>>> -#define MUSB_HDRC_TESTMODE    0x0f    /* 8 bit */
>>> +#define MUSB_HDRC_FADDR         0x00    /* 8-bit */
>>> +#define MUSB_HDRC_POWER         0x01    /* 8-bit */
>>> +
>>> +#define MUSB_HDRC_INTRTX        0x02    /* 16-bit */
>>> +#define MUSB_HDRC_INTRRX        0x04
>>> +#define MUSB_HDRC_INTRTXE       0x06
>>
>> Sorry for not noticing it earlier, and the problem is pre-existing and not 
>> related to your patches, but in case you respinning again, my git is 
>> complaining here about the spaces at the end of the line:
>>
>> .git/rebase-apply/patch:524: trailing whitespace.
>> #define MUSB_HDRC_INTRTXE       0x06
>>
>> (maybe this could also be fixed by the maintainer when picking up the patch)
...
>>
> Should I fix them and submit a new version?

No, let's wait for the maintainer (Gerd) first to decide whether this should 
be fixed in this patch or not.

  Thomas


