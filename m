Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC165E6C2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 09:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDLU6-0001iE-0u; Thu, 05 Jan 2023 03:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDLU4-0001hW-73
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDLU2-00006L-Jc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672906817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/A9KVpDAsC4eoCXMuNcNHsDF5erWeDrNFZhvUAPaL2U=;
 b=BQBvUMVIi6DK8BYdauLzznco0igddv43erW7f1t628vcuv/W0mxUInUcWOwmr5g2q4v3oz
 oKE/Nv/vMsMKdB4AYDeu01msl0X0KHuPmfMrpASx32l4I9sXUGLMqr49aLlPM9GNliz/cN
 U2QDRs73bbPFzym/aL4ESm1bpepzk+g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-51-L43nGMre4g3BuER9mjg-1; Thu, 05 Jan 2023 03:20:15 -0500
X-MC-Unique: 51-L43nGMre4g3BuER9mjg-1
Received: by mail-wr1-f70.google.com with SMTP id
 r21-20020adfb1d5000000b0026e4c198a43so4702589wra.20
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 00:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/A9KVpDAsC4eoCXMuNcNHsDF5erWeDrNFZhvUAPaL2U=;
 b=Kr9RXPiBoQFHPBJZgujz1m5Zc6z2LOLfXjngp4LRin/Z1P39TUTyPR+XHS8pZIoOae
 HN+1ow6ctx77sJYfs1Kd3XsbKX8/iORK9S7+T6QyYlj/7b8llsgBAfir2T2Zh5tZIa3P
 J4yxRxuiAC8w+SeetF5YH18dWlIfwmyxgI9FC7LnFRuC5R/ufGmKPte+MIogTqGeQyeD
 i6XI06uUnFLqEqSKC77f58h1fhnuGjsRt0OaP7YoqtaA2r71itzqDwdZZdDRLCkuiCrS
 KXqIXUfx7XPC4pJBqzpZ6adB1EiFY8lAKOFV/3ZiykAFocTPz674DdGkFtw84SnqDMLh
 deaw==
X-Gm-Message-State: AFqh2krAgbdwWZZKnSVC2Ya91iW5PVRUmjTfOHAvkDxNMiZSOu3gcVYK
 h+pC2VC4hSvljMRHBiS/zRLjuMJ9NmGWF0K8VgIIPeYHSxgoS8XPMfqZYVKfeSWUqgq76+sll8b
 1O7HlqAs+GUw32ho=
X-Received: by 2002:a05:600c:1c21:b0:3d2:2faf:e54b with SMTP id
 j33-20020a05600c1c2100b003d22fafe54bmr35367578wms.6.1672906814392; 
 Thu, 05 Jan 2023 00:20:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZErm4mrE5FeEjo4T4JZ1AJXbdTKxTIb0NNlPKWHx654swjoR1Y2V8wSSdZhfIpXa3yYMj3Q==
X-Received: by 2002:a05:600c:1c21:b0:3d2:2faf:e54b with SMTP id
 j33-20020a05600c1c2100b003d22fafe54bmr35367562wms.6.1672906814080; 
 Thu, 05 Jan 2023 00:20:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:6e00:ff02:ec7a:ded5:ec1e?
 (p200300cbc7076e00ff02ec7aded5ec1e.dip0.t-ipconnect.de.
 [2003:cb:c707:6e00:ff02:ec7a:ded5:ec1e])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003d1de805de5sm1619932wmq.16.2023.01.05.00.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 00:20:13 -0800 (PST)
Message-ID: <d01f16ff-9aa5-dbcf-7fe6-4d9ede4f9ed9@redhat.com>
Date: Thu, 5 Jan 2023 09:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com>
 <950cb6c6-6271-8126-9c75-533a6b6edaae@redhat.com>
 <20230104202707-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230104202707-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 05.01.23 02:27, Michael S. Tsirkin wrote:
> On Fri, Dec 23, 2022 at 10:34:36AM +0100, David Hildenbrand wrote:
>> On 22.12.22 12:02, David Hildenbrand wrote:
>>> For virtio-mem, we want to have the plugged/unplugged state of memory
>>> blocks available before migrating any actual RAM content. This
>>> information is immutable on the migration source while migration is active,
>>>
>>> For example, we want to use this information for proper preallocation
>>> support with migration: currently, we don't preallocate memory on the
>>> migration target, and especially with hugetlb, we can easily run out of
>>> hugetlb pages during RAM migration and will crash (SIGBUS) instead of
>>> catching this gracefully via preallocation.
>>>
>>> Migrating device state before we start iterating is currently impossible.
>>> Introduce and use qemu_savevm_state_start_precopy(), and use
>>> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
>>> state will be saved in qemu_savevm_state_start_precopy() or in
>>> qemu_savevm_state_complete_precopy_*().
>>>
>>> We have to take care of properly including the early device state in the
>>> vmdesc. Relying on migrate_get_current() to temporarily store the vmdesc is
>>> a bit sub-optimal, but we use that explicitly or implicitly all over the
>>> place already, so this barely matters in practice.
>>>
>>> Note that only very selected devices (i.e., ones seriously messing with
>>> RAM setup) are supposed to make use of that.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> [...]
>>
>>>        if (inactivate_disks) {
>>> @@ -1427,6 +1474,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>            qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>>>        }
>>> +    /* Free it now to detect any inconsistencies. */
>>> +    g_free(vmdesc);
>>
>> Missed to convert that to a json_writer_free().
> 
> 
> I get it you will post v4?

Yes, once the discussions on this version are done.

-- 
Thanks,

David / dhildenb


