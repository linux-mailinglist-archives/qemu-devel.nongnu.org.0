Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC94BB510
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 10:09:36 +0100 (CET)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKzGh-00048I-Bc
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 04:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1nKzAq-0002VO-6S
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 04:03:32 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:44393
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1nKzAl-0006pE-Cp
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 04:03:31 -0500
HMM_SOURCE_IP: 172.18.0.188:43000.718366975
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 630E42800BF;
 Fri, 18 Feb 2022 17:03:10 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id dd71dad299b74c288321c9a83f9982f5 for
 steven.sistare@oracle.com; Fri, 18 Feb 2022 17:03:18 CST
X-Transaction-ID: dd71dad299b74c288321c9a83f9982f5
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <be5242d68beca807ab6b2d08d71fff2e248d4217.camel@chinatelecom.cn>
Subject: Re: [PATCH V7 28/29] chardev: cpr for sockets
From: Guoyi Tu <tugy@chinatelecom.cn>
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org, 
 tugy@chinatelecom.cn
Date: Fri, 18 Feb 2022 17:03:03 +0800
In-Reply-To: <1640199934-455149-29-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-29-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.223; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-12-22 at 11:05 -0800, Steve Sistare wrote:
> Save accepted socket fds before cpr-save, and look for them after
> cpr-load.
> in the environment after cpr-load.  Reject cpr-exec if a socket
> enables
> the TLS or websocket option.  Allow a monitor socket by closing it on
> exec.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  chardev/char-socket.c | 35 +++++++++++++++++++++++++++++++++++
>  monitor/hmp.c         |  3 +++
>  monitor/qmp.c         |  3 +++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index d619088..c111e17 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -26,6 +26,7 @@
>  #include "chardev/char.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-websock.h"
> +#include "migration/cpr.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> @@ -358,6 +359,10 @@ static void tcp_chr_free_connection(Chardev
> *chr)
>      SocketChardev *s = SOCKET_CHARDEV(chr);
>      int i;
>  
> +    if (!chr->reopen_on_cpr) {
> +        cpr_delete_fd(chr->label, 0);
> +    }
> +
>      if (s->read_msgfds_num) {
>          for (i = 0; i < s->read_msgfds_num; i++) {
>              close(s->read_msgfds[i]);
> @@ -920,6 +925,10 @@ static void tcp_chr_accept(QIONetListener
> *listener,
>                                 QIO_CHANNEL(cioc));
>      }
>      tcp_chr_new_client(chr, cioc);
> +
> +    if (s->sioc && !chr->reopen_on_cpr) {

Is it necessary check if the device has QEMU_CHAR_FEATURE_CPR feature
here? In my opinion, fd should not be saved if device don't support
cpr.

> +        cpr_save_fd(chr->label, 0, s->sioc->fd);
> +    }
>  }
>  
>  
> @@ -1175,6 +1184,26 @@ static gboolean
> socket_reconnect_timeout(gpointer opaque)
>      return false;
>  }
>  
> +static int load_char_socket_fd(Chardev *chr, Error **errp)
> +{
> +    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
> +    QIOChannelSocket *sioc;
> +    const char *label = chr->label;
> +    int fd = cpr_find_fd(label, 0);
> +
> +    if (fd != -1) {
> +        sockchar = SOCKET_CHARDEV(chr);
> +        sioc = qio_channel_socket_new_fd(fd, errp);
> +        if (sioc) {
> +            tcp_chr_accept(sockchar->listener, sioc, chr);
> +            object_unref(OBJECT(sioc));
> +        } else {
> +            error_setg(errp, "could not restore socket for %s",
> label);
> +            return -1;
> +        }
> +    }
> +    return 0;
> +}
>  
>  static int qmp_chardev_open_socket_server(Chardev *chr,
>                                            bool is_telnet,
> @@ -1385,6 +1414,10 @@ static void qmp_chardev_open_socket(Chardev
> *chr,
>      }
>      s->registered_yank = true;
>  
> +    if (!s->tls_creds && !s->is_websock) {
> +        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
> +    }
> +
>      /* be isn't opened until we get a connection */
>      *be_opened = false;
>  
> @@ -1400,6 +1433,8 @@ static void qmp_chardev_open_socket(Chardev
> *chr,
>              return;
>          }
>      }
> +
> +    load_char_socket_fd(chr, errp);
>  }
>  
>  static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend
> *backend,
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index b20737e..a425894 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1484,4 +1484,7 @@ void monitor_init_hmp(Chardev *chr, bool
> use_readline, Error **errp)
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> monitor_read,
>                               monitor_event, NULL, &mon->common,
> NULL, true);
>      monitor_list_append(&mon->common);
> +
> +    /* monitor cannot yet be preserved across cpr */
> +    chr->reopen_on_cpr = true;
>  }
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 092c527..0043459 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -535,4 +535,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty,
> Error **errp)
>                                   NULL, &mon->common, NULL, true);
>          monitor_list_append(&mon->common);
>      }
> +
> +    /* Monitor cannot yet be preserved across cpr */
> +    chr->reopen_on_cpr = true;
>  }


