Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E624DE9A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:36:08 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9AxT-0004RY-7r
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k9AwE-0002dH-LS
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:34:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k9AwC-0001se-AS
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=J1ilFJOxYvVYcefj0wsxykyOcvukBanOEpKQEzYo0lM=; b=pKSo1JlaATA7z/10G2VPysZME2
 GWs886YaAtwFGh5q90nbgAGe4YT9IXWn1fairDXXNfK6RNBWwmgOz0VWq12i0ha4hBTjPjSFAuwdz
 w907LuoOZj/muf0j1feUhTjFpw+dYSkoHYzlTxN/8hx8GKSlcEWg4W7mxOpQ2Rj/F2Wua/2WaEDGA
 DtvWCKHmxnFQVsrbCwLzGhyAu8Z3LEXtdTjnR27cRJyEUH2tQ/TK3pwCray3g+3wwjbPTQ8XrVbOC
 T1eliNLeYFMEh4Fzzf/F7ObXIujrV0cxErC1jIRN3NZPrTBmjiml0/ynD8i8uv/BlwYGKz9VOiEJR
 xqlsXL0Q==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v8 1/1] audio/jack: fix use after free segfault
Date: Fri, 21 Aug 2020 19:34:44 +0200
Message-ID: <3291053.UyeazdVyI9@silver>
In-Reply-To: <20200821134554.101397-2-geoff@hostfission.com>
References: <20200821134554.101397-1-geoff@hostfission.com>
 <20200821134554.101397-2-geoff@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 13:34:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 21. August 2020 15:45:54 CEST Geoffrey McRae wrote:
> This change registers a bottom handler to close the JACK client
> connection when a server shutdown signal is recieved. Without this
> libjack2 attempts to "clean up" old clients and causes a use after free
> segfault.
> 
> Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
> ---
>  audio/jackaudio.c | 55 ++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index 72ed7c4929..572ebea208 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -25,6 +25,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "qemu/atomic.h"
> +#include "qemu/main-loop.h"
>  #include "qemu-common.h"
>  #include "audio.h"
> 
> @@ -63,6 +64,8 @@ typedef struct QJackClient {
>      QJackState      state;
>      jack_client_t  *client;
>      jack_nframes_t  freq;
> +    QemuMutex       shutdown_lock;
> +    QEMUBH         *shutdown_bh;
> 
>      struct QJack   *j;
>      int             nchannels;
> @@ -306,21 +309,27 @@ static int qjack_xrun(void *arg)
>      return 0;
>  }
> 
> +static void qjack_shutdown_bh(void *opaque)
> +{
> +    QJackClient *c = (QJackClient *)opaque;
> +    qjack_client_fini(c);
> +}
> +
>  static void qjack_shutdown(void *arg)
>  {
>      QJackClient *c = (QJackClient *)arg;
>      c->state = QJACK_STATE_SHUTDOWN;
> +    qemu_bh_schedule(c->shutdown_bh);
>  }
> 
>  static void qjack_client_recover(QJackClient *c)
>  {
> -    if (c->state == QJACK_STATE_SHUTDOWN) {
> -        qjack_client_fini(c);
> +    if (c->state != QJACK_STATE_DISCONNECTED) {
> +        return;
>      }
> 
>      /* packets is used simply to throttle this */
> -    if (c->state == QJACK_STATE_DISCONNECTED &&
> -        c->packets % 100 == 0) {
> +    if (c->packets % 100 == 0) {
> 
>          /* if enabled then attempt to recover */
>          if (c->enabled) {
> @@ -489,15 +498,18 @@ static int qjack_init_out(HWVoiceOut *hw, struct
> audsettings *as, QJackOut *jo  = (QJackOut *)hw;
>      Audiodev *dev = (Audiodev *)drv_opaque;
> 
> -    qjack_client_fini(&jo->c);
> -
>      jo->c.out       = true;
>      jo->c.enabled   = false;
>      jo->c.nchannels = as->nchannels;
>      jo->c.opt       = dev->u.jack.out;
> 
> +    jo->c.shutdown_bh = qemu_bh_new(qjack_shutdown_bh, &jo->c);
> +    qemu_mutex_init(&jo->c.shutdown_lock);
> +
>      int ret = qjack_client_init(&jo->c);
>      if (ret != 0) {
> +        qemu_bh_delete(jo->c.shutdown_bh);
> +        qemu_mutex_destroy(&jo->c.shutdown_lock);
>          return ret;
>      }
> 
> @@ -525,15 +537,18 @@ static int qjack_init_in(HWVoiceIn *hw, struct
> audsettings *as, QJackIn  *ji  = (QJackIn *)hw;
>      Audiodev *dev = (Audiodev *)drv_opaque;
> 
> -    qjack_client_fini(&ji->c);
> -
>      ji->c.out       = false;
>      ji->c.enabled   = false;
>      ji->c.nchannels = as->nchannels;
>      ji->c.opt       = dev->u.jack.in;
> 
> +    ji->c.shutdown_bh = qemu_bh_new(qjack_shutdown_bh, &ji->c);
> +    qemu_mutex_init(&ji->c.shutdown_lock);
> +
>      int ret = qjack_client_init(&ji->c);
>      if (ret != 0) {
> +        qemu_bh_delete(ji->c.shutdown_bh);
> +        qemu_mutex_destroy(&ji->c.shutdown_lock);
>          return ret;
>      }
> 
> @@ -555,7 +570,7 @@ static int qjack_init_in(HWVoiceIn *hw, struct
> audsettings *as, return 0;
>  }
> 
> -static void qjack_client_fini(QJackClient *c)
> +static void qjack_client_fini_locked(QJackClient *c)
>  {
>      switch (c->state) {
>      case QJACK_STATE_RUNNING:
> @@ -564,28 +579,42 @@ static void qjack_client_fini(QJackClient *c)
> 
>      case QJACK_STATE_SHUTDOWN:
>          jack_client_close(c->client);
> +        c->client = NULL;
> +
> +        qjack_buffer_free(&c->fifo);
> +        g_free(c->port);
> +
> +        c->state = QJACK_STATE_DISCONNECTED;
>          /* fallthrough */
> 
>      case QJACK_STATE_DISCONNECTED:
>          break;
>      }
> +}
> 
> -    qjack_buffer_free(&c->fifo);
> -    g_free(c->port);
> -
> -    c->state = QJACK_STATE_DISCONNECTED;
> +static void qjack_client_fini(QJackClient *c)
> +{
> +    qemu_mutex_lock(&c->shutdown_lock);
> +    qjack_client_fini_locked(c);
> +    qemu_mutex_unlock(&c->shutdown_lock);
>  }
> 
>  static void qjack_fini_out(HWVoiceOut *hw)
>  {
>      QJackOut *jo = (QJackOut *)hw;
>      qjack_client_fini(&jo->c);
> +
> +    qemu_bh_delete(jo->c.shutdown_bh);

Paolo wrapped that qemu_bh_delete() call inside the lock as well. So I guess 
it makes a difference for the BH API?

> +    qemu_mutex_destroy(&jo->c.shutdown_lock);
>  }

Hmmm, is this qemu_mutex_destroy() safe at this point?

> 
>  static void qjack_fini_in(HWVoiceIn *hw)
>  {
>      QJackIn *ji = (QJackIn *)hw;
>      qjack_client_fini(&ji->c);
> +
> +    qemu_bh_delete(ji->c.shutdown_bh);
> +    qemu_mutex_destroy(&ji->c.shutdown_lock);
>  }
> 
>  static void qjack_enable_out(HWVoiceOut *hw, bool enable)

Best regards,
Christian Schoenebeck



