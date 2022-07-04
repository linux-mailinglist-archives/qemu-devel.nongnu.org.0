Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131505656EB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:21:14 +0200 (CEST)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M0n-00020r-3J
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LgF-0005Kr-Uu
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LgE-0007Zh-Hd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIsyLmCg2gAhj/ZVo8SksimJj1kvG6fx/6a8u1Gxfnc=;
 b=hZ1cBOepANOWi2tghG6BO98MR592R7NZn9gICriDXQqvUwSyULjPGoMAqYtAnMinMDmEEq
 tMZT7o1K29yEl1CQqvQNZpxgn121HhggFxz/HDd+I5CCPIg8C3Ya4FThfWhdUKKElJUL+N
 fU0TFw5Feu4JAyeJCd/GUtd5CZCmyTY=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-ip1lty9SNpW1BS0vs5H37Q-1; Mon, 04 Jul 2022 08:59:57 -0400
X-MC-Unique: ip1lty9SNpW1BS0vs5H37Q-1
Received: by mail-il1-f198.google.com with SMTP id
 f18-20020a056e020c7200b002d949d97ed9so4126627ilj.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIsyLmCg2gAhj/ZVo8SksimJj1kvG6fx/6a8u1Gxfnc=;
 b=qVcn+PDfd7X16A1e924domK+gTI0/grMqQD0ZO0rkcnXPGVzXswbuqsx9BibxyOhs6
 ZfxydBOroTCTnaAL8XjDs0UKLdzuQksCDRkmS4CpNzEUVTSTlvelzlg3dYxNmWIFGRFf
 X3xa1STEmXI65/4yf2o3DQPT0ZSRjgHsyIVXWSzZnQh+rbfwIO15rbbM8WPxNZazogpG
 lUFXx6IqYT9AebtEfpBsAV732wYWcEhRequmAVfoA0waqznKVD8ErLvMCT6c1z1upB1M
 DEJ3NFjiAVUVZAu3dAZibfEJ9OxzcHemQQ9Cw+xt7UthcEi582+ntewULfK0zzntd0oi
 g2QA==
X-Gm-Message-State: AJIora8fk7OUcR/PmJIHuJ4tXc3+Y2FwudNNkkDzz+QgIk4UryknbKcs
 M9ZN6DP7J8mUYFh+/AM1aaCqY7zRojuFZd9laMlEc0cOLH7YcMbB0CswgLLKzeiJygFCOM5W5Cp
 cMS9dw6Ou0urUAhGl+nVXSzG1begGBOg=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr18414232jav.263.1656939595912; 
 Mon, 04 Jul 2022 05:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v0Y1pN6qyQulj25PGFwNtZCmmU3lb070jWFSVbhB79kVdnnraami81YZPpySlmDy+WT+3tYfe+4er4Ihz6ENw=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr18414221jav.263.1656939595734; Mon, 04
 Jul 2022 05:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-14-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-14-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:59:20 +0100
Message-ID: <CAELaAXw6j2F2vrh5hH7_C86uVeRG7YeYCtPitv5eK53g_vg3tw@mail.gmail.com>
Subject: Re: [PATCH v2 13/26] parallels: add missing coroutine_fn annotations
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

On Mon, May 9, 2022 at 11:46 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/parallels.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


