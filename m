Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D484667CFE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:53:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1hW-0004mZ-UU; Thu, 12 Jan 2023 12:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG1hV-0004mA-Ah
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG1hT-00040i-VL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkhyjZqAF+LEftuH+5klMHngZZNmZbcRwEmFlYypuig=;
 b=JeffNGa6hq3klINGInpGDNZoiW0Va8CjhnIBXPUlm+p4hxSLnvEetT9C2NFiQzcwFVUgFl
 XHaCTNROuK/4pg10qtOhCgeMxR6AZh0C8FDWF8ahy1zmRwjdxe5F26vP2fTFKo/akbvNOk
 1b6mzqcWu4pV9D7m3dJS4/w1oE1YNgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-1FRYsp0TMLmS33OuRSx3Og-1; Thu, 12 Jan 2023 12:49:14 -0500
X-MC-Unique: 1FRYsp0TMLmS33OuRSx3Og-1
Received: by mail-wr1-f72.google.com with SMTP id
 k18-20020adfb352000000b002bdd0a7a2b5so717993wrd.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XkhyjZqAF+LEftuH+5klMHngZZNmZbcRwEmFlYypuig=;
 b=Qdl8PCoUS8kTJ4EGgzCi1V3n3VuDHPlBIMDupLv2uqfwpnukGYwv0dPpN/h6HlgjE0
 9d2IZBUc3N8US4VdJAm8YBDTRxxnFKbS47gCviy7alIh3aLY+lFvs5M3fMxataOqNyhA
 T44TFXJ3SAA/iTu+cf9C+vjLbjllPx4miwqmAMgITiSYTMJ+bAHI5vwNRKPzIWPH+m1G
 evUzHxdGm+TUVj2yfhoggj+16zM80G8yXzCTu7q9OZmCuWfumb3pt5BP12ypoDu2s1L/
 akcV1mywFqg2qkOFj/33GcqOw2W7rstHHYM56Q+2WwEf84+RkzJxS/PrrF6fEpsgenDB
 Jafw==
X-Gm-Message-State: AFqh2kqZGdc+hGhxU3mH7fANQcE+V2PGr5iJb2eo7ZedjepRIJkDSdXb
 LHuhBmJTd5W71BDP13dovo5ju2MndlesQ7oSpk++VywdqQsZJenloICPn1WIEx1yOpBvvbKUNB1
 3P3OjRQrjqcttTEY=
X-Received: by 2002:a05:600c:b4d:b0:3d3:49db:d84 with SMTP id
 k13-20020a05600c0b4d00b003d349db0d84mr55736846wmr.20.1673545752898; 
 Thu, 12 Jan 2023 09:49:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6wKeTl1pRGk/yW17ZfE7Ons6X2S6cfp1YFEoodlRJVoY1oWjXTvcVOwfbn0cI/SFmMoie7g==
X-Received: by 2002:a05:600c:b4d:b0:3d3:49db:d84 with SMTP id
 k13-20020a05600c0b4d00b003d349db0d84mr55736833wmr.20.1673545752694; 
 Thu, 12 Jan 2023 09:49:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4b00:f595:490f:692:a6f3?
 (p200300cbc7074b00f595490f0692a6f3.dip0.t-ipconnect.de.
 [2003:cb:c707:4b00:f595:490f:692:a6f3])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003d9ea176d54sm23874751wmq.27.2023.01.12.09.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 09:49:12 -0800 (PST)
Message-ID: <6ee9e268-efe9-87bc-d198-08784ce73f72@redhat.com>
Date: Thu, 12 Jan 2023 18:49:11 +0100
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8A8J78zL3hW9z34@work-vm>
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

On 12.01.23 17:58, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> Let's move more code into vmstate_save(), reducing code duplication and
>> preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
>> have to move vmstate_save() to make the compiler happy.
>>
>> We'll now also trace from qemu_save_device_state().
> 
> Mostly OK, but..
> 
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   migration/savevm.c | 79 ++++++++++++++++++++++------------------------
> 
> Doesn't this also need to upate trace-events?

The existing trace events from 
qemu_savevm_state_complete_precopy_non_iterable() are simply moved to 
vmstate_save(), so qemu_save_device_state() will implicitly use them.

So no update should be needed (no new events), or am I missing something?

Thanks!


-- 
Thanks,

David / dhildenb


