Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C03E2FA0A4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:02:48 +0100 (CET)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UBD-0003cV-8G
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U8Q-0002Qu-9N; Mon, 18 Jan 2021 07:59:54 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U8L-0005mL-Ki; Mon, 18 Jan 2021 07:59:54 -0500
Received: by mail-pl1-x633.google.com with SMTP id u11so4324730plg.13;
 Mon, 18 Jan 2021 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JV3tc2Q+O2/0vh7h5vHcGV/+wJ7PQguK7fhPrIKNG60=;
 b=YnI0lIk7/a+B5OogvQ5HcEufSiCTNWpapvjQgB7FOs/n2mL7kEKilPAnEQigmfEUdY
 Hs1DAt3EcXdm7aaTpVG+c+EDG1x8dhv6hoQfZHmIjITNsTYS8RSrzmCkZoL7dVk9OkrG
 9O7lnmp/xv4CVsu8oMOrYuo374FxMeRH+yrvOi4Bwm9e4Sos7G+834ZD4gZmvznHZyCs
 i/E35MEHMHLyt4Sfd0C0jZ4TzSZnu2igR9YnB9EcQJrHljBG4YIp97JYGZglG2vVsQDz
 Cj6IZt6XOqhtllh9ZHSbwsLFwxBNT0cXb29wZp+/RjettBB7eC3/SuGNwmz3QLLs3OWF
 g4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JV3tc2Q+O2/0vh7h5vHcGV/+wJ7PQguK7fhPrIKNG60=;
 b=uc8XQOf1cZH4nrZKLVGOgOh7fgVCKt1PU1qz8XJUtH6zJbE64fsCWRTux0G41/K0wS
 /YVQrwCeUbczZKgKlZRB+/4iCLNZjSK6kdnBWOhiMaLZ46/aloR9peqyHfcUwKOt6T8J
 GGOTTGdjhXaBrQBHBh7wmndoFWKao7Mrq+Y6ekoGp+aVIbUNiIcDyqC72SwQpPMJ2ORc
 ZQXHGDyTZD3+h0q5dZsoh6uI16MhbGJZFxpp//NEswhW071Fs46ivHVDQDavt1bYdTTg
 sd+hJOGjf/LqCVkQtSK5iz/lNbqLLcMkZ6+QY3sAtZcSuDrrLr/VrlyLMlFIF2TE8VrX
 LNjw==
X-Gm-Message-State: AOAM530rH8eogatTuNLXgUrmqBO7aEGnCeGu+9fEol91dXGb9qFdgLYD
 OboIKOH15znp27nm9i8SymI=
X-Google-Smtp-Source: ABdhPJymcEPoUQIJOzRtf3AdXvziyJnPEWm3VAr6mZwnSNRGyUv1q5CLYY8Rh9aDlynIlZE7PgThgA==
X-Received: by 2002:a17:90a:6fe4:: with SMTP id
 e91mr25266311pjk.39.1610974787981; 
 Mon, 18 Jan 2021 04:59:47 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u1sm16531263pjr.51.2021.01.18.04.59.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:59:47 -0800 (PST)
Date: Mon, 18 Jan 2021 21:59:45 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split
 writes
Message-ID: <20210118125945.GI18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-3-its@irrelevant.dk>
 <20210118124100.GB18718@localhost.localdomain>
 <YAWE4cDhwQOoc8NT@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAWE4cDhwQOoc8NT@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The spec requires aligned 32 bit accesses (or the size of the register),
> so maybe it's about time we actually ignore instead of falling through.

Agreed.

