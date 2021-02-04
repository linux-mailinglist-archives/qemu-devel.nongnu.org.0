Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB530F40D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:44:23 +0100 (CET)
Received: from localhost ([::1]:46982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7evm-0005yY-CQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7euy-0005TQ-N5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:43:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7eux-0000Ot-5Y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612446210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFWhTpLd2/gwhN22gIam3Xo0mOxIYh/4or06cKui9sc=;
 b=LrpuWg0Yw/CXqtMktvYIXaWvqOt3cqwFgsvkCDUHpoSOAPyGLIu55TR9xbr2nx94YHfZwo
 KTILluBBqS9V4D7N+mqTCVS3CIRml6wx8sJjbJfwjP56UWxnGfUDDkoQCX3qHro0VZcc8Z
 wa3LNx5Ubl0oIDhxomU8e1XpgeJHm6E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-v_N2yYYnNAytClwAxCez0Q-1; Thu, 04 Feb 2021 08:43:22 -0500
X-MC-Unique: v_N2yYYnNAytClwAxCez0Q-1
Received: by mail-ed1-f72.google.com with SMTP id o8so2803974edh.12
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 05:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PFWhTpLd2/gwhN22gIam3Xo0mOxIYh/4or06cKui9sc=;
 b=khlnjN0fNzfQjsmkox3ONUfQ1yh+3kUvgIwN1QCfoy6EUykhk7XKosaX0eT8j5Ffut
 3LPx2R7bMLReH9n1QbmJj9putdVw3XCSqhUAIeAxgrGBtnnCzivGHAcqEu3Bi0YoOuzQ
 oyUqmhqjJ31s1rUSlMjChIVWkHlRLbZYffcgd8QoZJs8Z/UwsCbG98c/xm58zKZ/RJHo
 Uld8kdLxluIub8fxSVXU4UAxh9N0vw4D52hbO2lWepJjX+eGIzuK32UWYeZfRYEOpR15
 hv7PH/9EPvbtn0pBoL61jt/jQrKGiILTG1fsOesvVXNcZ91rbM0lR3HlQxfA6Y78D2Jo
 EVLw==
X-Gm-Message-State: AOAM531w3Gfpquiah8ac/olalmOH6wkG2mpkh/W5mhkv8N4uaQIxX3G3
 56U/mgNlFEVdv++HGrIW2adFQQbN6QsZbMFJ9CBpFYzNX+eXvvNj7KjHxM+J3f5f2A/YMvoPpHV
 V4v85upqafTa3C7k=
X-Received: by 2002:a50:8b66:: with SMTP id l93mr7773110edl.384.1612446201786; 
 Thu, 04 Feb 2021 05:43:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaiBhsiU8rP4uVrmS3V0k4rpOx9Q6/O8fnqhWjJUQJ+QD8eyo2z1FXGyVwwPUrydgxsO59iA==
X-Received: by 2002:a50:8b66:: with SMTP id l93mr7773104edl.384.1612446201677; 
 Thu, 04 Feb 2021 05:43:21 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id er1sm2498155ejc.69.2021.02.04.05.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 05:43:20 -0800 (PST)
Subject: Re: [PATCH v2 03/20] vhost-user-gpu: use an extandable state enum for
 commands
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-4-marcandre.lureau@redhat.com>
 <b820bcfc-4e98-8a33-23ab-f76548443a51@redhat.com>
Message-ID: <c3ae91d7-5f39-b706-12e2-4e0bbc46e143@redhat.com>
Date: Thu, 4 Feb 2021 14:43:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b820bcfc-4e98-8a33-23ab-f76548443a51@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 12:26 PM, Philippe Mathieu-Daudé wrote:
> On 2/4/21 11:52 AM, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Introduce a pending state for commands which aren't finished yet, but
>> are being handled. See following patch.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  contrib/vhost-user-gpu/vugpu.h          | 8 +++++++-
>>  contrib/vhost-user-gpu/vhost-user-gpu.c | 8 ++++----
>>  contrib/vhost-user-gpu/virgl.c          | 2 +-
>>  3 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
>> index 86f3ac86aa..04d5615812 100644
>> --- a/contrib/vhost-user-gpu/vugpu.h
>> +++ b/contrib/vhost-user-gpu/vugpu.h
>> @@ -129,12 +129,18 @@ typedef struct VuGpu {
>>      QTAILQ_HEAD(, virtio_gpu_ctrl_command) fenceq;
>>  } VuGpu;
>>  
>> +enum {
>> +    VG_CMD_STATE_NEW,
> 
> Maybe VG_CMD_STATE_STARTING?
> 
>> +    VG_CMD_STATE_PENDING,
> 
> Maybe introduce VG_CMD_STATE_PENDING in the
> patch using it.
> 
>> +    VG_CMD_STATE_FINISHED,
>> +};
> 
> Can we use a typedef ...
> 
>> +
>>  struct virtio_gpu_ctrl_command {
>>      VuVirtqElement elem;
>>      VuVirtq *vq;
>>      struct virtio_gpu_ctrl_hdr cmd_hdr;
>>      uint32_t error;
>> -    bool finished;
>> +    int state;
> 
> ... and use it here?
> 
> Or directly declare in place:
> 
>        enum {
>            VG_CMD_STATE_STARTING,
>            VG_CMD_STATE_PENDING,
>            VG_CMD_STATE_FINISHED,
>        } state;
> 
>>      QTAILQ_ENTRY(virtio_gpu_ctrl_command) next;
>>  };
>>  
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Since Gerd was willing to queue v1, feel free to ignore my
comments at this point. R-b stands.


