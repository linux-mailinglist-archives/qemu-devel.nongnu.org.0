Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F7565692
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:08:43 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Log-0003sV-MF
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LeK-0001VD-AU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LeG-0007Pb-Nk
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OvT3DRAPQ165VEPwakuSoVZaMxaZa6PhIV2xAGbAJ3E=;
 b=NC5xAcO5KdGOdTmsr2ue309SE4ds7/MuooRoZOYje9foqYRJ0ln539mHqrI1EE6Q+bbGYo
 d8oLpUorPzrDwzg+TGHpzhENeTIRt9pkRF2G9PlUU5YJ3V36sdHPe3bgqUauhBBiHyzmzg
 Mg2T7D9yE9olBv65HQLujqBjFHuBv+o=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-Je5MDsSWPHy4-XslnmpseA-1; Mon, 04 Jul 2022 08:57:45 -0400
X-MC-Unique: Je5MDsSWPHy4-XslnmpseA-1
Received: by mail-io1-f70.google.com with SMTP id
 f1-20020a056602070100b00674f8035487so5514748iox.17
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvT3DRAPQ165VEPwakuSoVZaMxaZa6PhIV2xAGbAJ3E=;
 b=kL+mXQsA29BfmHQFw+eTGOtPgfZQfwO7K67IjrNs9sfcnFq8BAGVrhoki4LDdL9bTy
 jG8vEwVHd3w8VEKtVMVmjDRFNa80fZAGOYWo4DfbNuJjKyRvssLQQzme/QWuy562QKEX
 R/vVyVaurVLZN91rAYczzZqh8Mj46LmSETEqc4EH/Jy6fKF570kLBqAJLcGjzA44Byjs
 cocYS3qcN72AAwnhJAXQ+z/UnoYuhRaFwWw+kE4jUVLGprle1ZMQt8NZabKm4VaRdVhJ
 KxgJvgj8KvxrrlVcXmEtNXJY9sXXTl/Gj9Lb/7Srnko4EoHnV6HIS32N6OOt8mxEmV/p
 3Xow==
X-Gm-Message-State: AJIora/2nO/tbrONx1FefOc6iErtBoM7rWOQ2XZknzS3wVMlQWWu8CiD
 tDafIj827tqNXskAgakpIcjOiqhUNFoRxbUH7hSk84R4ysa0KTkdRiVunUacveRJnsmAdKhmXWA
 TIoTG0RPUame92f9j3I0DWPJ+UXJk7XI=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr17677795ilk.70.1656939464837; 
 Mon, 04 Jul 2022 05:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzIKPMzYZHoQhdAO1q2RnFZuOjFV+SdM5pYBKTOiCWfppDpJ7VJloLrX2iXZow6Na9en1JHnasbXcqO+sE/Xs=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr17677787ilk.70.1656939464686; Mon, 04
 Jul 2022 05:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-5-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-5-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:57:08 +0100
Message-ID: <CAELaAXy34-kd2o57RLb7s2hy2UzBXUo=Cgq4bSRHUF-JfN3q6w@mail.gmail.com>
Subject: Re: [PATCH v2 04/26] coroutine: remove incorrect coroutine_fn
 annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, May 9, 2022 at 11:35 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> qemu_coroutine_get_aio_context inspects a coroutine, but it does
> not have to be called from the coroutine itself (or from any
> coroutine).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/coroutine.h | 2 +-
>  util/qemu-coroutine.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


