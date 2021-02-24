Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC3F32389D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:28:41 +0100 (CET)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpXE-0002cH-KE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEpVY-0001ju-UX
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:26:56 -0500
Received: from mail.ispras.ru ([83.149.199.84]:38234)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEpVX-0003Gp-FC
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:26:56 -0500
Received: from [10.12.39.188] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3963540755E0;
 Wed, 24 Feb 2021 08:26:53 +0000 (UTC)
Subject: Re: [PATCH v2] char: don't fail when client is not connected
To: qemu-devel@nongnu.org
References: <161284977034.741841.12565530923825663110.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <18c2486b-dabd-1c11-c0e8-2f6b2306f4b6@ispras.ru>
Date: Wed, 24 Feb 2021 11:26:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161284977034.741841.12565530923825663110.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 09.02.2021 08:49, Pavel Dovgalyuk wrote:
> This patch checks that ioc is not null before
> using it in tcp socket tcp_chr_add_watch function.
> 
> The failure occurs in replay mode of the execution,
> when monitor and serial port are tcp servers,
> and there are no clients connected to them:
> 
> -monitor tcp:127.0.0.1:8081,server,nowait
> -serial tcp:127.0.0.1:8082,server,nowait
> 
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   chardev/char-socket.c |    3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 213a4c8dd0..cef1d9438f 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
>   static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)
>   {
>       SocketChardev *s = SOCKET_CHARDEV(chr);
> +    if (!s->ioc) {
> +        return NULL;
> +    }
>       return qio_channel_create_watch(s->ioc, cond);
>   }
>   
> 


