Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260373D023E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:45:19 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vg5-0008RV-L7
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5vdK-0005xr-TP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5vdH-00085S-RY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626810142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjSMvf2exlau77OyuO+FjklCtQD4yG0tzV3mIKmtfyI=;
 b=UtnWBvbxGLnSAjx49whSLuKzNnVGZDztYAtZx4WaUKqQOw0+kATeZmVyqLh08rm09IwB2J
 y4XLPpX0jpFDoMVIEL9xXwxBucvAxAI+E89YpU92qvBd/mHdlIQCkT7JaEmtkTJc6GKpgw
 D9fla5zcOqwUg1OjVUIOnsCkKYd5lSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-PFxUTLTgNnmFIL1i3hMb0Q-1; Tue, 20 Jul 2021 15:42:20 -0400
X-MC-Unique: PFxUTLTgNnmFIL1i3hMb0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso10717669wrr.18
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MjSMvf2exlau77OyuO+FjklCtQD4yG0tzV3mIKmtfyI=;
 b=iDT3uZ4j2Lk/QQHJAmbYAjkE1QUrQvAEk24oYGAuUmGBxwguiIb9REeT612/0rWiCI
 qmEQjvkoymBm2TdKT84cPlDhutn5NpJvxjPPOAuyQslBk/nziyxC++k5yX74zUuqNCuZ
 KG2I6leyi195MTGKyk39BMNw+ATJtPKmba2vByGPPtJfC4TEbXD3kQbf1jLeUttP/oOB
 Y3jtCi3ezFKiPSn5m5HkMtp6jQKOwTF9qqYDkIxJ2SsmGnMOTkhvcOcxffzvu/t2WmtH
 kCDfEkNhxuMoYIFpC+95n58jLJHpxK6Scb8zOzDVoRCKqxUwnwwDCzdNGLeLFYNzB3TS
 1Jnw==
X-Gm-Message-State: AOAM530VTWsa4/6LlLmAm/oNTHXEFNkgBGjD2eclXrygUxpKJzO5VvO7
 BYnSm72GyA1k36GZ7pgKNkYz5Xn4g/gEHw41aeE82l/ehSIH1ec1jayBlSaIU6QV95wXO69IJcd
 ZuhF4CEdhJo2MmNI=
X-Received: by 2002:a05:600c:4657:: with SMTP id
 n23mr32626571wmo.28.1626810139458; 
 Tue, 20 Jul 2021 12:42:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqP8sbOh7rDasY1zUZZyBFW7YBPTQ2vyk+L/HLZyyeEASohz1GXglISCPZm072zwNTA4BPgw==
X-Received: by 2002:a05:600c:4657:: with SMTP id
 n23mr32626543wmo.28.1626810139254; 
 Tue, 20 Jul 2021 12:42:19 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id x18sm23828029wrw.19.2021.07.20.12.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 12:42:18 -0700 (PDT)
Subject: Re: VFIO/vfio-user: specify NVMe namespace to boot from
To: Thanos Makatos <thanos.makatos@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <CH0PR02MB789873144D21EEEB6C501D298B159@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YO2BxLCOmNgRqIBl@stefanha-x1.localdomain>
 <CH0PR02MB7898B28B8D9A1C77336F1E3D8BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <199272f4-69f4-6c4c-e828-083c80cddf7a@redhat.com>
Date: Tue, 20 Jul 2021 21:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CH0PR02MB7898B28B8D9A1C77336F1E3D8BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 John Levon <john.levon@nutanix.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 9:10 PM, Thanos Makatos wrote:
>> On Mon, Jul 12, 2021 at 01:24:07PM +0000, Thanos Makatos wrote:
>>> We're working on implementing a virtual NVMe controller based on SPDK
>> and a multiprocess-qemu branch that uses the vfio-user. We're facing a
>> problem where the existing API doesn't allow us to tell QEMU from which
>> NVMe namespace we'd like SeaBIOS to boot from.
>>>
>>> How can we solve this problem? Can we add a parameter to the '-boot'
>> option, e.g. '-boot path=/devices/pciblah/...@namespace0'? AFAIK VFIO
>> should have the same problem.
>>>
>>> The corresponding SeaBIOS patch can be found in
>> https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/2Q7
>> NPH7TJNHK6JGPHQL7755HILO23ISN/
>>
>> Hi,
>> I have CCed Gerd Hoffmann on a hunch that he may have ideas.
>>
>> Yes, I think the path needs to include the Namespace ID similar to how
>> SCSI boot paths include the target/channel/LUN.
> 
> Just to make sure I've explained the problem correctly, what we need to fix is not specific to NVMe: we want to be able to boot from any PCI device, so we'd need something like '-boot /devices/pciblah'. Specifically, for NVMe we might want to specify the namespace (as we can't necessarily assume that the first one must be used), therefore we'd have to add the '/namespace0' bit. For other kinds of PCI devices, we'd have to append something different.
> 
> Would such a change be acceptable?

FWIW -boot path= sounds a good way to solve this problem,
as long as you succeed at not breaking the legacy bootdevice.c :)

> 
>>
>> When the SeaBIOS NVMe driver probes the controller is should discover
>> the available Namespaces and set up individual drives for each
>> Namespace. That would be analogous to virtio_scsi_add_lun().
> 
> Setting up an individual drive can easily exhaust SeaBIOS's limited memory, so it's better to either probe the specified namespace or probe the first active one. I've sent a patch here: https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/message/TKKUCH5PYZPXZG3NA2F5SALUFUVUYDZG/
> 
> 


