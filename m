Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E3969D0DE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:46:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8N5-0004Zg-6M; Mon, 20 Feb 2023 10:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU8Mj-0004Dy-5R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU8Me-0002Gz-LJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676907961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fxf5FwxJD0yeVwgdYtM0IRvrT2f4TgNRB3RC0xUUd8c=;
 b=D8G4I0gfg43YBGUX3qviortr+XZ2YI7gyc2g76ZW/liFutEho/gISeMR0KIQSUZoNXV79P
 p3saZAe3OREdIC23/OUojRIFVmV6POQtaA27vm84Vawk/ahb1iEYGC9nYWMQJ8ao92ycXv
 VuIu88CrrR4Hc7yqcvDCAV3KGRhdBAg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-QOeu6ElVNMKycxPKdh4ftQ-1; Mon, 20 Feb 2023 10:45:59 -0500
X-MC-Unique: QOeu6ElVNMKycxPKdh4ftQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m4-20020a05600c3b0400b003dfeeaa8143so638702wms.6
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fxf5FwxJD0yeVwgdYtM0IRvrT2f4TgNRB3RC0xUUd8c=;
 b=FdGgDZqttgTNN5R51+nMTwPn7Twzki4sCPWmFTre5oboNxztgJAhAdiGtfPGCcgIQH
 N9ryrMSmgArKlziBvg9OYv0qowLDxVt8PO4qOTPKKrCGBjMsuCepk1hLUzyinAJXNGHB
 qbIRIKehvyLvXiRba16nRW2c2gqLYfAt8XyUMvEGcyUzzs/oa0al9d9xihJQo8SGYqJo
 8IzbUFZ5jDn0phc5nJBBQn5sZKmW1GYJo+ZH7chYRQC9EjL4ETzoKBB3DlsmEEa1vl+2
 irKMhH2R7egXINjBAymLZdexZV9g/LeggMIriwPU90Y1u7bPaYBMpuXa7M5J6nSQrTZc
 /C2Q==
X-Gm-Message-State: AO0yUKWvrP1siGyXVtU+2M8i2eZjcx1QLj+ICYKhPNVeTA8+SDPtRYN5
 DZwxlzrkBdq1/KjBjXxNyYRNOcG+vEMrcDd2WZACHkahQL/XoH8xpBWu4tcJiL2hOtygvjs+FkE
 hdKL4VkhsUV6jCTk=
X-Received: by 2002:a05:600c:43d5:b0:3df:d8c5:ec18 with SMTP id
 f21-20020a05600c43d500b003dfd8c5ec18mr6651233wmn.13.1676907957910; 
 Mon, 20 Feb 2023 07:45:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/dHhrhXMci1Ma/dlUeEejSgTSf2zec1Bo3+X07niwqNDGfZvwMbyQxn33EaS25B/Yqo5v+gg==
X-Received: by 2002:a05:600c:43d5:b0:3df:d8c5:ec18 with SMTP id
 f21-20020a05600c43d500b003dfd8c5ec18mr6651215wmn.13.1676907957512; 
 Mon, 20 Feb 2023 07:45:57 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003e4326a6d53sm3408761wmb.35.2023.02.20.07.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 07:45:57 -0800 (PST)
Message-ID: <837e025f-2307-225d-2b87-5f58ccda183a@redhat.com>
Date: Mon, 20 Feb 2023 16:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/1] pc-bios: Support List-Directed IPL from ECKD DASD
Content-Language: en-US
To: Jared Rossi <jrossi@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: frankja@linux.ibm.com, jjherne@linux.ibm.com
References: <20230130212411.1167822-1-jrossi@linux.ibm.com>
 <62db22bc-2787-6c2d-6fad-9b4834ac12c4@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <62db22bc-2787-6c2d-6fad-9b4834ac12c4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/02/2023 16.13, Jared Rossi wrote:
> Hi,
> 
> Pinging this patch since v2.26.0 of s390-tools adds ECKD DASD list-directed IPL.
> This patch set allows QEMU to utilize that new boot pointer format.
> Any feedback about what needs to be changed for acceptance is much appreciated.

Where did you send your patches to? I can't find it in neither my qemu-s390x 
nor my qemu-devel mailing list folders.

  Thomas


> 
> On 1/30/23 4:24 PM, Jared Rossi wrote:
> 
>> Add support for List-Directed IPL (LD-IPL) type pointers.
>>
>> We check for a boot record indicating LD-IPL and use it if it is valid,
>> otherwise we use the CCW CDL or LDL format as usual. When a block is accessed
>> during IPL the block number is first calculated based on the cylinder, head,
>> and record numbers included in the block pointer; if LD-IPL has been initiated
>> then each pointer will be interpreted using the new format.
>>
>> For simplicity, there is no choice presented to forcibly use CCW-IPL if LD-IPL
>> is available.  Because both sets of pointers ultimately go to the same
>> kernel/initrd, using CCW- or LD-IPL is transparent to the user.
>>
>> One aspect of the user experience that does change is the availability of the
>> interactive boot menu when a loadparm is not specified.  For the existing
>> CCW-IPL, when the user does not specify a loadparm they are presented with a
>> list of boot options; however, this list is only written in the old style
>> pointers.  Therefore, if no loadparm is specified, and LD-IPL is supported, the
>> default boot option will be used automatically.
>>
>> Jared Rossi (1):
>>    pc-bios: Add support for List-Directed IPL from ECKD DASD
>>
>>   pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
>>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>>   2 files changed, 148 insertions(+), 39 deletions(-)
>>


