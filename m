Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AF26B8E26
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 10:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc0bd-0007if-Cw; Tue, 14 Mar 2023 05:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pc0ba-0007iS-RJ
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 05:06:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pc0bZ-0007yQ-13
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 05:06:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id m35so157706wms.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 02:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678784759;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h/lJt9s2WRiZqSUJt1NgB/CFrGxZutEK5uPIWwQ1+iY=;
 b=kI+bfujAQ55ePrqLGf8KA4t4Md+YehwS1IeF0GT4FIidlUTQzNoEmOioAN9koNVluv
 bKvaeLj6mX+JcKkiz+VFTNF690ptqqD+8ED/fH615zZxL+zO4uzRsJUTFv82Rtz1PNI8
 i6aqf3C5f2grqe4pys+PHh8FeZk86+7NKntHXUQ3+U/+8fPeFGuJUL0BDhOkfDEhK1mm
 GFKf0tDrgZKfYHsroRl2dGsDwXaIRq8LCrAt2vx/NZ41otGweYRd2UHIvgNsJu2qooeT
 vGjTwXLdQ5m7OzJ3E7RMYoi+4tpslgNqi8ZqmfNuqTmsfNGDT8uvVFTMarPwbxlMzHqi
 LGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678784759;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/lJt9s2WRiZqSUJt1NgB/CFrGxZutEK5uPIWwQ1+iY=;
 b=8FC99bPO5t8RpPq8EBXP4uewj12x0smDTDKwX34OtNwIwDzFyjAnTw/ajtZlsaw2KM
 g9YRSuQZwGBlQANG0GIZaGcu5LomUJNSBpXqiOQoazqN5AxWVivlf8HUVIVvfPtzPOH4
 6GM9qSc8MGoJ4aKJKt7FjHAxRoOwTRXIIAQuCWYGpOOhD5tbDAiojGxGMfl07nzmy1WZ
 gxX7Qnsv7d1/iZDBHFjcxKEFpbnU4z9QE/arZFxbjV4WwQU4QLVlka2VM2+R2WIBIC2A
 GD8jLSVchudUXddC1tjb4LQezQ4SoPN5CCRnlrFlD6VIHC+wpb4hnOqa9TDfcmUr2yFq
 MEWg==
X-Gm-Message-State: AO0yUKWPplTpABUedLh09Cw+N/fg3ioFlSWAovguWUYpIc1BaWX8efR4
 CZN5QSaL7HnPNbT84r7iqBQ=
X-Google-Smtp-Source: AK7set/iy+guVU8jvKQJiCwja+79BoDT/XQwIGyKPKWW2gx9TOz8R5kfjPD04OMjaplDG3HOZExHVg==
X-Received: by 2002:a05:600c:19cf:b0:3eb:3cc9:9f85 with SMTP id
 u15-20020a05600c19cf00b003eb3cc99f85mr14397660wmq.26.1678784759074; 
 Tue, 14 Mar 2023 02:05:59 -0700 (PDT)
Received: from [192.168.21.223] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a7bc38e000000b003ed2b6da0d2sm1450244wmj.9.2023.03.14.02.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 02:05:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <af8b5b82-036d-6355-4201-77ecdd6ba61b@xen.org>
Date: Tue, 14 Mar 2023 09:05:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] accel/xen: Fix DM state change notification in
 dm_restrict mode
To: David Woodhouse <dwmw2@infradead.org>, Jason Andryuk <jandryuk@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
 <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
 <CAKf6xptRmeVmH3xmF8QffQA=aYeXxCWUw9ta2HaYx1xQngzjTA@mail.gmail.com>
 <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/03/2023 08:35, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When dm_restrict is set, QEMU isn't permitted to update the XenStore node
> to indicate its running status. Previously, the xs_write() call would fail
> but the failure was ignored.
> 
> However, in refactoring to allow for emulated XenStore operations, a new
> call to xs_open() was added. That one didn't fail gracefully, causing a
> fatal error when running in dm_restrict mode.
> 
> Partially revert the offending patch, removing the additional call to
> xs_open() because the global 'xenstore' variable is still available; it
> just needs to be used with qemu_xen_xs_write() now instead of directly
> with the xs_write() libxenstore function.
> 
> Also make the whole thing conditional on !xen_domid_restrict. There's no
> point even registering the state change handler to attempt to update the
> XenStore node when we know it's destined to fail.
> 
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Co-developed-by: Jason Andryuk <jandryuk@gmail.com>
> Not-Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Will-be-Tested-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>   accel/xen/xen-all.c | 27 ++++++++++-----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


