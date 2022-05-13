Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A90526546
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:54:04 +0200 (CEST)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWg7-0002zX-Dh
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npWdf-0001zs-FL
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npWdd-0007ZH-W7
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652453489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/n/mnYD2VJafWkfYB14arITMhKQCjycfX4Bt6qdZOZs=;
 b=e6tgUHUHCre3lEj2kSpnMFcIlYj4e+ZtHHsEir3kElc2cgdiVGpM9vjMy0CGnWnSzVr0e8
 edpI3D5ZSNuUeE8WhFd/HjK2woRmuPFmHTp1B4mWqgiZkk6NycTVGNBkEPgWlqCMNb6lzo
 stzGsiooE/q7Mk8pvZ8ZVInbPkSqun4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-Zglh4mljMCSF7Sz_hcsZ1g-1; Fri, 13 May 2022 10:51:28 -0400
X-MC-Unique: Zglh4mljMCSF7Sz_hcsZ1g-1
Received: by mail-io1-f72.google.com with SMTP id
 k184-20020a6bbac1000000b0065aeedd4ba8so4901999iof.20
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/n/mnYD2VJafWkfYB14arITMhKQCjycfX4Bt6qdZOZs=;
 b=wT1J+aLDsXXAzBgZqTyOJJj+Js/tKC7MSP2ceuhV+piDmgx/XfrgsRYPv9afncqPKQ
 0n6J7nGGFzAHUXzGWDE7BOV8ikTxfasQ84wHT6XUMhVuo/YzNoUtktbVdVA9g94WHnX0
 daLAhFsIL308Fz9+9k2XYPlU9E9qg3HN3TJaaffV7WrXo1bIGyVR72p3Eww21dy5ROnz
 KQnhg5jbI+5mfCRvPpulWYWWjMfzrwY/m2YdNw81fdaZ1ADiCFFBB99+iEJ21zmjFP/d
 n2bjFINBpCR4/0NI6BXQPQKZrPuap1uhrgfTJmWZCxPe3rFfjiidOFOAcI/vuqbM8fso
 aqGA==
X-Gm-Message-State: AOAM5333pVqlUx5HUUIpWJkRa3qYspCjZo8ln0APYFRsl46zMejKd11Y
 Fs+pDnBINIu/JZ6ZUMIRKj1nWcVs6PbJnoIE+zqaqV+TJPgVCayMYAI7ebjjght/Uzdwggkprtt
 e9o1zlPdpwhQQi40dLaRTwpiLjFUFg8A=
X-Received: by 2002:a92:c247:0:b0:2cf:d2e1:cb13 with SMTP id
 k7-20020a92c247000000b002cfd2e1cb13mr2790491ilo.16.1652453487388; 
 Fri, 13 May 2022 07:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhouAoFBbWKA7cZ6/mhUbL3a14vu4uPFpNRNOL2tZlfkeQjbL7EBdIQ0KgG1X2jDrfKzN2jWjz9Xcic3FGoEw=
X-Received: by 2002:a92:c247:0:b0:2cf:d2e1:cb13 with SMTP id
 k7-20020a92c247000000b002cfd2e1cb13mr2790481ilo.16.1652453487251; Fri, 13 May
 2022 07:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512235103.2224817-3-afaria@redhat.com>
 <934aef85-7400-d870-dfae-3f869552e47c@redhat.com>
In-Reply-To: <934aef85-7400-d870-dfae-3f869552e47c@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 13 May 2022 15:50:51 +0100
Message-ID: <CAELaAXy7xOLKnJWLwT45VeaSV5Etss2ACpBDbhY-rhe3QjJBNw@mail.gmail.com>
Subject: Re: [PATCH 6/7] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, May 13, 2022 at 8:41 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> This is different from bdrv_co_pwrite_zeroes in that it does not clear
> BDRV_REQ_MAY_UNMAP; but that's a bugfix really.
>
> It also doesn't call trace_bdrv_co_pwrite_zeroes, which is another bugfix.

I'll mention this in the commit message.

Alberto


