Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D76EE7A6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 20:43:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prNcm-0005Ya-9B; Tue, 25 Apr 2023 14:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prNck-0005Xl-6m
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prNci-0005UL-0F
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682448163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DmzpTJ9V7j5QxjdbU/PuFduthKgjwlvo74ohu6nP5Pw=;
 b=L3ydaw6j17gYVkT5AI7PZWce5PGzEwsyM3raCTG2UCmoVxnyBjuLQvV3/EvqAj6iKyOF1E
 Vhc3OXp9IGRp0Iviusz9qHendfRVgHmxE425xUGy7+8fSY24/N93iGqqbngbDRxBXbyaVy
 puGDiLZlRSfjvvePNyJQMOv/7H6RAKk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-vbBJnY1-M-6bAnoNFA8nmg-1; Tue, 25 Apr 2023 14:42:41 -0400
X-MC-Unique: vbBJnY1-M-6bAnoNFA8nmg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so18130191cf.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 11:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682448161; x=1685040161;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmzpTJ9V7j5QxjdbU/PuFduthKgjwlvo74ohu6nP5Pw=;
 b=dTM7e4eTj28Eur+KRwMw1xTDLyoFPOMYMLOE5d1iiS3cT1WZWTwDcTSjxlo4xI+YYx
 OmayuEtHUlMA4QZmJo2AElFgDz2CbfYEicNOb5+/de7rwYLj0QImXJiCCqprm0LfN3O2
 tBmKw1TnBtUPxAvl2wHFvY5C4fy+ceOEa6p0qHKWqrBzAcO0VxI+3uNeegs8CoukUNAq
 1F9Q8MRIP/64YTqvqnzJpGyx2eHoGeHvOQUFl1qjeZhW9dQ2afppz7S7KqxctLDnJVkq
 oPWCTu90S0m97xJ4Nfq38QUWU0AxW9n9/LvmTmLlGxeTT26zqyZl//8AsN45DibjNw2v
 xNPw==
X-Gm-Message-State: AC+VfDzcj0OY+++1Eh9YgiPYgONG5vri3e5tAxxoY2JXwlFWp57wpdZd
 85ozUmDqtJdXfy6w0q7jNdNES0asftOp/xCYvDP0NUOEPVFsr/Dp0DUm6Vwr9dQSobXLlcAE4oo
 3HjdBZWw1D7TzGEU=
X-Received: by 2002:a05:6214:76d:b0:616:4e6a:a76d with SMTP id
 f13-20020a056214076d00b006164e6aa76dmr4492299qvz.3.1682448161370; 
 Tue, 25 Apr 2023 11:42:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sPm1VJQDd30ot+AIuiHeZJVlE04Rh3xRwPPSr7KgHRaS21Q7Ch76F23r/KZb5VD1mgeHaQQ==
X-Received: by 2002:a05:6214:76d:b0:616:4e6a:a76d with SMTP id
 f13-20020a056214076d00b006164e6aa76dmr4492274qvz.3.1682448161115; 
 Tue, 25 Apr 2023 11:42:41 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 h8-20020a0cfca8000000b005dd8b93459esm4253849qvq.54.2023.04.25.11.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:42:40 -0700 (PDT)
Date: Tue, 25 Apr 2023 14:42:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Leonardo Bras <leobras@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 1/3] multifd: Create property
 multifd-flush-after-each-section
Message-ID: <ZEgfH1qNGV6nqpWX@x1n>
References: <20230425163114.2609-1-quintela@redhat.com>
 <20230425163114.2609-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230425163114.2609-2-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 06:31:12PM +0200, Juan Quintela wrote:
> We used to flush all channels at the end of each RAM section
> sent.  That is not needed, so preparing to only flush after a full
> iteration through all the RAM.
> 
> Default value of the property is false.  But we return "true" in
> migrate_multifd_flush_after_each_section() until we implement the code
> in following patches.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

PS: Normally I'll just keep the last Sign-off-by for each person. :)

> 
> ---
> 
> Rename each-iteration to after-each-section
> Rename multifd-sync-after-each-section to
>        multifd-flush-after-each-section
> ---
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 13 +++++++++++++
>  migration/migration.h | 13 +++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 2ce97a5d3b..32bd9277b3 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -60,6 +60,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>  GlobalProperty hw_compat_7_0[] = {
>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>      { "nvme-ns", "eui64-default", "on"},
> +    { "migration", "multifd-flush-after-each-section", "on"},
>  };

Here we need hw_compat_8_0 instead?

Thanks,

-- 
Peter Xu


