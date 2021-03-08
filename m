Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF5330868
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:49:20 +0100 (CET)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9hf-0004ZG-75
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJ9fl-0003Ze-9Z
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:47:22 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:45609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJ9fi-0007MI-Vd
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:47:20 -0500
Received: by mail-io1-f51.google.com with SMTP id a7so8771234iok.12
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WdcuIai8bIJsoSKqEet8ltqSOFU9UfmgoaFgoRXX3U=;
 b=Qs3uZ5Pu0AOOXMzbz7Lt2jPV9sgyBLupNQSCwaAd40XRPI5QUVpW/oixXRQdVlSy70
 VpdW4zp5izI8VaoRsCGwNgOzNG5kD098V7rDT1DLcDNMH8Br0CVw+lGQ+MNCJjOHEnRm
 75deHJaR3w0sDEq42csXhQ+L1abHpZB9EEQpYFxwLMz5ry80xzQDhnE9jsCtcOT9tzqa
 oJgj/aaK5urxy+a9M6jJldf/I9ODcSs6afwTYFVJcEsWEU8YEbmBU5M386rJn9ml2Q/u
 ym4f+ud99Po1CU4hUpCvsMsZzP5EjXjx+LRxripIc9hQg6ZDwxJYWCEqcmus9jZQVbM3
 grmg==
X-Gm-Message-State: AOAM5311e24vvLNn1V5JGfFBWOJ9EbP2mAEhsuuYpD1onYOoqcVGQqLp
 Dk3wxKb5LM1ISRAbZnhvj5zHZTWhAFQ=
X-Google-Smtp-Source: ABdhPJwbl1ZJ4WnpeCKp7cdBIvxvo+RT6clGJRSPDA1se6ivGrlUL5y5QcedoUcKU1f/+BPlq6UGdQ==
X-Received: by 2002:a02:9663:: with SMTP id c90mr22261230jai.16.1615186037880; 
 Sun, 07 Mar 2021 22:47:17 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id u5sm5757291iob.8.2021.03.07.22.47.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:47:17 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id g27so8836970iox.2
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:47:17 -0800 (PST)
X-Received: by 2002:a02:9382:: with SMTP id z2mr22304501jah.120.1615186037566; 
 Sun, 07 Mar 2021 22:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20210210105527.74943-1-r.bolshakov@yadro.com>
In-Reply-To: <20210210105527.74943-1-r.bolshakov@yadro.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sun, 7 Mar 2021 22:47:06 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDG74cL5kCvHmzk8RR17NGGb-_TA+DpXcqd1owuMvk1xw@mail.gmail.com>
Message-ID: <CA+E+eSDG74cL5kCvHmzk8RR17NGGb-_TA+DpXcqd1owuMvk1xw@mail.gmail.com>
Subject: Re: [PATCH] util/osdep: Avoid mprotect() RWX->NONE on Big Sur 11.2
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.51; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 2:55 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> There's a change in mprotect() behaviour [1] in the latest macOS on M1
> and it's not yet clear if it's going to be fixed by Apple. For now we
> can avoid unsupported mprotect() calls. QEMU and qtests work fine
> without it.
>
> 1. https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
> Apple-Feedback: FB8994773
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>

Reviewed-by: Joelle van Dyne <j@getutm.app>

FYI the "macOS 11.2, *" means it applies to all versions of iOS. I
think it only broke in iOS 14.2 but making it return on other versions
seems to be fine from my tests.

-j

