Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F12485570
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:08:16 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57tf-0002rO-P3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n57iw-0005dL-BR
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:57:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n57iu-0006jx-5n
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZKFv//YVJcFOoEXlnJgpVWk5SK1msIDGbK4fNiF0gw=;
 b=MpVtJ+5nWgTCsGKvoWllbEWXhfTCDo4Q4x2wQhTktTVMR+4fCq/YSS1CszD3sGQd6BB6p4
 nTAbJMvKu1a0TY/qO+0wgjmaXZS45pppiiVyRlOmHAwenUKBM/w/RUvqIVN980LP6LrOy2
 SkKE1Wd9KVj+9pphTIC2/rp1ie4TG9w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-GeQRlgKJP6a-977ss3Uy0Q-1; Wed, 05 Jan 2022 09:57:01 -0500
X-MC-Unique: GeQRlgKJP6a-977ss3Uy0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so12758069wrg.7
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=xZKFv//YVJcFOoEXlnJgpVWk5SK1msIDGbK4fNiF0gw=;
 b=K6Lq3RwKgM5XyUaW4cp7kxIQa5PZVD4EL1pYvkWIBWKbVp/q/Iid/hLlRUQU0t0BOm
 g8JwYO602NFG6vIk14fu4pX8i7jbApwNpgRrVBk/4MIeYrLQJTtjv3zGuh92YAKDsEhs
 qb/XoYmTpb1LX75uxI+0uAZVTNr/Zn/h6lxLNa0ZvdKEoSUC/rLslSu182Tqh4otZmOl
 dcFm88lu+qvMM+a8nnaCB/0pwOkenXs0rNEJ6NNmUNq+JUBBPJRtcVMgOlG08Dxw4NlH
 HkTC8tb94tSuA/TZMFTxCSwzicCG4EoeM1XBaDik2qDYVjuS7QpFx5JRopDv7kP9A3/l
 JY9Q==
X-Gm-Message-State: AOAM5306xdVza16EtrfLwyOvYYyquaQAeGUAT0FJ6c/IbFb2SnAhQ2CF
 nzlgl5UDoxAvRDI4yVkkE7tT5h2A1zG+/kbM0hEzGFVKV3ZOk45A8NgrUxLxUeF4xhLn4YI3Hvm
 Ytgi71ldYMBQ6m78=
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr3286156wmc.104.1641394619722; 
 Wed, 05 Jan 2022 06:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+dXqVKb/+Xo6Ic0lw0MTB7eiGhucuZqF4NU0hWzY+KRapoyxaffqs7JPWWxs5K75kETsW8g==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr3286145wmc.104.1641394619555; 
 Wed, 05 Jan 2022 06:56:59 -0800 (PST)
Received: from [192.168.100.42] ([82.142.12.178])
 by smtp.gmail.com with ESMTPSA id l25sm2829815wmh.18.2022.01.05.06.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 06:56:59 -0800 (PST)
Message-ID: <bea3fa79-8044-d84d-9c8f-ad80002c937b@redhat.com>
Date: Wed, 5 Jan 2022 15:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] trace-events,pci: unify trace events format
From: Laurent Vivier <lvivier@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211105192541.655831-1-lvivier@redhat.com>
 <20211107033751-mutt-send-email-mst@kernel.org>
 <e5011077-3285-cb70-9948-27f84b407dba@redhat.com>
In-Reply-To: <e5011077-3285-cb70-9948-27f84b407dba@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 11:57, Laurent Vivier wrote:
> On 07/11/2021 09:38, Michael S. Tsirkin wrote:
>> On Fri, Nov 05, 2021 at 08:25:41PM +0100, Laurent Vivier wrote:
>>> Unify format used by trace_pci_update_mappings_del(),
>>> trace_pci_update_mappings_add(), trace_pci_cfg_write() and
>>> trace_pci_cfg_read() to print the device name and bus number,
>>> slot number and function number.
>>>
>>> For instance:
>>>
>>>    pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
>>>    pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
>>>    pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
>>>    pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000
>>>
>>> becomes
>>>
>>>    pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
>>>    pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
>>>    pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
>>>    pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>
>> Looks good to me. We are in freeze, will queue. Pls ping after
>> the release to make sure it's not lost.
> 
> Ping ?

Well, it seems really lost...

Thanks,
Laurent


