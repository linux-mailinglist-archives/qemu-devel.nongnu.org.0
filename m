Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5843B00C6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:51:01 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvd3c-00061C-2z
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvd1t-00057p-3o
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvd1q-00047T-Gk
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624355348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJhhPgcPxLiNin2SC3knrmNpZG8Os+cxjW4930fy8F4=;
 b=AUCWFZggd8J2mVdltc71Bp9SnYodh+YT6vJpaHV6dThpoW/RANL6nZIdjpPrGyy0jzWZ/w
 hXZBNoQtWkCJN1+0D2x0+sNUvCZTj0h9LUFm6Tdy2HrYjRudYWPZXCbcYNQ/dUySp9W4oC
 v0yQZZmC3kZq0kjFDaTUD6jt/feYn50=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-dqVto-0zNQmkkkZa61kiEQ-1; Tue, 22 Jun 2021 05:49:07 -0400
X-MC-Unique: dqVto-0zNQmkkkZa61kiEQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 s15-20020a7bc38f0000b02901dbb76fabe9so1075355wmj.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 02:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fJhhPgcPxLiNin2SC3knrmNpZG8Os+cxjW4930fy8F4=;
 b=t/htf898BABrrVxqcoG+CzyZAgwLY/iewL7BQZ1QybyN4HqmixEwMPfoBZPDyisGFQ
 TvBT4nwl0zuuofVsXRVU377z19ZqwtHATo/t9N4zcTy0684usPxb+uGCaxQRVwqAPvvW
 oNO8gPqc0Kf1Mt48Gchg1ql0x97rTDe9qCA0QfA04COxgttuEQ7a/vH9gqtG0O46rq4R
 6HSeUu2+H0RdH6xRp0BY4Cezy+RDFfFT73kjNDB8XFDq+ZkIQXHHp8DYhn26/23WijBO
 GbS+nDhPBHB4ULEu7L78jvXdpQ4tSCNYOoxScchy3zsbfriVem2Znx5Lh9YEAUFCBkmd
 ZrMg==
X-Gm-Message-State: AOAM532sQK9XK4hsBp6+00vmpXDj9Ya7gApS7BlYtX5z8agJGmLJxQ3D
 OTOolaUNZWn6lzlayYAFD1xWY5i2RSwRRTZn5vnZBnnKZCu6om1cgK3csMYMbGQv6L6A8WSZz0b
 YOo12HNz+4IlF2Zo=
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr3632788wrn.398.1624355346258; 
 Tue, 22 Jun 2021 02:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUhHI6Ttzxy6uFocxX78q9L8qh4qDeA7oUyBR2g3Uufkg5XbJJ5SlNQrVypXzSCz6o90qqNA==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr3632760wrn.398.1624355346012; 
 Tue, 22 Jun 2021 02:49:06 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r6sm20330574wrz.91.2021.06.22.02.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:49:05 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <89258a7b-fe24-4930-5af7-278b68d1f07c@redhat.com>
 <25b381ad-cdca-60dc-6fb1-1d97ea626843@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d983dbc4-1d6b-c51e-aa1f-3d736ac0d154@redhat.com>
Date: Tue, 22 Jun 2021 11:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <25b381ad-cdca-60dc-6fb1-1d97ea626843@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 11:44 AM, Dov Murik wrote:
> On 21/06/2021 23:32, Philippe Mathieu-Daudé wrote:

>> and added qemu_uuid_copy() to complete the API, but that's fine.
> 
> I think simple C assignment works for structs (and hence QemuUUID),
> something like:
> 
>     SevHashTable *ht = ...;
>     ht->guid = sev_hash_table_header_guid;
> 
> (where both ht->guid and sev_hash_table_header_guid are QemuUUID.)

OK.

>>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>>
>> If we never use the data_len argument, can we simplify the prototype?
> 
> The current uses for the OVMF reset vector GUIDed table is for simple
> structs with known length (secret injection page address, SEV-ES reset
> address, SEV table of hashes address).  But keeping the length there
> allows adding variable-sized entries such as strings/blobs.

OK. Good opportunity to document the prototype declaration ;)

> 
>>
>>> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
>>> +        return false;
>>> +    }
>>> +    area = (SevHashTableDescriptor *)data;
>>> +
>>> +    ht = qemu_map_ram_ptr(NULL, area->base);
>>> +
>>> +    /* Populate the hashes table header */
>>> +    memcpy(ht->guid, sev_hash_table_header_guid, sizeof(ht->guid));
>>> +    ht->len = sizeof(*ht);
>>> +
>>> +    /* Calculate hash of kernel command-line */
>>> +    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->cmdline_data,
>>> +                           ctx->cmdline_size,
>>> +                           &hash, &hash_len, errp) < 0) {
>>> +        return false;
>>> +    }
>>
>> Maybe move the qcrypto_hash_bytes() call before filling ht?
> 
> (below)
> 
>>
>>> +    e = &ht->entries[ht_index++];
>>> +    fill_sev_hash_table_entry(e, sev_cmdline_entry_guid, hash, hash_len);
>>> +
>>> +    /* Calculate hash of initrd */
>>> +    if (ctx->initrd_data) {
>>> +        if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
>>> +                               ctx->initrd_size, &hash, &hash_len, errp) < 0) {
>>> +            return false;
>>> +        }
>>
>> Ah, now I see the pattern. Hmm OK then.
>>
> 
> But this might change if initrd_hash is no longer optional (see separate
> self-reply to this patch).  In such a case I'll probably first calculate
> all the three hashes, and then fill in the SevHashTable struct.

Yes, sounds simpler.

Regards,

Phil.


