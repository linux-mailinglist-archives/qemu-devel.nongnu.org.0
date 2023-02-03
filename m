Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C07689566
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtCK-000632-J4; Fri, 03 Feb 2023 05:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNtCI-00062E-67
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:21:34 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNtCE-0003nn-Qz
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:21:33 -0500
Received: by mail-pl1-x62f.google.com with SMTP id m2so4771973plg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZDSZW3BFcIKAPoms1ekUlot/67EC57cYuMJ8QStrRKU=;
 b=VAlo0WxVN6688Rcbp/GfkXHEep6gAP5j530a2foN7ZF2lu6+3D3NVORpClnWDgHAiW
 8iHwC/g2Upts2AQdgWxMy0btIOyb45JxA7Y8yS1btdTzmFiKTtDvbcuiqJL+XpzomEgv
 jliuXHL93Kg2KJQ52oaXS1LwkHLRIrIh2c4ha3qQ9rhBotZXWE7OUbncaNQFfH4XLP0h
 H4xxwMfs+nlVIaAGGr0iPSJo93vxsAmyMSp36Xb/o/7O+nsAUtOodSbNPZWJJnRw89F/
 thF5BrJ3ng2FGGuzmxcZ0Zemi8tOKVzWhuKD/WopPPLuxgguuNVBpfdgqsCr1+Xumcm0
 jwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDSZW3BFcIKAPoms1ekUlot/67EC57cYuMJ8QStrRKU=;
 b=1GvypDH2s7hP9QVTpS+UoJ5J4lBppiKzlalYCE8eRp21VlZccc6fct1WteVWWHfPp5
 XAkyv7d/1OTj/2eEPafFv+OxeaNSagcFY0mVGkf8RkoL3nJqzJrCBj2GdsQbCkx/7kkK
 tbEQp0fOnFi/pMvdu87kzXy28nh/IROxpB2EGivwmqTORDK3AL/dtDjuFIm9wd+FGcke
 72ISisIC7JSuG1t1p9s3R1TKqrWqX+6eqedXg0BcqM1H6Tno0eJecgNKxg2gMkjM7em3
 3Z5IhpG0fFnJ3M2Ridee0LU7i85wfIfNAMFyEz3Sup2HJtf6KyIrZ9Ne/uoBi/Y/Z/47
 3mrA==
X-Gm-Message-State: AO0yUKWsE6ewhuFnimL8louzwdu0OQYh+N9UQv8+BvH6Jti/YnAgcVjr
 +9gQV9A7dMhxqGz0JSwGM/PjYQ==
X-Google-Smtp-Source: AK7set99k5iz3jvGQvXs51EqdmHxtAJeMsTghG6k/a8xZTaMh/tL1eAmsWoiNUpQaXKvDpK0Xt3I0w==
X-Received: by 2002:a17:903:2053:b0:194:3cef:31 with SMTP id
 q19-20020a170903205300b001943cef0031mr8411196pla.49.1675419688946; 
 Fri, 03 Feb 2023 02:21:28 -0800 (PST)
Received: from [10.213.81.57] ([157.82.194.11])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1709029b8700b0019493c84880sm1216662plp.188.2023.02.03.02.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:21:28 -0800 (PST)
Message-ID: <52c93ed1-7503-ba7b-2b2b-5fc5983ba073@daynix.com>
Date: Fri, 3 Feb 2023 19:21:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v6 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/02/02 16:52, Sriram Yagnaraman wrote:
> Based-on: <20230201042615.34706-1-akihiko.odaki@daynix.com>
> ([PATCH v7 0/9] Introduce igb)
> 
> Rebased on latest changes from Akihiko, and merged changes from my
> original patchset:
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
> 
> Changes since v5:
> - Added back an unecessarily removed empty line
> 
> Changes since v4:
> - Removed the change implementing VTCTL.IGMAC, it needs more thought
>    and implementation of DTXSWC.LLE and VLVF.LVLAN first
> 
> Changes since v3:
> - Fix comments
> - Rebased on latest patchset from Akihiko
> - Remove Rx loop improvements that Akihiko has pulled into his patchset
> 
> Changes since v2:
> - Fixed more comments from Akhiko
> - Reordered the patches to make changes easier to understand
> 
> Changes since v1:
> - Fix review comments from Akihiko
> 
> Sriram Yagnaraman (8):
>    MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
>    igb: handle PF/VF reset properly
>    igb: add ICR_RXDW
>    igb: implement VFRE and VFTE registers
>    igb: check oversized packets for VMDq
>    igb: respect E1000_VMOLR_RSSE
>    igb: implement VF Tx and Rx stats
>    igb: respect VMVIR and VMOLR for VLAN
> 
>   MAINTAINERS          |   1 +
>   hw/net/e1000x_regs.h |   4 +
>   hw/net/igb_core.c    | 199 ++++++++++++++++++++++++++++++++++---------
>   hw/net/igb_core.h    |   1 +
>   hw/net/igb_regs.h    |   6 ++
>   hw/net/trace-events  |   2 +
>   6 files changed, 175 insertions(+), 38 deletions(-)
> 

It passed all of the test cases of Linux Test Project and Windows HLK 
that my series passed. This series is now ready. Thank you for your 
contribution.

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

