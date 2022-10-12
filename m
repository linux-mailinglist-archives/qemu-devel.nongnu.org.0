Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE05FC917
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:22:19 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieUs-0004MH-AQ
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oieHk-0006zU-QC
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:08:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oieHi-00067p-FY
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ahBEq+M0LZDi6UusmKW5TuNFr/Fezrp/bL5umyxDA5Q=; b=MBQ1CK7+KALdMV3TkeD8jPB8M9
 EUfeYlwQxSfqKH30FjmgWxoIU7pVndz2aHPuMBKmWpFUiNRKD/CHkNbpGDf8a3n9bd7n27U+9//SR
 LGqaqQPdlWbpnStATUEoVcpAXWKr1+UHl82/IUVhveufgijnmUBeeacOhQm89+p6GkP9pELlzHuwz
 iukqZb7dTqQY8zMWyI7B2FZWnsnPiA0dnFWN7PBKbRbvA+jksMrCuzDCmSay9ev80pCGFubIqsphl
 kj6HXD2WWP3Ib8BoVQekaUD0dBDoHxNIK5GgEXrVfZL1M3q6jkvtBBIzafGF1RrM+AoIPlY8xYEPV
 7OjoQK1mqFC3XbiwZQS0rsnXaxv3UQIsOcsQjK+HP843c87O83To2zgwDyGzbFskDTHWYHwg3Wtxv
 Qkydj0/9VS9jYXAKhrfgEojMg9+veWAanWihLNJKn4k62IyDsSdNYjfYpNNkvm1I43AwvgK/xvuWv
 4pCwvYfEIT9McSQfi0c1bvAUHGtQbiW0dDiZQpy8lvc+UFtxDDg2JrHAsz3PpdePpuhuLvlIAFhy/
 ThbkLQIs9IDas4ReEVmPecwDqqKpvDRVUg1Ujz6c5meeU3LmPl2DAlYq33z3OnuCCOz3aOAgNWEAY
 aUJHKR4043unWk1EIqdZXepkNEUNLWOnkTFsv1NN8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
Date: Wed, 12 Oct 2022 18:08:39 +0200
Message-ID: <3046525.4nXOIBtuzV@silver>
In-Reply-To: <CAAJ4Ao-4+a4UtWKf0XyrQ6kQD8EsyDbn3H5O=R2DdzP76VSdZQ@mail.gmail.com>
References: <CAAJ4Ao-4+a4UtWKf0XyrQ6kQD8EsyDbn3H5O=R2DdzP76VSdZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 12. Oktober 2022 14:28:23 CEST Nikita Ivanov wrote:
> Rename macro name to more transparent one and refactor
> it to expression.
> 
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  chardev/char-fd.c    | 2 +-
>  chardev/char-pipe.c  | 8 +++++---
>  include/qemu/osdep.h | 8 +++++++-
>  net/tap-bsd.c        | 6 +++---
>  net/tap-linux.c      | 2 +-
>  net/tap-solaris.c    | 8 ++++----
>  os-posix.c           | 2 +-
>  7 files changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index cf78454841..d2c4923359 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
> Error **errp)
>  {
>      int fd = -1;
> 
> -    TFR(fd = qemu_open_old(src, flags, 0666));
> +    fd = RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));
>      if (fd == -1) {
>          error_setg_file_open(errp, errno, src);
>      }
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 66d3b85091..5ad30bcc59 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
> 
>      filename_in = g_strdup_printf("%s.in", filename);
>      filename_out = g_strdup_printf("%s.out", filename);
> -    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
> -    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
> +    fd_in = RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR | O_BINARY));
> +    fd_out = RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR |
> O_BINARY));
>      g_free(filename_in);
>      g_free(filename_out);
>      if (fd_in < 0 || fd_out < 0) {
> @@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
>          if (fd_out >= 0) {
>              close(fd_out);
>          }
> -        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
> +        fd_in = fd_out = RETRY_ON_EINTR(
> +            qemu_open_old(filename, O_RDWR | O_BINARY)
> +        );
>          if (fd_in < 0) {
>              error_setg_file_open(errp, errno, filename);
>              return;
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..a470905475 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
>  #define ESHUTDOWN 4099
>  #endif
> 
> -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> +#define RETRY_ON_EINTR(expr) \
> +    (__extension__                                          \
> +        ({ typeof(expr) __result;                               \
> +           do {                                             \
> +                __result = (typeof(expr)) (expr);         \

Not a big deal, but as Peter already pointed out in previous version: you 
could drop the type cast in this particular form here.

glibc's TEMP_FAILURE_RETRY() version needs the cast as it uses `long int` as 
hard coded type for the result variable, whereas this version here uses a 
generic approach by declaring the result variable already exactly with the 
type the passed expression evaluates to, so the cast is redundant in this 
version here.

> +           } while (__result == -1L && errno == EINTR);     \
> +           __result; }))
> 
>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>   * can be either signed or unsigned, so we can't just hardcode a
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 005ce05c6e..4c98fdd337 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
> } else {
>              snprintf(dname, sizeof dname, "/dev/tap%d", i);
>          }
> -        TFR(fd = open(dname, O_RDWR));
> +        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd >= 0) {
>              break;
>          }
> @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
> ifname_size, Error **errp)
>      int fd, s, ret;
>      struct ifreq ifr;
> 
> -    TFR(fd = open(PATH_NET_TAP, O_RDWR));
> +    fd = RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
>          return -1;
> @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>      if (ifname[0] != '\0') {
>          char dname[100];
>          snprintf(dname, sizeof dname, "/dev/%s", ifname);
> -        TFR(fd = open(dname, O_RDWR));
> +        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd < 0 && errno != ENOENT) {
>              error_setg_errno(errp, errno, "could not open %s", dname);
>              return -1;
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 304ff45071..f54f308d35 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
> int len = sizeof(struct virtio_net_hdr);
>      unsigned int features;
> 
> -    TFR(fd = open(PATH_NET_TUN, O_RDWR));
> +    fd = RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
>          return -1;
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index a44f8805c2..38e15028bf 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error
> **errp)
>      if( ip_fd )
>         close(ip_fd);
> 
> -    TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
> +    ip_fd = RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
>      if (ip_fd < 0) {
>          error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
>          return -1;
>      }
> 
> -    TFR(tap_fd = open("/dev/tap", O_RDWR, 0));
> +    tap_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (tap_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap");
>          return -1;
> @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
> **errp)
>      if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
>          error_report("Can't assign new interface");
> 
> -    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
> +    if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap (2)");
>          return -1;
> @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
> **errp)
>      if (ioctl (ip_fd, I_PUSH, "arp") < 0)
>          error_report("Can't push ARP module (3)");
>      /* Open arp_fd */
> -    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
> +    arp_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (arp_fd < 0)
>          error_report("Can't open %s", "/dev/tap");
> 
> diff --git a/os-posix.c b/os-posix.c
> index 321fc4bd13..bb27f67bac 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -266,7 +266,7 @@ void os_setup_post(void)
>              error_report("not able to chdir to /: %s", strerror(errno));
>              exit(1);
>          }
> -        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
> +        fd = RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
>          if (fd == -1) {
>              exit(1);
>          }
> --
> 2.37.3




