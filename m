Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4664038A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 10:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12Xa-0005SQ-O6; Fri, 02 Dec 2022 04:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p12XT-0005S5-Le
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p12XR-0003bD-Ok
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669974056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7Pv3fcwpCV7kMf2iBHQByj1cHtMUsRKepgQR8N5LOQ=;
 b=Hw5b9ynyp4PJJo/49z5s/kBcSCI97GoMfMpwdox6ulaC1LvR3geRsuQmRUR2sy+gst/mK3
 lybyIfSHySnJMnqYwW1i0aTvH790EmnW+nBGK8Na664tzNjgsHGajgDNU0jziJ+/aP4Ep+
 J6JXKjZEIUz3yEY/xTxAlNdFEBMoElw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-Fah2WjpNMtCWurcuBELGdw-1; Fri, 02 Dec 2022 04:40:53 -0500
X-MC-Unique: Fah2WjpNMtCWurcuBELGdw-1
Received: by mail-wm1-f71.google.com with SMTP id
 6-20020a1c0206000000b003d082ecf13cso901698wmc.3
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 01:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7Pv3fcwpCV7kMf2iBHQByj1cHtMUsRKepgQR8N5LOQ=;
 b=LTkwmNShQOOjopylT0WS7OoCo4AEaPY/w+EiNNIw7syYsiKNZo9sEqTdQZyGEMXU58
 zgt//vKJYLa6bvVEGtQrNz1Ptv++iayWJSmymRCyJxplA8G5eR2zgRJuslBiqGe8Lcpw
 xMtzukvghyMx0RjkliUAoAfQ4kJBspeME4ts3d95W9VFSqgUjo4Nmw1wBzHVl6E9kxEV
 ifj7NhnYX3UItQ1OU7hfRfMV/wuC7FtXebSMr2MTYBcUhEU01pXEVcD66qBD6wr2eetG
 CGjd5Zo+wQN7NMj3p28jC8mdqdIEhxd4XE4r5g0IbRa11m8sw/tj5CXvm0iOO218yL1B
 Bc2w==
X-Gm-Message-State: ANoB5pknFnZjWjdGhFqSkQXPAKQf84ixiDkgFHpxSrvnUWmDCwy9mEaE
 spct9cWfew2rLoa0tI2ukViaq39rpsgFua+oqKY+DPpXfZ87cqbceL/J4IVU4XPO8eQIZQGEf97
 TFDC5/sCuggorh0Q=
X-Received: by 2002:a05:600c:4c21:b0:3b4:8fd4:293e with SMTP id
 d33-20020a05600c4c2100b003b48fd4293emr37622429wmp.46.1669974052385; 
 Fri, 02 Dec 2022 01:40:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7iz9i4aLdbjKpM2x9g/uaCE4gPHbkaUabbsylufkKmKnyVkP+HXH9RikDyQ1oq+oU2vluPGA==
X-Received: by 2002:a05:600c:4c21:b0:3b4:8fd4:293e with SMTP id
 d33-20020a05600c4c2100b003b48fd4293emr37622417wmp.46.1669974052155; 
 Fri, 02 Dec 2022 01:40:52 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 k27-20020a5d525b000000b00242269c8b8esm6437466wrc.25.2022.12.02.01.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 01:40:51 -0800 (PST)
Message-ID: <4ce0329b-0868-f6b5-63f2-62ae212c76a7@redhat.com>
Date: Fri, 2 Dec 2022 10:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] blockdev: add 'media=cdrom' argument to support usb cdrom
 emulated as cdrom
Content-Language: en-US
To: Zhipeng Lu <luzhipeng@cestc.cn>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>
References: <20221201134227.1983-1-luzhipeng@cestc.cn>
 <871qpjf86a.fsf@pond.sub.org> <1d355249-9ab0-f824-e00d-3135cb2646b5@cestc.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1d355249-9ab0-f824-e00d-3135cb2646b5@cestc.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/2/22 03:26, Zhipeng Lu wrote:
> NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
> sda             8:0    0  100M  1 disk
> vda           252:0    0   10G  0 disk
> ├─vda1        252:1    0    1G  0 part /boot
> └─vda2        252:2    0    9G  0 part
>    ├─rhel-root 253:0    0    8G  0 lvm  /
>    └─rhel-swap 253:1    0    1G  0 lvm  [SWAP]
> lshw -short|grep cdrom -i
> No cdrom.
> 
> My patch is to solve this problem, usb cdrom emulated as cdrom.

This is a libvirt bug, it should use usb-bot instead of usb-storage 
together with -blockdev.  Then it can add a scsi-cd device below usb-bot.

Paolo

> 
> 
> 在 2022/12/1 23:35, Markus Armbruster 写道:
>> luzhipeng <luzhipeng@cestc.cn> writes:
>>
>>> From: zhipeng Lu <luzhipeng@cestc.cn>
>>>
>>> The drive interface supports media=cdrom so that the usb cdrom
>>> can be emulated as cdrom in qemu, but libvirt deprived the drive
>>> interface, so media=cdrom is added to the blockdev interface to
>>> support usb cdrom emulated as cdrom
>>>
>>> Signed-off-by: zhipeng Lu <luzhipeng@cestc.cn>
>>
>> What problem are you trying to solve?
>>
>>
>>
> 
> 
> 


