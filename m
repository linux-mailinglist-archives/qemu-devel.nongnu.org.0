Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77331745E8
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 10:36:06 +0100 (CET)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7yXV-0000IU-4v
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 04:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1j7ySq-00089j-Sh
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 04:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1j7ySp-0003wu-QB
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 04:31:16 -0500
Received: from smtp.duncanthrax.net ([178.63.180.169]:33408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1j7ySp-0003wL-9A
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 04:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4I+ZZeTyv3mwNKB+CpUOsv3dk7ZZGuP91LvgBxwJV/s=; b=mO/fhzCRGjt17t5EZGjbzpZzgE
 Wo7zWziRdoAWLG6WRT5Sev9rLlN0scr4uoxfy1F+ooB8ty/bUZbRTKXQ6Q8x8OZR9HPQJEn8wWOdN
 DlnpYJ6v43f4+YYktoT3CJEfdIABxV4tLQagxd6yoRre5CUO04/Dgzw0dZejHhsUoL6g=;
Received: from [134.3.47.90] (helo=t470p.stackframe.org)
 by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>)
 id 1j7ySm-0005TE-2l; Sat, 29 Feb 2020 10:31:12 +0100
Date: Sat, 29 Feb 2020 10:31:11 +0100
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 4/9] hw/display/artist: Avoid drawing line when nothing to
 display
Message-ID: <20200229093111.GA24534@t470p.stackframe.org>
References: <20200218193929.11404-1-richard.henderson@linaro.org>
 <20200218193929.11404-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200218193929.11404-5-richard.henderson@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.63.180.169
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 18, 2020 at 11:39:24AM -0800, Richard Henderson wrote:
> From: Philippe Mathieu-Daud� <f4bug@amsat.org>
> 
> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>
> Message-Id: <20200214001303.12873-5-f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/display/artist.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 97c811b35e..5492079116 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -579,6 +579,9 @@ static void draw_line(ARTISTState *s, int x1, int y1, int x2, int y2,
>      } else {
>          dy = y1 - y2;
>      }
> +    if (!dx || !dy) {
> +        return;
> +    }
>  
>      c1 = false;
>      if (dy > dx) {
> -- 
> 2.20.1
> 
> 

I noticed that this change causes 1px wide lines to disappear. So i would propose
to revert that change.

Regards
Sven

