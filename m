Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA13374A39
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:35:17 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePAq-0004JR-5E
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1leOrg-00063s-9E; Wed, 05 May 2021 17:15:28 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1leOre-0006Zi-AQ; Wed, 05 May 2021 17:15:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 5184E34C;
 Wed,  5 May 2021 23:15:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTWsVgwYhWmH; Wed,  5 May 2021 23:15:23 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6EA73319;
 Wed,  5 May 2021 23:15:23 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1leOra-002fD4-Iv; Wed, 05 May 2021 23:15:22 +0200
Date: Wed, 5 May 2021 23:15:22 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 04/23] chardev/baum: Avoid dynamic stack allocation
Message-ID: <20210505211522.grcqmeilft5ucjvp@begin>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210505211047.1496765-5-philmd@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 5184E34C
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

Philippe Mathieu-Daudé, le mer. 05 mai 2021 23:10:28 +0200, a ecrit:
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  chardev/baum.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/chardev/baum.c b/chardev/baum.c
> index 0822e9ed5f3..bc09cda3471 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -299,7 +299,8 @@ static void baum_chr_accept_input(struct Chardev *chr)
>  static void baum_write_packet(BaumChardev *baum, const uint8_t *buf, int len)
>  {
>      Chardev *chr = CHARDEV(baum);
> -    uint8_t io_buf[1 + 2 * len], *cur = io_buf;
> +    g_autofree uint8_t *io_buf = g_malloc(1 + 2 * len);
> +    uint8_t *cur = io_buf;
>      int room;
>      *cur++ = ESC;
>      while (len--)
> -- 
> 2.26.3
> 

