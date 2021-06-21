Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DF3AF52A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:38:14 +0200 (CEST)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOoG-0004vU-Fm
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvOhd-00011l-Rw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:31:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvOhc-0000AI-7t
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624300279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u73gw0aXIXXxKtxP2GxAFRO5c+VcCyRmYEGUmvy7mMM=;
 b=a1QZHD8QnSpg0dVLKTIIZqvrLpsFq2cSNm494UA9E8xKkXbxai025kVYGaY4B9C42cdukq
 tiCVlJDtWg5qdi0khB7yqfspM8vQcaPmnLbz7hkjrTTWnsE1BjJwZ5DMXAqZVEAoZ2FV3k
 Ri7waqFPWtBw9sLZKQTQEOjMxEl6OO4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-_RpN8h_CMdCHv6ErOlllNg-1; Mon, 21 Jun 2021 14:31:15 -0400
X-MC-Unique: _RpN8h_CMdCHv6ErOlllNg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l9-20020a05600c1d09b02901dc060832e2so334810wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u73gw0aXIXXxKtxP2GxAFRO5c+VcCyRmYEGUmvy7mMM=;
 b=pClYHRUr1Xf4k0nc1mcKYuaPKgtUqn7mQs3B3EqqpOdgymhLvEkuIDNfCzV5i4n5f+
 UWkZ+28YGP5k9CuOSknebFUeTCpTnpRK6LnK2KzJzdpR+9Klq7hSAwV5hDECaUiEKwTA
 NCtHMgfxrRrHi+iG0npRssCn+2bPI0teIa9Zul/fBbkQ1MVlxLDOh3OKqk5hVfJoqdpb
 5JOwaF76DsI5DxkY9DOwNXUeIALAr4SsvLC9Eo+iAXITCuzi3hcfvyVkO8P2fQ8VTp6K
 7EP0fOHw/lwZhOJZTTS4OsdynzCmSQUfKgD3pHZ/alw4XO46G75HPJ2j0OPOnYXkjwlK
 XeRA==
X-Gm-Message-State: AOAM531hqUFR/3xoaGxoOxzRLwqOMzkzPQ+6r7+IJ/qAHzIm8TynDRld
 cZozgHJnokdZVW2PQYj61JqTFzQlzEWOlY1isMPXTas0wwkl1WuTxcGJLv2KIkKv9ALNQyCR937
 VuPe4ZyNCsovt52Q=
X-Received: by 2002:a1c:f216:: with SMTP id s22mr28944495wmc.18.1624300274907; 
 Mon, 21 Jun 2021 11:31:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuneXLx5Vn21ovMrer+HXQDMSeODEuiT/9pFGIzbhouPacCX+alCIAb/+YA2PWjX54OCpgTw==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr28944472wmc.18.1624300274659; 
 Mon, 21 Jun 2021 11:31:14 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m7sm20234893wrv.35.2021.06.21.11.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:31:14 -0700 (PDT)
Subject: Re: [PATCH 10/15] hw/pci-host/q35: Improve blackhole_ops
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619172626.875885-1-richard.henderson@linaro.org>
 <20210619172626.875885-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8cd66162-e99a-9551-dc79-a3c3f02b635e@redhat.com>
Date: Mon, 21 Jun 2021 20:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619172626.875885-11-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 7:26 PM, Richard Henderson wrote:
> There is nothing about the blackhole that requires 4 byte
> operations.  Decrease the min size to 1, increase the max
> size to 8.  Drop duplicate endianness spec.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/pci-host/q35.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


