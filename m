Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDB4BB5EB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 10:47:50 +0100 (CET)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKzrg-0008R7-Hd
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 04:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1nKzo7-0006qg-Lt
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 04:44:08 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:48451
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1nKznf-0004Zy-Cq
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 04:43:43 -0500
HMM_SOURCE_IP: 172.18.0.218:57992.1467929984
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 53F9B2800D1;
 Fri, 18 Feb 2022 17:43:17 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id acd88f65e71d478ba175bd9acbc23b08 for
 steven.sistare@oracle.com; Fri, 18 Feb 2022 17:43:29 CST
X-Transaction-ID: acd88f65e71d478ba175bd9acbc23b08
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <1be6733ab2585db50cbd98fc9930a9273520ffcd.camel@chinatelecom.cn>
Subject: Re: [PATCH V7 29/29] cpr: only-cpr-capable option
From: Guoyi Tu <tugy@chinatelecom.cn>
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org, 
 tugy@chinatelecom.cn
Date: Fri, 18 Feb 2022 17:43:07 +0800
In-Reply-To: <1640199934-455149-30-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-30-git-send-email-steven.sistare@oracle.com>
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
> Add the only-cpr-capable option, which causes qemu to exit with an
> error
> if any devices that are not capable of cpr are added.  This
> guarantees that
> a cpr-exec operation will not fail with an unsupported device error.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  MAINTAINERS             |  1 +
>  chardev/char-socket.c   |  4 ++++
>  hw/vfio/common.c        |  6 ++++++
>  include/sysemu/sysemu.h |  1 +
>  migration/migration.c   |  5 +++++
>  qemu-options.hx         |  8 ++++++++
>  softmmu/globals.c       |  1 +
>  softmmu/physmem.c       |  5 +++++
>  softmmu/vl.c            | 14 +++++++++++++-
>  stubs/cpr.c             |  3 +++
>  stubs/meson.build       |  1 +
>  11 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 stubs/cpr.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index feed239..af5abc3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2998,6 +2998,7 @@ F: migration/cpr.c
>  F: qapi/cpr.json
>  F: migration/cpr-state.c
>  F: stubs/cpr-state.c
> +F: stubs/cpr.c
>  
>  Record/replay
>  M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index c111e17..a4513a7 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -34,6 +34,7 @@
>  #include "qapi/clone-visitor.h"
>  #include "qapi/qapi-visit-sockets.h"
>  #include "qemu/yank.h"
> +#include "sysemu/sysemu.h"
>  
>  #include "chardev/char-io.h"
>  #include "chardev/char-socket.h"
> @@ -1416,6 +1417,9 @@ static void qmp_chardev_open_socket(Chardev
> *chr,
>  
>      if (!s->tls_creds && !s->is_websock) {
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
> +    } else if (only_cpr_capable) {
> +        error_setg(errp, "error: socket %s is not cpr capable due to
> %s option",
> +                   chr->label, (s->tls_creds ? "TLS" :
> "websocket"));

Should the error be ignored if reopen-on-cpr is set.


>      }
>  
>      /* be isn't opened until we get a connection */
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index f2b4a81..605ffbb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -38,6 +38,7 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/sysemu.h"
>  #include "trace.h"
>  #include "qapi/error.h"
>  #include "migration/migration.h"
> @@ -1923,12 +1924,17 @@ static void
> vfio_put_address_space(VFIOAddressSpace *space)
>  static int vfio_get_iommu_type(VFIOContainer *container,
>                                 Error **errp)
>  {
> +    ERRP_GUARD();
>      int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
>                            VFIO_SPAPR_TCE_v2_IOMMU,
> VFIO_SPAPR_TCE_IOMMU };
>      int i;
>  
>      for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
>          if (ioctl(container->fd, VFIO_CHECK_EXTENSION,
> iommu_types[i])) {
> +            if (only_cpr_capable && !vfio_is_cpr_capable(container,
> errp)) {
> +                error_prepend(errp, "only-cpr-capable is specified:
> ");
> +                return -EINVAL;
> +            }
>              return iommu_types[i];
>          }
>      }
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 8fae667..6241c20 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -9,6 +9,7 @@
>  /* vl.c */
>  
>  extern int only_migratable;
> +extern bool only_cpr_capable;
>  extern const char *qemu_name;
>  extern QemuUUID qemu_uuid;
>  extern bool qemu_uuid_set;
> diff --git a/migration/migration.c b/migration/migration.c
> index 3de11ae..f08db0d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1257,6 +1257,11 @@ static bool migrate_caps_check(bool *cap_list,
>          return false;
>      }
>  
> +    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
> +        error_setg(errp, "x-colo is not compatible with -only-cpr-
> capable");
> +        return false;
> +    }
> +
>      return true;
>  }
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 1859b55..0cbf2e3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4434,6 +4434,14 @@ SRST
>      an unmigratable state.
>  ERST
>  
> +DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
> +    "-only-cpr-capable    allow only cpr capable devices\n",
> QEMU_ARCH_ALL)
> +SRST
> +``-only-cpr-capable``
> +    Only allow cpr capable devices, which guarantees that cpr-save
> and
> +    cpr-exec will not fail with an unsupported device error.
> +ERST
> +
>  DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
>      "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
>  SRST
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index 7d0fc81..a18fd8d 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -59,6 +59,7 @@ int boot_menu;
>  bool boot_strict;
>  uint8_t *boot_splash_filedata;
>  int only_migratable; /* turn it off unless user states otherwise */
> +bool only_cpr_capable;
>  int icount_align_option;
>  
>  /* The bytes in qemu_uuid are in the order specified by RFC4122,
> _not_ in the
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index e227195..e7869f8 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -47,6 +47,7 @@
>  #include "sysemu/dma.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/hw_accel.h"
> +#include "sysemu/sysemu.h"
>  #include "sysemu/xen-mapcache.h"
>  #include "trace/trace-root.h"
>  
> @@ -2010,6 +2011,10 @@ static void ram_block_add(RAMBlock *new_block,
> Error **errp)
>                  addr = file_ram_alloc(new_block, maxlen, mfd,
>                                        false, false, 0, errp);
>                  trace_anon_memfd_alloc(name, maxlen, addr, mfd);
> +            } else if (only_cpr_capable) {
> +                error_setg(errp,
> +                    "only-cpr-capable requires -machine memfd-
> alloc=on");
> +                return;
>              } else {
>                  addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>                                             shared, noreserve);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4319e1a..f14e29e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2743,11 +2743,20 @@ void qmp_x_exit_preconfig(Error **errp)
>      qemu_create_cli_devices();
>      qemu_machine_creation_done();
>  
> +    if (only_cpr_capable && !qemu_chr_is_cpr_capable(errp)) {
> +        ;    /* not reached due to error_fatal */
> +    }
> +
>      if (loadvm) {
>          load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
>      }
>      if (replay_mode != REPLAY_MODE_NONE) {
> -        replay_vmstate_init();
> +        if (only_cpr_capable) {
> +            error_setg(errp, "replay is not compatible with -only-
> cpr-capable");
> +            /* not reached due to error_fatal */
> +        } else {
> +            replay_vmstate_init();
> +        }
>      }
>  
>      if (incoming) {
> @@ -3507,6 +3516,9 @@ void qemu_init(int argc, char **argv, char
> **envp)
>              case QEMU_OPTION_only_migratable:
>                  only_migratable = 1;
>                  break;
> +            case QEMU_OPTION_only_cpr_capable:
> +                only_cpr_capable = true;
> +                break;
>              case QEMU_OPTION_nodefaults:
>                  has_defaults = 0;
>                  break;
> diff --git a/stubs/cpr.c b/stubs/cpr.c
> new file mode 100644
> index 0000000..aaa189e
> --- /dev/null
> +++ b/stubs/cpr.c
> @@ -0,0 +1,3 @@
> +#include "qemu/osdep.h"
> +
> +bool only_cpr_capable;
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 9565c7d..4c9c4ea 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -4,6 +4,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
>  stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
>  stub_ss.add(files('change-state-handler.c'))
>  stub_ss.add(files('cmos.c'))
> +stub_ss.add(files('cpr.c'))
>  stub_ss.add(files('cpr-state.c'))
>  stub_ss.add(files('cpu-get-clock.c'))
>  stub_ss.add(files('cpus-get-virtual-clock.c'))

The only-cpr-capable option is a good way to prevent qemu from starting
if some device don't support cpr. But if this option is not provided,
the user still can perform cpr-xxx operation even there are devices
don't support cpr, in this case, the exec() will fail and the original
process cannot recovery.

How about introducing a cpr blocker (as migration blocker does) to
prevent the user from performing cpr-xxx operaton to address the
problem

--
Guoyi Tu



