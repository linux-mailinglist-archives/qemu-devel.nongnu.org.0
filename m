Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3015F5BDE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:41:39 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogC94-0007Cy-H6
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogC5G-0002Hd-CU
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogC5C-0006s3-Tl
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665005857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INUb+1/wji7Ozu+njRJP0Lv8AEol+llU1VilcPhjLHI=;
 b=YJwYiEQvva1jYgKNlkLd/BOA6PuBP4gjww3MPa0gV6spysysjGHbeYHIjsQrhTYVj/ktI0
 v62mQY2w7+SFuXbJOS21IQPeevaCo2NVsI/8bABjnbNr4YUJn7VEgF62f3U+JuaVdtir7K
 TOdy26feVEbf51hPCxdkrhDJqOuv178=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-IeQQNJeFNamk08eTz1ZsEw-1; Wed, 05 Oct 2022 17:37:36 -0400
X-MC-Unique: IeQQNJeFNamk08eTz1ZsEw-1
Received: by mail-qt1-f198.google.com with SMTP id
 g21-20020ac87d15000000b0035bb6f08778so27323qtb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 14:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=INUb+1/wji7Ozu+njRJP0Lv8AEol+llU1VilcPhjLHI=;
 b=KgDRW6svx1PJpNTYsGJRwSu9SzL8c5UDnce2x7nj9qFsFJikCRbYNsGB3Eg+sMt0aM
 zBwdWax0KoO7l+f2hSs/ZKCKAaJE5WSornmKI8u+jw49uh+3x5bbKNBa7vNV/0F4QZmT
 oVAcn0N/1oXymkk4D0MWBSBQH82/c7epBA6el8b0fRozPGoSY6MqjearbS3FhYKD8AUO
 y2JLIqCknnSkKdh+yHA2yvbIC6a2S7ev4dZocANQpmQ6QTl+hsyMoB8ttTniNQXyA1Fd
 p5/wpDX7VB/MmWVcpahbtzWhpdc6D+kKKNkeYrxEuD+X7TXn3oEHvBRbHWnjxPHGCkLX
 MmZQ==
X-Gm-Message-State: ACrzQf3Ik2P2mg++7N1vAR8UYqE9NmR0B53tBk5hNCQfYgV9Q548FnBj
 LQQiB1LMzqZiz4lbL4wv8Vbu6ssK80Us2J7074rG3lL/RB2pqv/rePm2mIWUP7/De0k5cYTquNx
 3mz883WAXM7VDYaI=
X-Received: by 2002:a05:622a:409:b0:35d:5a1e:888d with SMTP id
 n9-20020a05622a040900b0035d5a1e888dmr1194172qtx.561.1665005855932; 
 Wed, 05 Oct 2022 14:37:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FCvRTgffnfnAgRLsqC21rxa2Am1+cJNiG0Sv4emE3HZGwiCZxYjyt5WSEQQhnYFmJ1cjBEw==
X-Received: by 2002:a05:622a:409:b0:35d:5a1e:888d with SMTP id
 n9-20020a05622a040900b0035d5a1e888dmr1194159qtx.561.1665005855643; 
 Wed, 05 Oct 2022 14:37:35 -0700 (PDT)
Received: from [172.20.5.108] (rrcs-66-57-248-11.midsouth.biz.rr.com.
 [66.57.248.11]) by smtp.googlemail.com with ESMTPSA id
 u4-20020a37ab04000000b006e26c6db902sm2878651qke.53.2022.10.05.14.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 14:37:34 -0700 (PDT)
Message-ID: <bb2d1de3-5622-076a-7282-06c812bb4804@redhat.com>
Date: Wed, 5 Oct 2022 23:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Content-Language: en-US
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
 <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
 <YztsgiapfWC78BG+@lt>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YztsgiapfWC78BG+@lt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/22 01:13, Venu Busireddy wrote:
>> script? Something must be putting the SCSI command in the queue.
>> Perhaps the driver is doing so when it sees an event? And if it is
>> bypassing the normal submission mechanism, the REPORT LUNS commands is
>> hidden in scsitrac; that in turn retruns a unit attention and steals
> 
> While SAM does say "if a REPORT LUNS command enters the enabled command
> state, the device server shall process the REPORT LUNS command and shall
> not report any unit attention condition;," it also says that the unit
> attention condition will not be cleared if the UA_INTLCK_CTRL is set to
> 10b or 11b in the "Control mode page."
> 
> It doesn't appear to me that virtio-scsi supports "Control mode pages."
> Does it? If it doesn't, is the expected handling of REPORT LUNS command
> be same as the case of UA_INTLCK_CTRL being set to 00b?

In QEMU, all HBAs except for esp.c and lsi53c895a.c support autosense. 
As in the comment below, 00b is the right value for virtio-scsi.

The code to build the 0Ah (control) mode page would be in scsi-disk.c 
for example.  Nobody ever wrote it because the values mentioned in the 
comment below (00b if HBA supports autosense and therefore calls 
scsi_req_get_sense; 10b for HBAs with no autosense, typically very old 
emulated parallel-SCSI hardware) are the ones that make the most sense 
and OSes will just assume them.

00b is also the default UA_INTLCK_CTRL value, so the mode page is not 
needed at all for virtio-scsi.

Paolo

> If virtio-scsi doesn't support "Control mode pages," why does the above
> comment even say "assume UA_INTLCK_CTRL to be 00b" or address the case
> of 10b? Also, other than the reference to it in the above comment,
> UA_INTLCK_CTRL is not used anywhere else in the code. This comment
> confused me. Is the comment just wrong, or am I missing something? I am
> just trying to understand this better so that I am better prepared when
> the client driver folks start asking me questions about the qemu support.
> 
> Venu
> 
>> it from the other commands such as TEST UNIT READY, but that's a guest
>> driver bug.
>>
>> But QEMU cannot just return the unit attention twice. I would start
>> with the patch to use the bus unit attention mechanism. It would be
>> even better to have two unit tests that check the behavior prescribed
>> by the standard: 1) UNIT ATTENTION from TEST UNIT READY immediately
>> after a hotunplug notification; 2) no UNIT ATTENTION from REPORT LUNS
>> and also no UNIT ATTENTION from a subsequent TEST UNIT READY command.
>> Debugging the guest is a separate step.
> 


