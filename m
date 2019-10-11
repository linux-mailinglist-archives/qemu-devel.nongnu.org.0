Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FBD3815
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 05:55:12 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIm1H-0005lM-IB
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 23:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iIm0L-0005LC-13
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 23:54:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iIm0K-0003uC-3Y
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 23:54:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48426)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iIm0J-0003u5-UR
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 23:54:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 050ED8372F0;
 Fri, 11 Oct 2019 03:54:11 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18D4360BE1;
 Fri, 11 Oct 2019 03:54:07 +0000 (UTC)
Date: Fri, 11 Oct 2019 00:54:06 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Moger, Babu" <Babu.Moger@amd.com>
Subject: Re: [Qemu-devel] [RFC 2 PATCH 03/16] hw/i386: Introduce
 X86CPUTopoInfo to contain topology info
Message-ID: <20191011035406.GF29387@habkost.net>
References: <156779689013.21957.1631551572950676212.stgit@localhost.localdomain>
 <156779711572.21957.10722611828264773686.stgit@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156779711572.21957.10722611828264773686.stgit@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 11 Oct 2019 03:54:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ssg.sos.staff" <ssg.sos.staff@amd.com>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 06, 2019 at 07:11:57PM +0000, Moger, Babu wrote:
> This is an effort to re-arrange few data structure for better
> readability. Add X86CPUTopoInfo which will have all the topology
> informations required to build the cpu topology. There is no
> functional changes.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
[...]
> +typedef struct X86CPUTopoInfo {
> +    unsigned numa_nodes;
> +    unsigned nr_sockets;
> +    unsigned nr_dies;
> +    unsigned nr_cores;
> +    unsigned nr_threads;
> +} X86CPUTopoInfo;

With more complex topologies, the meaning of each of those fields
may be ambiguous.  e.g.: is nr_cores cores per die, cores per
ccx, or cores per socket?  Maybe we should use this opportunity
to use more explicit names like threads_per_core, cores_per_die,
dies_per_socket.

-- 
Eduardo

