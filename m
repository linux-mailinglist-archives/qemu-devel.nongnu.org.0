Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA51604C3B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:53:03 +0200 (CEST)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBNO-0001kl-3n
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1olBBk-0005hu-CG
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:41:07 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1olBBh-00064b-9H
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=uXm3KIy7qR5FyHjbrMFig/bpy1L2MuakS5OE8KZENak=; b=b6UrlxSMS9bvJjlb2loARegves
 1e5Kabjgo3sewJ9CuEXVuYyb2hYCsi5w/Mo0BmE4B+w+HZUxo+SXH0/G4bTWHR2Z98v4ZY1FW+KUg
 /zSYkbB+40cf3cDmlHlNGvMbSonHpP6A2OCr/O4XWfSsPGdUZkr4lGpE5TdOKvs9H+ArcJ3SE5MeR
 DjFQtFzLWPna61h1JKKVgQfXqPz8BO3CQtUCgmtx1omwSDtfEjxzcBKYYmyfTa8OMrUd4UtsFFHvo
 X2qztTbBOoFWPtniMSRyXVrsMkCTf4/+rQAdvqgTKnS+IFmnv/BRq+6AX7zKXBHEZQ0EEGhvtKZBr
 E2msQ+ousMCLC+S5EzbGSrXEBBEtbdk0U2qDew3KgPbFWMJgO3csi1HGSDmZpOAI+j3Sf5qyQ+rcL
 IIKhyeZ3WlwI5VRSMBPwPzDvgFZvZxDJYXT9PIgb5DhaAM0znL+MWIVXMe3NTmxzRmoeKDNA1OBqQ
 ic3LaTXC7DsXuKVMpclWLKIZoNexO0qMHYL4oTZLSyFjLAo/AfoRuLUD/I9m8qANLjxhMQvWLCrny
 UWqYoySMkYGfwo2DrmL8aeY+5vPTRQLKXsLWaXyksZxXlE8TDOTMl6MTlzQEufuIhuv1gTkAwEedS
 x7S0TVh+12LfCde+8PC1CWYrDvLlaCWctlCdJaVpc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
Cc: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
Date: Wed, 19 Oct 2022 17:40:39 +0200
Message-ID: <3388065.HNbAOOnhXR@silver>
In-Reply-To: <20221018084341.16270-2-nivanov@cloudlinux.com>
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
 <20221018084341.16270-2-nivanov@cloudlinux.com>
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

On Dienstag, 18. Oktober 2022 10:43:40 CEST Nikita Ivanov wrote:
> Rename macro name to more transparent one and refactor
> it to expression.
> 
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  chardev/char-fd.c      | 2 +-
>  chardev/char-pipe.c    | 8 +++++---
>  include/qemu/osdep.h   | 8 +++++++-
>  net/tap-bsd.c          | 6 +++---
>  net/tap-linux.c        | 2 +-
>  net/tap-solaris.c      | 8 ++++----
>  net/tap.c              | 2 +-
>  os-posix.c             | 2 +-
>  tests/qtest/libqtest.c | 2 +-
>  9 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index cf78454841..d2c4923359 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags, Error **errp)
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
> +    fd_out = RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR | O_BINARY));
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
> index b1c161c035..45fcf5f2dc 100644
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

You forgot to drop the redundant type cast here. With that dropped:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> +           } while (__result == -1 && errno == EINTR);     \
> +           __result; }))
>  
>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>   * can be either signed or unsigned, so we can't just hardcode a
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 005ce05c6e..4c98fdd337 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>          } else {
>              snprintf(dname, sizeof dname, "/dev/tap%d", i);
>          }
> -        TFR(fd = open(dname, O_RDWR));
> +        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd >= 0) {
>              break;
>          }
> @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int ifname_size, Error **errp)
>      int fd, s, ret;
>      struct ifreq ifr;
>  
> -    TFR(fd = open(PATH_NET_TAP, O_RDWR));
> +    fd = RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
>          return -1;
> @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
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
>      int len = sizeof(struct virtio_net_hdr);
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
> @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
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
> @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>      if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
>          error_report("Can't assign new interface");
>  
> -    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
> +    if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap (2)");
>          return -1;
> @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>      if (ioctl (ip_fd, I_PUSH, "arp") < 0)
>          error_report("Can't push ARP module (3)");
>      /* Open arp_fd */
> -    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
> +    arp_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (arp_fd < 0)
>          error_report("Can't open %s", "/dev/tap");
>  
> diff --git a/net/tap.c b/net/tap.c
> index e203d07a12..e090d14203 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -651,7 +651,7 @@ static int net_tap_init(const NetdevTapOptions *tap, int *vnet_hdr,
>          vnet_hdr_required = 0;
>      }
>  
> -    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
> +    fd = RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
>                        mq_required, errp));
>      if (fd < 0) {
>          return -1;
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
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index b23eb3edc3..90648eb8d1 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
>      /* Skip wait if qtest_probe_child already reaped.  */
>      if (pid != -1) {
>          kill(pid, SIGTERM);
> -        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> +        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
>          assert(pid == s->qemu_pid);
>          s->qemu_pid = -1;
>      }
> 




