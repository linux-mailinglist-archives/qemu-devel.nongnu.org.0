Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94B40DA06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:36:34 +0200 (CEST)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqcz-0007d1-5A
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:36:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqa6-0005B1-KL
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:33:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqa4-00022B-NO
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:33:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t8so2233014wri.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+w6bQRhYv1iXdxNOi3ANdb6Gu9cEs1/yX9+bjyd0Pew=;
 b=wTmmvb+1oWGx6K+VPaeLoEqPWZK3CJ2IS7QNMjYcP1gkWRVD6JGmouMUvaQ13+5zVm
 NR3I118mV80rboTbldh6y7BHvwXMBajG/ZdzIFRFxpXDYBmQ48867i9CcojZMGpT9SsV
 suTE3l3Rern9QyT2oUvPoPWHp75bN/hGyc7CnRM/+0zQMzx7uNLxmS4pCNcIsI4Miwx1
 cudSjLkU+8pwrNJpyN5PYDIhAufvKqjuIJwkak4gOYyzvOc82ETsxYy31IZLoBkKtT4H
 7ig/A9uGxCCIHQDRQKKEZwI3MYYuCM/0mdzC5zqbBCRAOFDZiK5mcRxbFNPSr5kupmHx
 A06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+w6bQRhYv1iXdxNOi3ANdb6Gu9cEs1/yX9+bjyd0Pew=;
 b=gf7O2YQpj2fVbVf9ghHG4cd0Tot9lKG8mxWWUTMxwq98om94gAx/hdRJkOJXBENz94
 J3QsHa9g5quc0sjtAdeVZPpeuHIJhTWGeU23iCJUmQJtY8jZwT98+9mRYuACqylATl0q
 ZTa8LNDgez8aeHs8uf1dbvySRNRP9nOz2BylMITEQb+KmgtoS9pbPNtSBYjItNHRbKht
 5cXfb/qptD+OjhurMDttqQT4MDx4eDZeUqLiQhYbHHiscmu9HoMEOpfsytl2IPMRD+r6
 t05esywjxD3rxw9lflB8tNCeFupMUfuT/cl+Ccm20GEOOxbl7ioO1PbQxHriEFyOYHJB
 a6fQ==
X-Gm-Message-State: AOAM530clmtwOIXKDs3Z39qVOmmC8t9Kb57qkNyQmhUJPGG592LijLDP
 qda+3l9RKaa8dz9KIG2ao2cBXmWAU9oZjSHHQ63quQ==
X-Google-Smtp-Source: ABdhPJwUywsAD2URYAXXOzmMMfjSCGByR+UU4bJ9LXdOmTp8fk29S19rXSNzKdmA9PTTviNE2oeEbMdThoNSPewZV3E=
X-Received: by 2002:adf:f185:: with SMTP id h5mr5896735wro.302.1631795611054; 
 Thu, 16 Sep 2021 05:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-10-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-10-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:32:39 +0100
Message-ID: <CAFEAcA_=_0xfN8Tk8RqE7JacrSCLPZeqLJJgVapn6GuPeV6E4A@mail.gmail.com>
Subject: Re: [PATCH v11 09/10] hvf: arm: Add rudimentary PMC support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We can expose cycle counters on the PMU easily. To be as compatible as
> possible, let's do so, but make sure we don't expose any other architectural
> counters that we can not model yet.
>
> This allows OSs to work that require PMU support.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 179 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

