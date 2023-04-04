Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9A6D5AEE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 10:30:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjc3S-0003vP-J3; Tue, 04 Apr 2023 04:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjc3K-0003sH-D8
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:30:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjc3I-0005Y2-Gy
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680597003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3n1dehyGNRRP/AtKpPQWqmxhO8eev6P3XxQHvDxp08=;
 b=K4vZipE6efbz4q6VSXN0GXsxt+iyfR1ommq1yibvtCfcR/UAOfwjHVVLJpm6khCk/NQ3Tr
 hwQ2/Czs6Llvl4NMF2TTbyU9mR29XhziFzv+lfSuIieYycXzftp7rQ8iofOILu/kXSX3+Q
 bNIBWTSR6UKI+wekCc3mFbKDdpsjJpc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-u62xQxSPM0qnnDKw3XLpeQ-1; Tue, 04 Apr 2023 04:29:22 -0400
X-MC-Unique: u62xQxSPM0qnnDKw3XLpeQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 s28-20020adfa29c000000b002d92bb99383so3549837wra.23
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680596961;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3n1dehyGNRRP/AtKpPQWqmxhO8eev6P3XxQHvDxp08=;
 b=R1jz1E++pFAm3D1joPHCsw5mgbet5+0nruZBiE/V5p/YkBMvzfByakyIOLbiaEDhoJ
 po/WmZEnwUkoU0zxySrR1IIdX8yV/+PqUf+eLKgqMU4+xVah0lLFNtqlkV8UmQQdXwti
 CgAo+GpAguILI6Jzke2DosQonaSOESaQoMr4XWR5VFnvN3xNiwmqFja8YU+x82NWsCDJ
 vfY0KbzsnFyAGbeT9ExTN8C4nKNehutNUkx0YKl/lA5Rf+ptr2MsIAndvezFwF7Lcz2P
 LAs7rxkMFWeFymcympKBNECiHyvM65QTiAvvMx1BpLx/5y72+NMB6rXAmhI68tDDntzV
 KVng==
X-Gm-Message-State: AAQBX9eA/gq/QlsftaJEnughDhVsXl+TE11AYDp4a23ygihrkhZNX/17
 AFkOkH2C67ZOjToUSb3xqNsbg/ci1CtP4jlVd4LcB8pHqOvFLOzLDPwjqV8VjciiBBRQhz1x4GX
 BoaLh96djfiNTN8c=
X-Received: by 2002:adf:f10f:0:b0:2e6:1b9a:8cc8 with SMTP id
 r15-20020adff10f000000b002e61b9a8cc8mr881410wro.29.1680596960936; 
 Tue, 04 Apr 2023 01:29:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZK6qJBHaWIIJaBySnuQXTkqwZbDlI82zsnF/jjcYCRx50wSX2nYZU8Hm0ST+pv6L2rEh2seA==
X-Received: by 2002:adf:f10f:0:b0:2e6:1b9a:8cc8 with SMTP id
 r15-20020adff10f000000b002e61b9a8cc8mr881388wro.29.1680596960626; 
 Tue, 04 Apr 2023 01:29:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:b600:e63:6c3b:7b5d:f439?
 (p200300cbc709b6000e636c3b7b5df439.dip0.t-ipconnect.de.
 [2003:cb:c709:b600:e63:6c3b:7b5d:f439])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adff611000000b002c5a790e959sm11701407wrp.19.2023.04.04.01.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 01:29:20 -0700 (PDT)
Message-ID: <a0710fac-fe6d-364d-56ae-1f0b116b44bf@redhat.com>
Date: Tue, 4 Apr 2023 10:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4] hostmem-file: add offset option
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20230401124257.24537-1-graf@amazon.com>
 <20230401174716.GB154566@fedora>
 <f2e232df-51d4-9cac-557d-329523a69530@redhat.com>
 <b3e4a295-f233-9a49-2220-9ad4638e6c65@amazon.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <b3e4a295-f233-9a49-2220-9ad4638e6c65@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>
>> The change itself looks good to me, but I do think some other QEMU code
>> that ends up working on the RAMBlock is not prepared yet. Most probably,
>> because we never ended up using fd with an offset as guest RAM.
>>
>> We don't seem to be remembering that offset in the RAMBlock. First, I
>> thought block->offset would be used for that, but that's just the offset
>> in the ram_addr_t space. Maybe we need a new "block->fd_offset" to
>> remember the offset (unless I am missing something).
>>
>> The real offset in the file would be required at least in two cases I
>> can see (whenever we essentially end up calling mmap() on the fd again):
>>
>> 1) qemu_ram_remap(): We'd have to add the file offset on top of the
>> calculated offset.
> 
> 
> This one is a bit tricky to test, as we're only running into that code
> path with KVM when we see an #MCE. But it's trivial, so I'm confident it
> will work as expected.
> 

Indeed.

> 
>>
>> 2) vhost-user: most probably whenever we set the mmap_offset. For
>> example, in vhost_user_fill_set_mem_table_msg() we'd similarly have to
>> add the file_offset on top of the calculated offset.
>> vhost_user_get_mr_data() should most probably do that.
> 
> 
> I agree - adding the offset as part of get_mr_data() is sufficient. I
> have validated it works correctly with QEMU's vhost-user-blk target.
> 
> I think the changes are still obvious enough that I'll fold them all
> into a single patch.

Most probably good enough. Having the offset part separately as a fix 
for ed5d001916 ("multi-process: setup memory manager for remote device") 
could be beneficial, though.

Thanks Alex!

-- 
Thanks,

David / dhildenb


