Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BFF58CBAF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 17:57:09 +0200 (CEST)
Received: from localhost ([::1]:38908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL57s-00055h-Pk
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 11:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oL54e-0000Ay-NB
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:53:50 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oL54d-000885-Ab
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:53:48 -0400
Received: by mail-qt1-x82c.google.com with SMTP id l5so360222qtv.4
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=uSS3KXeiCRVGEzSaNGn8rNkcfG1IJhxhuOcP6L17mjI=;
 b=GL3OlW2HpMD9mJ36i3Bw44ei6oW0a9FKHhb+IZI+MDLx4R/X5y9kiWL0r1nZiAMBG/
 3zG9GPaRbCyDuuNquLM6I2znMaaMzJNXcVlQxdUG00iKwzbVyrr1gO4DGLxNPvMq+fK6
 gpVOe1aNKVw2tF09/WxLCYhoc8mhKTzHOtIXEx20hE0lTH9ynCJrQT0zfLrPWHEPY2zX
 MolZ0QCfIquKi0LhXWcFrytyKHdD7sxmcPo1iNir168LFZWY46uTrhnKy+ACajchRhbz
 X/kmhDvU6WMwlOMOAYMUM90FpIxcnKFaH/jTBNNQWQMaSbbj8giLmVvSTK9r4jlCF9FW
 3J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uSS3KXeiCRVGEzSaNGn8rNkcfG1IJhxhuOcP6L17mjI=;
 b=DAJ22Aep+wupRzTOcEoi5IDD02tYjMbAxtiBP5k1axcWdi+4XXe2U4nuhXxkdLZ0dz
 S1hvZDmT+JzAWZmLjdWJPXrf8mQrDXdTTDEHQUdqZZZTTiwN8elHrF3bv2Lcb1OTF5a/
 mX5qJ6PWd+0lbwd9sGeSivi3PtJTUqSh3AxCujSyxLesELAabqNlLdojJBmhaNdjmQOU
 PAdma5TwEmtLWUMXyLuA1daqgW3abIGYErnkYEDIUH40JYvvr+SOJLHhh4yzGH8RsMg/
 Pt7nBiS+4TPqjVWvoN0n5a7FZ/47xDIechL36FNCu+alQ93XCMTPZt8+/yIRDt/4rVzh
 JrJw==
X-Gm-Message-State: ACgBeo2M7dKQmws/DAhbrC3cxZyUYvA7OZpB6nd3/BsIGJAt3quJeja/
 DGcdq0U1JqrgCQA51h2odcgkJiey6PzN6XDvaM5X7vhc
X-Google-Smtp-Source: AA6agR5KIMvhLGIHiEwn+6cMJBLasmV8BaKtTpT33RcOp4X5Jnrfs/eWl4tGn7aokhaS4s4WRgE4A6oBb3YxFPAgGw4=
X-Received: by 2002:a05:622a:152:b0:31f:1ff1:b394 with SMTP id
 v18-20020a05622a015200b0031f1ff1b394mr16702743qtw.543.1659974026154; Mon, 08
 Aug 2022 08:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
In-Reply-To: <20220805145617.952881-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Aug 2022 23:53:35 +0800
Message-ID: <CAEUhbmVA5RGmyZgW0HXyPAWaA2sqXFz4pkV-i3HSMD4wtUEzDQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 5, 2022 at 10:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  util/main-loop.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Ping?

