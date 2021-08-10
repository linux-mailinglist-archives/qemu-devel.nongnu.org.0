Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEA23E814C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:00:24 +0200 (CEST)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDW35-00008W-PN
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW1L-0007Ac-Kg
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:58:35 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW1K-0000FE-0o
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:58:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so5474205pjs.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9CNdTscmk466xOpUAfE5D19GL/OQ662LbbKlXUEW8dA=;
 b=oRzH581wWYswe9TLs77Z9Zy8RL69l9jWatxIdjyGTxs1olrQyjJ8sCHN5gk2enytAU
 z7VBbxIDyzYJaP3AuQ0mv7e/6kKhZ365lkxbBVEhbaqTu6u/qx0UASXCNpl5qrNianuF
 nEYiMrV+E00CUexj5TDTWddZzpSjyd1IsUtptN6hwm7wvJF6AEaCOywPOvQn5SQUrT+O
 yiWliaQzbysddzIrryg+Rlw7ThJC7cHGmp9HfMEK4qKI6hP5EkdT0L9vfRT8q86OitvH
 KQEfgQdhx7N5/Zwb8Ch7iF7w5IV1KC7zsRnRZ0ok88UgIIpjUObdsuR3qQOXgVs9T4r1
 Imng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9CNdTscmk466xOpUAfE5D19GL/OQ662LbbKlXUEW8dA=;
 b=MVWNrTIc/vGibBqTKpLwjrJKr4xdcnZ1SsMILyBRcL/cak7kqIK47v3fSyWbwzBmfx
 XqepisHrxmRrT7h1yRCMp8H6G5sN0KFcJU1SPMtk3fpg8ByY9EoX8jyAzydqKX+XSTX/
 DIk6uG6mqldDqOUB8r8MzkzJ+/OvhbPJvraUyMAg2x+/USVSRpGQFumwChRvdFJCbjhg
 2/vMjQ51ZKEuAUpsC0GYiOMrR+UbaV5elmbXaqjjxWYCZIYnQY+AoxtGbvLG26p+o5hO
 IMtaWsMuFKBQ53Dlu9ReLJFqgEavO64Po00nf9fz7LjdvQw7alAV/CwCoro/OIecJyT8
 aGfA==
X-Gm-Message-State: AOAM531jDI0kADKSNe2un5MCyb06qSr5Bz8r/HPzgkofdo2ZoeUZv+Fd
 KVi3oonZy6CnXytMjOftD6ISGg==
X-Google-Smtp-Source: ABdhPJwGMpx6s0L42WCvQrqMWoTqVnhNsHEN7HR7WvlAj4zQfBYZ2ze3DBK7yukGquof0AFIwlu2yg==
X-Received: by 2002:a65:5b86:: with SMTP id i6mr56905pgr.180.1628618312233;
 Tue, 10 Aug 2021 10:58:32 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id q12sm2946203pjd.18.2021.08.10.10.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:58:22 -0700 (PDT)
Subject: Re: [PATCH for 6.2 45/49] bsd-user: Make guest_base an unsigned long
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-46-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b866c4a7-9726-497a-dcc3-672a4e3039e1@linaro.org>
Date: Tue, 10 Aug 2021 07:58:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-46-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Make the guest_base a plan, uneigned long rather than a uintptr_t. It
> isn't really a pointer.

NACK: 5ca870b9f6c.  It most certainly is a host pointer.


r~

