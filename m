Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9232B3B73
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 03:18:35 +0100 (CET)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keU6E-0003be-Pa
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 21:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1keU4n-000326-CJ
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 21:17:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1keU4k-00084g-1e
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 21:17:05 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZCPP3ZG5zkXlL;
 Mon, 16 Nov 2020 10:16:41 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 10:16:49 +0800
Message-ID: <5FB1E111.1060409@huawei.com>
Date: Mon, 16 Nov 2020 10:16:49 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <kraxel@redhat.com>
Subject: Re: [PATCH] usb/hcd-xhci: Fix an index-out-of-bounds in
 xhci_runtime_write and xhci_runtime_read
References: <5FA405FE.1080604@huawei.com>
In-Reply-To: <5FA405FE.1080604@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:16:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping...

On 2020/11/5 22:02, AlexChen wrote:
> Currently, the 'v' is not checked whether it is between 0 and 16,
> which may result in an out-of-bounds access to the array 'xhci->intr[]'.
> This is LP#1902112. Following is the reproducer provided in:
> -->https://bugs.launchpad.net/qemu/+bug/1902112
> 
> === Reproducer (build with --enable-sanitizers) ===
> export UBSAN_OPTIONS="print_stacktrace=1:silence_unsigned_overflow=1"
> cat << EOF | ./qemu-system-i386 -display none -machine\
>  accel=qtest, -m 512M -machine q35 -nodefaults -drive\
>  file=null-co://,if=none,format=raw,id=disk0 -device\
>  qemu-xhci,id=xhci -device usb-tablet,bus=xhci.0\
>  -device usb-bot -device usb-storage,drive=disk0\
>  -chardev null,id=cd0 -chardev null,id=cd1 -device\
>  usb-braille,chardev=cd0 -device usb-ccid -device\
>  usb-ccid -device usb-kbd -device usb-mouse -device\
>  usb-serial,chardev=cd1 -device usb-tablet -device\
>  usb-wacom-tablet -device usb-audio -qtest stdio
> outl 0xcf8 0x80000803
> outl 0xcfc 0x18caffff
> outl 0xcf8 0x80000810
> outl 0xcfc 0x555a2e46
> write 0x555a1004 0x4 0xe7b9aa7a
> EOF
> 
> === Stack Trace ===
> 
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/usb/hcd-xhci.c:3012:30 in
> ../hw/usb/hcd-xhci.c:3012:30: runtime error: index -1 out of bounds for type 'XHCIInterrupter [16]'
> #0 0x55bd2e97c8b0 in xhci_runtime_write /src/qemu/hw/usb/hcd-xhci.c:3012:30
> #1 0x55bd2edfdd13 in memory_region_write_accessor /src/qemu/softmmu/memory.c:484:5
> #2 0x55bd2edfdb14 in access_with_adjusted_size /src/qemu/softmmu/memory.c:545:18
> #3 0x55bd2edfd54b in memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
> #4 0x55bd2ed7fa46 in flatview_write_continue /src/qemu/softmmu/physmem.c:2767:23
> #5 0x55bd2ed7cac0 in flatview_write /src/qemu/softmmu/physmem.c:2807:14
> 
> This patch fixes this bug.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1902112
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/usb/hcd-xhci.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 79ce5c4be6..50abef40ad 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -2962,8 +2962,9 @@ static uint64_t xhci_runtime_read(void *ptr, hwaddr reg,
>  {
>      XHCIState *xhci = ptr;
>      uint32_t ret = 0;
> +    int v = (reg - 0x20) / 0x20;
> 
> -    if (reg < 0x20) {
> +    if (reg < 0x20 || v < 0 || v >= XHCI_MAXINTRS) {
>          switch (reg) {
>          case 0x00: /* MFINDEX */
>              ret = xhci_mfindex_get(xhci) & 0x3fff;
> @@ -2973,7 +2974,6 @@ static uint64_t xhci_runtime_read(void *ptr, hwaddr reg,
>              break;
>          }
>      } else {
> -        int v = (reg - 0x20) / 0x20;
>          XHCIInterrupter *intr = &xhci->intr[v];
>          switch (reg & 0x1f) {
>          case 0x00: /* IMAN */
> @@ -3009,14 +3009,16 @@ static void xhci_runtime_write(void *ptr, hwaddr reg,
>  {
>      XHCIState *xhci = ptr;
>      int v = (reg - 0x20) / 0x20;
> -    XHCIInterrupter *intr = &xhci->intr[v];
> +    XHCIInterrupter *intr;
>      trace_usb_xhci_runtime_write(reg, val);
> 
> -    if (reg < 0x20) {
> +    if (reg < 0x20 || v < 0 || v >= XHCI_MAXINTRS) {
>          trace_usb_xhci_unimplemented("runtime write", reg);
>          return;
>      }
> 
> +    intr = &xhci->intr[v];
> +
>      switch (reg & 0x1f) {
>      case 0x00: /* IMAN */
>          if (val & IMAN_IP) {
> 


