Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FB2B540D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 23:03:21 +0100 (CET)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kemal-0000lV-I9
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 17:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kemYR-00085p-6m
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kemYN-0003ka-FL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605564048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTkGuDo0j3Atz/qt4g20i2I/LX3e3+7mF5t8VLZXd5s=;
 b=RjV+Q7e33RRP21x2HEfPb7KiBGcf6g4HGkjmHGRp8XfOTIP0A6mv5HB0jQNx2zB2CFx9ya
 WCdl6YzYgFISfBsFzUDDMHLqRSRAlVdotgT9ru/Gi3/WLKEuft2WGKth8VR6sFlFPGHS9F
 pJz3l+8RrXnUNbtxYV54a1gjciIkCI0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ABrMchXDNde-pKu4TSb1sQ-1; Mon, 16 Nov 2020 17:00:46 -0500
X-MC-Unique: ABrMchXDNde-pKu4TSb1sQ-1
Received: by mail-wr1-f69.google.com with SMTP id z13so11758995wrm.19
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 14:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LTkGuDo0j3Atz/qt4g20i2I/LX3e3+7mF5t8VLZXd5s=;
 b=XDJyY1+nwRr3O04YwF6xS+JJR/pciU8ZKEF1UYTa16oNBXjrLFxX8yUfC0Kbu64dCP
 RLNdrIo7jW8kTwqqoAVhtXkV0mdf9XhsUd3bcADWd5oIowAVOCIoIAmJVY8CFMRgJ2WT
 Cf+bTx4qjyo/tXFISHbvBFvkd1/zE7exDWFw8WBc5KaVIImU0LYVcoHPjFnwRs92NRdz
 Xjh1s9hske9GiJlYbCWmvgk+qIvSiwsHQyRtKNS8b/rF/86pt7D36HsC7blc58snHG/v
 3CR4LRvjlNVMiKT+pF5JlIpkl7MjjYgfvoohRwmJpqmCyQEIAak59XBce+KAs3Xnygp3
 ks8g==
X-Gm-Message-State: AOAM531OXO5KHgh+fsPdfcG/xcftAu/AY1V560Zqo6CohFGkf2PV+JZ1
 iwhrXgRSUIh2+RcvJSU1Es8HJfOfoMy3hxcxnASzttQXD0naeshJfw2YMBbXcQXKZLoeOKqDmh/
 RHXcPz3iYJWaHY8CKQtmSVv3a13tC3gShmDP8XTHbc3hYiuludyZO9c3hy/bw6fl3mEQ=
X-Received: by 2002:adf:fd06:: with SMTP id e6mr21935022wrr.206.1605564045588; 
 Mon, 16 Nov 2020 14:00:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8w58UiBhxOvxmDFvJHZerZgAvwafpQ/T7C/t9MQZkngp4JoYvhyRcwUhELbib3zzpJ+fIaQ==
X-Received: by 2002:adf:fd06:: with SMTP id e6mr21935011wrr.206.1605564045405; 
 Mon, 16 Nov 2020 14:00:45 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id h17sm18030262wrp.54.2020.11.16.14.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 14:00:44 -0800 (PST)
Subject: Re: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-8-hare@suse.de>
 <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
 <08795f50-2b4e-14cb-f5dd-709b054308c0@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d2a538ca-d865-07d7-1c8f-380633bd4b0e@redhat.com>
Date: Mon, 16 Nov 2020 23:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <08795f50-2b4e-14cb-f5dd-709b054308c0@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 20:05, Hannes Reinecke wrote:
>>> +    if (sreq->host_status == SCSI_HOST_OK) {
>>> +        SCSISense sense;
>>> +
>>> +        sreq->status = 
>>> scsi_sense_from_host_status(sreq->host_status, &sense);
>>> +        if (sreq->status == CHECK_CONDITION) {
>>> +            scsi_req_build_sense(sreq, sense);
>>> +        }
>>> +    }
>>
>> Should be != of course.
>>
> No.
> scsi_req_build_sense() transfers the sense code from the second argument
> into a proper SCSI sense. Which is only set if the status is 
> CHECK_CONDITION...

I mean sreq->host_status != SCSI_HOST_OK.  I might be wrong, but every 
other HBA is using that...

Paolo


