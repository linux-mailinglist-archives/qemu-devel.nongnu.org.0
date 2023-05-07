Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DE6F9919
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 17:02:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvftd-0003fH-P7; Sun, 07 May 2023 11:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvftN-0003f4-PA
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:01:41 -0400
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvftJ-00071h-E5
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:01:41 -0400
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout08.t-online.de (Postfix) with SMTP id B462C567C;
 Sun,  7 May 2023 17:01:30 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvftC-1Bhek50; Sun, 7 May 2023 17:01:30 +0200
Message-ID: <3f7e1b2a-e409-9a05-ae4d-a6df8c87ab6f@t-online.de>
Date: Sun, 7 May 2023 17:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 05/12] audio/pw: needless check for NULL
Content-Language: de-DE
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-6-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230506163735.3481387-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683471690-E6FFAC37-5EE94C52/0/0 CLEAN NORMAL
X-TOI-MSGID: a05b4643-a20b-48b2-8b3a-7212c1c19706
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> g_clear_pointer() already checks for NULL.
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 51cfc0b052..6ca4ef4f62 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -834,12 +834,8 @@ fail:
>       if (pw->thread_loop) {
>           pw_thread_loop_stop(pw->thread_loop);
>       }
> -    if (pw->context) {
> -        g_clear_pointer(&pw->context, pw_context_destroy);
> -    }
> -    if (pw->thread_loop) {
> -        g_clear_pointer(&pw->thread_loop, pw_thread_loop_destroy);
> -    }
> +    g_clear_pointer(&pw->context, pw_context_destroy);
> +    g_clear_pointer(&pw->thread_loop, pw_thread_loop_destroy);
>       return NULL;
>   }
>   


