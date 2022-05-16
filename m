Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F29528D78
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 20:52:15 +0200 (CEST)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqfpG-0007l5-IZ
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 14:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqfnF-0006ff-JP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 14:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqfnB-0003GO-TN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 14:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652727004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ofnhwtsXr2sAc4YCvZS7DaTl8wrlyhfXMjUEUwNndXQ=;
 b=a9ClyZPap5SR0KwZZMsvyxNBWPxIUlMC7feaFC7Glk/yCWVlXBEPmrkZ5pnQHSuGTzyApi
 Lte/lhhHfnIY+UQb/arOdhxvHqMf4bTUzDqw132CP8pbvIfI10s5ADFqCkEENLQrUsU3sP
 jo2+5ikIyxLaU0lliugjE91fVoZ/Mu0=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-t0wrZ4DDPtCg3pyh7NyM5Q-1; Mon, 16 May 2022 14:50:02 -0400
X-MC-Unique: t0wrZ4DDPtCg3pyh7NyM5Q-1
Received: by mail-io1-f72.google.com with SMTP id
 r17-20020a0566022b9100b00654b99e71dbso10975667iov.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 11:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofnhwtsXr2sAc4YCvZS7DaTl8wrlyhfXMjUEUwNndXQ=;
 b=dq7im62uPyIg5N/5CqlxO1GBCOu4+7Z7jXrVMOFTh5QDsRsBiooN8r0RMYk+PbY8E+
 wN6XFcsZ81F5b9Noewdxx6sIi0GqgubwK2IQoBoFvuKbWun/tN2EjGxVS/ymc92MM5lt
 3J5W4YQYmPMHhVXVnS2PQ2DXowoKMyBddIMBkfEXkJjXu72ZRIPX9geDunfMNf2Dquno
 s4oa2UYITL9v88mAb4G8NttSeMs24ojoYeeEUd6TS9fb5MtU0R3o9xuo4Cr/K2qlHwIp
 3awZS44bt8M8fkBpEiKyRh44bWBRcmpi3mhVttC+TkyZHZz+rNtvR19IaIl4ZhpUEzro
 XlHA==
X-Gm-Message-State: AOAM530uii+a7CEZOveuDPAhIH20mU6GRYjzcznCWi5RuRcolYZ6drL9
 vtKTUDnd38VecbJw+7//mMPn7apgmCEHi8NUOhPHEq+c7DxqI5ZbmSPw3m0zlw6Z8cEJir5rZN6
 sfQHi/EGEKP1cfWf6hqmGKb0nVd6Nn8Y=
X-Received: by 2002:a05:6602:2b0b:b0:64f:acc1:52c3 with SMTP id
 p11-20020a0566022b0b00b0064facc152c3mr8430829iov.38.1652727001893; 
 Mon, 16 May 2022 11:50:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLYWhk3NqxNb3c6rrJ2fKKucM6D87n9cZW1Q8Kut7bIpSTCXMproFXesolhVJATCFuEjmDuLIqYYPMcmeppHg=
X-Received: by 2002:a05:6602:2b0b:b0:64f:acc1:52c3 with SMTP id
 p11-20020a0566022b0b00b0064facc152c3mr8430815iov.38.1652727001650; Mon, 16
 May 2022 11:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-8-pbonzini@redhat.com>
 <20220513212613.laydrlckh63wett4@redhat.com>
 <ab3b2d59-109c-43d4-f97b-1c8ee1ee1f2c@redhat.com>
In-Reply-To: <ab3b2d59-109c-43d4-f97b-1c8ee1ee1f2c@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 16 May 2022 19:49:25 +0100
Message-ID: <CAELaAXykoYHvPpvNOgp0XUnzZAhL2ru5AkLSikeRVxaBn+wN9Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/26] block: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

On Sat, May 14, 2022 at 10:54 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> But I agree that blk_pwrite_zeros shouldn't be a coroutine_fn, because
> of fuse_fallocate and block_load.  Alberto, this function is another
> candidate for adding a blk_co_pwrite_zeros + a matching
> generated_co_wrapper.

Thanks for the heads up. In fact, looking at block-backend-io.h,
there's quite a few functions that (AFAICT) we could implement using
generated_co_wrapper:

    - blk_pread, blk_preadv, blk_preadv_part
    - blk_pwrite, blk_pwritev, blk_pwritev_part
    - blk_pwrite_compressed, blk_pwrite_zeroes
    - blk_pdiscard
    - blk_flush
    - blk_truncate, blk_ioctl

Would this make sense?


