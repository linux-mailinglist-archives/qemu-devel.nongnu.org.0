Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AE315063
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:38:33 +0100 (CET)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TDs-0007Gy-LU
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l9TCX-0006OW-Vg
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:37:09 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l9TCS-0007kM-NJ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=PfVCxfK4e1hH1UX4uZsYEoADiL4z3P+h+/YpvyIN7yI=; b=UkonFoJIFqUKDnLu2L43uBbreF
 ZfuyiQGp1oikfY5079U2ZqqO/dk6U7e4mIc7+3RG4eg39Z6ifDzRBJ7VWlM+YjkpyFxcgED5SNTfn
 HnGohVFxuyt763+gcdjdPpyjYl6o70Pap9SHXGFUCKVAC3fbEA2BcxcF7pCOiB8UOyK5nuHwaL4VL
 s1LKPkY6Lp7GGAHEiId+ZVH0BVCbJH//uZZjQmJWGllXpctqs4VhBsPZhxgVi8xHbEYSngL8YP+D6
 JKdoZ0Ge/LFFx+J1ge2ltBbR2hhu39/R3pAdGiDtFAyt5kgRpd03bSEAeRr1GTk+4t0rkL7hzipM4
 eCw6m9h5L3oc+v71+394/IVv4IoJY6Xgz/KHmushYpWcOF4yEqNfd6/wc01MvBPZAEQVx9g4Ualo9
 g0fPCLDwpRLaUlBNSScfMq8kggIaWZXW8q1LjkGTyesphydhfZGgsjUNVZe/qVhTnhe+IbV7JUUTY
 JK6MSIC5yOrZ4yAdg6rLzY0RU8L94PUiV8842nbVzT6CAyQy9vJxCBr8klYL4kOTlrUH/r5mmbR72
 Y1PV16QJaYUKuYiPYzuzl/v+5cSYA/SSLzqQozr9jY2OHt4fh0jeQqSbuQeNzKblM/Rl8dutZB1LO
 FQLxhqZzVNG/cMkL/Wj52ORNBkY2TmEVBPKjCD3bg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/5] libqos/qgraph_internal: add qos_printf() and
 qos_printf_literal()
Date: Tue, 09 Feb 2021 14:36:59 +0100
Message-ID: <2332542.Y7J5JqHEnN@silver>
In-Reply-To: <834a4045-1e13-95d7-a6fb-0fb47d14b2d7@redhat.com>
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
 <653a5ef61c5e7d160e4d6294e542c57ea324cee4.1611704181.git.qemu_oss@crudebyte.com>
 <834a4045-1e13-95d7-a6fb-0fb47d14b2d7@redhat.com>
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

On Donnerstag, 28. Januar 2021 11:13:27 CET Thomas Huth wrote:
> On 27/01/2021 00.04, Christian Schoenebeck wrote:
> > These two are macros wrapping regular printf() call. They are intended
> > to be used instead of calling printf() directly in order to avoid
> > breaking TAP output format.
> > 
> > TAP output format is enabled by using --tap command line argument.
> > Starting with glib 2.62 it is enabled by default.
> > 
> > Unfortunately there is currently no public glib API available to check
> > whether TAP output format is enabled. For that reason qos_printf()
> > simply always prepends a '#' character for now.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >   tests/qtest/libqos/qgraph_internal.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/tests/qtest/libqos/qgraph_internal.h
> > b/tests/qtest/libqos/qgraph_internal.h index 974985dce9..c0025f5ab9
> > 100644
> > --- a/tests/qtest/libqos/qgraph_internal.h
> > +++ b/tests/qtest/libqos/qgraph_internal.h
> > @@ -255,4 +255,15 @@ void qos_delete_cmd_line(const char *name);
> > 
> >    */
> >   
> >   void qos_graph_node_set_availability(const char *node, bool av);
> > 
> > +/*
> > + * Prepends a '#' character in front for not breaking TAP output format.
> > + */
> > +#define qos_printf(...) printf("# " __VA_ARGS__)
> > +
> > +/*
> > + * Intended for printing something literally, i.e. for appending text as
> > is + * to a line already been started by qos_printf() before.
> > + */
> > +#define qos_printf_literal printf
> 
> I'd maybe rather name it qos_printf_append ... but that's just a matter of
> taste.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

PING

Best regards,
Christian Schoenebeck



