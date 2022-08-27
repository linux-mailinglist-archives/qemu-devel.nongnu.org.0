Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AED5A39A8
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 21:03:43 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS15q-0000x2-3U
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 15:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oS125-0006kp-Uy
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 14:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oS122-0001tl-Fp
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 14:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661626784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GujzdJ8kkZ2wkBd5UbWK05w2fpb8OsB8+ML9qeQcTUY=;
 b=NxiB/21ZPf/S2Jv7eJKd278nyBSMy/8MNMIgmjMfTi7UdJ/Xf46GBw5qgBtyruUbdiQmiS
 IOTTBgbleSGq2oBfg/DDXczCmqBoeyOtwgaCyc/VXSZzRGipOWcsLlTPIH/zkM2GH850+3
 wfBYQ3Zo48G39YvvApQG3wT+qUeVTOY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-HhH8dAK_NJK9Bk3NhPCUpQ-1; Sat, 27 Aug 2022 14:59:40 -0400
X-MC-Unique: HhH8dAK_NJK9Bk3NhPCUpQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bm11-20020a05620a198b00b006bb2388ef0cso3660126qkb.5
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 11:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=GujzdJ8kkZ2wkBd5UbWK05w2fpb8OsB8+ML9qeQcTUY=;
 b=Fe/qASGgnFxXy9bsNx2RyYPWBhm4mdKmhv+YobGI8vOKZIvYMgip3BEttlYmZmT1GK
 e80xClLOg0WBtABl4n+2yRtYI3roPbQGUZNu2VmoJJnIW8vOXAT83LT8K89Mz8Ay3967
 /97kGa7UnjpXCjSR5RQc8aLKuHZgJ1x4ICVrKN4a8pgvn+Z7qmRjQ3EQsJ9KHRjEf0wY
 2KFWAW/m9JISmQbC7iTlNADLvgGRN6oap7qpIfsPA98UzZYmgrI/p+i961OL47p1CRhh
 fWXMZrqT6AM9y3Wfh0/TRQSjW23SqTAdmxcbaPe0dTAhQ2iCbPe+VtT3Gz6pMv4+GWPP
 eAxQ==
X-Gm-Message-State: ACgBeo3zZMODR0ns3bVBIyEeUSTuNdhFY5Ksdh6RZaINEKWPtt8MwQAx
 umZSMXjIOHmIr+Z0stnFuxQDWS5rQnAl5r2M8iQgTiPcxx22RIgFXodrsonOSEs/Aw6/MmAgIWU
 O/9guxMYeqBUhuFY=
X-Received: by 2002:a05:6214:23ca:b0:474:2411:b482 with SMTP id
 hr10-20020a05621423ca00b004742411b482mr4533109qvb.128.1661626780293; 
 Sat, 27 Aug 2022 11:59:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4coTH1/cdvHvLzxzAQImQNtmwt281mjBIEYd4R0FtGiw1ojtujKWqL4ZqxYSiS2xiPmZq+7Q==
X-Received: by 2002:a05:6214:23ca:b0:474:2411:b482 with SMTP id
 hr10-20020a05621423ca00b004742411b482mr4533093qvb.128.1661626780062; 
 Sat, 27 Aug 2022 11:59:40 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a37f703000000b006b5cc25535fsm2248412qkj.99.2022.08.27.11.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 11:59:39 -0700 (PDT)
Date: Sat, 27 Aug 2022 14:59:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
Message-ID: <YwppmYUOLTqQ7K25@xz-m1.local>
References: <20220826160927.322797-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220826160927.322797-1-afaria@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Alberto,

On Fri, Aug 26, 2022 at 05:09:27PM +0100, Alberto Faria wrote:
> Apply cache->xlat to addr before passing it to
> flatview_(read|write)_continue(), to convert it from the
> MemoryRegionCache's address space to the FlatView's.

Any bug encountered?  It'll be great to add more information into the
commit message if there is.  We could also mention the issue was observed
by code review or so.

> 
> Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
> Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  softmmu/physmem.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index dc3c3e5f2e..95d4c77cc3 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3450,9 +3450,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>      l = len;
>      mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
>                                          MEMTXATTRS_UNSPECIFIED);
> -    return flatview_read_continue(cache->fv,
> -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> -                                  addr1, l, mr);
> +    return flatview_read_continue(cache->fv, cache->xlat + addr,
> +                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
> +                                  mr);
>  }
>  
>  /* Called from RCU critical section. address_space_write_cached uses this
> @@ -3468,9 +3468,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>      l = len;
>      mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
>                                          MEMTXATTRS_UNSPECIFIED);
> -    return flatview_write_continue(cache->fv,
> -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> -                                   addr1, l, mr);
> +    return flatview_write_continue(cache->fv, cache->xlat + addr,
> +                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
> +                                   mr);
>  }

The issue looks correct, but I hesitate on the fix.. since afaict
cache->xlat is per memory region not flat view, so the new calculation is
offset within memory region but not flat view too.

So I'm wondering whether it should become:

  cache->xlat + addr - cache.mrs.offset_within_region +
    cache.mrs.offset_within_address_space

If the issue happens on vIOMMU+virtio on x86, then offset_within_region and
offset_within_address_space should be all zeros for vt-d emulation since
vt-d only has one huge vIOMMU window, then the outcome could be the same.
However maybe there might be a difference with other vIOMMUs.

Thanks,

-- 
Peter Xu


