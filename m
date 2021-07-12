Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453443C60A9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:32:24 +0200 (CEST)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yr1-00021y-AU
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2yoU-0000SY-4N
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2yoS-0004No-H1
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626107384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4n66ADN3JqLkLe0RsOYxV0ZfThVeY1+bK/SOJ38Zuc=;
 b=W5eGmqohgLY3XeMVBA2zDfrTd1XrRrD2uWdD0Hwrcka8wcZOSgjGrQgcF9DkE976aaZxyB
 YhzxpSiBaO/V0fl+WUcoq+CePI3DqhrfIiwbc/GLOVBBx2BXTvd2xOPMTDionWvIdorE47
 LEDZCdxcrzdndusaJts0LlSlS9TRsjk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ftZXetCeOz-pCxG-W4qrpA-1; Mon, 12 Jul 2021 12:29:42 -0400
X-MC-Unique: ftZXetCeOz-pCxG-W4qrpA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f16-20020a1c6a100000b0290210c73f067aso3101671wmc.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 09:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+4n66ADN3JqLkLe0RsOYxV0ZfThVeY1+bK/SOJ38Zuc=;
 b=O3hDYQf3jJbODa7rIaf6F812emyqMrQkozizphWctzYph2I3QPbAFBMQW7oWKpcbyC
 5rJNufQSCdQxiXN3Xzd+vRY/RpWClpbjOvcgWXaRrrXclL1akIXCVL1r0+kdURgLhHuI
 m+X+vXsNjAPYmiAVW3sdl7UfbDgqnqFEM3s0/usp4KvvlyHAYWlBY23sjSE/X41Mufny
 2WmztQkhkZ1zdTzJfpjwLANt0XtUgfuH/D0iKkGQjbRLwER1Aj5rNTCEyplybKezawWF
 vX2of/YQpTAv9DsaNc3s7jWuiJhzrU3AVAtmOfNKqVRm74/driQWXN5Fb+aDosgW4g+y
 +TtQ==
X-Gm-Message-State: AOAM532tZxf/CQ1cwU+9gwnPWjReubUw3bo1Nka1nuMlEpXwfRSpSOAo
 +O7y3GnfukXto9hBAS6kMTpICIlOV87U7sq5+jUvyQsGJPa49MxOr7q34EsM/mrjCEchfDncgiH
 i9LzY7KIU1xhS9E4=
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr59548165wrs.347.1626107381645; 
 Mon, 12 Jul 2021 09:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSPS49fufyKnd2Shv7S/JotXkfnk7MvhsOQVwGE3Eb5HxfsZY34+/+CCWkp9JzJZG/dBSveA==
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr59548148wrs.347.1626107381480; 
 Mon, 12 Jul 2021 09:29:41 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id d29sm3709956wrb.63.2021.07.12.09.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 09:29:40 -0700 (PDT)
Subject: Re: [PATCH 2/3] qemu/atomic: Use macros for CONFIG_ATOMIC64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
 <20210712155918.1422519-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1952860a-2ee1-f5c7-b242-39044096d667@redhat.com>
Date: Mon, 12 Jul 2021 18:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712155918.1422519-3-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 5:59 PM, Richard Henderson wrote:
> Clang warnings about questionable atomic usage get localized
> to the inline function in atomic.h.  By using a macro, we get
> the full traceback to the original use that caused the warning.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/atomic.h | 25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


