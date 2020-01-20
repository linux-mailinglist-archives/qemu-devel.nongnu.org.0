Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A71430C3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 18:26:30 +0100 (CET)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itaom-0002Y5-BK
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 12:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1italp-0007VE-Ua
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:23:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1itall-00018m-7h
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:23:25 -0500
Received: from relay68.bu.edu ([128.197.228.73]:44134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1itall-00018C-3U
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:23:21 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 00KHMw2f010386
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 20 Jan 2020 12:23:01 -0500
Date: Mon, 20 Jan 2020 12:22:58 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 16/20] fuzz: add configure flag --enable-fuzzing
Message-ID: <20200120172258.vps4liho355em5mz@mozz.bu.edu>
References: <20200120055410.22322-1-alxndr@bu.edu>
 <20200120055410.22322-22-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120055410.22322-22-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 128.197.228.73
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200120 0055, Bulekov, Alexander wrote:
> +if test "$fuzzing" = "yes" ; then
> +  if test "$have_fuzzer" = "yes"; then
> +    FUZZ_LDFLAGS=" -fsanitize=address,fuzzer"
> +    FUZZ_CFLAGS=" -fsanitize=address,fuzzer"
> +    CFLAGS=" -fsanitize=address,fuzzer"

This will fail when build standard qemu-system targets with ./configure
--enable-fuzzing
Instead it should be:
CFLAGS=" -fsanitize=address,fuzzer-no-link"
-Alex

