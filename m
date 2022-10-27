Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D160F251
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:27:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyCX-0003Xm-S4; Thu, 27 Oct 2022 04:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1onyCO-00037E-Kp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:25:14 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1onyCK-0005Gr-6H
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:25:09 -0400
Received: by mail-io1-xd30.google.com with SMTP id p184so784374iof.11
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fNh0TvJ3DAqdIqSyjHNKnV6UOL33eXa20RyZF4Egqww=;
 b=WmN+GopVJ1/r4JNGmHf5iz8IiDCnzysxMMptQqcTAEzHBiwWH+n1q7ceenD5nowUu2
 gLcYJvzWWOqsGZ/5T+7QrS7XMMNQ5mi0JtA83D3J20SDoO9S5w+wYnw1zMpLPmAAk/3s
 ItWqfc3chITIfx/WKqUlBN/nQusKyD7h6SSkMiaLLu2BoRhEtCM33ySYfg/gP9J3JmP9
 CMWfh9dVvsY1+2nXcyqcI443IUcWnhJForaKBb5SMVGL59FeXF2Ngml/isVD4Rl80Hws
 zaUP0dThCHTTTL1ReDYepXFc7Yoo9hPYZ8eW4uXGEA+bGNEbIx/lw2013XrGvvzBxC0Z
 9tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNh0TvJ3DAqdIqSyjHNKnV6UOL33eXa20RyZF4Egqww=;
 b=ERuazBgwnrv0cdVwzdaeqJuXBVuMDq0+m91mXK1eUClfAWKNmeqVOuAyZwJUHpt/3m
 BFLblkhEaLA/IZer8YUyGW/rDowfObQ39I6x2dvFPv3pcRAsyWoSf/SJmdkctHGs+95u
 +Jj5Lja8ZQqvL5mQB5CwlCypQyqN/Drzfkf8rc6E7885xIcHcZUWXGNxq2jRlyf4Xi/P
 Y0Mgwr99Q+R2IGE4fewCHvbtI52h0fkWKtvXhmi95/1zkHLK3IHn6Og4wPze1knSv04E
 9UOxV4/w9q0KaMjO5ZSVXbi0baMVacheaB74W5eonl7QiELwBPAUmoTF6vJAf33xT2Gb
 l2mw==
X-Gm-Message-State: ACrzQf3aDvi9EU0re+RuyRlUHETTM5Y5/zh2kOdtza+vlfSwpvjjqwVF
 adHYcjks1aiq/tj5ib+4KBILGBCNAnMq2169/Lxhhg==
X-Google-Smtp-Source: AMsMyM6N7Y15xviVgxNz2vy6cJdYURd+2aqoFKObOyT7aqpkwHilbPJs2GFoqPfS+IMnlZf7AJjmmvKDoIdq8KeL4mo=
X-Received: by 2002:a05:6638:2646:b0:374:f6f6:2e12 with SMTP id
 n6-20020a056638264600b00374f6f62e12mr10042992jat.182.1666859104109; Thu, 27
 Oct 2022 01:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
In-Reply-To: <20221027054649.69228-1-mchitale@ventanamicro.com>
From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Oct 2022 10:24:53 +0200
Message-ID: <CAF--n8oFpSdtnFgXy0rvHfUk8w1cMori_wZmxRb8RHKnogcSmQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] target/riscv: Apply KVM policy to ISA extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=ajones@ventanamicro.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 7:52 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Currently the single and multi letter ISA extensions exposed to the guest
> vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
> and applies policies set in KVM to the extensions exposed to the guest.
>
> Mayuresh Chitale (3):
>   update-linux-headers: Version 6.1-rc2
>   target/riscv: Extend isa_ext_data for single letter extensions
>   target/riscv: kvm: Support selecting VCPU extensions
>

I already reviewed this internally and it hasn't changed, so

for the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

