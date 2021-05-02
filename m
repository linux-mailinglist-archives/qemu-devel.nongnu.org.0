Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800513709CD
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 06:09:50 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld3QT-0002Pd-JV
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 00:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ld3Oq-0001zF-VQ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 00:08:08 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:1435
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ld3Op-0007qb-DC
 for qemu-devel@nongnu.org; Sun, 02 May 2021 00:08:08 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FXt1Q1Yjxz8PbN;
 Sun,  2 May 2021 00:10:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=bi93xAtHH
 lcKTWHiC+PmmHJBtjI=; b=iMajtRX/CZZair5ND11iV+y0Bu9Qzn1qDb0dByVFm
 hVAriQhJZrhuGP5j7g4nsa1Vm+If1f5Q7xa0/0IU8y75nJwOsJOhS1xLaZEc9lXq
 kfkCZMelArYTmHyKhFkTxIypWJ+grPMaQhXxfzKCZtybYMmhUTUWk3uAqNf1G/6t
 +8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=J2B
 s8/lXmx19OCsErodKKbJxebtt1tg30Cb/EozXbaxj3iDVQUzL8yvIiVbsO/RiNYh
 zJ1KGsOumObZCLe5aj8nw7S7gKWVA+UnSa60o3drPOR5njH8/e/hyaquIAqu0axL
 pYP9v8LkVMSycptJ8u+3zolftkmRi6OpndcXJ2+E=
Received: from [192.168.3.42]
 (bras-base-toroon2719w-grc-49-142-114-9-241.dsl.bell.ca [142.114.9.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FXt1Q0n1jz8PbK;
 Sun,  2 May 2021 00:10:18 -0400 (EDT)
Message-ID: <9392c2f9-dea9-1836-8966-7ddb62e5156b@comstyle.com>
Date: Sun, 2 May 2021 00:08:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] oslib-posix: Remove OpenBSD workaround for
 fcntl("/dev/null", F_SETFL, O_NONBLOCK) failure
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <YGYECGXQhdamEJgC@humpty.home.comstyle.com>
In-Reply-To: <YGYECGXQhdamEJgC@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping.

On 4/1/2021 1:34 PM, Brad Smith wrote:
> OpenBSD prior to 6.3 required a workaround to utilize fcntl(F_SETFL) on memory
> devices.
>
> Since modern verions of OpenBSD that are only officialy supported and buildable
> on do not have this issue I am garbage collecting this workaround.
>
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 36820fec16..7b4bec1402 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -273,17 +273,6 @@ int qemu_try_set_nonblock(int fd)
>           return -errno;
>       }
>       if (fcntl(fd, F_SETFL, f | O_NONBLOCK) == -1) {
> -#ifdef __OpenBSD__
> -        /*
> -         * Previous to OpenBSD 6.3, fcntl(F_SETFL) is not permitted on
> -         * memory devices and sets errno to ENODEV.
> -         * It's OK if we fail to set O_NONBLOCK on devices like /dev/null,
> -         * because they will never block anyway.
> -         */
> -        if (errno == ENODEV) {
> -            return 0;
> -        }
> -#endif
>           return -errno;
>       }
>       return 0;

