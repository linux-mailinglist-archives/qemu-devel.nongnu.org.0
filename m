Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386784353EC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 21:38:40 +0200 (CEST)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdHQ7-0007BB-BW
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 15:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdH2D-0007h7-Jh
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 15:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdH2B-0000H8-05
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 15:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634757232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BchiqeCaKqAdM8SP9XQuLmv1bPPMgNQ9UfsIkjChlNg=;
 b=jVimfspdLOIqQ2+GYKSSarXs1ZbmE4mASqaulB/5hlUWFiD6kGdGddKheDDoA3B5CeWpSx
 Ixjvv5Y2kHD3k5Kg3BuOK6MtHebHmL9cUFao8jnKW8w/jnZbc5LjhuTG2QBcbrwRYL+7eE
 j9ilreR4cubQdnBZiY/RPgOOKHKpSsk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-efZBPQGdOAmUAJlu86wFTA-1; Wed, 20 Oct 2021 15:13:51 -0400
X-MC-Unique: efZBPQGdOAmUAJlu86wFTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 d143-20020a1c1d95000000b0030dc197412aso943213wmd.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 12:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BchiqeCaKqAdM8SP9XQuLmv1bPPMgNQ9UfsIkjChlNg=;
 b=IKnDaerpw9hU8BRqdy4+Qn1qglOKFIBC8Ntgj9Su7b17NtFxL08DkLq3U8R+QZ+0wR
 cc3GuRlMxn/ntivupHrURef1Ye6zKxRkTuDaZ7weTgUZzPyk7lfKksHlrEsO5dAhRWob
 MgmFLj7AyB7B4iAX9IkDOgd8SgJGczqy5ypS52eDLcgCPf34bS82kPTAqdj3rGCslMRN
 YE7hbIouOprJdXwvxlohot+YHDoANR9nPzjemWJNEL4jmSoMv3zejUgb0EkfHGyQ6eSV
 i/5pGT6iVM+aSsdxGbbi8P96CovDIvYGH3KM+ABJuTe+j1XMRlWP9mX7Icq40A7Gfgv+
 Txfg==
X-Gm-Message-State: AOAM530hv/xdnT07p6Yw4btiBKDuIrPFniJMI2vMP/QDQadJmwWk3+5b
 BL/AysIvsQlSDTwzKMrMJRJZdT/xBtXzO5Os9ObFwFV/ALVLdb+PUQuzXRWZ4GQBTVGXZ3S+k+3
 ugd8ODgMHRp3+nHA=
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr1397733wry.194.1634757229836; 
 Wed, 20 Oct 2021 12:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8HrQB5xYsEeZWsInu8Zh2jz5FG1C5F1kScEmHYmsxzseBHjx2PnuT0tWnA5/COLclOQP7Hg==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr1397713wry.194.1634757229674; 
 Wed, 20 Oct 2021 12:13:49 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e25sm62138wmp.9.2021.10.20.12.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 12:13:48 -0700 (PDT)
Message-ID: <d4ce7902-25a7-a4a0-40d3-a4a489a9d7ed@redhat.com>
Date: Wed, 20 Oct 2021 21:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] target/i386: move linuxboot_dma_enabled to
 X86MachineState
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211020140244.485249-1-pbonzini@redhat.com>
 <20211020140244.485249-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020140244.485249-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
> This removes a parameter from x86_load_linux, and will avoid code
> duplication between the linux and multiboot cases once multiboot
> starts to support DMA.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/microvm.c     | 5 ++++-
>  hw/i386/pc.c          | 5 ++---
>  hw/i386/pc_piix.c     | 3 ++-
>  hw/i386/pc_q35.c      | 3 ++-
>  hw/i386/x86.c         | 5 +++--
>  include/hw/i386/pc.h  | 3 ---
>  include/hw/i386/x86.h | 5 +++--
>  7 files changed, 16 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


