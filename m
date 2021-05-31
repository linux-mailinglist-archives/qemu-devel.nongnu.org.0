Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC03954CB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 06:49:42 +0200 (CEST)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnZrx-0005yJ-AB
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 00:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lnZpR-000472-BY
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:47:05 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50268)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lnZpP-0003jv-BX
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:47:05 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id D53364076B39;
 Mon, 31 May 2021 04:47:01 +0000 (UTC)
Subject: Re: [PATCH] replay: fix event queue flush for qemu shutdown
To: qemu-devel@nongnu.org
References: <162125673369.1252743.1121827086025789296.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <de627623-022f-fad4-a85d-e50ffe726902@ispras.ru>
Date: Mon, 31 May 2021 07:47:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162125673369.1252743.1121827086025789296.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.618,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 17.05.2021 16:05, Pavel Dovgalyuk wrote:
> This patch fixes event queue flush in the case of emulator
> shutdown. replay_finish_events should be called when replay_mode
> is not cleared.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/replay/replay.c b/replay/replay.c
> index 6df2abc18c..2d3607998a 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -387,9 +387,8 @@ void replay_finish(void)
>       g_free(replay_snapshot);
>       replay_snapshot = NULL;
>   
> -    replay_mode = REPLAY_MODE_NONE;
> -
>       replay_finish_events();
> +    replay_mode = REPLAY_MODE_NONE;
>   }
>   
>   void replay_add_blocker(Error *reason)
> 




