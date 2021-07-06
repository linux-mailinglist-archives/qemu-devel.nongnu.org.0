Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32073BC74D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:35:00 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fbg-00038j-2c
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0fZd-0001PV-GL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0fZb-0004B1-1W
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwdjxq0fIdVBg5EpmSPTCzctGDKnbANO6zEWljKS/iI=;
 b=YjFvXXqMagXdIdwFjPM0XEMClGtIXjkLFmCPqC1cNBmvWDvjcHQkK9GFI213O2cVPHU8OL
 4ilZoR2R7YNkW2k7d+OR1l6TM8EJcsDYqBok2/P5+5Zh0M72dmvh4SS0+kbVfX8/49C4el
 TRPG09ybeEnmK0AT1tefB0hOFJV9FXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570--moWhQbyMmmcoGEuq2ey7w-1; Tue, 06 Jul 2021 03:32:49 -0400
X-MC-Unique: -moWhQbyMmmcoGEuq2ey7w-1
Received: by mail-wm1-f71.google.com with SMTP id
 13-20020a1c010d0000b02901eca51685daso774889wmb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwdjxq0fIdVBg5EpmSPTCzctGDKnbANO6zEWljKS/iI=;
 b=VCy3g6gvqzJ26SdMcbevNKpi0kQZh8e1HE9dc382viYDE1Sb1BoqT0mNkW3UsgUV+X
 GSrG354T+0P4nvHo276nGzxM3t8lpFoQ9261HuKiuYeK1BGELJann9DSbhNlfjDNIOtG
 2coRFINNxaL4PSI4xWhaYbWOAbtng290XDJcaLPTRPZaenAvPo1Ww3rMSgabTJ9h23UQ
 /NpoKXwdzlTfhfO41a052BGz/V9X9Mb/fPrLWRJH/xwpERsVwyUQ+rcKzCk0FFzBfHH2
 h4ZEKFVGeVveOp5a6k6roP2Kh2QkOLo/KVl+PaUB+WBMpp9mQWTt/CzCm4voDQTaFB3Y
 qfvg==
X-Gm-Message-State: AOAM5339B9ItBSd73K7+cegEllLGzx+n1bFn9cxOyVNQ9hYvvrlf+0PM
 APbQ4nySoa1cMBObQupYe3lf0Jpxnapz/ngxIT9IjeKD703Sg4SrAiHrpXKELP9ifoZN2CgwjDy
 g7JaN00g+0oxAMlI=
X-Received: by 2002:a5d:448c:: with SMTP id j12mr20902663wrq.105.1625556768240; 
 Tue, 06 Jul 2021 00:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/sHM1vonLAQMos7+97ZaFB8JD8AL3AhckCwpodo+QDedNpgLEDTaqirJLT1uCQRyJx/lBjA==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr20902629wrq.105.1625556767940; 
 Tue, 06 Jul 2021 00:32:47 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x187sm5897308wmb.47.2021.07.06.00.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:32:47 -0700 (PDT)
Subject: Re: [PATCH] configure: Remove the OBJCC variable from config-host.mak
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210706071934.1054496-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e16094bb-2bda-db40-8ad6-93faf19a8f9d@redhat.com>
Date: Tue, 6 Jul 2021 09:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706071934.1054496-1-thuth@redhat.com>
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
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 9:19 AM, Thomas Huth wrote:
> The last user of this variable has been removed in commit
> 660f793093 ("Makefile: inline the relevant parts of rules.mak"),
> so we don't need this variable in config-host.mak anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


