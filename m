Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2596C0AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 07:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pe92v-0004YV-Ew; Mon, 20 Mar 2023 02:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pe92o-0004Xt-Np
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 02:31:00 -0400
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pe92m-0002Tk-TL
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 02:30:58 -0400
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout03.t-online.de (Postfix) with SMTP id 1ED658850;
 Mon, 20 Mar 2023 07:30:50 +0100 (CET)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd83.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pe92d-2R7TQ90; Mon, 20 Mar 2023 07:30:47 +0100
Message-ID: <325b0fd9-d435-e8c6-25cc-124e7ad68f8c@t-online.de>
Date: Mon, 20 Mar 2023 07:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
References: <20230315164633.60924-1-dbassey@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230315164633.60924-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1679293847-432C3378-AE732440/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ff9db02-dd77-4c3e-a03d-6af1ebed6cab
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


> diff --git a/audio/trace-events b/audio/trace-events
> index e1ab643add..e0acf9ac56 100644
> --- a/audio/trace-events
> +++ b/audio/trace-events
> @@ -18,6 +18,13 @@ dbus_audio_register(const char *s, const char *dir) "sender = %s, dir = %s"
>   dbus_audio_put_buffer_out(size_t len) "len = %zu"
>   dbus_audio_read(size_t len) "len = %zu"
>   
> +# pwaudio.c
> +pw_state_changed(const char *s) "stream state: %s"
> +pw_node(int nodeid) "node id: %d"
> +pw_read(int32_t avail, uint32_t index, size_t len) "avail=%u index=%u len=%zu"
> +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) "filled=%u avail=%u index=%u len=%zu"
> +pw_audio_init(void) "Initialize Pipewire context"
> +

Hi Dorinda,

the format specifiers and parameter types don't always match.

With  best regards,
Volker

>   # audio.c
>   audio_timer_start(int interval) "interval %d ms"
>   audio_timer_stop(void) ""
>


