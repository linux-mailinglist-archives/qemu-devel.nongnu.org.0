Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E50DF444F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 11:17:29 +0100 (CET)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT1KZ-00059W-9L
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 05:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.kiszka@siemens.com>) id 1iT1EO-00039u-Vn
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@siemens.com>) id 1iT1EL-0000p1-Is
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:11:02 -0500
Received: from thoth.sbs.de ([192.35.17.2]:45327)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
 id 1iT1EL-0000iC-8b
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:11:01 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xA898YNb003511
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Nov 2019 10:08:34 +0100
Received: from [167.87.14.235] ([167.87.14.235])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xA898Vx0018440;
 Fri, 8 Nov 2019 10:08:32 +0100
Subject: Re: [PATCH v2] ivshmem-server: Terminate also on SIGINT
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Markus Armbruster <armbru@redhat.com>
References: <99c1a7bd-1876-66a2-4b8e-d5bc86116fe7@web.de>
Message-ID: <fed41c57-c433-9723-e5db-5eb3a10c4f8b@siemens.com>
Date: Fri, 8 Nov 2019 10:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <99c1a7bd-1876-66a2-4b8e-d5bc86116fe7@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 192.35.17.2
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.08.19 15:22, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Allows to shutdown a foreground session via ctrl-c.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> Changes in v2:
>   - adjust error message
> 
>   contrib/ivshmem-server/main.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
> index 197c79c57e..e4cd35f74c 100644
> --- a/contrib/ivshmem-server/main.c
> +++ b/contrib/ivshmem-server/main.c
> @@ -223,8 +223,9 @@ main(int argc, char *argv[])
>       sa_quit.sa_handler = ivshmem_server_quit_cb;
>       sa_quit.sa_flags = 0;
>       if (sigemptyset(&sa_quit.sa_mask) == -1 ||
> -        sigaction(SIGTERM, &sa_quit, 0) == -1) {
> -        perror("failed to add SIGTERM handler; sigaction");
> +        sigaction(SIGTERM, &sa_quit, 0) == -1 ||
> +        sigaction(SIGINT, &sa_quit, 0) == -1) {
> +        perror("failed to add signal handler; sigaction");
>           goto err;
>       }
> 
> --
> 2.16.4
> 
> 

...and this one for you as well, Markus?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

