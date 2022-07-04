Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C05656EC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:22:09 +0200 (CEST)
Received: from localhost ([::1]:38746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M1f-0003QH-GZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lj3-0006vR-Ge
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lj2-0008Cj-12
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0bMQbNWv/lTeYUiQY0ft/9h7pMljWuSrWip66Sdym4=;
 b=Ry78l4iAL5ghvsAQlIi1M44bhTV3tYtAryableSGsdf35V00UMraGGvCsbYAKmwCOkgFFd
 BHymiS0Et54x3RlDZPpBiL+S/pAAfExTKKqxVIlMEafvXJcynX/A6MntF+E9WOatO6mFUZ
 4n9MPnROu3yEJ3mTDPVPuYf4bjLxW+8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-97uEjqO0MyKmaenr93_YeQ-1; Mon, 04 Jul 2022 09:02:49 -0400
X-MC-Unique: 97uEjqO0MyKmaenr93_YeQ-1
Received: by mail-il1-f199.google.com with SMTP id
 e4-20020a92de44000000b002dab11299d9so4181858ilr.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0bMQbNWv/lTeYUiQY0ft/9h7pMljWuSrWip66Sdym4=;
 b=3fgXJd85m7SXga5ID/oliD1iR1ftphGrzGDNCohSnCorcu3enka3n7hBNJbXecJJZE
 8Ft78sSU+8mQmlniRJcgrnoKgwxlFa7Sg2sqMlG7uCVE/8rN8Vn7a0ZZUyvr6JpJqoPl
 L6CSBmJkb7skJalkrw6iPfM2xlaKGJmBAOxvSdns3M2V9P/AlnfISCGvq6ev2dUCKEhI
 lczvHnrnKlkn3gxwXcbU1L5ZGo9Q0ygAsRB42Ja3LnrqOYUtJETViBC4vr4MRkjdG8wk
 LhtKHa5/2yS9oPGhxAktJnwwdJrQRfm16OkMtTkkNFBB+4OvUM/Lzw/dFw7wca/29USj
 pwhg==
X-Gm-Message-State: AJIora8cgp3NTJFxReGcpsZz/4V7qNFRps9NQbVyvVgLLpaCWdLvka8/
 5sAmgM1cW3Gmc9M23z9bN1Ea6GmwujrGJJ1VxRBf0sipcut91gxz219ltLnh+HVq6R2o9aSrN8M
 RGTVLSmx66hNMonJ2Yyv8xKYIr+gEzIk=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr15715901jam.130.1656939769198; 
 Mon, 04 Jul 2022 06:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOPknCPp7ffgSIZwXnUSmMLyfCRdQ8Ae9CAULTeHJ+8Qwz8RnSdnQzUuzfc/wSh6BV1HOtGv/wN2jH4dD5Dsc=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr15715890jam.130.1656939768954; Mon, 04
 Jul 2022 06:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-20-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-20-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:02:13 +0100
Message-ID: <CAELaAXx8wYXj9sJzHOhgXyE8PQad6-xcdzPgzx5VtYjzgz9mnw@mail.gmail.com>
Subject: Re: [PATCH v2 19/26] throttle: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
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

On Mon, May 9, 2022 at 12:13 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/throttle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


