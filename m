Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA238A439
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 12:01:45 +0200 (CEST)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljfUs-00065y-Pe
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 06:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljfTK-0005Cq-IJ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljfTI-0004d2-Ds
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621504802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soJikgRAvJEbzQ2zOKRv46JF4OIJLWe8tjByVE1XiAY=;
 b=evKsoMPG4+lFt39EctnEsmgvOZXvQm/9knm2zolz1W3dc9LqWXIeWT9hulzfvph8wkHqT3
 z9ZigIXaWTXLpjUoKVyaFRmuUOfbZIiws1nvwhdUdqZ0uO6MqcmQSaPDrl0MNfC68a9Frz
 kg6gy8a8p1guilyECtYVoiFvm1Wb4TE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-kWv2EApMMGGes06l2y-TTQ-1; Thu, 20 May 2021 06:00:00 -0400
X-MC-Unique: kWv2EApMMGGes06l2y-TTQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a9-20020adfc4490000b0290112095ca785so3247418wrg.14
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 03:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soJikgRAvJEbzQ2zOKRv46JF4OIJLWe8tjByVE1XiAY=;
 b=TWq3Zc5SoAxKmABkuj2tVS0a4vci3lbGKPxrBEgYRv/q/VHJL6hbe6G+ZIeb3/P7rX
 IoOv/OvEDfpKsh1NSLK6TBqE6QldDUclZDLJyLulF1pYrdKptOrzTGrmZdOZdTrfWt7W
 iHK9Qmm9bjx9O8/MF+nmS7KxSq34+kmj4N9jyhhnbsRp9+dpEyPglwNN+RTeUameBenW
 fTfR1H6osRtff1YZhM2jAPSdDekQpO8XZUUi43fcGz3Xzpac45uf/740dqEf7sDaUKx/
 34JdMxCReYAaZ+rrFGoh28Jj3/EoKVOVGb+O/nKkmkp7Er9RkKbQIqedJnkckVw9hqeQ
 IQ2w==
X-Gm-Message-State: AOAM532kQPfhqSFfmF1fFi0EWf6iN3xu47GHcSPsD03tNnIgJYpRoB8k
 9qLxcH1/M3R941JtfYSknYy5SIOu59GfkydpqhW6tr4gj8QqlAj/VF1jLqBgCZM9w8Z9bfw0Zny
 VgksQuJU3xfhZd/A=
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr3367794wrz.201.1621504799017; 
 Thu, 20 May 2021 02:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR+d72nCbh7B6x80XJHlC8ofbGCEYhUIPBVjuaPwrYXxj3DVL05lZ1EZ4k3EVdHzlPwLIuuw==
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr3367786wrz.201.1621504798823; 
 Thu, 20 May 2021 02:59:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f13sm2747649wrt.86.2021.05.20.02.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 02:59:57 -0700 (PDT)
Subject: Re: [PATCH v6 0/5] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210519163448.2154339-1-philmd@redhat.com>
 <07fb087d-38dd-15ce-b04f-2dbc06a103e4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <405241a2-f512-b600-b97c-cc9019fa2162@redhat.com>
Date: Thu, 20 May 2021 11:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <07fb087d-38dd-15ce-b04f-2dbc06a103e4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/21 23:39, John Snow wrote:
> On 5/19/21 12:34 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>
>> This series clean that by extracting each device in its own file,
>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
>>
>> Since v5:
>> - Added stub (thuth)
>>
>> Since v4:
>> - Dropped machine patches for later due to DMA jazz issue
>>
>> Since v3:
>> - Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)
>>
>> Since v2:
>> - rebased
>>
>> Since v1:
>> - added missing "hw/block/block.h" header (jsnow)
>> - inlined hardware specific calls (Mark)
>> - added R-b/A-b tags
>>
>> Regards,
>>
>> Phil.
>>
> 
> Tentatively staged to floppy branch again.
> 
> Allowing Paolo/Thomas et al a chance to reject 01/05 it before sending a 
> PR.
> 
> (I am also, unrelatedly, waiting on PJP to send more patches for FDC and 
> I will collect all the FDC patches together and send. Thanks!)

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


