Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001E57DAAB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:13:46 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEmr2-0001oR-IK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEmTh-0002NN-HN
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEmTd-0002xq-TZ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658472571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qb5tsHWDKIBrUMiGkdwqnGOdOuRh5/NIzQD7xlQ9K2E=;
 b=glQJektVqybxC8RrcqPVVeM/vr0VXwUw7RsvxnnvShawdn1ZFyduA8gndH9dH3XK4ejTrZ
 jq/xYwPPtzKQ/d3Qjsy1DgCQUTxIQ9aFu188GePZ+zCENraNvKNmN5PBs5XcAM4sBO8m9A
 hvc0YIZUMfXyLr8SqoJ07btSsDLz9D4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-xhUrIBe1NIeQfA702X61GA-1; Fri, 22 Jul 2022 02:49:29 -0400
X-MC-Unique: xhUrIBe1NIeQfA702X61GA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso1417139wmm.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 23:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=qb5tsHWDKIBrUMiGkdwqnGOdOuRh5/NIzQD7xlQ9K2E=;
 b=I+mUZKaQLndIpMm89xxXI8p5MpY6RA/XNB9y583mjeI5UakVQ0Qh/afUkj+1p2H0UK
 Bsckicbl0fLw3/3UH+Xohqu3f3vrtto7n3Oz7ImKMONp8ogESL5PtedrOb8Ti5G72dtG
 CU+T8tgdW13wR30OG1/C2LyQtCaGgKbPZ0vMmFhdLvguuu7SNmHEGRqtT4miM/J64dK1
 xUWjugsaYTkKzcxl0KBvwb1Kml0KJ3sl0/Z0eRq0Z2GCNO4ZHStAJyCv1omny2vimCVv
 x8KW8YS/a3a3WUTEve/N3r2BSCozID414sfcupb1on3VhwUoOypIiWYWd7Xee/7+5Wwb
 41gQ==
X-Gm-Message-State: AJIora/51E69VNrMShBGD0sUapPlV1u28C0F1jkb2y93ePavhIGa9GW/
 AukVG0VoJzXH3eqsFX9xfGFqOU2VTh4h5xbzFQ7kRXcFhohLvW6/7NXFl9u5bFoWCEiYX8YmTFz
 H+CXfe6+ySjWaG60=
X-Received: by 2002:a1c:f314:0:b0:3a2:fee4:91d4 with SMTP id
 q20-20020a1cf314000000b003a2fee491d4mr10635872wmq.108.1658472568205; 
 Thu, 21 Jul 2022 23:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEuwENe+sUD20PImTONr/MzCouZXsw9iKoxrhYaTcwCXtbJ2vsDLmXKhKFnoPE3YdMoQ9mdQ==
X-Received: by 2002:a1c:f314:0:b0:3a2:fee4:91d4 with SMTP id
 q20-20020a1cf314000000b003a2fee491d4mr10635838wmq.108.1658472567663; 
 Thu, 21 Jul 2022 23:49:27 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:cb00:cd6b:7964:cc7d:b0e6?
 (p200300cbc707cb00cd6b7964cc7db0e6.dip0.t-ipconnect.de.
 [2003:cb:c707:cb00:cd6b:7964:cc7d:b0e6])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003a033177655sm3507884wmq.29.2022.07.21.23.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 23:49:27 -0700 (PDT)
Message-ID: <b63cb739-06b5-6a97-4b23-fce36ef52ef2@redhat.com>
Date: Fri, 22 Jul 2022 08:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peterx@redhat.com, f4bug@amsat.org
References: <20220622012839.3419865-1-zhenzhong.duan@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
In-Reply-To: <20220622012839.3419865-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22.06.22 03:28, Zhenzhong Duan wrote:
> The comment of flatview_access_allowed() suggests to pass address
> within that memory region, this isn't ture in some call sites.

s/ture/true/

> 
> This makes qemu log in flatview_access_allowed() confusing and
> potential risk if the input parameter will be checked in the future.
> 
> Fixes: 3ab6fdc91b72 ("softmmu/physmem: Introduce MemTxAttrs::memory field and MEMTX_ACCESS_ERROR")

My opinion is to not use fixes tags unless there is really something
broken -- a user-visible effect of a BUG exists.

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  softmmu/physmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index fb16be57a6c6..214cb04c8fc3 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2850,7 +2850,7 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
>  
>      l = len;
>      mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
> -    if (!flatview_access_allowed(mr, attrs, addr, len)) {
> +    if (!flatview_access_allowed(mr, attrs, addr1, l)) {
>          return MEMTX_ACCESS_ERROR;
>      }
>      return flatview_write_continue(fv, addr, attrs, buf, len,
> @@ -2917,7 +2917,7 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
>  
>      l = len;
>      mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
> -    if (!flatview_access_allowed(mr, attrs, addr, len)) {
> +    if (!flatview_access_allowed(mr, attrs, addr1, l)) {
>          return MEMTX_ACCESS_ERROR;
>      }
>      return flatview_read_continue(fv, addr, attrs, buf, len,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


