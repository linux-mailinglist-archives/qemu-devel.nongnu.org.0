Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2D39EED1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 08:36:45 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqVLw-0002me-B5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 02:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVK4-00012t-Va
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVK3-0002Ll-E8
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623134086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9t+//wXTlgop/Z03yZFjOGzC5k4x/poh5TNc11yD0h8=;
 b=If8wwriIpCjP+hbRKrkFwuM0q6I3j1PwpfUEkO0a5tSEjU35sOGx71DyG/FHOEeySWgTft
 e2ZTGBUEPc6PtgmoJd/4j7/5bVpyYtHBWy7kTCNANHiwCT2AFBJMciulPM9kIRb+/lcLHv
 FJ/RCaxip4awfXhd5q7p3WZW3ev3DSw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-qjx-wlb2N0u5_B6IDD6m9A-1; Tue, 08 Jun 2021 02:34:45 -0400
X-MC-Unique: qjx-wlb2N0u5_B6IDD6m9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 n21-20020a7bcbd50000b02901a2ee0826aeso784710wmi.7
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 23:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9t+//wXTlgop/Z03yZFjOGzC5k4x/poh5TNc11yD0h8=;
 b=K07G4dRBOUBY67UgHN0gbv/tz204T2eK05csNlkfJmaojd5V2YdwOLZPRZM8sQ4Ahg
 rsI1XZenoM1sM6u4pOX6lL5ExqM13I/BL3RuKMNtiWFEaMx1s+2pj2e8kFLXyvImTY8t
 Lit5E0mbS+d4ACUb60kwRexhyivIyOGt461W17pM1qLJHkUNV+8kH5sFKtEOp46D9b65
 OqGdRjb4i0PSc2+zkAHOi9kEoD8TRZ2wDqfoVNMUh9DFFLrO3YLOJf2Cxk6hSScpdtb0
 2LE1qFM0ZoKj9/AhKlTEZXUeDaTqjkxtcbFyRsclPs/hAANtAbNfnPLXbWukl+jMrucs
 Hxbg==
X-Gm-Message-State: AOAM5311dMGPi1y15nOYwZR9wLRIV8UNduAPCLFYx+rRs6NiH6spsiCC
 Okdr7TxROHNU6XpnMTD4yWQW9B13/yJJ+4GelJAk04CN/xQ5Cooa3hSd3f5CxlZ0S3ocBSBOjrC
 Npe27ZpBJyEb/ycw=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr2463305wmg.19.1623134084258; 
 Mon, 07 Jun 2021 23:34:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBSjWECOFuVscr5fW4hRXciQIRtW9NS5XHTioNbWNrcqSyT5TvUHjFC2sNqCupNcGqS0Zuew==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr2463290wmg.19.1623134084087; 
 Mon, 07 Jun 2021 23:34:44 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y189sm17215966wmy.25.2021.06.07.23.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:34:43 -0700 (PDT)
Subject: Re: [PATCH] docs/interop/live-block-operations: Do not hard-code the
 QEMU binary name
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210607172311.915385-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0094f2fa-5925-4706-dfa8-8771fae74cf4@redhat.com>
Date: Tue, 8 Jun 2021 08:34:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607172311.915385-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 7:23 PM, Thomas Huth wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the live-block-operations doc, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/interop/live-block-operations.rst | 32 +++++++++++++++-----------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


