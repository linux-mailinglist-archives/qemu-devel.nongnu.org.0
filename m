Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51440D9B8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:19:32 +0200 (CEST)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqMV-0007oU-H1
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqKX-00065Y-T9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:17:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqKW-0005u4-9O
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:17:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id 140so4694569wma.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oSpHLR6R74Rtm2/C22hOJeM8MXyeV/bagNFJ8H86SME=;
 b=aBqVlh84zSbm9YMNbW55U9/g86cZWrw1jLX0REsfBJVIzAPVkSPzpvZdFVupbd14+2
 kSIS8nUY9NsPyfPfZMQogzitR6oUgx/udNiKone7wfqslRenjmylRcn4qDkhlh8Yc85b
 VpglQzQZX+ncgtKGTbWPBnCWL+0qggDe8WKQ0INJP2zzLLcf8t+bqg83lXtfy3kBtiU9
 4zbOzUoC1Kjx9XNgL+ixWW22tAgyBZdiBGNdgKkJrKz8ESv85tsyTUcRVBCNlxInSN9i
 jVKBDij4yz+oaCzgegr+BZ33zehVor96sJ4F62gAlkm1Qzj9Hr1azfThEl4mrxBKQorp
 N0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSpHLR6R74Rtm2/C22hOJeM8MXyeV/bagNFJ8H86SME=;
 b=bwvsiCEqRpsFaOBjlyRRoCSe+ebd+DD+/Hp35BTUHW5sHcn7Peyj428V6Lkt78+fnx
 ALsSvmEbGV8EBqoS4qTKCnXQjF4Tk62HxMcUiHQIwmMpFJ/x9PC0X/8dYV1l0F8Pct4e
 oYnHhEjv6gAZGh/pt8uAWYnTN4xSIiIJ6dN1jGcV4sNgSvpmqHyjggdxitXlzVM+0mwU
 G/DDYs+Z/JDoTx/4U/Mdb0pjzWU7jVZ1gCXbU9n6+qbuPBmA5hzjhxr4kPKGFnE8dRGA
 VHZZ+ItKRgsNwTzrfEU4r4bALnrmQYJyi9kM2bk6EE13oK3vbAvJFrlHtZLr+boGMVyy
 4vTw==
X-Gm-Message-State: AOAM532VPdF2erBA+HqGHJcE1KAIGgtdDt++xtaVgSujJ+RBNRxe8Tsu
 MBPt1pl3sgP2CCLTZLrqiRa3QHCZ+I2byAsljhqNnA==
X-Google-Smtp-Source: ABdhPJwooF8aF3jU21zITOdxz2qm+c2beB/kJn0sonK68UKqEWay56OZ+P49bEZwc/CWXFU8p8OUMICgAfsz/tQxWXc=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9619485wmo.21.1631794646489; 
 Thu, 16 Sep 2021 05:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-5-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-5-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:16:35 +0100
Message-ID: <CAFEAcA9omLRSXw23Q0KPEihe+kXs7vDheqnZLSCGegAOrifWsA@mail.gmail.com>
Subject: Re: [PATCH v11 04/10] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
>
> This patch adds all necessary architecture specific code to get basic VMs
> working, including save/restore.
>
> Known limitations:
>
>   - WFI handling is missing (follows in later patch)
>   - No watchpoint/breakpoint support
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

