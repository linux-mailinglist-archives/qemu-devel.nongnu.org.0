Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29C232209
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 17:57:20 +0200 (CEST)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0oSG-0004Ti-0g
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 11:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1k0oRC-0003ZY-O2; Wed, 29 Jul 2020 11:56:14 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1k0oRB-0000EW-8N; Wed, 29 Jul 2020 11:56:14 -0400
Received: by mail-pf1-x444.google.com with SMTP id b186so2859418pfb.9;
 Wed, 29 Jul 2020 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3pY1fcqXml+zGmGu6FSlfZAfCy8bJNq/iyWk9Dm9U6c=;
 b=FkllsY7aD5NCo4M4VY8yhu7lzBgpBcnRTM5HnamN3Si2qKmP3uUXwAGGlFhXGHRnGr
 XcZkaygmb0DlBnvSSPa98GqP7Bd3JwyQwO4sPBg9V6E7navyLBKD1LhqD+bjMPD3SFbm
 Xez4ln8EuKQFpRFDXk3+tZ4IUNQD1D+Hl3ANyBHorwtqlYmOf+Vp/UBjHBbzDf9jGlI/
 fi4cNyIxOL/ZXlncKwzlobElbp5S2v39h10g3pWMWKcA02ayqxgHqi4C1d/er1X+oJpf
 g0keCUoHJZvGsdIk+5buCca8qVKgA5KWUAqyemhUZkmJsNaGxxcCwrEGdh0zjsTe2PCE
 Y9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3pY1fcqXml+zGmGu6FSlfZAfCy8bJNq/iyWk9Dm9U6c=;
 b=SUxwECfew8CYQGcpPhSznzqbwZ99eYimc978FWRqiikszp7YGdyews/j6J4i3Lclj5
 4VLlviDFeJQi4UQSJZ7Tqh7LfXENnG61K8C53MTBta0/zhVgkuRBfSXPvm2ochzcvUE9
 km/fICZvwnZU8BVIeTzt6xwC2XdIaj3+eFcCXCk5DZLZyCSl79s2zDKwuVw3PVJy67wa
 yIE9Izadnk9p6MsKIKTYzxa05gaq4MwUS+3HY/ukrPmtJ7XoOwhY6borFxMY8wOSLn6n
 1NwWt7YyrNFSSSEc/M4U10LU3QE3DzOY9N007+afagKBVM1y/8EGb2g9R0cQlWvAOEjb
 FQJQ==
X-Gm-Message-State: AOAM530evScN0V0ZjTbxTZBVM0dRG5M/Xg/CIyLQdn/xT6HgiiDA5mH8
 JWyLpDjACNzaH77dqo+ohss=
X-Google-Smtp-Source: ABdhPJwZcjXI/67u4nOvDDL/azF3DcZQ+USARUiI9pQe2gDG94IR7loAIkbDdd+M8pGjsjwnKmd9dw==
X-Received: by 2002:aa7:83c9:: with SMTP id j9mr18690220pfn.151.1596038171712; 
 Wed, 29 Jul 2020 08:56:11 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id y8sm2740830pjj.17.2020.07.29.08.56.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 08:56:11 -0700 (PDT)
Date: Thu, 30 Jul 2020 00:56:09 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 09/16] hw/block/nvme: refactor request bounds checking
Message-ID: <20200729155609.GH14876@localhost.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-10-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200720113748.322965-10-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-07-20 13:37:41, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hoist bounds checking into its own function and check for wrap-around.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

