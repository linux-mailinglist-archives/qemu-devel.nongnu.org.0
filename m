Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D91EB42D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 06:16:36 +0200 (CEST)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfyLr-00014n-4N
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 00:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfyL4-0000Wm-MA
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 00:15:46 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfyL3-00026Z-S2
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 00:15:46 -0400
Received: by mail-pf1-x441.google.com with SMTP id b201so350397pfb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 21:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PXGJ4gt5oyH1UgM0SNXfgnxueAMm6B3WnIoe3BdHTxk=;
 b=y2gESXYMO/iSq31PLf7FlD0APM8iB3f1Jx2LNbpvW5OoT1NmiTiBnMqjcY7ePtTwPU
 lEu80E9sphH65CGomcMaCZiOqQhmjVsJaNBmzY3M5p65w7rljbjUMsLfxLPuXhur00ce
 1qSPgG42ZpxSMY7k7qBVoFOf8M0qcUZ0xONET+la7mtID4gNfj4CXV4Py04/bBqRZBwy
 7hv0YpB78hppAJn0H0qM0QWhNm6uAJ01gYLot0xpp4IO701XGfNqNvh3wLlg5tsdjpwT
 j4tqNPLVHfMCM8M4TnWgETRFimEbNZzFVWnNBXH0ELeO7PSkWIC9l0ZfLSCXQYqjlncX
 ZkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXGJ4gt5oyH1UgM0SNXfgnxueAMm6B3WnIoe3BdHTxk=;
 b=IZRxP6mjizbCBc7GgvK+CyAjHUrisUq2dJ0mpkdHN7AeOLCT3J6MpRRexxOHw9NbE7
 1WS1mBtJhWAVFK53zZ5aRGgjeNaS7CgRzr9wW3w4J/o8dFQ+vViaLC/K3eMPgG+at0R2
 Kx+qRVlkmroTX6sKSRCB3rIs6dQaw/eZRSg7SrpghVIq+wv+TuWgPmHsNgbMJZUmzPuC
 QICgDqzLR39OkmBpiYHDvNGHCc0EHQ9dOwjoZ0BuzML0GrSCVQU4/ZoAV/J70suzXYgm
 bf5U8jyK0hwmjg8hBtgsTwNLuPPzPeb2qKvV/JkiY3va3KYjXst8GVp9jMNJtp6Z7hTC
 UbHQ==
X-Gm-Message-State: AOAM533Ge2D22znvoVnmrIfehj/TP464JOOvppz6OlR6CJs2TnmmHFb0
 TJNumWE5D9hB1alcYUfme9uPnQ==
X-Google-Smtp-Source: ABdhPJxLDfCnVA3/aAfcMXPKTFGbRAmuXfL/fQBrCvRzdKwgJzvl1sYbzaUp265Dyq7tZTS3wgHEyQ==
X-Received: by 2002:a63:c846:: with SMTP id l6mr21787298pgi.197.1591071344366; 
 Mon, 01 Jun 2020 21:15:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c8sm877062pjn.16.2020.06.01.21.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 21:15:43 -0700 (PDT)
Subject: Re: [RFC v2 16/18] guest memory protection: Add Error ** to
 GuestMemoryProtection::kvm_init
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, frankja@linux.ibm.com, dgilbert@redhat.com,
 pair@us.ibm.com
References: <20200521034304.340040-1-david@gibson.dropbear.id.au>
 <20200521034304.340040-17-david@gibson.dropbear.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bba205c-00a7-d642-800c-a5ed8469836c@linaro.org>
Date: Mon, 1 Jun 2020 21:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521034304.340040-17-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/20 8:43 PM, David Gibson wrote:
> This allows failures to be reported richly and idiomatically.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  accel/kvm/kvm-all.c                    |  4 +++-
>  include/exec/guest-memory-protection.h |  2 +-
>  target/i386/sev.c                      | 31 +++++++++++++-------------
>  3 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


