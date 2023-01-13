Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B76697E9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJfW-0000Eh-Uo; Fri, 13 Jan 2023 08:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGJf9-0000DV-GX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:00:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGJf7-0002eb-F9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673614769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfdQpXV+DjjbEGqEUOV9SClLE+f1M9EHcObyV8sSHlM=;
 b=CWV0fUdH48819juQK3RFh+W3KFJVv+3IXh788Gu/s6Coz5EaOe54qkqhuVvGYb6jkbt/m1
 It2AD9KA/xhqO+8ud3sVNwN8tg0pYQEehlaM44SyhobYvvWpmjN19InR/BTUWBQ2fp+qVg
 Bf3gp8xoQKjMvIzyslhIjPvLrmgjZsA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-5OoSdGvvNnqYFU9l-jHM0w-1; Fri, 13 Jan 2023 07:59:28 -0500
X-MC-Unique: 5OoSdGvvNnqYFU9l-jHM0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so10869351wms.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 04:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YfdQpXV+DjjbEGqEUOV9SClLE+f1M9EHcObyV8sSHlM=;
 b=SAlnJgtAh50QSApsq5YOqtMWGS9ewnD9y87oUPCW2foOoERh471H0BJQe7we91tXFx
 riVKd0cdpP7nLC9mmzwclZpvxHMZRiC5DjFVFLs0ZMl/5Z9j22YrWxyTX2aEmzR6cHs3
 15p4oheuk0b09ynlBPeXEwiGph4PW7nC9EvocRrY7My+nyjmoxd/Lg1Mcme5Mv4ls7Ho
 7udRK0Wa1AxqGlrihgSraZRvPjtr6Doc7ojzg6uG9TQmCuJPHXouuWv8rMrYc67nusJR
 RMiDWLOrXuOE+jhbxY2SIaCrKHfsfk2WmLBS2Gym5e/6cTsIuKvbCZ/vImdazFI5/iJ7
 vLcA==
X-Gm-Message-State: AFqh2kpneUCxZuaIc+leeCBQX9coeB7XlAigD627tqCEoSYezetxilQL
 0+W4W7FW2d26yOm5CF2OU2SK8sybFU1w0Myt5F+d5/n+Azj3z57pbMsDwjsJAVEgGs7QGAE/9PS
 zXQNmg1RQiTvq4a8=
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id
 b27-20020a05600c4a9b00b003d1dc6fb1a4mr69280273wmp.5.1673614766935; 
 Fri, 13 Jan 2023 04:59:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjEG02pVouNfHQtmlTvHR+2/ax6fDroKfK0xuPRs+oU40TjkABqUV5xFgndKOS03bSyPev+A==
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id
 b27-20020a05600c4a9b00b003d1dc6fb1a4mr69280246wmp.5.1673614766579; 
 Fri, 13 Jan 2023 04:59:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:ec00:869d:7200:eb03:db01?
 (p200300cbc704ec00869d7200eb03db01.dip0.t-ipconnect.de.
 [2003:cb:c704:ec00:869d:7200:eb03:db01])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003d9fa355387sm12620932wmo.27.2023.01.13.04.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 04:59:26 -0800 (PST)
Message-ID: <7836f952-86d3-3e90-7140-d59728992907@redhat.com>
Date: Fri, 13 Jan 2023 13:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/8] migration/savevm: Move more savevm handling into
 vmstate_save()
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-2-david@redhat.com> <Y8A8J78zL3hW9z34@work-vm>
 <6ee9e268-efe9-87bc-d198-08784ce73f72@redhat.com> <Y8BTJVQhkpenEeKH@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8BTJVQhkpenEeKH@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 12.01.23 19:36, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> On 12.01.23 17:58, Dr. David Alan Gilbert wrote:
>>> * David Hildenbrand (david@redhat.com) wrote:
>>>> Let's move more code into vmstate_save(), reducing code duplication and
>>>> preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
>>>> have to move vmstate_save() to make the compiler happy.
>>>>
>>>> We'll now also trace from qemu_save_device_state().
>>>
>>> Mostly OK, but..
>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    migration/savevm.c | 79 ++++++++++++++++++++++------------------------
>>>
>>> Doesn't this also need to upate trace-events?
>>
>> The existing trace events from
>> qemu_savevm_state_complete_precopy_non_iterable() are simply moved to
>> vmstate_save(), so qemu_save_device_state() will implicitly use them.
>>
>> So no update should be needed (no new events), or am I missing something?
> 
> Aren't you losing the trace_savevm_state_setup() trace?

trace_savevm_state_setup() is called from qemu_savevm_state_setup() 
before/after this change.

Calling it from qemu_save_device_state() would be wrong: they skip the 
setup phase and don't call any save_setup() -- skipping all "se->is_ram".

-- 
Thanks,

David / dhildenb


