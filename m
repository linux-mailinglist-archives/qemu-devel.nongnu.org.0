Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74E3F511A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:15:21 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIF7L-000254-0C
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIEwx-0005rT-RW
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:45:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIEwt-00068o-TV
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629744330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAROJlFzkpPQxERojoPsRCol2qZQwDCzIiD0nkCUsm8=;
 b=bIP3d1Sr4SSGJQQzUhG2o5+VXrAQwn/TFuHhN94hDEsRvN/FmhzT2lQiVi4bUIrbWa08w9
 aXZckfRIEuVC24sG2YzTuUKRfAcnQzx5WeSKdN9SxhckvRtzKDNYq0L3RdCgL5mArswsC1
 bsO3fx4soEAyFfA39eKB5WY6ada90/k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-OIgHJc1ONNmXqFbkEZZFig-1; Mon, 23 Aug 2021 14:45:28 -0400
X-MC-Unique: OIgHJc1ONNmXqFbkEZZFig-1
Received: by mail-qk1-f197.google.com with SMTP id
 c27-20020a05620a165b00b003d3817c7c23so12441795qko.16
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MAROJlFzkpPQxERojoPsRCol2qZQwDCzIiD0nkCUsm8=;
 b=XhXMamTA+MI9pZo/9y4u1fSYnos9SDvAhCREbhNqlFUrXRCRe0ouONBRW1+TMkhtPt
 Sotg70axXIWGX5/FcNbWJ5Qfg+lLlvTc3D039mvBAtntl4rKULraU6VGh0lAN2y+YLpA
 ZmsVMpk2Z9lJUu6lxr2iFH15KOikef4M4aYZeDassWVEPv31EUqE/FL0dOvujtMpbBVv
 w60X1Ybz0FftBu8fZ3Gn2Pu3ovI+mp8StHOBMcIhqkugbUeUN9YE8L2v7NEKSwqlBBM2
 MSAFSjEbwUrK5rlh1/poYDVYEgUi/C9HJYVW9h/F2IzwYdrSXBElqtYW8iTTIdY+ovew
 4JYQ==
X-Gm-Message-State: AOAM531vU7quNEYHfxmPxrR6CpLcM24h7KTJ0KiFswVVVyq13FQtOEdX
 oq508FitHU7xGddAZ2Dtiucn6vOHMeb7nQrw25Xyx7eTmIN/qDkrgFqLyisxrq/yH3M3nBrpfpL
 8z/nPkmxMMVHwCOg=
X-Received: by 2002:ac8:5901:: with SMTP id 1mr9512099qty.40.1629744327784;
 Mon, 23 Aug 2021 11:45:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm4oJxcqc/FSZOkiUSoCE/EIcsYbLg7ofWaLhz3qGasisj2ElbWSj0cactKa/gmiqUtuuH8Q==
X-Received: by 2002:ac8:5901:: with SMTP id 1mr9512077qty.40.1629744327561;
 Mon, 23 Aug 2021 11:45:27 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id g1sm9040689qkd.89.2021.08.23.11.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:45:27 -0700 (PDT)
Date: Mon, 23 Aug 2021 14:45:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
Message-ID: <YSPsxWCQjiC4w+IE@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daudé wrote:
> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
>                                             hwaddr addr, hwaddr len,
>                                             MemTxResult *result)
>  {
> -    return true;
> +    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {

memory_region_is_ram() should be enough ("ram_device" is only set if "ram" is
set)?  Thanks,

-- 
Peter Xu


