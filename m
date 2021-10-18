Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75043137C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:29:15 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOxG-0005zP-Ng
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOtj-00025u-IC
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOtf-0003KN-Jr
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIwOG7Y9iwazJPmrAP8YjkaApp+gXmKxHAuhJCLHDb8=;
 b=JgXFxKFX1qH5WPXoFAQxlIGpEARzY3QV69ZT8P04OP4PT37xT7YiwuejZ496/V8zLfzF9/
 FFxqyeCDD4Q4lZExjPTLTM0QRAeEsckVpB2BIGqd8dTMkd/iNuSw9RMzB/GKWVel1GNs6I
 K4Yh4r5bxhE6SfIeNt6P1jPCHZ3Re+I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-GC-EO_BMNb6lyOh2DhRI6A-1; Mon, 18 Oct 2021 05:25:22 -0400
X-MC-Unique: GC-EO_BMNb6lyOh2DhRI6A-1
Received: by mail-wm1-f72.google.com with SMTP id
 o196-20020a1ca5cd000000b0030dc197412aso2964449wme.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oIwOG7Y9iwazJPmrAP8YjkaApp+gXmKxHAuhJCLHDb8=;
 b=HXG9dv6cgrCqfC9MtGCOjeQt0oUzR5cw5cEQS5Kh7/TvVkEPlQ4osqNEQ8EaGMKgTg
 6Vpgqmv30QMYkrk454kdOUBTcF5f/7i7GnuOgQqBC/hkGNf0kWARqlXqdYbay1FfPM0P
 UqTVxDdxhNwrqayvmGsaXxmEcmOuusVVc8SQBzK8geffGD5X3Y/X2qdX7qtsBh8uS44N
 UpDzhHf0UGvzDrg+0gj6oxswrfbg/ReF5azULr2KKDmyllqVXpvTrQebdRlSpCw4Hyq3
 Nq58wUsJ/MSKzpKE2i8B80FamQKHaZciked6BSJIc8EeRSO3ALNa/dYCpanChS00lNsY
 weQg==
X-Gm-Message-State: AOAM531qIWkOak/jOXbfFuuj3nnUNBStNJCN4cdYZg76mW5Z6K03//dY
 hru3gfHdcA1M/00elcJutxjTUh8nC7NjhtoitNovcTp7MABS20erUKgGecGuyz95qTRiK84TzD3
 N94QtV7pqe4QABq/vUdKyb93M13N3aEsICF5AlpLPzAhS2wqWUOeYt4SBwvrLdXHp
X-Received: by 2002:a05:600c:22c6:: with SMTP id
 6mr43853231wmg.106.1634549120485; 
 Mon, 18 Oct 2021 02:25:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuwL+9FPxYZDLJPzj1y0ewraX7g4qP67loxdVIUZdEmegoLNhN3hRglgh8eMPhX6XaQF1opg==
X-Received: by 2002:a05:600c:22c6:: with SMTP id
 6mr43853218wmg.106.1634549120323; 
 Mon, 18 Oct 2021 02:25:20 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id d8sm12424119wrv.80.2021.10.18.02.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:25:20 -0700 (PDT)
Message-ID: <c6a78e16-9abd-42a2-bf24-66cfaccf0462@redhat.com>
Date: Mon, 18 Oct 2021 11:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] roms/edk2: Avoid cloning unused cmocka submodule
To: qemu-devel@nongnu.org
References: <20211018092354.2637731-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211018092354.2637731-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 11:23, Philippe Mathieu-Daudé wrote:
> cmocka website SSL certificate expired, making CI pipelines
> fail [*]. However EDK2 images built to test QEMU don't need
> cmocka. Avoid cloning it.

Oh I forgot to mention we don't need oniguruma either, so
this series also avoid cloning it.

> Philippe Mathieu-Daudé (2):
>   roms/edk2: Only init brotli submodule to build BaseTools
>   roms/edk2: Only initialize required submodules


