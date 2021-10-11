Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2942993D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:59:05 +0200 (CEST)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3K4-0000V8-0f
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma3HG-0007mL-Ol
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:56:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma3HC-0006gJ-6y
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:56:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id n11so11770266plf.4
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zk1aS3HQo3BXT2SWxewxVET+zlIkF/q1vdu+lhkZ0xw=;
 b=zByni2hFI0sRcauxwlp/YQku4xuZWqonbQlHBx7LvdmnvJX2Dk4CYBlJBCWyKlvN43
 X8f5rdDrjqD7gEuOfcFOyIGv2Fe4cXpITIZ3bOy9yHEFFMb9Q5cIxU91k2eeFIUyz0aN
 I+iKieXgm2k5U+IoKhnWaMT3BU9nX0P6cjPuAB6SBmVNWv4VBgFXKnl6qsmk9u00tU6a
 1nPxMIJIv8bMtMJAGMy3huJW0bZLR4LdJhzumpy7p854zyRaqGpvUDW7psX9tB+LKMIS
 3WXGFM+9YZcM2QTeimLBH4KzsTY1Svrg7/7XwpGlF8eSqZ0XF9mZ0LEkTb8H+NhOEBQj
 Lbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zk1aS3HQo3BXT2SWxewxVET+zlIkF/q1vdu+lhkZ0xw=;
 b=AejTjqn/ZWihONkPumoHDI+NBJxI/osmfLtplXTzkjqOIjvqSpBFPzvMKyf0CTMUOX
 ViZoVJqryM4bXRLzvZe8IF4c0XIzs63g6Nr7hIVaA6ID5lsWbEnqzY3wR8qTfnJX4XEu
 FvXhXVVRf3rLJfihmx8qz6N1/SssREHqvZNs8VQqXFs5kRlmeAJdjCNBz91W5+n8+2w1
 OxgWcP3KvxmBwnUWdzZJjj3rWcuhXyxYc+GOj7QN1Mi3BiLfdD3ihoymwHeN5HWhW+T6
 EcKEgfhropyfW2NVbOPbLyG1tmm1frngkREPuRF1sKQukQAwOl07/3zwf8k0Ze6oz8wR
 FpFg==
X-Gm-Message-State: AOAM533Y2UhHACpNuTXxrWAwyx+EDBWpIqlVaagVqlJOtHD/Cy8qtCdB
 +OpWR2zFzRG2RSiSKl5OY+HvnQ==
X-Google-Smtp-Source: ABdhPJyrJQcw6xCEMVzBBpNbJ41EzH9XsXMQ+QRrj1kXV9jIM6HLTijuySL00rAdZG4H5UCdb72FEQ==
X-Received: by 2002:a17:90b:4f8a:: with SMTP id
 qe10mr1663097pjb.27.1633989364326; 
 Mon, 11 Oct 2021 14:56:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u24sm8580012pfm.27.2021.10.11.14.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:56:03 -0700 (PDT)
Subject: Re: [PATCH] memory: Log access direction for invalid accesses
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211011173616.F1DE0756022@zero.eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56dbd6fb-1882-f3fc-7fbf-6a6f55f300ab@linaro.org>
Date: Mon, 11 Oct 2021 14:56:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011173616.F1DE0756022@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 10:32 AM, BALATON Zoltan wrote:
> In memory_region_access_valid() invalid accesses are logged to help
> debugging but the log message does not say if it was a read or write.
> Log that too to better identify the access causing the problem.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   softmmu/memory.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Thanks, queued for tcg-next.

r~

