Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D26E1009
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 16:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmxzh-00086g-Mh; Thu, 13 Apr 2023 10:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmxze-00085Z-Vi
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 10:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmxzb-0004jz-Su
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 10:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681396325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hihIMZCeWeEH9FAUegzK2ktyJfVIK6kw0jBVsUVg+F0=;
 b=hJPWGBNYm/vyyOZEFHZqve6AbJulbOWHv1l2nljZJoi9s7ULtRAbXD1Mo0RB0f5xqHEwxl
 V8IwbmaIFhWr7JqXBC8kn2umMP4FaU+69OwcaO5nz2v4kLTQKrnoX/r6pUvTgmFQoQzmLU
 HkknVwMqIljI44HpZZWZyGoORf1QNqc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-8a5u-Tp_NVqf9Iw7ByHJww-1; Thu, 13 Apr 2023 10:32:04 -0400
X-MC-Unique: 8a5u-Tp_NVqf9Iw7ByHJww-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-5ea572ef499so9244516d6.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 07:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681396324; x=1683988324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hihIMZCeWeEH9FAUegzK2ktyJfVIK6kw0jBVsUVg+F0=;
 b=Jx0ef0enp0zGJ16hVOWXbGDtms4JEnSuRwPxo5/KrakeCfy0VDqwUFvv41aVE3lFk9
 FKePCi9T2fLFX5JoGClJ8eDMxlNyo0+IcFk80zp6XKc0xikNsKV3fs7fcDCu/WH1We48
 OBcoeS4J/EQPE5CbTdBoe/uCFSURTeUCXHeb+8EtzW3JmnwA4BK6XQI5mr6QcYMElQ3j
 VUklHkBltMmJNv//2+AeC0mLXzwQ7+eiidpqsFl/6ULojeAuDpbMwTAUkSr0w+bfuMjR
 kGil2Dp/gSGYW9wDxvbw1pq/Z8dxt52Zehg/Qt1tz/7ulyC58F+R6JwKqLjobl1eNrTf
 Y/Cw==
X-Gm-Message-State: AAQBX9cMj/nsHgYebi7P+92Ku1Ry0tAcIjWhRNREIy8yxp2pGv+Ufveq
 X/Xsq3yaVAE2bGDUIQ8zOeMSyCk8UKlLgqBxXjW31WUHT4c2Pu/ep43wHRmvvPtt4vtY/qUE6Fi
 FxiNzU08s1sSBucQ=
X-Received: by 2002:a05:6214:3007:b0:5da:b965:1efd with SMTP id
 ke7-20020a056214300700b005dab9651efdmr3361971qvb.2.1681396323700; 
 Thu, 13 Apr 2023 07:32:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z+dEKhiZjXvvZ/9ruj0y9xcP+SM+8Ui8K1DLykixOSKvEOVoO8nN8hVftMs7jeGAYoEDi7pQ==
X-Received: by 2002:a05:6214:3007:b0:5da:b965:1efd with SMTP id
 ke7-20020a056214300700b005dab9651efdmr3361945qvb.2.1681396323409; 
 Thu, 13 Apr 2023 07:32:03 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 er5-20020a056214190500b005e7648f9b78sm452037qvb.109.2023.04.13.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 07:32:02 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:32:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH V2] intel_iommu: refine iotlb hash calculation
Message-ID: <ZDgSYYYJFOFLIDiu@x1n>
References: <20230412073510.7158-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230412073510.7158-1-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Apr 12, 2023 at 03:35:10PM +0800, Jason Wang wrote:
> Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
> account when calculating iotlb hash like:
> 
> static guint vtd_iotlb_hash(gconstpointer v)
> {
>     const struct vtd_iotlb_key *key = v;
> 
>     return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>            (key->level) << VTD_IOTLB_LVL_SHIFT |
>            (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> }
> 
> This turns out to be problematic since:
> 
> - the shift will lose bits if not converting to uint64_t
> - level should be off by one in order to fit into 2 bits
> - VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
>   some bits
> - the hash result is uint64_t so we will lose bits when converting to
>   guint
> 
> So this patch fixes them by
> 
> - converting the keys into uint64_t before doing the shift
> - off level by one to make it fit into two bits
> - change the sid, lvl and pasid shift to 26, 42 and 44 in order to
>   take the full width of uint64_t
> - perform an XOR to the top 32bit with the bottom 32bit for the final
>   result to fit guint
> 
> Fixes: Coverity CID 1508100
> Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


