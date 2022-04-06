Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C94F623A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:58:27 +0200 (CEST)
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc773-0003Rq-Qd
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nc72u-0002Lk-D8
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:54:09 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nc72q-0000rt-VR
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:54:07 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 36CFA20896;
 Wed,  6 Apr 2022 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649256839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFtsk1LT/K56puuLBR9s62DPTEB82EErkjaPs9VON/s=;
 b=7UghDxYBtuYC3wdW7X8b1TzK2pAn9Oj+Wz17dqiPbnAxi2ixNqlaLaprZx5kNlwH9o7Jwy
 h4/4yySwJhYFPaeckmLGSCAFX1RkiXK3Lk7ga+XF0bd51Gjr9VxAVeI9P9tqPJ0J46d1BH
 DeCLe7Zl1dlFpD6ctXk28EVWPDssqm0=
Message-ID: <b63ec990-ba01-6e9b-2e2a-974526aa0339@greensocs.com>
Date: Wed, 6 Apr 2022 16:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/32] qga: replace deprecated g_get_current_time()
Content-Language: en-US-large
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-13-marcandre.lureau@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220323155743.1585078-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/22 16:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> According to GLib API:
> g_get_current_time has been deprecated since version 2.62 and should not
> be used in newly-written code. GTimeVal is not year-2038-safe. Use
> g_get_real_time() instead.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qga/main.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/qga/main.c b/qga/main.c
> index b9dd19918e47..1deb0ee2fbfe 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -314,7 +314,6 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
>                      const gchar *msg, gpointer opaque)
>   {
>       GAState *s = opaque;
> -    GTimeVal time;
>       const char *level_str = ga_log_level_str(level);
>   
>       if (!ga_logging_enabled(s)) {
> @@ -329,9 +328,11 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
>   #else
>       if (level & s->log_level) {
>   #endif
> -        g_get_current_time(&time);
> +        gint64 t = g_get_real_time();
>           fprintf(s->log_file,
> -                "%lu.%lu: %s: %s\n", time.tv_sec, time.tv_usec, level_str, msg);
> +                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
> +                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
> +                level_str, msg);
>           fflush(s->log_file);
>       }
>   }

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

--
Damien

