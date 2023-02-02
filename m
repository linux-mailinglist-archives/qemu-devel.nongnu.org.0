Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232C687E26
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZAn-0004xE-8G; Thu, 02 Feb 2023 07:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pNZAj-0004wi-At
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:58:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pNZAh-000788-Qn
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675342713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qm+yeFd4pnhA1whtOLVjoKR2fAyw/nSZvd5jeulr63c=;
 b=Ghkmkr54bRKjhkvHcxebyJw2Jt058q5V6lcju0ySnDJnP2PJLo9rB3Lq+LL3r/P7UU0K/5
 foWLDxoPfPWAcHctjXLdACzCc/+Aw9nfDZLhqon7BrrNnRBnbi+WtAwqZkW//rUJV2lKta
 aT3Xu6gH/kji5kWXsxgHiGdiGvuCl6c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-gwgLmgByPwqHgHA212E0Cw-1; Thu, 02 Feb 2023 07:58:31 -0500
X-MC-Unique: gwgLmgByPwqHgHA212E0Cw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003da1f6a7b2dso2800909wmb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 04:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qm+yeFd4pnhA1whtOLVjoKR2fAyw/nSZvd5jeulr63c=;
 b=g9USw7l0j4RT8lC8Tdx0Cj0d/BIBz0sJAe8ifFK1rXfFAwddMxBXo3u82dCVIIfnWc
 NFz9Urv8rf3v88bc8eOR25JZavIoKZP0XYVdH5icfRbto/vAd0Opbz4MnbT3PFxqgnHq
 agkXElL1dV/1A/p9YD9EfbO9L8LhvAq6eSd7qhbLVAc6YtLCdBVx9Ii64AgdLZdkfJuX
 GIXF2VtVtTeWwC6dyBdYc280aO1ZbcfqTBGWkK+U+FYNPoyz9qYbElP+tH75ouHgxybh
 or5Bt/UBQgue3mSR9r8PSpFCm2lMfSHP4jM0wgQlyQFaMW2oJlEHH1Bt2T0AlB5bgQbi
 wdqQ==
X-Gm-Message-State: AO0yUKVSyMxD/JWSyAtry4hIHVRQY6i41iXAdbDbxU4I0gW53PWAIMSn
 yj/+Ycd8nrYIiP1g8koxuOywf2uxPaWVtpfJJ50tPeOtnI6KYkYgheCTtWh0X8mljDfLugpt9XX
 7IjkISA+KdTW5q0U=
X-Received: by 2002:a5d:434c:0:b0:2bf:e31a:26b9 with SMTP id
 u12-20020a5d434c000000b002bfe31a26b9mr5229416wrr.63.1675342710689; 
 Thu, 02 Feb 2023 04:58:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8ekRowHyG5ys2CKU9ntrBUw6oJViO3425USj/2xTCAUl8tStxurfibpcQxhb7ENbNGLm5WAA==
X-Received: by 2002:a5d:434c:0:b0:2bf:e31a:26b9 with SMTP id
 u12-20020a5d434c000000b002bfe31a26b9mr5229403wrr.63.1675342710447; 
 Thu, 02 Feb 2023 04:58:30 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfcd0a000000b002bff7caa1c2sm8892918wrm.0.2023.02.02.04.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 04:58:29 -0800 (PST)
Message-ID: <66be6ed2-f961-1731-4fb5-f4bac5f92a51@redhat.com>
Date: Thu, 2 Feb 2023 13:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 0/8] virtio-mem: Handle preallocation with migration
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230117112249.244096-1-david@redhat.com>
 <01a7ad2a-5fbc-a3ad-f3a9-82bf5b44096e@redhat.com>
 <87ilgks4z4.fsf@secure.mitica>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87ilgks4z4.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02.02.23 12:04, Juan Quintela wrote:
> David Hildenbrand <david@redhat.com> wrote:
>> On 17.01.23 12:22, David Hildenbrand wrote:
>>> While playing with migration of virtio-mem with an ordinary file backing,
>>> I realized that migration and prealloc doesn't currently work as expected
>>> for virtio-mem. Further, Jing Qi reported that setup issues (insufficient
>>> huge pages on the destination) result in QEMU getting killed with SIGBUS
>>> instead of failing gracefully.
>>> In contrast to ordinary memory backend preallocation, virtio-mem
>>> preallocates memory before plugging blocks to the guest. Consequently,
>>> when migrating we are not actually preallocating on the destination but
>>> "only" migrate pages. Fix that be migrating the bitmap early, before any
>>> RAM content, and use that information to preallocate memory early, before
>>> migrating any RAM.
>>> Postcopy needs some extra care, and I realized that
>>> prealloc+postcopy is
>>> shaky in general. Let's at least try to mimic what ordinary
>>> prealloc+postcopy does: temporarily allocate the memory, discard it, and
>>> cross fingers that we'll still have sufficient memory when postcopy
>>> actually tries placing pages.
>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Cc: Juan Quintela <quintela@redhat.com>
>>> Cc: Peter Xu <peterx@redhat.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Cc: Michal Privoznik <mprivozn@redhat.com>
>>
>> @Juan, David: I can similarly take this via my tree as well.
> 
> Reviewing it.
> 
> I can get it through migration tree, thanks.
> 
> Later, Juan.

Thanks Juan and Michael!

-- 
Thanks,

David / dhildenb


