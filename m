Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB64DBDF7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:04:35 +0100 (CET)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiJM-0007sZ-Tq
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:04:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nUiGa-0006RZ-9h; Thu, 17 Mar 2022 01:01:40 -0400
Received: from mail.ispras.ru ([83.149.199.84]:35540)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nUiGY-0001Zy-4F; Thu, 17 Mar 2022 01:01:40 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5A3F1405A19B;
 Thu, 17 Mar 2022 05:01:08 +0000 (UTC)
Message-ID: <0a1fbad0-0e4d-661d-c25a-7a7d70896eb2@ispras.ru>
Date: Thu, 17 Mar 2022 08:01:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220315144156.1595462-1-armbru@redhat.com>
 <20220315144156.1595462-4-armbru@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.03.2022 17:41, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>      $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   replay/replay-char.c                     |  4 +--
>   replay/replay-events.c                   | 10 +++---
> 

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

> diff --git a/replay/replay-char.c b/replay/replay-char.c
> index dc0002367e..d2025948cf 100644
> --- a/replay/replay-char.c
> +++ b/replay/replay-char.c
> @@ -50,7 +50,7 @@ void replay_register_char_driver(Chardev *chr)
>   
>   void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
>   {
> -    CharEvent *event = g_malloc0(sizeof(CharEvent));
> +    CharEvent *event = g_new0(CharEvent, 1);
>   
>       event->id = find_char_driver(s);
>       if (event->id < 0) {
> @@ -85,7 +85,7 @@ void replay_event_char_read_save(void *opaque)
>   
>   void *replay_event_char_read_load(void)
>   {
> -    CharEvent *event = g_malloc0(sizeof(CharEvent));
> +    CharEvent *event = g_new0(CharEvent, 1);
>   
>       event->id = replay_get_byte();
>       replay_get_array_alloc(&event->buf, &event->len);
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index 15983dd250..ac47c89834 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -119,7 +119,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
>           return;
>       }
>   
> -    Event *event = g_malloc0(sizeof(Event));
> +    Event *event = g_new0(Event, 1);
>       event->event_kind = event_kind;
>       event->opaque = opaque;
>       event->opaque2 = opaque2;
> @@ -243,17 +243,17 @@ static Event *replay_read_event(int checkpoint)
>           }
>           break;
>       case REPLAY_ASYNC_EVENT_INPUT:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = replay_read_input_event();
>           return event;
>       case REPLAY_ASYNC_EVENT_INPUT_SYNC:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = 0;
>           return event;
>       case REPLAY_ASYNC_EVENT_CHAR_READ:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = replay_event_char_read_load();
>           return event;
> @@ -263,7 +263,7 @@ static Event *replay_read_event(int checkpoint)
>           }
>           break;
>       case REPLAY_ASYNC_EVENT_NET:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = replay_event_net_load();
>           return event;

