Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB82822A9
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 10:50:03 +0200 (CEST)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOdEw-0001xq-3u
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 04:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOdDI-0000rj-LN
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 04:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOdDG-0003dK-9U
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 04:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601714897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yD2Xg+heLEf/P4MLYz+dS5vx/J1O0Ekd2CO4abRGUI=;
 b=IZBvuzTz3/gX1eODDowjdNzWz67prVyS566rsBHR6xJ6z39WoXCxpU9GBnILNG2YlvqG70
 Gmh4CaT9dInJiN/Da7Fko3okm7sBShHdYy7PKMrmlh5IFXY/STGLvWV1dV/ZjsEuCBcBDQ
 EpQDldvLOW7ykK9dupD0BxBluagVTJg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-K8ci0tRrMoSH5XissPg2IA-1; Sat, 03 Oct 2020 04:48:13 -0400
X-MC-Unique: K8ci0tRrMoSH5XissPg2IA-1
Received: by mail-wr1-f71.google.com with SMTP id c6so622522wrt.6
 for <qemu-devel@nongnu.org>; Sat, 03 Oct 2020 01:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/yD2Xg+heLEf/P4MLYz+dS5vx/J1O0Ekd2CO4abRGUI=;
 b=LmwVDTmtCnkScuUCgmqNrolF7Oih6nfF00yBBpXfZLkPoFX8qorVkMeR43j+y3qcip
 ThJ1ekV1PoXcbAq3B9hY9UHqIXHU35cV5F6RHy/TfaV4FG+q+rDmiuufYwa13HWjjnh6
 2/Eg682F+X/hUlDFn32vK3MJpTsNx3BCtKdSCrq1jMZoH7gGEccuPlLP8ZSyGJSLOQVm
 55CEvKZWWTJlr1GWJ6lVhXZb25LopqC5HIU1rUodeDTeXphBCAKNRa56K5nIzNVoMmpr
 ajEdDZLAt7rG2LDyxb3/OgxgA5TE0FTUHrJx3why39cbe6g5PEZPWeNL/rwMeMkn2jyh
 RdnQ==
X-Gm-Message-State: AOAM532IfYJXiPS3CLF9Lhgddfj2GyGMNxlw933bfVm3c6RgxLKnx7Tx
 kmZUJAqpby4xNjNDmTEH+Chw5zsk8/cd3abn6HQp6gXyJ0rmscdaHt2pqUn9LlYDyyDwKWj9uoc
 kZLTYJLCWE9m7SV4=
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr7276929wrw.331.1601714892044; 
 Sat, 03 Oct 2020 01:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAIX0iUFCBJ4wyETu7XcFXy583sWva8tpa1gx50dhNU0Dwz4oNCcxqQkasJf6KRmPiXxW7Lw==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr7276871wrw.331.1601714891730; 
 Sat, 03 Oct 2020 01:48:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f6ef:6259:374d:b794?
 ([2001:b07:6468:f312:f6ef:6259:374d:b794])
 by smtp.gmail.com with ESMTPSA id u81sm1344487wmg.43.2020.10.03.01.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 01:48:11 -0700 (PDT)
Subject: Re: [PATCH v3] qemu/atomic.h: rename atomic_ to qatomic_
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200923105646.47864-1-stefanha@redhat.com>
 <4e65d6fa-0a7e-015b-eb6f-5dd1cc3ddd91@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <45ba3626-0e06-96c7-5ed8-ea561ae20f15@redhat.com>
Date: Sat, 3 Oct 2020 10:48:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4e65d6fa-0a7e-015b-eb6f-5dd1cc3ddd91@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 02:43:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 sheepdog@lists.wpkg.org, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Jiri Slaby <jslaby@suse.cz>, Stefano Stabellini <sstabellini@kernel.org>,
 Alberto Garcia <berto@igalia.com>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Liu Yuan <namei.unix@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, Max Reitz <mreitz@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/20 18:43, Matthew Rosato wrote:
>> diff --git
>> a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>> b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>> index acd4c8346d..7b4062a1a1 100644
>> ---
>> a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>> +++
>> b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>> @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx,
>> uint32_t max_elems)
>>     static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
>>   {
>> -    const unsigned int idx = atomic_read(var);
>> +    const unsigned int idx = qatomic_read(var);
>>         if (pvrdma_idx_valid(idx, max_elems))
>>           return idx & (max_elems - 1);
>> @@ -77,17 +77,17 @@ static inline int32_t pvrdma_idx(int *var,
>> uint32_t max_elems)
>>     static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
>>   {
>> -    uint32_t idx = atomic_read(var) + 1;    /* Increment. */
>> +    uint32_t idx = qatomic_read(var) + 1;    /* Increment. */
>>         idx &= (max_elems << 1) - 1;        /* Modulo size, flip gen. */
>> -    atomic_set(var, idx);
>> +    qatomic_set(var, idx);
>>   }
>>     static inline int32_t pvrdma_idx_ring_has_space(const struct
>> pvrdma_ring *r,
>>                             uint32_t max_elems, uint32_t *out_tail)
>>   {
>> -    const uint32_t tail = atomic_read(&r->prod_tail);
>> -    const uint32_t head = atomic_read(&r->cons_head);
>> +    const uint32_t tail = qatomic_read(&r->prod_tail);
>> +    const uint32_t head = qatomic_read(&r->cons_head);
>>         if (pvrdma_idx_valid(tail, max_elems) &&
>>           pvrdma_idx_valid(head, max_elems)) {
>> @@ -100,8 +100,8 @@ static inline int32_t
>> pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
>>   static inline int32_t pvrdma_idx_ring_has_data(const struct
>> pvrdma_ring *r,
>>                            uint32_t max_elems, uint32_t *out_head)
>>   {
>> -    const uint32_t tail = atomic_read(&r->prod_tail);
>> -    const uint32_t head = atomic_read(&r->cons_head);
>> +    const uint32_t tail = qatomic_read(&r->prod_tail);
>> +    const uint32_t head = qatomic_read(&r->cons_head);
>>         if (pvrdma_idx_valid(tail, max_elems) &&
>>           pvrdma_idx_valid(head, max_elems)) {
> 
> 
> It looks like the changes in this file are going to get reverted the
> next time someone does a linux header sync.

Source code should not be at all imported from Linux.  The hacks that
accomodate pvrdma in update-linux-headers.sh (like s/atomic_t/u32/)
really have no place there; the files in
include/standard-headers/drivers/infiniband/hw/vmw_pvrdma should all be
moved in hw/.

Paolo


