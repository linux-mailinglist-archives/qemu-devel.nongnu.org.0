Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626965E6E2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 09:36:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDLjR-0006BT-TN; Thu, 05 Jan 2023 03:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDLjG-00063f-N4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDLjC-0001Qo-Pr
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672907758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DL8JxS41rK+TolCZ4YaJBW7Vh4CRGUBaBiINxkMyXaw=;
 b=Gqxgc/1tnyJO67ocMgAI01kRz3U1u2+Rpx8J6irkD/VxMyOHkj2Eie+H5f5Lgxp8IjekyI
 JNxoanPVZ8iQouZToz7ecfzkld3tp1EVzYfqIgM+8gZ3cdlUTJPGZD7ktSkTIWWU1g/JFk
 0rT1KR0fkpdbJ2CIKeWr1J0TEsFB29s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-dc0-U5HSMdS6cWQMbJGKXQ-1; Thu, 05 Jan 2023 03:35:57 -0500
X-MC-Unique: dc0-U5HSMdS6cWQMbJGKXQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e3-20020adfa443000000b00296b280432dso1912191wra.19
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 00:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DL8JxS41rK+TolCZ4YaJBW7Vh4CRGUBaBiINxkMyXaw=;
 b=dqnlnVJO1hnB4hvGL2Hi60W/oBYNDzexSqAidpHE9CoSnigqhuD9mqcSLMuWyfWtBR
 qHSSPtnwwtgxAqzomo8vysQU893Wzb3z8wLhd9uozb38iZOfuVNU11FeaIzngpvfejc9
 dbzDZb0kC20ppcbQv/AhWX/repKLjxEj7UAQkMxAMO/D2tsk+YwNen5EzDltYXDthWJs
 +FR7iP7JSlv/aCPL6g9thk9GlQSvpRLmGXkKpDUeWv/v1U76RgCWAkVqgqta/AHiPOZ5
 dpRmZEwBCK2JcCUGhVnCMqD94RLZ+fApL19lj14ECIf7ZtNR/ymSLkaYR3eM9NV7PwBp
 8tWw==
X-Gm-Message-State: AFqh2krfZkhHuNJu/FnzcC1pVJ3RUZ4CEWsDy32pz4ANwx6YhX4XHlFy
 yWH+/sqiyL0QtYdvaMFBcDS7wwUo8CKg7T8p6DSx4+fgMdtZGbaLH70zpigBttbzCasxbiUoGDo
 CVOybonYlBx/1QgI=
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr38707715wmp.21.1672907755929; 
 Thu, 05 Jan 2023 00:35:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLdSelX2kEMDtIJzb7P/mLr8oQcjYbltVjXRQf5wNc5RVxwUQEcDtq7aVeC/h/LfPIExPmTQ==
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr38707701wmp.21.1672907755665; 
 Thu, 05 Jan 2023 00:35:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:6e00:ff02:ec7a:ded5:ec1e?
 (p200300cbc7076e00ff02ec7aded5ec1e.dip0.t-ipconnect.de.
 [2003:cb:c707:6e00:ff02:ec7a:ded5:ec1e])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm1745488wmb.29.2023.01.05.00.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 00:35:55 -0800 (PST)
Message-ID: <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
Date: Thu, 5 Jan 2023 09:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
In-Reply-To: <Y7W2LtO5/m1r3VaL@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 04.01.23 18:23, Peter Xu wrote:
> On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
>> Migrating device state before we start iterating is currently impossible.
>> Introduce and use qemu_savevm_state_start_precopy(), and use
>> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
>> state will be saved in qemu_savevm_state_start_precopy() or in
>> qemu_savevm_state_complete_precopy_*().
> 
> Can something like this be done in qemu_savevm_state_setup()?

Hi Peter,

Do you mean

(a) Moving qemu_savevm_state_start_precopy() effectively into
     qemu_savevm_state_setup()

(b) Using se->ops->save_setup()

I first tried going via (b), but decided to go the current way of using 
a proper vmstate with properties (instead of e.g., filling the stream 
manually), which also made vmdesc handling possible (and significantly 
cleaner).

Regarding (a), I decided to not move logic of 
qemu_savevm_state_start_precopy() into qemu_savevm_state_setup(), 
because it looked cleaner to save device state with the BQL held and for 
background snapshots, the VM has been stopped. To decouple device state 
saving from the setup path, just like we do it right now for all vmstates.

Having that said, for virtio-mem, it would still work because that state 
is immutable once migration starts, but it felt cleaner to separate the 
setup() phase from actual device state saving.

Thanks!

-- 
Thanks,

David / dhildenb


