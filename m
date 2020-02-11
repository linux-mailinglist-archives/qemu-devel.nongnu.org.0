Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233001594B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 17:21:45 +0100 (CET)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1YIB-0005Ab-OC
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 11:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1j1YHJ-0004RQ-PR
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1j1YHI-0004KN-EU
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:20:49 -0500
Received: from relay64.bu.edu ([128.197.228.104]:35963)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1j1YHI-0004JZ-BJ
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:20:48 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 01BGJmCf006587
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 11 Feb 2020 11:19:51 -0500
Date: Tue, 11 Feb 2020 11:19:48 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [PATCH v8 15/21] fuzz: add support for qos-assisted fuzz targets
Message-ID: <20200211161948.dbp2bsl6dkl5unl2@mozz.bu.edu>
References: <20200129053357.27454-1-alxndr@bu.edu>
 <20200129053357.27454-16-alxndr@bu.edu>
 <20200205131825.lxmr7pqbpzyw47bf@starbug-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205131825.lxmr7pqbpzyw47bf@starbug-mbp>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 128.197.228.104
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

On 200205 1318, Darren Kenny wrote:
> On Wed, Jan 29, 2020 at 05:34:24AM +0000, Bulekov, Alexander wrote:
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > <snip>
> > +    return allocate_objects(qts, current_path + 1, p_alloc);
> > +}
> > +
> > +static const char *qos_build_main_args(void)
> > +{
> > +    char **path = fuzz_path_vec;
> 
> Is it possible that fuzz_path_vec is not valid here? Specifically,
> how likely is it that walk_path() won't ever set it, or that it
> results in a possible previous value being used since we don't reset
> it before calling qos_graph_foreach_test_path() in
> qos_get_cmdline().

Hi Darren,
Maybe this can happen if the target doesn't support a particular device.
I added a check
-Alex
> Thanks,
> 
> Darren.
> 

