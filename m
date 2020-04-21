Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911EF1B29ED
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 16:33:45 +0200 (CEST)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQty4-0004ym-6s
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 10:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jQtwP-0004Xk-Ox
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 10:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jQtwO-0001Yp-TD
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 10:32:01 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:44328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jQtwO-0001Uz-Gq
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 10:32:00 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o139so7416485ybc.11
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WwEo6nIIuucBzY59Z8eeDYudjPrSpXnXgvcRUvBkjCk=;
 b=UqgY4r6G0FqT3fDppH7W1Qb3cpqchRu7QrBgvornSj4XT21TZ1cK/BFsBrv44M4cFf
 3j/BicP+NV0QIBleLgIr4m3SwN/OodYj9f4t4FRAItAi5r+NqyqiYeCkjb3cb0ODqqwN
 ygiqg3EG4hrHw3mNvmdoj+i6w8e1wmpkIjX5GjcO3qfQzYmyjHw+z1s4xbMwnz7xY/ci
 rezAWY/yEkvfqLNTJKdinb5BRLRqdVCsy4pOmWiTTvPF6HkXEjAoF+7SSb5tTeQBMkET
 UqlHg7s9QmAXpcb7BwJ+slJk0R5RCpEjkx1YB/axS17JT79Puk0QMn0uJk06TtGpddP+
 TVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WwEo6nIIuucBzY59Z8eeDYudjPrSpXnXgvcRUvBkjCk=;
 b=KONEUd/04lKCOLKziAJLcwCjyFq/PkrzFn8cZ/XiDFhsHIh1ksN2WQ8gSBxz8oR/9e
 5HCfbecXRLfxH+2zmYChNX03JsmgRW3EuZiylu66RGncm3Ikn/kf4pD99VJFMDDAPuGY
 nzCv4uiL49BpQBxgYPSqHa2Om+T9OuXzoCZbdgvWBi9gqIMvtIjXX3EYpvb/s/4B3LML
 d0A3qJHGWvcVgU2ezuj9Kq511IpzUIzd3mYCRmW/Bl+ctwooX0EU8daJexY6GULfVMPc
 pOJ0R+DbEFcvDH4Ai2Vuir2n1cq/FuyA0ramrEpl00HTZkl8eWUjdQTDnWgQvD5+Eseq
 hVXw==
X-Gm-Message-State: AGi0PuaApyXAbyS2x23ob3uPYqUUIOLFCSLic4QoWr/wAEZ4ozTsFQci
 P3/ssxrq553v020mN8OAI9OQCAlWGrs+lDyr5fE=
X-Google-Smtp-Source: APiQypJXmIHwhRZgpwbKcZ6uVtrrHq1yQrQLCPxxyTX0RUlRa6mIoynSMQMNSkgZMZPMnJ3z4Wsq9QAWKjk4YC6Jbi8=
X-Received: by 2002:a25:d646:: with SMTP id n67mr26662008ybg.65.1587479519158; 
 Tue, 21 Apr 2020 07:31:59 -0700 (PDT)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Apr 2020 22:31:48 +0800
Message-ID: <CAEUhbmUuRCDWMKZdgNNX43G4wfLvzgHcMuT=36JO_q8LnAVisg@mail.gmail.com>
Subject: hw/net/cadence_gem: TX checksum offload does not work for fragmented
 packets
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Jason Wang <jasowang@redhat.com>, 
 "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
 John Linn <john.linn@xilinx.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::b35
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The cadence_gem does the TX checksum offload by:

                /* Is checksum offload enabled? */
                if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
                    net_checksum_calculate(tx_packet, total_bytes);
                }

However this will only work for non-fragmented packets. For fragmented
packets, it just corrupts the packets by inserting wrong checksum to
the fist fragment, or corrupts the data to be sent in other fragments
than the first one.

Any idea of how to solve this cleanly?

Regards,
Bin

