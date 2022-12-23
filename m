Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8902654E77
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 10:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8eS2-000577-H7; Fri, 23 Dec 2022 04:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8eRv-00056k-1j
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 04:34:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8eRt-0000Np-Ey
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 04:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671788080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ovMIuIh36TeTfawURs8ps0CLPwSIfZQmQ+fxTCnzVY=;
 b=ixWSOLaEKHHbUvlhQG2mvJkbmOv2is2GE5lXscpS4tUQXstt8aqQN4H0Kc9eT0fWZEBFwX
 VxIyzAkgMmdZTlCydAWxXsVDuCqhuTEJAdTXJ1y2rJFcERAkGxl2QC6Rx8H0fu77Kc/GMY
 iLpmK5eo4/0e2TLbbjer9LfyGfY8iv8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-eEv5fKteMZGLRNBCd6GoEA-1; Fri, 23 Dec 2022 04:34:39 -0500
X-MC-Unique: eEv5fKteMZGLRNBCd6GoEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so1985475wma.6
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 01:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ovMIuIh36TeTfawURs8ps0CLPwSIfZQmQ+fxTCnzVY=;
 b=AdjH8tRBu6bk8TWkltrJAUnva64nZaAXxHWphOCGzd5BI7sDxdvaTQJcx0Q376tg0C
 LZsO2SmtcBiFbpe2InzoEmGnlSoAD2JP7fdczckoRQi4SSgGjqVbTnW3QnruoxyHsKmD
 68Hkq87IoSVwgey2UYhPY2tFIrF3gi4dxgQcnzzCN/1uHFWlnAE8encGuGzkGK8GB9Ml
 TtR5gqJrLHjqHbIq++MSKma7oUgp+U+xguu3Hh7f+4YYNGj8iM1HEDKmS99bXhEPUOOG
 kv1Mfg6Q7aGp6/2xN24/lngTYbvWaaC3/sqi5/VUOJdnFo56sNbvDjZ2jPcxaQ5ssqy+
 iWPA==
X-Gm-Message-State: AFqh2kouQF4r5FrvisMM9r8j0gQcgCQD/hwaaiov4X0BRhcIeTE0NZz3
 knT0oS1PkFSFWnQvEd8SdpZKK1h7HglDQJuBBenUTp72UWeIzVhcPJeIjYXveGSHAKyx6fVxyJ2
 9lih0jfrL3jC+Im/bjzYQt6R38XFA48nXfmN2uDUXYMVhEuInCa05S2+QO784MxU=
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr7716994wmq.6.1671788077993; 
 Fri, 23 Dec 2022 01:34:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsb2eYFEUkzSHJ2r8lam9tau5Qv89tPvHHDbQQgazt/MNZ4E7DyC7hKMmkEQqzs/nLZkChIDQ==
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr7716971wmq.6.1671788077619; 
 Fri, 23 Dec 2022 01:34:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:ab00:3d8e:16c4:a38d:2827?
 (p200300cbc707ab003d8e16c4a38d2827.dip0.t-ipconnect.de.
 [2003:cb:c707:ab00:3d8e:16c4:a38d:2827])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm15729737wmq.1.2022.12.23.01.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 01:34:37 -0800 (PST)
Message-ID: <950cb6c6-6271-8126-9c75-533a6b6edaae@redhat.com>
Date: Fri, 23 Dec 2022 10:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221222110215.130392-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22.12.22 12:02, David Hildenbrand wrote:
> For virtio-mem, we want to have the plugged/unplugged state of memory
> blocks available before migrating any actual RAM content. This
> information is immutable on the migration source while migration is active,
> 
> For example, we want to use this information for proper preallocation
> support with migration: currently, we don't preallocate memory on the
> migration target, and especially with hugetlb, we can easily run out of
> hugetlb pages during RAM migration and will crash (SIGBUS) instead of
> catching this gracefully via preallocation.
> 
> Migrating device state before we start iterating is currently impossible.
> Introduce and use qemu_savevm_state_start_precopy(), and use
> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
> state will be saved in qemu_savevm_state_start_precopy() or in
> qemu_savevm_state_complete_precopy_*().
> 
> We have to take care of properly including the early device state in the
> vmdesc. Relying on migrate_get_current() to temporarily store the vmdesc is
> a bit sub-optimal, but we use that explicitly or implicitly all over the
> place already, so this barely matters in practice.
> 
> Note that only very selected devices (i.e., ones seriously messing with
> RAM setup) are supposed to make use of that.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

[...]

>   
>       if (inactivate_disks) {
> @@ -1427,6 +1474,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>           qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>       }
>   
> +    /* Free it now to detect any inconsistencies. */
> +    g_free(vmdesc);

Missed to convert that to a json_writer_free().

-- 
Thanks,

David / dhildenb


