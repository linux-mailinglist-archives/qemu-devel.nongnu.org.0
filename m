Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B735590098
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:45:24 +0200 (CEST)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMAN9-0004iU-5U
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMAK4-0000rU-RP
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:42:12 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMAK2-0002kE-N8
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:42:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r22so15044630pgm.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=z3hn8pLmklMWB3HO3epYREDckYICdYNbLOBpFglUlS0=;
 b=y1/PFRye5mzuti2ol6eh+RkDYl9YwXHZ1w1Sy+fxhfzju1MLTMnZZToRL/I3jplJa5
 Vh7xTbtrX78Vd2zR3YXbnN0D5WXSEM66aEwcihdMKJl6TZVTwW3U3YAHjpcs5rAhtyhO
 3lwiFRPrfoKZl8BX+W0bV9AQuj9e531KtX8vaDpLc91/E9PAtRhi6IZZY8qE6Y8i2zSt
 UCzKU7T7R6xLV4QWqjSl3/Bhjf5zlcBh18N5SXdvwBihYzyYCs+/2wE+nnU0kDF/K6S4
 XPCGmQ9ojPeP8TpA9pletvj+QqtH2c4w3jeXStB54j9OCV1wFXshga9GiYCHcW7u0RIy
 Z/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=z3hn8pLmklMWB3HO3epYREDckYICdYNbLOBpFglUlS0=;
 b=7BMZYDyQ8qU8ykrjRND5Y+BWHF6LjvQslJ95jYaf9FIoMzuLv0WGNfKgsqZXq6ZHCf
 q4ErVA1qTGU0hzOsBYlaWrcNthPo+d0qX4/zg4OqKZF5T/YRg2iekbEE1VCINwr2jHSs
 p341DWPGSuMmjW9YTKlU4yEUHYXhVUULCu/udeh/oqoyi/sph98j3oYOEXjTx/W7nXns
 cB/uyO8EKwk5Xk99R5NfxvNMrtLRMJ/N+bCMGZy/lODKNTV6GRnN9W3mFkdS/iJEuZNt
 iQ7kWCdFItf8r7kl3s9EEAsK1El96eLXH24M3eH/cgPq01ToDuyb9EuxNSFWb053K97Y
 Umnw==
X-Gm-Message-State: ACgBeo1luBCbTZZDLLP+Hg5yNwgSD7LsyRh4PNKkq20LKEdbMpMnruMY
 ax3HDwo/rMJxZl3FjI+iYdcMug==
X-Google-Smtp-Source: AA6agR612p0kIVLReJTZFGOGEyHsRwmAX0kyWTENRRsiz2bIngWhbkuBwWDzLlG1a4wcj526dQkPiw==
X-Received: by 2002:a63:1e5f:0:b0:419:d6bf:b9d7 with SMTP id
 p31-20020a631e5f000000b00419d6bfb9d7mr27663382pgm.593.1660232529174; 
 Thu, 11 Aug 2022 08:42:09 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 ij29-20020a170902ab5d00b0015e8d4eb219sm14995572plb.99.2022.08.11.08.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 08:42:08 -0700 (PDT)
Message-ID: <0070ac70-9c86-b360-e877-3d7e01d176ea@linaro.org>
Date: Thu, 11 Aug 2022 08:42:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_EXEC
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-2-iii@linux.ibm.com>
 <6e3e5974-15eb-05e8-a005-942884732fef@linaro.org>
 <23d43d7cda9293eca9afbba91c50f613d004a407.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <23d43d7cda9293eca9afbba91c50f613d004a407.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/11/22 02:28, Ilya Leoshkevich wrote:
> How is qemu-user's get_page_addr_code() involved here?
> 
> I tried to experiment with it, and while I agree that it looks buggy,
> it's called only from translation code paths. If we already have a
> translation block, these code paths are not used.

It's called from tb_lookup too, when we're trying to find an existing TB.


r~

