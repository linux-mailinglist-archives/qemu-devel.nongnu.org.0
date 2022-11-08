Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C2620F3D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMv5-0000MD-IO; Tue, 08 Nov 2022 06:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osMv4-0000Lz-AJ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osMv2-0005Gm-Jp
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667907448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8Ny0tfZtrLUzV1Gw5xD+ZYbWpvP5UAl7EKGBGmvSho=;
 b=VsxLqixC5S8WQaPUbiVwEIlF/M3uaGmqVQUebepOQnV5db18bKzdvycFQ3ocbsAyZrWjES
 GOnh/ebb113eVVrYBapE6ViKjeoTbYtZKsc4t9rKTh5yoNEmgR/ZYDUetT9MIs0hE0/bnT
 Ymdlwf7U+4NcO+7mgLFH21uydXzZqgY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-HxQtWLyHNWW3hVDeA9DImQ-1; Tue, 08 Nov 2022 06:37:26 -0500
X-MC-Unique: HxQtWLyHNWW3hVDeA9DImQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so3749821wme.8
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8Ny0tfZtrLUzV1Gw5xD+ZYbWpvP5UAl7EKGBGmvSho=;
 b=Pg+3k2Y/aXJvBtg/u0/9xVGceHDk5lWGFFYWJS9Juz91ivduYeTHmoCfv09X2b3eNF
 jciAG5SHo+vQlR6MIoELjx4tONCut5Vo7rbHM9wftBsfBlq1qTu3ZiBMQEDHBZBCCsJ/
 X2LnlOqX9a4fmYUzkGF472P//h6BcOpmWcNo+Cid8m9Fd9lsWz/Vqa7TobGJaNjq7dPE
 GhhsWPoAuSTyShmCq0iZHnfxB5aa95BC69RTJcZ3Cy/qM6gR46p2KuNJN3cMn2B5vqNb
 DvCgLXr7kxWtRZa0zpYgAWiYn/VSpU7WxFb/cBkmxIc3kLDN8uDYjWlJLLqLYbWg1M65
 f7Lw==
X-Gm-Message-State: ACrzQf06GqF3E9HHE6tGDdECj4f9UBcLhkhTtkw23ZWEg9/NmZm64JbH
 tj0uE2n61s4o4ENF7vJzCGohDduy9VYzjd2eZE1nJg9FmJlLmL2ms/MNj2W7+tgZTX6lkJgRFBU
 MNtpS710JzOiZ3SY=
X-Received: by 2002:a05:600c:15d6:b0:3cf:8e4b:957e with SMTP id
 v22-20020a05600c15d600b003cf8e4b957emr19099929wmf.118.1667907445648; 
 Tue, 08 Nov 2022 03:37:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7kZ0KpUxT3L7JR8k1MHeUQmWiqCPo1q3Du+HZeXaApFq7b75Pw4sEyDi0q5FByaxrCeBAmSQ==
X-Received: by 2002:a05:600c:15d6:b0:3cf:8e4b:957e with SMTP id
 v22-20020a05600c15d600b003cf8e4b957emr19099922wmf.118.1667907445415; 
 Tue, 08 Nov 2022 03:37:25 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a8434530bbsm15501328wms.13.2022.11.08.03.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 03:37:24 -0800 (PST)
Message-ID: <e35226a6-ad4b-77aa-36b4-7d262b53e178@redhat.com>
Date: Tue, 8 Nov 2022 12:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/4] hw/usb: fix tab indentation
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Cc: berrange@redhat.com, vr_qemu@t-online.de
References: <cover.1666707782.git.amarjargal16@gmail.com>
 <6c993f57800f8fef7a910074620f6e80e077a3d1.1666707782.git.amarjargal16@gmail.com>
 <52cab5c6-ffa8-93fa-7080-e8d0fa7a5729@redhat.com>
 <bf18e166-4d9d-0371-5598-df54df1f9442@gmail.com>
 <2cc4aef0-a177-c3a9-03a5-062935261a58@redhat.com>
