Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA14CD543
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:36:21 +0100 (CET)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ86U-0002LQ-Ir
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7q5-00046T-9h
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:19:26 -0500
Received: from [2607:f8b0:4864:20::b35] (port=41925
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7q3-0000oZ-O9
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:19:20 -0500
Received: by mail-yb1-xb35.google.com with SMTP id t7so13273177ybi.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zp1ujxxlswdluW+ACVYECOuJevVCiNsm2N0UeNDDYac=;
 b=KKly2a9EYCkg1qQoThiyaX7W/c+HntTmTG2/OH6cMmRSDLrN7jRNXk8STbYA9GHMZf
 ZXS9VSZEjiVFO4lUb+ytFx8Tcqfs9ELZD+0ICe7p7T8DAKw+SxFpbPf123TiX/w5yZhE
 NwHT6dP53S0XR7HJd9P7sG1UFusoeFEpFiwOnh9QXlMux9vYrm5EOG5AJGIWHyo8YmN9
 QtgGDwschhpjncnyOg9e16B6i1cXt+ezQsIcT6C+JACTrioUCWlcGEA3IoqkMK1zaf4m
 /oEeHoTP8YHLkfPNkF/Am5xZrWSbrT494JMj0evEccs2TS035/6mB0EgyHO7S8tMDWVi
 rOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zp1ujxxlswdluW+ACVYECOuJevVCiNsm2N0UeNDDYac=;
 b=34qtZ4ryIwc0uYfIf7To5RPFFrYeK7k+Lbf27DrmyjYCDueCA9rsrJJ3tn0MwbHy7V
 zIHZCQUeCECFAlsL1N172MrBnCWjMN2gtz++wP0Sslc9eVB09NFF9aL/4ZGVveHm581R
 jXbud+2X7vBfh+1oV1ttZAQYJPesznhyMujykYkNS7NHDavGLerV648yBRUF0Iy1tE4S
 yNfp9CLpHHar2A4lAi88Enw7fbU/qWCoPD2kyH4c/2kWrajszpJiRUFFfMwtM563U6/E
 9N8717XjsaYG4D215L87OVsWRR0XW8RMPEa/Rus5CZON+QBG7tdgQIplG7GiH2CMFplm
 43Rw==
X-Gm-Message-State: AOAM533iqdf0dNTKwN2pBf8hGT9Tj2cuFiJii7j/28IA2Ip0lzG9X/tu
 HnrmLJKkdvh6D/C188NEKh3miDyRlVDdNcQkt9ZWGg==
X-Google-Smtp-Source: ABdhPJxmzc7XYdi7/jBQ1Q5BmnPCn5Cas5dB64rXargTRh5im31ALlvu3TTv2htQ+Sl9vlU4Eom0osvv3VIQEdYzXIY=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr15512482ybp.39.1646399958727; Fri, 04
 Mar 2022 05:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20220303204624.468786-1-richard.henderson@linaro.org>
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 13:19:07 +0000
Message-ID: <CAFEAcA_KfiBS4zppGN4K+ZTVGPxKiT-E64XArM=YSKWeSj_fbw@mail.gmail.com>
Subject: Re: [PULL 0/7] target/nios2: Rewrite interrupt handling
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 20:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 36eae3a732a1f2aa81391e871ac0e9bb3233e7d7:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20220302b' into staging (2022-03-02 20:55:48 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-nios-20220303
>
> for you to fetch changes up to b72c9d5951f1dfa047f545408dd9e35597e6b9d3:
>
>   target/nios2: Rewrite interrupt handling (2022-03-03 09:51:59 -1000)
>
> ----------------------------------------------------------------
> Rewrite nios2 interrupt handling
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

