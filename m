Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BCA3D014B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:10:55 +0200 (CEST)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uCk-0002Jq-Rl
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u7L-00082X-1U
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u7J-0000t3-BN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKGO6LJvlNVCcfwPuQKqzpvBya791cDyEpLFfWyV1VQ=;
 b=fW66NE8BdKmKFXN3TrnJx5lVHC9p7Z8E7YGhkniheLovwyTJpgJUuPVLCSzQAy0WE6Pt+V
 yfLohVsSBqsCchHnsX7j7FoZVrM/g7nUAMl4ycjfAMNbOFFBbhV55lcobDlZDy8LqcILN6
 YuT+znMNRgiCH3imtLNhHmS89+6j28Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-qChIyVaeMbmW25M9czWLLQ-1; Tue, 20 Jul 2021 14:05:15 -0400
X-MC-Unique: qChIyVaeMbmW25M9czWLLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m6-20020a05600c4f46b0290205f5e73b37so39596wmq.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uKGO6LJvlNVCcfwPuQKqzpvBya791cDyEpLFfWyV1VQ=;
 b=W9mjpL8w6/UsObSybUg5eqILPv78MLNpI9zicVeZQarNiQoOYI2ocJqE6CPQsPSQJq
 qAqZwgYoLXJnHuUzEN1ooEu7a4gzhvmiLsOogdgLpxVNpUVWXi9oZKb22V89upftF9EX
 XJHm34m/SVQ3LoaTRBGk27+ZotCuc8VZZY+ZUvo58SNM56Mve1kIUiEj+NTFcyJkNxP6
 QiAcTRsjQBO87ujhTKK2BGdx/KaGfqumiBjQjGdHLaiBhNHIlQkccsEt2yR3CNy5Z49u
 ecBIetLqZ0jTHiuWJaPu/0NvMdwKHOzQuylCpS0jx9l+TrMbSE0GQz81EYzZgXx/OKTo
 hP9Q==
X-Gm-Message-State: AOAM532xJuxf2O7dUdA1cyZShSDFyqkgTLAzCX7S4wOdD+ohk3TAuqCP
 YGmJi2hKhBpgK+52BmPSuLWF1WFBmB+XI805fL6JpmRE8Xltbiq0rlejB2CSvoOkSgyUBZSyWd7
 iI6CKEDCnr+CAXIjngox30mgRSddndVFt9Kx8Aon529n+E794zS3yCE0OZ3WDeDzR
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr38160540wrp.254.1626804314083; 
 Tue, 20 Jul 2021 11:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnHkfNNSya31IBGB3Je29aZ4zr9AXHs6BlzluRNtvLQm3/+96GZBjc0E2l7NHfoN0B4gR0mQ==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr38160519wrp.254.1626804313948; 
 Tue, 20 Jul 2021 11:05:13 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f13sm25632289wrt.86.2021.07.20.11.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 11:05:13 -0700 (PDT)
Subject: Re: [PATCH 09/16] migration: Unify failure check for
 migrate_add_blocker()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1d697127-8642-8e0a-0c26-56d9886639a2@redhat.com>
Date: Tue, 20 Jul 2021 20:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-10-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> Most callers check the return value.  Some check whether it set an
> error.  Functionally equivalent, but the former tends to be easier on
> the eyes, so do that everywhere.
> 
> Prior art: commit c6ecec43b2 "qemu-option: Check return value instead
> of @err where convenient".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  backends/tpm/tpm_emulator.c | 3 +--
>  hw/display/qxl.c            | 8 ++++----
>  hw/virtio/vhost.c           | 2 +-
>  target/i386/kvm/kvm.c       | 6 +++---
>  target/i386/nvmm/nvmm-all.c | 3 +--
>  target/i386/whpx/whpx-all.c | 3 +--
>  6 files changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


