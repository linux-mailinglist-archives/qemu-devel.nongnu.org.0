Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6122FE996
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:06:10 +0100 (CET)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Yj3-0004w6-NA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Yh1-0003e0-R5
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:04:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Yh0-00085O-3H
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611230641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PL0s2OLTEGC2EV+iROFbdnp/PeOS3tm55hemfDAcqlE=;
 b=OOHgpuzk7+eHAJLUjex7aI35b+U7IXXeOVSMJqTmbdbSE74EAXJXSdS7ekLWO/RbFfm3ve
 OwGXlX44Dl3RTE3heSt2LB+OTqn0RqyCgEA3rVezDF3YU/p8HLcFRjmc+d+ear5q2SI4O6
 8B2BUgrY6vgkqT1sptVcHM9ccKe9oJM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-00JH7hTyMoWNLALH5YPKWA-1; Thu, 21 Jan 2021 07:03:58 -0500
X-MC-Unique: 00JH7hTyMoWNLALH5YPKWA-1
Received: by mail-wr1-f69.google.com with SMTP id e12so842774wrx.14
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PL0s2OLTEGC2EV+iROFbdnp/PeOS3tm55hemfDAcqlE=;
 b=N/gSSxC9ZQlWv/qDM4a+G3Jpat57Dj8XIoM4xb8p/yzE/eH7oDpZnwHJpf7E6ygDbd
 uGfJy2vMkiRQpPaxsZ6QhSZMcpJAMYPII6YU7n7ZjI7EWKYWJvMY7yBlNMNAuVrdZjZ2
 KtbRzanTxe/oLtFLlMd4W73M00z3MQ8s1efRgRLwri09R1g85OYndGzuWc3M3yrnuJ3W
 Np9JXMP9CzSLnzKBk6s08IvdeBnkMTaPlBXKHKgHSMs687a//AYTy/GoS/3cKWTOLocy
 YpVy98XXK/1lpO5vI+wZAXNvNyP7z12cn80L4A4Oc4naKtzrjS2pMbD1ldQNr+Wp6D/y
 BtlQ==
X-Gm-Message-State: AOAM5320/IfaAXENDIeHGV4j9ZDhWZP36HuC1FGH0eOtlzfZLqoYVx/G
 zwU/7FSd8/BOaXORAQSBXebwOaQGOtZiMHJqixO64hNk5huKt6aCgONmKbIqmgQzjBGYvl/ZKST
 7rS8b8yvavg86SuA+w+WbEZdDN7bFK5fzvL9eMin2jTasZRyCOwtj/xrfLkmt5m/IPis=
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr13669208wrw.36.1611230636726; 
 Thu, 21 Jan 2021 04:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvEyLKAA4sRWcnH5shmKRtPxgCyhGBXqdS70LgU1hFrb4Z/zCE5UgVUzYw4dGOPe/Sdr4t0g==
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr13669193wrw.36.1611230636505; 
 Thu, 21 Jan 2021 04:03:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id x10sm337722wrt.84.2021.01.21.04.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 04:03:55 -0800 (PST)
Subject: Re: [PATCH v2 0/8] meson: Clarify summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210121095616.1471869-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5ebaed3e-73a3-fea1-93af-ed1748711786@redhat.com>
Date: Thu, 21 Jan 2021 13:03:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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

On 21/01/21 10:56, Philippe Mathieu-Daudé wrote:
> Reorder stuffs in summary to quicker understand bug reports.
> 
> Remove information from deselected features when not necessary.
> 
> Since v2:
> - integrate Paolo's summary sections
> - simpler sort
> 
> Philippe Mathieu-Daudé (8):
>    meson: Summarize information related to directories first
>    meson: Display host binaries information altogether
>    meson: Summarize overall features altogether
>    meson: Summarize compilation-related information altogether
>    meson: Display accelerators and selected targets altogether
>    meson: Display block layer information altogether
>    meson: Display cryto-related information altogether
>    meson: Display library dependencies altogether
> 
>   meson.build | 295 ++++++++++++++++++++++++++++++----------------------
>   1 file changed, 171 insertions(+), 124 deletions(-)
> 

Queued, thanks.

Paolo


