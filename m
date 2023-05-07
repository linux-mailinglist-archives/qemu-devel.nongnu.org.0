Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8606F9966
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 17:33:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvgNh-0003Bh-PD; Sun, 07 May 2023 11:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvgNf-00033x-IZ
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:32:59 -0400
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvgNd-0006GA-0i
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:32:59 -0400
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout01.t-online.de (Postfix) with SMTP id 74D9F32402;
 Sun,  7 May 2023 17:32:33 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvgND-0BN3Oj0; Sun, 7 May 2023 17:32:31 +0200
Message-ID: <64fc5a81-31a2-0e43-813e-11b5c52e5964@t-online.de>
Date: Sun, 7 May 2023 17:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 09/12] audio/pw: add more error reporting
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-10-marcandre.lureau@redhat.com>
Content-Language: de-DE
In-Reply-To: <20230506163735.3481387-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683473551-8EFFAC12-16C15902/0/0 CLEAN NORMAL
X-TOI-MSGID: 1fafccdd-5b4d-428b-9078-bf5a9527f613
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 67df53948c..5c706a9fde 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -429,6 +429,10 @@ create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
>       struct pw_properties *props;
>   
>       props = pw_properties_new(NULL, NULL);
> +    if (!props) {
> +        error_report("Failed to create PW properties: %s", g_strerror(errno));
> +        return -1;
> +    }
>   
>       /* 75% of the timer period for faster updates */
>       buf_samples = (uint64_t)v->g->dev->timer_period * v->info.rate
> @@ -441,8 +445,8 @@ create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
>           pw_properties_set(props, PW_KEY_TARGET_OBJECT, name);
>       }
>       v->stream = pw_stream_new(c->core, stream_name, props);
> -
>       if (v->stream == NULL) {
> +        error_report("Failed to create PW stream: %s", g_strerror(errno));
>           return -1;
>       }
>   
> @@ -470,6 +474,7 @@ create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
>                               PW_STREAM_FLAG_MAP_BUFFERS |
>                               PW_STREAM_FLAG_RT_PROCESS, params, n_params);
>       if (res < 0) {
> +        error_report("Failed to connect PW stream: %s", g_strerror(errno));
>           pw_stream_destroy(v->stream);
>           return -1;
>       }


