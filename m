Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C375E770D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:27:51 +0200 (CEST)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeyM-0004ML-GY
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obeZY-00086m-Hv
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obeZV-0004V6-IL
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663923728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mtg7wIJVP3tDp/hmYXraAcpbKfaq+ogDJgtY9EHsnE4=;
 b=SMKGD+DGO3I1Ke2Ey9VHPvHPyUZIm7G9nfllF+7xgwI1yNZs97WQ4PCwez8D+rTSCfuyfS
 q3JzFbefWiq7uZ4JHRKpMU69xYhG3mfJq523EedmKEr/m/H+HwPdMS+OJWBHGLDMPUYvPX
 +POUKeWYIUNEDbQSzPF19oAE3MsEMWI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-YvXNJhtCPwi93FJM7ZITuQ-1; Fri, 23 Sep 2022 05:02:07 -0400
X-MC-Unique: YvXNJhtCPwi93FJM7ZITuQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d25-20020adf9b99000000b0022adb03aee6so3763297wrc.6
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 02:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Mtg7wIJVP3tDp/hmYXraAcpbKfaq+ogDJgtY9EHsnE4=;
 b=vQfGKo1l5EJzQ3XFhxJypzxPu7WgXChliWz5VLsGeKQMqF8I4mI8UaCQktB0D67NU9
 w+nTHLvRgqbPpgN6ZoLC7s7VL9LLYBPvGLG6afy2XarEVBiyDlT2Xqt/VbYBBOS+0eB2
 +vbn7WlMadAKKTnA5DeJL3Vmz1jQzcrVp2tzxZJt83p7psP2fR5BvDMgIAXuHt0331J8
 IfS78F7j8oi2VSCnl5y4eAcxoyjHdfFOKe61zv9TXH2NRi7SHtfoy5Od+XkkzDLlldVM
 sf9ujl8qYOvZqX27sU19tjaFiIe3cd0FrWO/adtoaJmsThapsnx/H5vGksKj6JfxOGMY
 9Crg==
X-Gm-Message-State: ACrzQf2TSw/ZqRc/ltznQ4mYjk58M76OFKWMhuLWaUMMkUkMM/I9tytc
 HIPMXQqcvgGZDfq6PhCE+fmEcJmkNZRmzcMomR0nk/xuxlV0MZW7BgdNWdtK8EVBMros4sv70b3
 GASdNmgnYcRCuKsU=
X-Received: by 2002:a05:600c:2181:b0:3b4:74e4:16f8 with SMTP id
 e1-20020a05600c218100b003b474e416f8mr4911306wme.174.1663923726187; 
 Fri, 23 Sep 2022 02:02:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM74Ow6DCsG/inzGSnENmUuD0prfkF4bo9xKqvWzoVInGfZr8im1v0ziqSP1YJQ9GX/hT9pbig==
X-Received: by 2002:a05:600c:2181:b0:3b4:74e4:16f8 with SMTP id
 e1-20020a05600c218100b003b474e416f8mr4911262wme.174.1663923725840; 
 Fri, 23 Sep 2022 02:02:05 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 z10-20020adfec8a000000b0022afe4fb459sm6888963wrn.51.2022.09.23.02.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:02:05 -0700 (PDT)
Message-ID: <4c0cbccf-0c1c-3ce3-04dd-534b11d9b62f@redhat.com>
Date: Fri, 23 Sep 2022 11:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on
 buildroot
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220923084803.498337-1-clg@kaod.org>
 <20220923084803.498337-2-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220923084803.498337-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/2022 10.47, Cédric Le Goater wrote:
> Replace 'buidroot' and 'builroot' by 'buildroot'.
> 
> Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   tests/avocado/machine_aspeed.py | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


