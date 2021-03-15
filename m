Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05BB33C82D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:07:30 +0100 (CET)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLuQz-0008Q0-D9
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLuPV-0007op-B2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLuPS-0004e1-9Q
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615842352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqQNnCm33V8UPGKQpOzpVC/0Tccul6yIMOrRTi8V+K8=;
 b=EjlsfSZMh4kjciNwIKDHMkCRyKM5E1eUyvOqeRXSIHj21Tmmqd2CEl8gmTkLYU2f5ykpQT
 j//IOHppDbvZLBTnRJdYMRABeV0ZxEa6aB5Aj4GgWH5q1efId2Xm7OvDTGiWQ3XhbBeAfl
 y/q/OidPsg0xec7uEXd1tB2tpzBD2p4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-PtoL5vW0OpuCEXOzo6XsVQ-1; Mon, 15 Mar 2021 17:05:49 -0400
X-MC-Unique: PtoL5vW0OpuCEXOzo6XsVQ-1
Received: by mail-wr1-f69.google.com with SMTP id p12so13044034wrn.18
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KqQNnCm33V8UPGKQpOzpVC/0Tccul6yIMOrRTi8V+K8=;
 b=a/DD8dOFN+BYHU8y3n1svb7URTFwpmTzK3pdoJEZR/dk1GO+sXCLwSBn2hVx41TLEH
 +Q5U/JCRTh0u3xY0E/ITIgj3JnIkonEnBsi28LIIGYSILVKkfPVFwVwmCuRPcHJ5aDFl
 Xf3u05mUdm4rkza2yCl7J+zaXMxLl65/7WBQ/626d0U8fcg+DCVKHd0Wp7C8GlKw82Uu
 d9CFEHgkETq3lhN/BgNPGlqPTFZZhZDasg0UFJ3M4L0BNDekTAsBegOmlapZKDBhSGM/
 LPiUQKITA4RMLIUNv8byVoHZfxuV1ZJkj8TqlvbygGNXNhhk4g4X37HHwwF8GHdkuvTo
 T4kg==
X-Gm-Message-State: AOAM5322E0iBySCFtZkE3hzlftLoOAO4SgCI8WqjVcim3L+96iaKN8+q
 4HeFWMf+4LiIhDyOPbgYqDx5fiI4BX1AAAIdcDZ+vJUdOxLeYCd14dbTxoihuegubQssmGdZ/FP
 dvVDbfqMb8fHYi80=
X-Received: by 2002:adf:a3c2:: with SMTP id m2mr1451886wrb.195.1615842348260; 
 Mon, 15 Mar 2021 14:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcQjVJi2HkHU+OzFMxmDlYrPNDRFfM8HDKDADHbGjNIAx3yALuT7DUl72wDpyd46x2Fp3sxQ==
X-Received: by 2002:adf:a3c2:: with SMTP id m2mr1451871wrb.195.1615842348103; 
 Mon, 15 Mar 2021 14:05:48 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x23sm828615wmi.33.2021.03.15.14.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 14:05:47 -0700 (PDT)
Subject: Re: [PATCH] migration: Move populate_vfio_info() into a separate file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20210315190756.317710-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f26d3ce6-b51a-7c44-2ec1-21a6bd2d4a46@redhat.com>
Date: Mon, 15 Mar 2021 22:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315190756.317710-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

+Alex

On 3/15/21 8:07 PM, Thomas Huth wrote:
> The CONFIG_VFIO switch only works in target specific code. Since
> migration/migration.c is common code, the #ifdef does not have
> the intended behavior here. Move the related code to a separate
> file now which gets compiled via specific_ss instead.
> 
> Fixes: 3710586caa ("qapi: Add VFIO devices migration stats in Migration stats")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  migration/meson.build |  3 ++-
>  migration/migration.c | 15 ---------------
>  migration/migration.h |  2 ++
>  migration/special.c   | 25 +++++++++++++++++++++++++
>  4 files changed, 29 insertions(+), 16 deletions(-)
>  create mode 100644 migration/special.c
> 
> diff --git a/migration/meson.build b/migration/meson.build
> index 9645f44005..e1f72f6ba0 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -30,4 +30,5 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>  softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
>  softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
>  
> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
> +specific_ss.add(when: 'CONFIG_SOFTMMU',
> +                if_true: files('dirtyrate.c', 'ram.c', 'special.c'))

Why not simply name this migration/vfio.c? That way we do not start
mixed bag of everything target specific.

Otherwise LGTM.


