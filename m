Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C335374A31
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:33:01 +0200 (CEST)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP8e-00010i-NA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1leOqW-0004An-2M; Wed, 05 May 2021 17:14:17 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:33352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1leOqU-0005rb-JI; Wed, 05 May 2021 17:14:15 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id A58F834C;
 Wed,  5 May 2021 23:14:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJAjMzBFPomz; Wed,  5 May 2021 23:14:10 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id DF0E0319;
 Wed,  5 May 2021 23:14:09 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1leOqP-002fBq-4S; Wed, 05 May 2021 23:14:09 +0200
Date: Wed, 5 May 2021 23:14:09 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/23] chardev/baum: Use definitions to avoid dynamic
 stack allocation
Message-ID: <20210505211409.lgmh7ivo7lrudfvd@begin>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210505211047.1496765-4-philmd@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: A58F834C
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daudé, le mer. 05 mai 2021 23:10:27 +0200, a ecrit:
> We know 'x * y' will be at most 'X_MAX * Y_MAX' (which is not
> a big value, it is actually 84). Instead of having the compiler
> use variable-length array, declare an array able to hold the
> maximum 'x * y'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  chardev/baum.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/chardev/baum.c b/chardev/baum.c
> index adc3d7b3b56..0822e9ed5f3 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -383,9 +383,9 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
>      switch (req) {
>      case BAUM_REQ_DisplayData:
>      {
> -        uint8_t cells[baum->x * baum->y], c;
> -        uint8_t text[baum->x * baum->y];
> -        uint8_t zero[baum->x * baum->y];
> +        uint8_t cells[X_MAX * Y_MAX], c;
> +        uint8_t text[X_MAX * Y_MAX];
> +        uint8_t zero[X_MAX * Y_MAX];
>          int cursor = BRLAPI_CURSOR_OFF;
>          int i;
>  
> @@ -408,7 +408,7 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
>          }
>          timer_del(baum->cellCount_timer);
>  
> -        memset(zero, 0, sizeof(zero));
> +        memset(zero, 0, baum->x * baum->y);
>  
>          brlapi_writeArguments_t wa = {
>              .displayNumber = BRLAPI_DISPLAY_DEFAULT,
> -- 
> 2.26.3
> 

