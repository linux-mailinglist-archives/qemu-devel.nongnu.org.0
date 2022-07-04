Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0155656A2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:11:36 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LrT-0001JA-Sw
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LeZ-0001Xo-1h
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LeW-0007RH-3H
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5PfwMzGt8yziGLYwnS+KIcOUMY5GSqBfS8RkKrvXCHU=;
 b=HH7ndnwpo2u3gBf9OexzcDasz2nXT33wv0oJA6EJnmIsGjqnyDKrEC9Lm7NYmzHwvYMBlH
 exVOnYAOZqYd8cgHfnxrwzuCuqZAtCGGMlReZJidieMKQEztCqk0K2NcQQxoBIGW8yvUxc
 gY+SsQX2dqloAspOTZ2sXrax9/nabCc=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-WJX6HY7KNueDkaP3MdziLQ-1; Mon, 04 Jul 2022 08:58:09 -0400
X-MC-Unique: WJX6HY7KNueDkaP3MdziLQ-1
Received: by mail-io1-f72.google.com with SMTP id
 q75-20020a6b8e4e000000b0067275f1e6c4so5612494iod.14
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PfwMzGt8yziGLYwnS+KIcOUMY5GSqBfS8RkKrvXCHU=;
 b=nKYpbm7gYpYqs81nskpmS/pUaGju1F6lQdJF1/32XeC2JzxmqVsodGEaiayY4SddAF
 B4RQsCp3/WMDEcBPsK8mgMH4UJ/P6eyLE1tFJozJCPbxj1FoXBnucIXhwVAE0Z/QbHJT
 xN3mkpaBqp8d/ndQU2z+ABmUiP4f1GTfSvcXGbT8yC/TeeD5i15FAs+PSNQlrLLppjul
 PWAU+wHAIW+7jACdo9gI58Ra7yOgd6WQ7HYbQbaWt5YOvZmyl4O+UrqK9CiGSawBQPry
 jV90tkkvV6oqvkILx5rWe3auBFoP2IlPuP1P9rTHfwRb/URlEQ3jI67TSs2OHU0bYupt
 r2Dg==
X-Gm-Message-State: AJIora/U0p2geTSIB6Xe2DIehjgj8kHwy7pfNufJ46xIkK/yk2C9NiPT
 XJsHbRYYuHnRwDv04k464D6OYv6/r14hNkpk7AfPSLWIe3v/LFO6gm/Dmtkq+wQ9Bz3PWCJ+w4M
 aIbi0s2otbmWn0TjUH2EblmTddekNDak=
X-Received: by 2002:a02:c649:0:b0:33e:b970:5bda with SMTP id
 k9-20020a02c649000000b0033eb9705bdamr6977188jan.319.1656939488225; 
 Mon, 04 Jul 2022 05:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVk2JY2JXgXTlf+o9BXFnr0DZ9aJRyxHXX2eG+cjRztxMIVu7/M+HY4OF9zgFg/Vgz30GAExcqLkOs/6vJS3U=
X-Received: by 2002:a02:c649:0:b0:33e:b970:5bda with SMTP id
 k9-20020a02c649000000b0033eb9705bdamr6977177jan.319.1656939488056; Mon, 04
 Jul 2022 05:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-7-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-7-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:57:32 +0100
Message-ID: <CAELaAXx9YaGHEEcwnHe+_fDZ-Lpn_wgOLPHiUcZnKmKZVG3NDw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] blkverify: add missing coroutine_fn annotations
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
>  block/blkverify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


