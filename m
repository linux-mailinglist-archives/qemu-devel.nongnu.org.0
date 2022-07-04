Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C673B5656DD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:18:25 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ly4-0008Mx-SY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LjR-0007cj-KU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LjN-0008F7-Aw
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMleGeSOIwJpWlj45B917Q03/ZVt7NYGxR0/pWaJcoY=;
 b=ahpo1aEiYm6Kfc9BeS3ayiI/PUDtAKKZwi4bP6j22BShpqm0cAW5MPJ9bzJrYIUMUKDNls
 IblxNdCVd+fw/9B0Pc/+newHKfnLRxb9CWGXkwucv7/I27bh0Dc2QKIgnMJx6ZN6PRVvXA
 iO5eLccEv7Yg/U6hS+AsvW0wb9P+sz8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-W-oPkbX7OgiDgexMf5m2NA-1; Mon, 04 Jul 2022 09:03:08 -0400
X-MC-Unique: W-oPkbX7OgiDgexMf5m2NA-1
Received: by mail-io1-f69.google.com with SMTP id
 p123-20020a6bbf81000000b00674f66cf13aso5609257iof.23
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KMleGeSOIwJpWlj45B917Q03/ZVt7NYGxR0/pWaJcoY=;
 b=dWyPdXqBb2q0O91l62swPyqF5CnbDTfknftxZ7ayiBsUGOPteweDkOlrJrBfkYrv22
 u+QqWmG4mjnlZXz1H/eGKBPKkNXd6z9EYgt4j8/+MuBEhLtli3tUvBu7v5IQYpT/LUCx
 w1qHWQLORFPXk/ZbL3B8U0F97fbgQRZRJr6XOO6pM2coFmQh9Huos3e6E5tV8g27uGQs
 o4WPUPc7IeDRRH9yVr+pHymv2ZbJXtkWl4Z1LJoPxP2KwoTwqfqPRyaRx/zhixG9qjon
 hHGin14Ft9LjuYNBnL9ktDUYk7fW9CwDnXGGbwR9az8lon8M0NONw+m6we0Pr8Od6ajI
 6olQ==
X-Gm-Message-State: AJIora+Dc+qfbU4HMFwtpl6+xkVw5ZvttzYWgLN+huNHI3CtB7j82LDP
 Jy6r4piO0UBGJF+H9CS1JiO+IE1kGfMEF1UgxRDkIJcawKaGt3pNbnMl35smi2LGp1QTkYdSNy3
 XoP1OGPiYRgXUW+3wfVE5k15Yg5ofduk=
X-Received: by 2002:a5d:9281:0:b0:675:6668:13ae with SMTP id
 s1-20020a5d9281000000b00675666813aemr15221763iom.171.1656939786877; 
 Mon, 04 Jul 2022 06:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sjNmDo2A8DpbikgOjfvP8MjR+nyp79Fvh45JezybBluom4XwK2nIfpdiAcnLIkil+tv4ohMh8iGzh9NOaO4dI=
X-Received: by 2002:a5d:9281:0:b0:675:6668:13ae with SMTP id
 s1-20020a5d9281000000b00675666813aemr15221753iom.171.1656939786677; Mon, 04
 Jul 2022 06:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-21-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-21-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:02:31 +0100
Message-ID: <CAELaAXwQNudTXhyxbbASW1+ak+daO5Z3BKeU-nECj4VOBonxxA@mail.gmail.com>
Subject: Re: [PATCH v2 20/26] vmdk: add missing coroutine_fn annotations
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

On Mon, May 9, 2022 at 12:18 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/vmdk.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Some overly long lines.

Reviewed-by: Alberto Faria <afaria@redhat.com>


