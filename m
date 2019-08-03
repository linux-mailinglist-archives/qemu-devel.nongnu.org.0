Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC780644
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 15:05:21 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1httip-0007Rc-8q
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 09:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59001)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cfontana@suse.de>) id 1httRc-0003Fn-L1
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 08:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cfontana@suse.de>) id 1httRb-0004ST-MG
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 08:47:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:35790 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cfontana@suse.de>) id 1httRb-0004Nz-GH
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 08:47:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19483AF7E;
 Sat,  3 Aug 2019 12:47:28 +0000 (UTC)
To: Jan Kiszka <jan.kiszka@web.de>
References: <6976a3e4-d484-56cb-5450-f4a72cc6dddc@web.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5dab55e2-f2fd-36f6-433a-a8af9578a080@suse.de>
Date: Sat, 3 Aug 2019 14:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6976a3e4-d484-56cb-5450-f4a72cc6dddc@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Sat, 03 Aug 2019 09:04:15 -0400
Subject: Re: [Qemu-devel] [PATCH] ivshmem-server: Terminate also on SIGINT
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/19 1:48 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Allows to shutdown a foreground session via ctrl-c.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  contrib/ivshmem-server/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
> index 197c79c57e..8a81cdb04c 100644
> --- a/contrib/ivshmem-server/main.c
> +++ b/contrib/ivshmem-server/main.c
> @@ -223,7 +223,8 @@ main(int argc, char *argv[])
>      sa_quit.sa_handler = ivshmem_server_quit_cb;
>      sa_quit.sa_flags = 0;
>      if (sigemptyset(&sa_quit.sa_mask) == -1 ||
> -        sigaction(SIGTERM, &sa_quit, 0) == -1) {
> +        sigaction(SIGTERM, &sa_quit, 0) == -1 ||
> +        sigaction(SIGINT, &sa_quit, 0) == -1) {
>          perror("failed to add SIGTERM handler; sigaction");

I guess the error string should not mention SIGTERM specifically anymore:

perror("failed to add signal handler; sigaction");

>          goto err;
>      }
> --
> 2.16.4
> 
> 

Ciao,

Claudio

