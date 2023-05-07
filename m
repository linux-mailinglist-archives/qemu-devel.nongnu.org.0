Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE466F9967
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 17:33:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvgNt-0003PM-3f; Sun, 07 May 2023 11:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvgNr-0003Od-Cs
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:33:11 -0400
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvgNp-0006Ie-QG
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:33:11 -0400
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout03.t-online.de (Postfix) with SMTP id C05A724DBA;
 Sun,  7 May 2023 17:33:07 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvgNk-0zInzt0; Sun, 7 May 2023 17:33:04 +0200
Message-ID: <ba44ad60-596c-71f2-f073-10b0bbd8211f@t-online.de>
Date: Sun, 7 May 2023 17:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 10/12] audio/pw: simplify error reporting in stream
 creation
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-11-marcandre.lureau@redhat.com>
Content-Language: de-DE
In-Reply-To: <20230506163735.3481387-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683473584-8EFFAC12-9EABE27C/0/0 CLEAN NORMAL
X-TOI-MSGID: 735f3626-f70f-402b-b48e-617f1ac4aa37
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
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

> From: Marc-André Lureau<marcandre.lureau@redhat.com>
>
> create_stream() now reports on all error paths.
>
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 5c706a9fde..38905f5be2 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -486,8 +486,6 @@ static int
>   qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
>                  const char *name, enum spa_direction dir)
>   {
> -    int r;
> -
>       switch (v->info.channels) {
>       case 8:
>           v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> @@ -540,13 +538,7 @@ qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
>       }
>   
>       /* create a new unconnected pwstream */
> -    r = create_stream(c, v, stream_name, name, dir);
> -    if (r < 0) {
> -        AUD_log(AUDIO_CAP, "Failed to create stream.");
> -        return -1;
> -    }
> -
> -    return r;
> +    return create_stream(c, v, stream_name, name, dir);
>   }
>   
>   static int
> @@ -577,7 +569,6 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
>       r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
>                          ppdo->name, SPA_DIRECTION_OUTPUT);
>       if (r < 0) {
> -        error_report("qpw_stream_new for playback failed");
>           pw_thread_loop_unlock(c->thread_loop);
>           return -1;
>       }
> @@ -621,7 +612,6 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
>       r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
>                          ppdo->name, SPA_DIRECTION_INPUT);
>       if (r < 0) {
> -        error_report("qpw_stream_new for recording failed");
>           pw_thread_loop_unlock(c->thread_loop);
>           return -1;
>       }