In-Reply-To: <2cc4aef0-a177-c3a9-03a5-062935261a58@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/11/2022 07.51, Thomas Huth wrote:
> On 31/10/2022 20.10, Amarjargal Gundjalam wrote:
>>
>> On 26/10/22 00:22, Thomas Huth wrote:
>>> On 25/10/2022 16.28, Amarjargal Gundjalam wrote:
>>>> The TABs should be replaced with spaces, to make sure that we have a
>>>> consistent coding style with an indentation of 4 spaces everywhere.
>>>>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>
>>>> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
>>>> ---
>>>>   hw/usb/dev-hub.c           |   82 +-
>>>>   hw/usb/dev-network.c       |  286 +++----
>>>>   hw/usb/dev-wacom.c         |    4 +-
>>>>   hw/usb/hcd-musb.c          |  328 ++++----
>>>>   hw/usb/quirks-pl2303-ids.h |  180 ++--
>>>>   include/hw/usb.h           |  100 +--
>>>>   include/hw/usb/dwc2-regs.h | 1608 ++++++++++++++++++------------------
>>>>   7 files changed, 1294 insertions(+), 1294 deletions(-)
> ...
>>>>   diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
>>>> index 8323650c6a..7177c17f03 100644
>>>> --- a/hw/usb/dev-wacom.c
>>>> +++ b/hw/usb/dev-wacom.c
>>>> @@ -36,8 +36,8 @@
>>>>   #include "qom/object.h"
>>>>     /* Interface requests */
>>>> -#define WACOM_GET_REPORT    0x2101
>>>> -#define WACOM_SET_REPORT    0x2109
>>>> +#define WACOM_GET_REPORT    0x2101
>>>> +#define WACOM_SET_REPORT    0x2109
>>>>     struct USBWacomState {
>>>>       USBDevice dev;
>>>> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
>>>> index 85f5ff5bd4..6929b026b1 100644
>>>> --- a/hw/usb/hcd-musb.c
>>>> +++ b/hw/usb/hcd-musb.c
>>>> @@ -28,227 +28,227 @@
>>>>   #include "hw/hw.h"
>>>>     /* Common USB registers */
>>>> -#define MUSB_HDRC_FADDR        0x00    /* 8-bit */
>>>> -#define MUSB_HDRC_POWER        0x01    /* 8-bit */
>>>> -
>>>> -#define MUSB_HDRC_INTRTX    0x02    /* 16-bit */
>>>> -#define MUSB_HDRC_INTRRX    0x04
>>>> -#define MUSB_HDRC_INTRTXE    0x06
>>>> -#define MUSB_HDRC_INTRRXE    0x08
>>>> -#define MUSB_HDRC_INTRUSB    0x0a    /* 8 bit */
>>>> -#define MUSB_HDRC_INTRUSBE    0x0b    /* 8 bit */
>>>> -#define MUSB_HDRC_FRAME        0x0c    /* 16-bit */
>>>> -#define MUSB_HDRC_INDEX        0x0e    /* 8 bit */
>>>> -#define MUSB_HDRC_TESTMODE    0x0f    /* 8 bit */
>>>> +#define MUSB_HDRC_FADDR         0x00    /* 8-bit */
>>>> +#define MUSB_HDRC_POWER         0x01    /* 8-bit */
>>>> +
>>>> +#define MUSB_HDRC_INTRTX        0x02    /* 16-bit */
>>>> +#define MUSB_HDRC_INTRRX        0x04
>>>> +#define MUSB_HDRC_INTRTXE       0x06
>>>
>>> Sorry for not noticing it earlier, and the problem is pre-existing and 
>>> not related to your patches, but in case you respinning again, my git is 
>>> complaining here about the spaces at the end of the line:
>>>
>>> .git/rebase-apply/patch:524: trailing whitespace.
>>> #define MUSB_HDRC_INTRTXE       0x06
>>>
>>> (maybe this could also be fixed by the maintainer when picking up the patch)
> ...
>>>
>> Should I fix them and submit a new version?
> 
> No, let's wait for the maintainer (Gerd) first to decide whether this should 
> be fixed in this patch or not.

Seems like Gerd is currently away from keyboard, so I dared to pick up patch 
1, 3 and 4 for my current pull request (and fixed the white spaces at the 
line endings in patch 4). For patch 2, I think I'd prefer to wait for Gerd's 
feedback first what to do best with the fmopl.c file.

  Thomas


