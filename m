Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9611A4BD8A9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:48:42 +0100 (CET)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5JB-0002EA-L1
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nM57l-0007th-4N
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:36:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nM57f-0002JI-NW
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645436198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxBGcshXAlWLA7OAp43IgLevrCVr0xmO912o00i5QAo=;
 b=HcKzCaZezO+DDZKbsWmA/D5uausXeO6GBui3Ly0SNSpivwcQB50eu/vyIoDWGUEfc1wt0x
 IWnjebamKP7sds7lyeYXrUYOXMwkP9pnlZYAEARG4LwC/QQXqDSi4aGzyDzarLzO1UhRIj
 khrLAbsL4no5VNH9cbZ5mxDjWgJkNxc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-xNRBHDAgNR-f0kdVl3FrTQ-1; Mon, 21 Feb 2022 04:36:32 -0500
X-MC-Unique: xNRBHDAgNR-f0kdVl3FrTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso9815308edt.20
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hxBGcshXAlWLA7OAp43IgLevrCVr0xmO912o00i5QAo=;
 b=hq6Pqjc1pjhUFg6wSocUnCdhIf90GV/XJ0ciofO/zDBBfER0PEldWYKt12J9w7F4Z8
 nnn8F2BX34l1S8rEh1JVXozjK06Qf7kenn97r36U1ZazqbTFuxNBXlVxGtx1Ovx03ees
 VNRMV9TspdhoOkMQD5xEo6mhWDtk7P9DWcwJSPPOdkMDIJvKssedYUcmmomH9vh4iJZA
 ruQNwxSnufMh6h/f0ufR61edeR9PIGmpeIOmqzGG1qJ4MeeiZE0WTuy5D7g0oqg4AbDj
 mTsxJNkMsf/23EYuhl854lyVGV0lVAx+MAudpVd7BmcgauBxqSPrVKgH/XQLRz5XTqDN
 JhQw==
X-Gm-Message-State: AOAM532gY/pHlX/tqEVOYj1upDTjXm/kncoC354hgjL7JlEex1XFIloq
 dGDmGpEtcER0lVA3ILbZxMv+Mpa1NYztllZ/mqzZwawzL/X4v1Sgjkdzi+Z2aeckoyElyvRehvE
 3VrtCFzNbHC1QHBw=
X-Received: by 2002:a17:906:f74c:b0:6cf:6f7b:25a8 with SMTP id
 jp12-20020a170906f74c00b006cf6f7b25a8mr15445539ejb.532.1645436191220; 
 Mon, 21 Feb 2022 01:36:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxexHXWrTv7Oe/fsLj1d8vfHP+ilC8LAvyuxLe8mCxZAcQg2mgunRiQV2rxFWigPDhwABDZQQ==
X-Received: by 2002:a17:906:f74c:b0:6cf:6f7b:25a8 with SMTP id
 jp12-20020a170906f74c00b006cf6f7b25a8mr15445524ejb.532.1645436190969; 
 Mon, 21 Feb 2022 01:36:30 -0800 (PST)
Received: from [10.43.2.56] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id r3sm5044262ejd.129.2022.02.21.01.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 01:36:30 -0800 (PST)
Message-ID: <d2af5caf-5201-70aa-92cc-16790a8159d1@redhat.com>
Date: Mon, 21 Feb 2022 10:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
 <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
 <ad4e6ea2-df38-005a-5d60-375ec9be8c0e@redhat.com>
 <CAJSP0QVNjdr+9GNr+EG75tv4SaenV0TSk3RiuLG01iqHxhY7gQ@mail.gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <CAJSP0QVNjdr+9GNr+EG75tv4SaenV0TSk3RiuLG01iqHxhY7gQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "libvir-list@redhat.com" <libvir-list@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/22 14:46, Stefan Hajnoczi wrote:
> On Fri, 18 Feb 2022 at 16:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 2/18/22 12:39, Michal Prívozník wrote:
>>> On 2/17/22 18:52, Paolo Bonzini wrote:
>>>> I would like to co-mentor one or more projects about adding more
>>>> statistics to Mark Kanda's newly-born introspectable statistics
>>>> subsystem in QEMU
>>>> (https://patchew.org/QEMU/20220215150433.2310711-1-mark.kanda@oracle.com/),
>>>> for example integrating "info blockstats"; and/or, to add matching
>>>> functionality to libvirt.
>>>>
>>>> However, I will only be available for co-mentoring unfortunately.
>>>
>>> I'm happy to offer my helping hand in this. I mean the libvirt part,
>>> since I am a libvirt developer.
>>>
>>> I believe this will be listed in QEMU's ideas list, right?
>>
>> Does Libvirt participate to GSoC as an independent organization this
>> year?  If not, I'll add it as a Libvirt project on the QEMU ideas list.
> 
> Libvirt participates as its own GSoC organization. If a project has
> overlap we could do it in either org, or have a QEMU project and a
> libvirt project if the amount of work is large enough.

Indeed. Libvirt's participating on its own since 2016, IIRC. Since we're
still in org acceptance phase we have some time to decide this,
actually. We can do the final decision after participating orgs are
announced. My gut feeling says that it's going to be more work on QEMU
side which would warrant it to be on the QEMU ideas page.

But anyway, we can wait an see. Meanwhile, as Stefan is trying to
compile the list for org application, I'm okay with putting it onto
QEMU's list.

Michal


