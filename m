Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA10A185FE0
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 21:56:35 +0100 (CET)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDaJG-0000yr-8J
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 16:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa7z-0006ct-EG
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa7y-0006GW-9X
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:44:55 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDa7y-0006BU-0e
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:44:54 -0400
Received: by mail-pg1-x542.google.com with SMTP id x7so8447881pgh.5
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 13:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
 b=f4e+Q/GYztxTGgIohU+ZUpbG193GhozninwhFE/Hc40VgjLMvSeo15v8WMRNnNlC4S
 +b1FCeXlnEDCuJ8rojP+X8t3pfiBjX7xq63zwr7ODcl79f9OTnY7y8k1hFMPxFfe1V3M
 dugq6DzDVAzcmZmTE0ODP7TcQlHFWqZ+KbHB9gaB4pEsU6QIwmT/FqEVFUoiXKXHfmIk
 tsaXYfVinietrGXNfON1bBHM3vs8jsi0cknmH7N3lYzzQLtZyqMOP9krPxsfy3SvCw10
 0xug7l7iRtjZfHgo0dqYpFFt1Kptlu6P2rIk+SiHLzJVQV65qmtX9eKlGNWkGOLTL9zK
 c39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
 b=kQRYZ2LxA5XL2LNHB/9JHezkP3AcnhRTKNrO1fwY9kq+yoknY1SzwVsKtXlAM3koBP
 yUDMVV3eI2xUwui7D1KOOJw5gsnprc4kN71jsLSB9DVw3o30vqXXasrQpgWtFMOLqOMd
 Bmds8gVBqx2iAmV+PvuuzKNgr+WWs2K/EzC+uZHixW+n3Ukv1CU7l+VWT1vuM1UA+Q72
 nnnLusIlv+nE40eDdEeg2Fnq/Dp+tJaovrmDCaGF9ulgEDPENYME/S3hBNutlszZ1t9b
 OiII6c38tcIo1ZFIWyeYHZXzaoo0nvUr8mhZOC1CbynjC+sPKlzXNZ3fIfdrRHCc2buD
 IhQg==
X-Gm-Message-State: ANhLgQ2RziR+NCAWRlZVPze4hUxYRSvc+0uwHNfwkTMFP74zs0FdvEbp
 mSTy46yqvf5Zp81ti/XG9vQ96A==
X-Google-Smtp-Source: ADFU+vvtP3uW9LKERfhJChn5oNpU3hlqP9xmv+mLkTuDEmTJ8JQvz1UJ+xgk3zuIfDnKafJD16j6bA==
X-Received: by 2002:a62:d144:: with SMTP id t4mr11916177pfl.10.1584305092408; 
 Sun, 15 Mar 2020 13:44:52 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y143sm15475592pfb.22.2020.03.15.13.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:44:50 -0700 (PDT)
Subject: Re: [PATCH 11/14] target: Restrict write_elfXX_note() handlers to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ded109e8-ceab-752d-c938-66d5386c57b1@linaro.org>
Date: Sun, 15 Mar 2020 13:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu.h                | 10 +++++-----
>  target/i386/cpu.h               | 18 +++++++++---------
>  target/ppc/cpu.h                |  2 --
>  target/s390x/internal.h         |  3 ++-
>  target/ppc/translate_init.inc.c |  2 --
>  5 files changed, 16 insertions(+), 19 deletions(-)

Hmm.  Or an suggestion to generate guest core files for user-mode upon a fatal
guest signal?


r~

