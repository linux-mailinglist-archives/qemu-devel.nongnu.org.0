Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA98628EA5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijj-00048F-Es; Mon, 14 Nov 2022 18:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieV-0002R9-Oi
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue3h-0004Z6-VY
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668449988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjiT24fMD65GhRxjoz05sgUCNOgujOFhEAEa4sS2wI0=;
 b=AfFtCGrBu3pJM1mtoZT/t6XeTluO+XKLuZ70VvT1XY6MVTt5S9kiftOKeW/t5pSO9/+LxO
 f1LXldRW82Fnmdkr5tG0OOdyzu9t3Ks0rIzkQ5hqcbviF5Lwr9lpBX5boIC7vnc0OiIKUB
 C5JRWzsjFGdMdK0m/vthbiMu02ttP4o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-6G_sz6xtNTy8pQsb7wD2_A-1; Mon, 14 Nov 2022 13:19:35 -0500
X-MC-Unique: 6G_sz6xtNTy8pQsb7wD2_A-1
Received: by mail-ed1-f71.google.com with SMTP id
 q13-20020a056402518d00b00462b0599644so8830132edd.20
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MjiT24fMD65GhRxjoz05sgUCNOgujOFhEAEa4sS2wI0=;
 b=eUVfLRKs3zBMuxJ/+uf2/88nth942VxpB8pZZRWNJKIW54mI4VyoMwfRZf6fWxk/Yu
 rSKviIY7zJ53wAr8O+yWXBXriUOlCkG9e9A/QBqwPlzbA22wVG/vWbJFzQi0IpqQP5TL
 YkEnMRajuf+cUvU5nxnYDf88LgbrtdA+u974CD1pCbG+f8cAl5zrKQsOpGWVBtRIoXtG
 ACupTyo5OGO9RTLpHHwmNNe42eabIBQHpl7/L0if8nA44wb6TcrKvGa6EEJid2dhpdqI
 saNdJ9BJ0KKT2EpSv/AjZrulSaqHZjH7ptCDJmDM8KswDBacKYCYwmtkdshJd7qT8v5f
 P2eg==
X-Gm-Message-State: ANoB5pkECmcknfUNFFCfoF+J9V/UOZQQt7b+bEzQBlgEygoxJJN/lsym
 ycyhPETZWg32SsMPLaVFAFS8knzOTyW5BZOEsuVSnEZBFF8lKX7j0p+Mdq7+OU6PVUa44nnfG2u
 N7pci1koNnvOX2+8=
X-Received: by 2002:a05:6402:e0c:b0:467:6cec:709e with SMTP id
 h12-20020a0564020e0c00b004676cec709emr11034126edh.192.1668449961970; 
 Mon, 14 Nov 2022 10:19:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7vrbLZaIN10L3DGURbg9TpPqRN+kMsDrF7SZ4kBf9/tz/UdMLPH6pL0lN8YUtfIiVd3A5SnQ==
X-Received: by 2002:a05:6402:e0c:b0:467:6cec:709e with SMTP id
 h12-20020a0564020e0c00b004676cec709emr11034114edh.192.1668449961736; 
 Mon, 14 Nov 2022 10:19:21 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a50935e000000b0045c3f6ad4c7sm5091228eda.62.2022.11.14.10.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:19:21 -0800 (PST)
Message-ID: <385e97df-0fe9-4dfa-4fd9-b218a98d59e7@redhat.com>
Date: Mon, 14 Nov 2022 19:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/13] block: Remove drained_end_counter
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-5-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-5-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 08.11.22 13:37, Kevin Wolf wrote:
> drained_end_counter is unused now, nobody changes its value any more. It
> can be removed.
>
> In cases where we had two almost identical functions that only differed
> in whether the caller passes drained_end_counter, or whether they would
> poll for a local drained_end_counter to reach 0, these become a single
> function.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-io.h         | 15 -----
>   include/block/block_int-common.h |  6 +-
>   block.c                          |  5 +-
>   block/block-backend.c            |  4 +-
>   block/io.c                       | 97 ++++++++------------------------
>   blockjob.c                       |  2 +-
>   6 files changed, 30 insertions(+), 99 deletions(-)

The comments on bdrv_drained_end() and bdrv_parent_drained_end_single() 
in include/block/block-io.h still say that they poll some AioContext 
“which may result in a graph change”.  That’s no longer the case, 
though, so those paragraphs should be dropped, I think.

Apart from that, looks good.

Hanna


