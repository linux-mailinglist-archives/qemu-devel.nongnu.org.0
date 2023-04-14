Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F44E6E258D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:23:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKKj-0003HT-Ly; Fri, 14 Apr 2023 10:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKKf-0003H4-RO
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:23:22 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKKe-0002CW-CD
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:23:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id q5so10422837wmo.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681482198; x=1684074198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WH3tVq8skDUMRd4kmype3XGges4f+AMUggocLuzgE2M=;
 b=jv0QTiFpAhbh5DJ0MD5fPgkmJ2DpZN8p4usqgIEqZw4j1rFjMxC3V9JOuwnCpn+RmC
 Rd8rH/HezhTRNleTE9enL2bQ838q8rNCxo0TiROWAbKq177u1cOPtBjDXZb9gDBb6QGP
 UpIeeiqSqafR6vHPkul54JbtUHy3rtSAwLH9DFsJ7MUJ3W20C5znM/V2978ssYRImt2a
 zZyH4bPuh4MvpFs5rPx/ddHcNkfmhVL4bSMiYYs4Fh3J7Sto8W0ZHGKAb4m7qeiCZCmG
 NPXJEHA72B1WGi3nFo6nh9TkcyM98ZlccJtayiGIJTrghsq4ETKxGrj7rczhje2d2/5Y
 lThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681482198; x=1684074198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WH3tVq8skDUMRd4kmype3XGges4f+AMUggocLuzgE2M=;
 b=GebB3yfFEFbZQ5ZCuja0iqrQfydPguADLyC38DHxnrn37Ne1q8z8MK2xKYHd3g1DbX
 dNkHtIq+gFXmZVbwoeLGA1X2z7Diba7cb5RddLGShQoCxBvMd54jpG+u33n2UeGGRN5E
 WM5Kna/fCS3ynuPIbJkkJff+qPTI/AyTHFYN42Ds1gzMEqMZiriyBACD8jKiSxPQ6Lpn
 Mr3obwhEbFQNlWSc3bcH+g64T/gd/aF6ug/exsHKQO3yCjjPKzjQuM7/bCXxtW8ZNMSu
 UhhezOe4BXiNiilsgwD9wSuk+2Hae8s0YPO15yYHaPW9cwS8E3B8oxPiMsQVAquv8cnu
 xpgw==
X-Gm-Message-State: AAQBX9c/x9Uj5R4sHAqzt8LtZiFNn1C3XdSYom2Rf58chg2D1+i8yoN3
 VZl1FVqSTdJ3Y/G1tZiqAf/1hw==
X-Google-Smtp-Source: AKy350ZTSMmPPXxAApGX7LcF1VQdDXkD+VDOF/NyG1zCur3Xhu8fkLX3RAQZOUcqaqOXktOFWlrbng==
X-Received: by 2002:a05:600c:3642:b0:3ed:f5b5:37fc with SMTP id
 y2-20020a05600c364200b003edf5b537fcmr4433608wmq.1.1681482198139; 
 Fri, 14 Apr 2023 07:23:18 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a1c7213000000b003ee58e8c971sm4423471wmc.14.2023.04.14.07.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:23:17 -0700 (PDT)
Message-ID: <787e1e38-6dfa-ca31-d740-a59d1cf32f66@linaro.org>
Date: Fri, 14 Apr 2023 16:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 01/40] hw/net/net_tx_pkt: Decouple from PCI
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/4/23 13:36, Akihiko Odaki wrote:
> This also fixes the leak of memory mapping when the specified memory is
> partially mapped.
> 
> Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/net_tx_pkt.c  | 65 +++++++++++++++++++++++---------------------
>   hw/net/net_tx_pkt.h  | 38 +++++++++++++++++++-------

Preferably split the patch in at least 2, first the back-end,
then the front-ends.

Also consider installing scripts/git.orderfile when posting
API changes, as this eases email review workflow (no need to
scroll up/down frenetically to follow).

>   hw/net/e1000e_core.c | 13 +++++----
>   hw/net/igb_core.c    | 13 ++++-----

>   hw/net/vmxnet3.c     | 14 +++++-----
>   5 files changed, 83 insertions(+), 60 deletions(-)


