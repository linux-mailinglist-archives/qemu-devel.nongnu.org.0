Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADD4353E3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 21:36:26 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdHNx-0004l9-Qo
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 15:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdH7U-0001L8-Hb
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 15:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdH7T-0005TK-4a
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 15:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634757561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=focIT5N6CTycMPJowLNwa8meDt82z3230n0dELvLT5s=;
 b=H/OKSwBxgccnACGTUjQ09tWZAJwJjcsSgijiDzSv146MBDu+NnVWxA6Q+9VT8YNMY6Dk4O
 urW2Jc90jlDQDUQFsWt/rcp6VUFc8nmLeecbu3GEgLbP3hclyUeZ9S/BVNs2ham1A1Y1zE
 cXxwN9hgEp0ms/QXXDuYXV37CRZH5IA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-zd-MhIbwOSSX5PnpgKWmSA-1; Wed, 20 Oct 2021 15:19:16 -0400
X-MC-Unique: zd-MhIbwOSSX5PnpgKWmSA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f185-20020a1c1fc2000000b0032311c7fc54so941322wmf.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 12:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=focIT5N6CTycMPJowLNwa8meDt82z3230n0dELvLT5s=;
 b=jB3UKKlwHwf2VXP4RhDh/eZmjsY06Y7nU0bufXULZUtB4SFv1zlaOfzASImoDwBEK9
 3hPh9yJ2iM90cP0mTIM9nxwrvkZgGCXRblGCKgjnqGqTYFIxCBpySRSfubi/EvHM4Rek
 CULS+nWL5wccll15D7XDjP8+AQWs9bQkb6kqCYS5yYtHop4xd+h2EC3I/e8Ys8+AJAO3
 E02DBbn1UwV99QH3E6Dazemp6Sc1LbilqYq3Cv5YcX/5y+VSuvjFUDm/ZBaqiswMAyXS
 eSJ1S2s3g2B+ToBL0pdbi1SeUpA/Tm3RyqFlv/5iA6rZhg+AuazrFY93TshoV6fQRAOR
 sygQ==
X-Gm-Message-State: AOAM5304C5OcVe6x5iKYeZV2XonnLPwEro76iyzcXNZ8G2ldGA3lRrN5
 n8NNLZBCynrkcn/rjGUgDXIriXp/tFPRrN1/zJGTVxhg7lc0+cfilgUVtNnLT11ozyJyYCi1mAZ
 fz0FTxS72KmirWuo=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr1354207wrc.71.1634757555692;
 Wed, 20 Oct 2021 12:19:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7z8FVXw2QIOkgw/H8GjSPjD617a8Kk7Kes5/lkBrfyq93CQQUd+c/cx/xvHQn449MMKMgew==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr1354183wrc.71.1634757555503;
 Wed, 20 Oct 2021 12:19:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k13sm2774536wrp.86.2021.10.20.12.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 12:19:15 -0700 (PDT)
Message-ID: <c55a03f4-3613-7616-28ff-2bb452c59aa6@redhat.com>
Date: Wed, 20 Oct 2021 21:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] target/i386: use DMA-enabled multiboot ROM for
 new-enough QEMU machine types
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211020140244.485249-1-pbonzini@redhat.com>
 <20211020140244.485249-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020140244.485249-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: adam@l4re.org, marcus.haehnel@kernkonzept.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 16:02, Paolo Bonzini wrote:
> As long as fw_cfg supports DMA, the new ROM can be used also on older
> machine types because it has the same size as the existing one.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/multiboot.c | 10 ++++++++--
>  hw/i386/multiboot.h |  4 +++-
>  hw/i386/pc.c        |  3 ++-
>  hw/i386/x86.c       |  2 +-
>  4 files changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


