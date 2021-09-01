Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074D3FE077
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:55:15 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTW6-0004CA-83
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSyT-00033Z-BC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSyR-00049G-3d
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9v72gwWAy5qaNuog2S1FNiaTh/MNfzgNG47O7CVqO+w=;
 b=a7bauFJmvVOOKJPEOuu042RnDjZHY4sfk1177Bp8acql8iXM62DnacqL66kGoLpY19Cw8A
 qFlShz/UITqb+XbKrNPmfmxcFMy4GNNB4sDRZtTHWWyFrMHTIrYMmA/V2FdQFJ/df4vwFm
 5cIof8duWBhO0r6xP8iyXVHCnxkf9Vo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-M2KweeNhOUyY3YqhkWYKnA-1; Wed, 01 Sep 2021 12:20:22 -0400
X-MC-Unique: M2KweeNhOUyY3YqhkWYKnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so92233wmc.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9v72gwWAy5qaNuog2S1FNiaTh/MNfzgNG47O7CVqO+w=;
 b=dQH76SU0mahwNlXc4fp2MtBomxe+4zo6fL+uinweMeaRVp4TYcRQY8A5vr2IGffg/5
 xNPyemGNF7kmmWWjgD718aWe+S2mB8KQXy0if+TBVJEvssxb8VwRIWUB4Pkbahnv4/DS
 gyqq1Wgrw2VpK9XJroZ/5qPx6f1T76R8EnfPyfOJcL+DOUYvwOrNei1jdLgM8A4vGzjd
 yrvRqgmjr3XfmxKs60Obb/PENM1F2jx5Su2wu0x2+Q4EKbM3iDeKNtGtO74h8soUl9Zv
 Kzal8OllputWJ5RgwZGYu8XxBFaOnG2XATQCcGBH8YoaJ+d/VOwkoeArEHCBhNI0j1pD
 urnA==
X-Gm-Message-State: AOAM5334rRIVlC842kgwRpmDVLfti8R1soCLL1b4wr8xBHRXI6JqCJdr
 9prvy4HLez8yYParCi7R93BLbo2IdE0oibBnbI98sQvCBQvs5JEdgxKrOKqSCGNQGxH7DaFPEFB
 ZczaLIQGcG02jlbs=
X-Received: by 2002:a1c:443:: with SMTP id 64mr229423wme.180.1630513221153;
 Wed, 01 Sep 2021 09:20:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAtfp9jfyI0IPx20Kle69FyxFbs9YX4EaqrspdrtwwezBumNf5UU4xkKk1vt88XjCidwfBSA==
X-Received: by 2002:a1c:443:: with SMTP id 64mr229409wme.180.1630513221029;
 Wed, 01 Sep 2021 09:20:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k16sm22248014wrx.87.2021.09.01.09.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:20:20 -0700 (PDT)
Subject: Re: [PATCH] tests/vhost-user-bridge.c: Fix typo in help message
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210901152713.25701-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f11e5af-41b2-fdc5-fb01-1e3284e53670@redhat.com>
Date: Wed, 1 Sep 2021 18:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901152713.25701-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 5:27 PM, Peter Maydell wrote:
> Fix a typo in the help message printed by vhost-user-bridge.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/vhost-user-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


