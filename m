Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B7677DFE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxnj-0000Mf-Ey; Mon, 23 Jan 2023 09:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxnh-0000C2-2L
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:27:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxnf-0005yB-8V
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674484074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANpBSA5NVaYx+EsAfKkK7Q1Jj4Qd83UrrpIv/oDmikk=;
 b=RlzYSsoWbaM6bCO6oMOr1P9Y9BswaWWZaSEEtWnBdyNMpd6siz6KhMbLvoDH5+ahKeXYHu
 epspAn6/ORlYknYV+HMfz2ADTBKz8o66lLfJg0cyoO6NTwGsZacLGRyllAcEhm1ANGHWBz
 Jqoe0UTfTfVvxAlj8llgLP1jLimPpx8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-9Ymf2lTUPk2RQpIMNfds4g-1; Mon, 23 Jan 2023 09:27:52 -0500
X-MC-Unique: 9Ymf2lTUPk2RQpIMNfds4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 p1-20020a05600c1d8100b003daff82f5edso7582744wms.8
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 06:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ANpBSA5NVaYx+EsAfKkK7Q1Jj4Qd83UrrpIv/oDmikk=;
 b=Oa31roWlVwuXLXuYNob5OhoWNsoaZpFnuxtYYYWeL+slbJarh5nP2TVuLvdJZFPhof
 /AWfw+vQ3ouBVLlhzIl9ATSQS1WF2rik7nIiGMYkD/aEnnIzvesvGsNKCq8e1f7fpkv7
 iTzSVf0AjlmYvKE+sWFYHyvFzk0AN3o450oUZxhn96RZIjUX72rqXBrOOTo8Sie/VtRZ
 xpFkZ8bjQJmiYhp1ypIbfmB8twf0caQ0QAfLkV3+mcnfOxiyOhFecpPwxf97/Xxx9QcR
 mROCUtim9ekFYM0zPM00vEMsA+kHeZgLxulox/oAdTFZl/OVNdyIqdtNuk4y+Ujv96GV
 w9vw==
X-Gm-Message-State: AFqh2kr17qTZIpoZXHintjK5I6osJkVTuO22qBBgmfT+Yz7/ERSLwavt
 SHdhPgBoQYr803yFl0nddtrlGJREjs7+3ow/1x+vlcP9VB/h3mHnhObhCSAzOs0/iUMJVbnHW4q
 BongU8Xeqt5zyToINsDtNymYIp1yt2VQ/iR1K4F4Z4j2/IX9jZ5PvGeqGD25JV9k=
X-Received: by 2002:a05:600c:89a:b0:3cf:6e78:e2ca with SMTP id
 l26-20020a05600c089a00b003cf6e78e2camr32053133wmp.5.1674484071305; 
 Mon, 23 Jan 2023 06:27:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1IAalw0uO6tXHP+5goD+uxC+4CRBoGyBAOEm02OJWMYWbADo9++sTn2meUXKiDFjjJq2Now==
X-Received: by 2002:a05:600c:89a:b0:3cf:6e78:e2ca with SMTP id
 l26-20020a05600c089a00b003cf6e78e2camr32053112wmp.5.1674484070990; 
 Mon, 23 Jan 2023 06:27:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1100:65a0:c03a:142a:f914?
 (p200300cbc704110065a0c03a142af914.dip0.t-ipconnect.de.
 [2003:cb:c704:1100:65a0:c03a:142a:f914])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a05600c188f00b003db122d5ac2sm10355037wmp.15.2023.01.23.06.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:27:50 -0800 (PST)
Message-ID: <01a7ad2a-5fbc-a3ad-f3a9-82bf5b44096e@redhat.com>
Date: Mon, 23 Jan 2023 15:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 0/8] virtio-mem: Handle preallocation with migration
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230117112249.244096-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230117112249.244096-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17.01.23 12:22, David Hildenbrand wrote:
> While playing with migration of virtio-mem with an ordinary file backing,
> I realized that migration and prealloc doesn't currently work as expected
> for virtio-mem. Further, Jing Qi reported that setup issues (insufficient
> huge pages on the destination) result in QEMU getting killed with SIGBUS
> instead of failing gracefully.
> 
> In contrast to ordinary memory backend preallocation, virtio-mem
> preallocates memory before plugging blocks to the guest. Consequently,
> when migrating we are not actually preallocating on the destination but
> "only" migrate pages. Fix that be migrating the bitmap early, before any
> RAM content, and use that information to preallocate memory early, before
> migrating any RAM.
> 
> Postcopy needs some extra care, and I realized that prealloc+postcopy is
> shaky in general. Let's at least try to mimic what ordinary
> prealloc+postcopy does: temporarily allocate the memory, discard it, and
> cross fingers that we'll still have sufficient memory when postcopy
> actually tries placing pages.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>

@Juan, David: I can similarly take this via my tree as well.

-- 
Thanks,

David / dhildenb


