Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEB766B234
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5BH-0008Ht-UK; Sun, 15 Jan 2023 10:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pH5BF-0008HS-MM
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 10:44:21 -0500
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pH5BD-0007VD-Nh
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 10:44:21 -0500
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout12.t-online.de (Postfix) with SMTP id 3E205C97C;
 Sun, 15 Jan 2023 16:44:17 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH5B7-0Qky3d0; Sun, 15 Jan 2023 16:44:13 +0100
Message-ID: <208c61b7-bcc0-a42b-fcb3-edc0ccbfb71f@t-online.de>
Date: Sun, 15 Jan 2023 16:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] audio: don't check qemu_add_vm_change_state_handler
 failure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230113162200.3010804-1-berrange@redhat.com>
 <20230113162200.3010804-2-berrange@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230113162200.3010804-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: 5a2deb2c-c0f4-4253-af19-95b738d6f6e9
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
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

Am 13.01.23 um 17:21 schrieb Daniel P. Berrangé:
> This function cannot fail since g_malloc0 aborts on OOM.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   audio/audio.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index d849a94a81..7b4b957945 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1712,7 +1712,6 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>       size_t i;
>       int done = 0;
>       const char *drvname = NULL;
> -    VMChangeStateEntry *e;
>       AudioState *s;
>       struct audio_driver *driver;
>       /* silence gcc warning about uninitialized variable */
> @@ -1830,11 +1829,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>           s->period_ticks = dev->timer_period * (int64_t)SCALE_US;
>       }
>   
> -    e = qemu_add_vm_change_state_handler (audio_vm_change_state_handler, s);
> -    if (!e) {
> -        dolog ("warning: Could not register change state handler\n"
> -               "(Audio can continue looping even after stopping the VM)\n");
> -    }
> +    qemu_add_vm_change_state_handler (audio_vm_change_state_handler, s);

checkpatch.pl doesn't work properly here. It should report:
ERROR: space prohibited between function name and open parenthesis '('

With this changed,

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

>   
>       QTAILQ_INSERT_TAIL(&audio_states, s, list);
>       QLIST_INIT (&s->card_head);


