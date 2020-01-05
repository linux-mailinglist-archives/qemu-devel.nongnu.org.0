Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF501309C1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jan 2020 20:57:39 +0100 (CET)
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioC1q-0002d7-QP
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 14:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1ioC0t-0002DK-PI
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 14:56:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1ioC0s-0008V3-0m
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 14:56:38 -0500
Received: from relay68.bu.edu ([128.197.228.73]:45371)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1ioC0q-0008Pf-Gl
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 14:56:37 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 005JtjVg026994
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 5 Jan 2020 14:55:48 -0500
Date: Sun, 5 Jan 2020 14:55:44 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 12/21] libqtest: add in-process qtest.c tx/rx handlers
Message-ID: <20200105195544.rysht5cz43fzppwz@mozz.bu.edu>
References: <20191129213424.6290-1-alxndr@bu.edu>
 <20191129213424.6290-13-alxndr@bu.edu>
 <20200103111518.GG130240@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103111518.GG130240@stefanha-x1.localdomain>
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
Cc: Thomas Huth <thuth@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200103 1115, Stefan Hajnoczi wrote:
> On Fri, Nov 29, 2019 at 09:34:47PM +0000, Oleinik, Alexander wrote:
> > +QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
> > +                    void (*send)(void*, const char*))
> > +{
> > +    QTestState *qts;
> > +    qts = g_new0(QTestState, 1);
> > +    *s = qts; /* Expose qts early on, since the query endianness relies on it */
> > +    qts->wstatus = 0;
> > +    for (int i = 0; i < MAX_IRQ; i++) {
> > +        qts->irq_level[i] = false;
> > +    }
> > +
> > +    qtest_client_set_rx_handler(qts, qtest_client_inproc_recv_line);
> > +
> > +    /* send() may not have a matching protoype, so use a type-safe wrapper */
> > +    qts->ops.external_send = send;
> > +    qtest_client_set_tx_handler(qts, send_wrapper);
> > +
> > +    qts->big_endian = qtest_query_target_endianness(qts);
> > +    gchar *bin_path = g_strconcat("/qemu-system-", arch, NULL);
> > +    setenv("QTEST_QEMU_BINARY", bin_path, 0);
> > +    g_free(bin_path);
> 
> Is this a dummy path that is needed to make other code happy?  Or does
> the user need to have an actual file at /qemu-system-ARCH?

Yes - with the inproc mode this is only needed to make qtest_get_arch
happy, which simply returns the suffix of the env variable. Standard
qtest initialization relies on it in qtest_init_without_qmp_handshake,
but that function is not used by the fuzzer.

