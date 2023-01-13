Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24289669C8A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLzF-0007Aq-3X; Fri, 13 Jan 2023 10:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGLz2-00075h-VB
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:28:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGLz0-0001v8-Gc
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673623721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4h0EoBULSTIHwBq7rR7mx6SHWD+cQTK77kpGPTgSYQ=;
 b=HlSRO9wzG336gz68jOwV1FQX8yT/pX+RWjNHvlEMDomb2LRdUKMxAHBAIv9zqWMU/pr7J9
 DEQak/qrPY+dYXRNZTlFlAGM6FE44NsXQS73NoPsz+RTHcsCv1Wo4DKYTxtuqHUavlBNvQ
 uY2Kito5wHixEbyQG5NYRljiA8FLcAk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-r5DyGLwzMEq_NvnQNmHG1A-1; Fri, 13 Jan 2023 10:28:40 -0500
X-MC-Unique: r5DyGLwzMEq_NvnQNmHG1A-1
Received: by mail-wr1-f69.google.com with SMTP id
 s20-20020adfa294000000b002b81849101eso4234651wra.16
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K4h0EoBULSTIHwBq7rR7mx6SHWD+cQTK77kpGPTgSYQ=;
 b=QHk4yaxNEahNzxtYiJn9IG91nuE89/uJRz1+Z/VvBKfy+LWnknM7/XsLuXYmFckpa2
 Zaoo6OuHOuaKi5vEHt5VtfFUbGjUtl24LXA8Fjmqk0y/UG1HezEz6OWgDMgBrk2tP2Qv
 RSYMtl2R+m+O0fjj4FvWzm9KJjZ5S3nM9hVHS5HTBoi51LSKdtDxFOixaPav2oii+zV4
 AwLUt2zLIU/mrkQRC9WfnYqYpPPHLqNcV8emROitf+Luk3CUE/+qQtLxIgU53jvOyL9Z
 kuWfWCaJiHOk+tpfu7UsLRuAwmmyGQBmytPSJ2kYq2gXht6hNzqbNRdycR9S8/+kJzbk
 qWpA==
X-Gm-Message-State: AFqh2krmuH4AiPvQ6e0z0OREwvSFP0EO60Id9XNc3lGmQXBJu1ZJcB+7
 xuseY/QcpmW/o9xlE0vcAfajmk8A6duOeCDJFnJSAvhqIBRULuqbTul2X/0sgqOLPdSd8jtervX
 3z2jAgenVOrWyuwU=
X-Received: by 2002:adf:f1c6:0:b0:2bb:c50f:6381 with SMTP id
 z6-20020adff1c6000000b002bbc50f6381mr16367576wro.6.1673623719574; 
 Fri, 13 Jan 2023 07:28:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIpoCYK1YeCTQDU++vuf7mA3cio4rbwEl1Zqd7G8CBwbFgDnGuAXgexcXFMZHJn9p06TSVuQ==
X-Received: by 2002:adf:f1c6:0:b0:2bb:c50f:6381 with SMTP id
 z6-20020adff1c6000000b002bbc50f6381mr16367562wro.6.1673623719339; 
 Fri, 13 Jan 2023 07:28:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:ec00:869d:7200:eb03:db01?
 (p200300cbc704ec00869d7200eb03db01.dip0.t-ipconnect.de.
 [2003:cb:c704:ec00:869d:7200:eb03:db01])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adffcc6000000b002bbdcd15e44sm15447384wrs.37.2023.01.13.07.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 07:28:38 -0800 (PST)
Message-ID: <5a790e3b-fe32-d9d3-086e-93fd5e7701e5@redhat.com>
Date: Fri, 13 Jan 2023 16:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com> <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com> <Y8BlCeViRSzyTQ8+@work-vm>
 <Y8CGYZ3F/h1oXV+d@x1n> <Y8CJf7hCy76AtfcF@x1n>
 <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com> <Y8F2v+ikvEJa5+qc@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8F2v+ikvEJa5+qc@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13.01.23 16:20, Peter Xu wrote:
> On Fri, Jan 13, 2023 at 02:47:24PM +0100, David Hildenbrand wrote:
>> I'd prefer to not go down that path for now. QEMU_VM_SECTION_START without
>> QEMU_VM_SECTION_PART and QEMU_VM_SECTION_END feels pretty incomplete and
>> wrong to me.
> 
> That's fine.
> 
>>
>> If we want to do that in the future, we should conditionally send
>> QEMU_VM_SECTION_START only if we have se->ops I assume?
> 
> Yes.  START/FULL frames are mostly replaceable afaiu in the stream ABI, so
> we always have space to change no matter what.  Let's leave that as-is.

Thanks Peter! I'll send a new version early next week.

-- 
Thanks,

David / dhildenb


