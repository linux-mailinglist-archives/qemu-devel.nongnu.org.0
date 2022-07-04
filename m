Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DED565678
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:06:34 +0200 (CEST)
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lmb-0000nn-03
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lf6-0002mx-RG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lf5-0007U2-F4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yABOfPD2XBz36KrpsbZxsNkeWhYzoYuyA9ZRYgz0hGA=;
 b=T9vBdkaKJmtEkIcayLFLt3mcOsm8IL2+iehqh7oKaiIiATW8d9kijQk19eLcnvMhLizog1
 f4utuDZcTxyKVhSkt55VAFTPWhQKJfo4htmnkdi/h6ngRQ4u+2L66TKrnfLrdH9+oSQ/JD
 0ZSkBSy8J1oYOK5xwVBwTNbl9czwG1I=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-l_iqQx0QPX64eRg_cak_-A-1; Mon, 04 Jul 2022 08:58:45 -0400
X-MC-Unique: l_iqQx0QPX64eRg_cak_-A-1
Received: by mail-io1-f70.google.com with SMTP id
 o6-20020a5eda46000000b00674f9e7e8b4so5556433iop.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yABOfPD2XBz36KrpsbZxsNkeWhYzoYuyA9ZRYgz0hGA=;
 b=e+rT9VjJLrSFZb0M/fH+hJYpcWu5lHTjq1T7KA0Lc6N0TQ1Pkzk/JEKQsppFQFAMZo
 O+i+yrFq996O3EHcJ7ZJ2tdVdlfQ4ZMuIpXPrzkin6tIltb4vnjpPRqyqsxPFKOlr9qb
 mC5wSu/ynsSvimH+AmS2xVjiJ74k3hjAB8uXQSPLQAwNSr7doxbrfF+Ca5DvFgfUGbbH
 ND47NmyvulsMaBs2tmogITOdDwY3q/sn4IZj6KobH/2JtljZ3D2znuubA2z3Tue+/ShB
 2Qof3bcGAA2pQ4D1fk+A7e003y/uyzvZmK3/+O87y19vkwLKbNSoM/i2U4h4Jvk6J+BU
 JHZQ==
X-Gm-Message-State: AJIora/a4UbUeusrwszNEAGQpv8LaoM8g5IWKdSvYKG2pMG+PuisjEKv
 4kdO6Jq6QrYK2I/dCB/ObkICIM02vdiP9/5uh7cOFKEmJ0qfxY5CkqL/Tiw2vsfWlY4TaiiE7DT
 Nozy72C83zl31kHiVfZjahBeiRi9s4r0=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr15704642jam.130.1656939524514; 
 Mon, 04 Jul 2022 05:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqLDdu0/GgyZHK/qyLJBAjN767QrqLPMhW2g6nstmkEykqV7GGekTEyYEbocYCg/gsHOGwlWVkFsvqc6Qb3s4=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr15704632jam.130.1656939524348; Mon, 04
 Jul 2022 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-10-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-10-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:58:08 +0100
Message-ID: <CAELaAXy8KGCemco99zdsdwtL8n9_15JypDt1xjZAbQeAEFOkLQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/26] iscsi: add missing coroutine_fn annotations
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

On Mon, May 9, 2022 at 11:39 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/iscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


