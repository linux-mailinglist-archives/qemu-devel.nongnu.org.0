Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26E430F51B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:37:39 +0100 (CET)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7flK-0002Ou-Oa
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l7fhW-0006wp-0a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:42 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l7fhU-0006Ef-Hs
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:41 -0500
Received: by mail-lf1-x12b.google.com with SMTP id m22so4831067lfg.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5BAAewmuo2VkjJKzyHWom/XS6gaKBnL3UOqHsgJZ188=;
 b=Cg7DeW6Wr6x1AbInDzNFA5MqWLOb5sbrULAjoR57OUg5u8iDj7YC+BEY4zMPkc7abq
 51w4jGq4yU3qG4Xc0ekzMfT70UpN3WVUDuVwkQJDcGzZLRazKOve4uW4muPVeFNHpn7v
 6cMGpaRsBbZrMcpgUIFfuBiFEGxF0ioHVupx7kYrQsWX9r3n0rGQ3zwOsqT5MesskK2J
 omVtNuNoiSfm4SiWcfB646ITjXFswXVxzM366B+q9KYVU2NcdN7I8ULS+daUrrQPgps4
 oiOFCHufK9Qhj7fI0HYuLUo6b+J/K6PR83iBZ/hXGHANMG4awjgF8u2FOaVhlEGzEWvw
 8fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5BAAewmuo2VkjJKzyHWom/XS6gaKBnL3UOqHsgJZ188=;
 b=tMRSM3/3W29Ws7gyGbw1k5i8r5JByUY/Afst6e2kR6fbY5h7MnDWkv6oMQQwInjf5J
 DRN2pmkWILcSJvZGyWFeVtF5kg7TGLckdSfx8T1Qn2zOVyZ0JDHb7F5taoG30S6kU0uJ
 L+MoPS5emUpCk5HWwqvC5hWcbFJE2Tx3UTiUNhCbDIEdVEBO/+CNDXqGA8jdxvEXm60l
 QE/KErOa/jsSbFs30cwBq/iPvm3IUYSY0FPU3zsgOveqKewBnNtSz1oQcbrV3XXQAo91
 pOhvoadhbCYbHcyDmk7HhCUlWDDheV5cmuByJMEIFRIWkXjAkEUKoQUI1oruApoyahFO
 oBFw==
X-Gm-Message-State: AOAM53195uejmsBZvt8mW0sMC6o66cQp/2QAifOSgXC9szkb0WyG+Ixl
 Z1y1607oAbFOq+bR19AifUk=
X-Google-Smtp-Source: ABdhPJwdgjW521bmPvH3WphqL0tR8H/U/0JGsbscp19XEnKJOfX7L/VaLss9CcwjfIYnqtoTb2yCvQ==
X-Received: by 2002:a19:c14c:: with SMTP id r73mr4565117lff.201.1612449218694; 
 Thu, 04 Feb 2021 06:33:38 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id m2sm627577lfo.176.2021.02.04.06.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 06:33:38 -0800 (PST)
Date: Thu, 4 Feb 2021 15:33:37 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/2] target/cris: Let cris_mmu_translate() use
 MMUAccessType access_type
Message-ID: <20210204143337.GG477672@toto>
References: <20210128003223.3561108-1-f4bug@amsat.org>
 <20210128003223.3561108-3-f4bug@amsat.org>
 <08f1efab-91c8-a7e7-98ee-6d73d5ccfad8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08f1efab-91c8-a7e7-98ee-6d73d5ccfad8@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 04:46:28PM -1000, Richard Henderson wrote:
> On 1/27/21 2:32 PM, Philippe Mathieu-Daudé wrote:
> > All callers of cris_mmu_translate() provide a MMUAccessType
> > type. Let the prototype use it as argument, as it is stricter
> > than an integer. We can remove the documentation as enum
> > names are self explicit.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >  target/cris/mmu.h |  2 +-
> >  target/cris/mmu.c | 24 ++++++++++++------------
> >  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

