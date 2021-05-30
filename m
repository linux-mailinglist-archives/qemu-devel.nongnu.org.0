Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377F3952C7
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 21:49:39 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnRRK-0000pK-Ip
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 15:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lnRN6-0005Eh-DL
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:45:16 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:10059
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lnRN0-0003d6-Fy
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:45:16 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FtTQz5T66z8PbN;
 Sun, 30 May 2021 15:44:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=bi93xAtHH
 lcKTWHiC+PmmHJBtjI=; b=OTpajLysDnEOE7auz/05BVwkt9YzLa6rOfmi4pktE
 Ot9Zc/Hkp1wMKh9SKQ5hiX9JURZIDRkLuYVkJ86qgsYk5DYJ1u9IiAQBnuKiqpNR
 jiwh4hmc0DaZ2piOkQiZKAYcC7jfQhOZwuVKrW3EObH/tDYyoi18/9Xd6H0TRtG6
 bg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=kEy
 W9KS/R4W18mhMaYOjP0/Qzz6ddIJOJ5sTyWUIeAYC4OE2VsL+Pl/evb+DA4ayXED
 IrjnrCofIbUK6rM3RJJrePbcWGaggoKt78DE7xePaDVnluUBSVFHrRENsM5K1Rlv
 sB4m8xVArsDWqzDeiooc7UKwjRAp0VnZuq4rWY0Q=
Received: from [192.168.6.30]
 (bras-base-toroon2719w-grc-50-142-114-10-211.dsl.bell.ca [142.114.10.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FtTQz4cmVz8PbK;
 Sun, 30 May 2021 15:44:59 -0400 (EDT)
Message-ID: <74fd36f2-6638-6f43-f1d1-63cd41670e62@comstyle.com>
Date: Sun, 30 May 2021 15:44:59 -0400
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
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
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

