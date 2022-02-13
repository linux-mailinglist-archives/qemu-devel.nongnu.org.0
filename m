Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B04B3B06
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 12:14:23 +0100 (CET)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJCph-00047k-Kk
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 06:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nJCn0-0002cW-EX
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 06:11:35 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:31567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nJCmx-0000Ry-HA
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 06:11:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 00F68745958;
 Sun, 13 Feb 2022 12:11:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DBF55745708; Sun, 13 Feb 2022 12:11:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DAA597456E3;
 Sun, 13 Feb 2022 12:11:27 +0100 (CET)
Date: Sun, 13 Feb 2022 12:11:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fix the leak of qemu_console_get_label
In-Reply-To: <20220213021329.2066-1-akihiko.odaki@gmail.com>
Message-ID: <42c9885-3012-3b4b-a97e-c78aaa3d6d8b@eik.bme.hu>
References: <20220213021329.2066-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Feb 2022, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> ui/cocoa.m | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce01..fdf52a7c2f7 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1680,7 +1680,10 @@ static void create_initial_menus(void)
> /* Returns a name for a given console */
> static NSString * getConsoleName(QemuConsole * console)
> {
> -    return [NSString stringWithFormat: @"%s", qemu_console_get_label(console)];
> +    char *label = qemu_console_get_label(console);

I guess you could do g_autofree char *label to save a g_free but not a big 
deal and only saves one line here so it's also good as it is.

Regards,
BALATON Zoltan

> +    NSString *nslabel = [NSString stringWithUTF8String:label];
> +    g_free(label);
> +    return nslabel;
> }
>
> /* Add an entry to the View menu for each console */
>

