Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE703C2A96
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 23:03:32 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xel-0002Lz-N0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 17:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1xdR-0001Kz-U3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 17:02:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1xdQ-0006QY-Ay
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 17:02:09 -0400
Received: by mail-pj1-x102f.google.com with SMTP id g24so6410179pji.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fGSCR3y1c/9lMMWsgSPLN0tsfKVHWL81HrjGIX/FwJA=;
 b=AM6uKgd14HL2VOyVFNl0mf6dg5v7bunPnQqwM0dC6hr/2LNV1GvYN+RJzSzWqlqPvk
 IXnmOQfcMTl31EeEt4jQc3nNtGANfgsDJIVW8SxjBljTA9vHBYjG12FGCV98+2Wlyss+
 bIFR91NMuVGm0CLrScJxGMOsvOlP9VifZyGcea+p1P6gN4YMb4YhJg/oR09OOyCJBqGJ
 SId+TCm62zLVdzX2cLsMc/Ii/OJNIOfdELhxCDpYLBrfXuozh7in9ca9YZ1fT9GuFrAV
 xuPDymHRhXbfeztC2q6UIj8DbE63cp4IYBjNBFYgI6lX0UZwwa/TF8GRzaHmEh77YVit
 4Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fGSCR3y1c/9lMMWsgSPLN0tsfKVHWL81HrjGIX/FwJA=;
 b=pdDfS+hDRxEPIU6AuNP1V/YfaGdj4nKEOy8qboE4SClITJxpfThBO7I+Jd3CYpYuEG
 YMECMJDgZnUcec8OdDtiV28co9uFVCTrePL+hDWJCMiGpZ/UX0nvAZXYUsK1KgWnAtiJ
 SJUiZaFl9nHU6KA4+8pML/amoUMO7Yu7imBlWHkf6whY6NtEqmwphbk09neDQDplKw3G
 2eJe4kjWyf2P87m4gNJ4JJS6NR0HbZ6h/vh4ppwpF5Xf8npYO7BVj4hKtWQ0izMuCpYb
 kUXgjYJ9GNPoMjc4TOzc0pjj8CNZIqvgJm4R17q3nnlUBZmWc7vP3FwM1m3vQag1BjaQ
 DMLw==
X-Gm-Message-State: AOAM532LErnLkqZuHmpUSa3eUh8Jfx/aNeAqjByTdqVYaLiyw5jsaY2F
 d1FC+MY9885HH45VfiqMDgE=
X-Google-Smtp-Source: ABdhPJwd84ABHuUnle+iAIsBCmCiPbVtkbOGShyJn3r7TvLD499EObsCDNmH9xfiyNGzcOPEZOS8EQ==
X-Received: by 2002:a17:90a:9b02:: with SMTP id
 f2mr40362821pjp.123.1625864526738; 
 Fri, 09 Jul 2021 14:02:06 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 g1sm6934581pfj.125.2021.07.09.14.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:02:06 -0700 (PDT)
Date: Sat, 10 Jul 2021 06:02:03 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/4] target/openrisc: Use tcg_constant_*
Message-ID: <YOi5S9lKa/4uwgIP@antec>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
 <20210708213754.830485-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708213754.830485-2-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 02:37:51PM -0700, Richard Henderson wrote:
> Replace uses of tcg_const_* with the allocate and free close together.

I read this as tcg_const_* is being replaced with allocate and free.  Perhaps we
can say:

Replace uses of tcg_const_* allocate and free close together with
tcg_constant_*.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>


