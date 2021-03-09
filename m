Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC52332631
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:12:57 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcAS-0005xJ-92
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJc8O-0004ab-FE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:10:48 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJc8L-0003yv-Hh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:10:47 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F463746344;
 Tue,  9 Mar 2021 14:10:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7C4C3746334; Tue,  9 Mar 2021 14:10:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7AE8C74632F;
 Tue,  9 Mar 2021 14:10:39 +0100 (CET)
Date: Tue, 9 Mar 2021 14:10:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/2] ui/cocoa: Do not rely on the first argument
In-Reply-To: <20210309122226.23117-2-akihiko.odaki@gmail.com>
Message-ID: <30b88283-8d6b-502b-9032-33c81e26d97@eik.bme.hu>
References: <20210309122226.23117-1-akihiko.odaki@gmail.com>
 <20210309122226.23117-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021, Akihiko Odaki wrote:
> The first argument of the executable was used to get its path, but it is
> not reliable because the executer can specify any arbitrary string. Use the
> interfaces provided by QEMU and the platform to get those paths.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> ui/cocoa.m | 29 +++++++++++++++--------------
> 1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index d8eacea6d22..6e94301c0d6 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1414,20 +1414,21 @@ - (void)make_about_window
>     [superView addSubview: picture_view];
>
>     /* Make the name label */
> -    x = 0;
> -    y = y - 25;
> -    int name_width = about_width, name_height = 20;
> -    NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
> -    NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
> -    [name_label setEditable: NO];
> -    [name_label setBezeled: NO];
> -    [name_label setDrawsBackground: NO];
> -    [name_label setAlignment: NSTextAlignmentCenter];
> -    NSString *qemu_name = [[NSString alloc] initWithCString: gArgv[0]
> -                                            encoding: NSASCIIStringEncoding];
> -    qemu_name = [qemu_name lastPathComponent];
> -    [name_label setStringValue: qemu_name];
> -    [superView addSubview: name_label];
> +    NSBundle *bundle = [NSBundle mainBundle];
> +    if (bundle) {

Does this break about window if the executable is not in a bundle (like 
when run from the command line after compiling)? Shouldn't you only put 
the qemu_name in this if and have some default name if bundle is not 
available (or fall back to argv[0] in that case?

Regards,
BALATON Zoltan

> +        x = 0;
> +        y = y - 25;
> +        int name_width = about_width, name_height = 20;
> +        NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
> +        NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
> +        [name_label setEditable: NO];
> +        [name_label setBezeled: NO];
> +        [name_label setDrawsBackground: NO];
> +        [name_label setAlignment: NSTextAlignmentCenter];
> +        NSString *qemu_name = [[bundle executablePath] lastPathComponent];
> +        [name_label setStringValue: qemu_name];
> +        [superView addSubview: name_label];
> +    }
>
>     /* Set the version label's attributes */
>     x = 0;
>

