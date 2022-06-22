Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68867556DBA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 23:09:01 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47au-0001Eo-El
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 17:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47VC-00023t-R0
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 17:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47V9-0006Ut-T4
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 17:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655931782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HjzMRaYC9pJyjURYFqrVeTHEz2DdXe/+0ge9TwUOf2Q=;
 b=QLeYdt6YBwg9jGWHQHUx947l2qVH9SX703WnF9Bcyqzp/XVvmfInzOuOuCgrL84wTbVhIc
 z5fJYsbiCrtci83sYQd5GOYrEBdJwXlDjEvv3vqR60YJCNoUlhuM+s1r9wlsG2LYIgeAzI
 MzCzHjqpJLvrGph5TQhGVccWAR105pc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-1DNrObtjPzqxmEmdsIpaeA-1; Wed, 22 Jun 2022 17:03:01 -0400
X-MC-Unique: 1DNrObtjPzqxmEmdsIpaeA-1
Received: by mail-il1-f197.google.com with SMTP id
 g11-20020a056e021e0b00b002d1b5e8389bso11759015ila.2
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 14:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HjzMRaYC9pJyjURYFqrVeTHEz2DdXe/+0ge9TwUOf2Q=;
 b=20djb5lZVLYNm7F5B5k10tYoEL40zbU2sUCv1c4xmesVS2oX+n7m+3Y+lOwTdsk8yg
 c+eJyIQjH49VkRdQOqWmoC/eHrxlhSNxUjxI4MqnPibPc38fhYf4enxtTAQbYXJvtnXZ
 smtn4m2JnD/2AeJsHXeTKfPXQR5bWrVtw/KaJWFI9PjcQ0RjVs7rp85l57NVLwXzh0/v
 5aKy744iwWeZ7vaoSWLIi3hgi2DwmKPz5GDq8b/8+UCg7Nj0MEOCHIOpodufzgLcFC62
 6Xrcx8q/oVYHNnCTHuvxFtKkOIIonZ7AGNYnehrEaeAaYrz6qQEnLZtEk78Q5dSv2bDk
 wSlw==
X-Gm-Message-State: AJIora+pEvkZHpKlBA9CkCOGlIzuSqinReTJfbvW0abciAfMvQIggtrm
 bRZnDCQXRo5aYrhwCsaGzhvujh5OdgjzHXPD/PG5cLCzqIMlhPUPr5AjaSIThriNf5EuWmd7lAe
 u4waNlJvcTh4vRkU=
X-Received: by 2002:a05:6638:1608:b0:331:c83a:cc24 with SMTP id
 x8-20020a056638160800b00331c83acc24mr3039743jas.143.1655931780472; 
 Wed, 22 Jun 2022 14:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRovHJ4SqE0EEbDQaXJoVjXe/4znloI+Jpsb2HRCVr4fWp9+JxLmKvnyANuSS06sb2nSvIMA==
X-Received: by 2002:a05:6638:1608:b0:331:c83a:cc24 with SMTP id
 x8-20020a056638160800b00331c83acc24mr3039734jas.143.1655931780239; 
 Wed, 22 Jun 2022 14:03:00 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h35-20020a022b23000000b003322997dbf2sm8848520jaa.169.2022.06.22.14.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 14:02:59 -0700 (PDT)
Date: Wed, 22 Jun 2022 17:02:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, david@redhat.com,
 f4bug@amsat.org
Subject: Re: [PATCH] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Message-ID: <YrODgKNyoKF3l1Rp@xz-m1.local>
References: <20220622012839.3419865-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220622012839.3419865-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 22, 2022 at 09:28:39AM +0800, Zhenzhong Duan wrote:
> The comment of flatview_access_allowed() suggests to pass address
> within that memory region, this isn't ture in some call sites.
> 
> This makes qemu log in flatview_access_allowed() confusing and
> potential risk if the input parameter will be checked in the future.
> 
> Fixes: 3ab6fdc91b72 ("softmmu/physmem: Introduce MemTxAttrs::memory field and MEMTX_ACCESS_ERROR")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


