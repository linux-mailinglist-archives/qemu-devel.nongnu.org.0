Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89C6D382B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 06:00:23 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIm6I-0007wc-T1
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 00:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iIm5B-0007Xg-9m
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 23:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iIm5A-0006h7-7a
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 23:59:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34730)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iIm5A-0006gr-2N
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 23:59:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AFD29309265B;
 Fri, 11 Oct 2019 03:59:10 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1A9710013D9;
 Fri, 11 Oct 2019 03:59:07 +0000 (UTC)
Date: Fri, 11 Oct 2019 00:59:06 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Moger, Babu" <Babu.Moger@amd.com>
Subject: Re: [Qemu-devel] [RFC 2 PATCH 13/16] machine: Add new epyc property
 in PCMachineState
Message-ID: <20191011035906.GH29387@habkost.net>
References: <156779689013.21957.1631551572950676212.stgit@localhost.localdomain>
 <156779718791.21957.9675425538561156773.stgit@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156779718791.21957.9675425538561156773.stgit@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 11 Oct 2019 03:59:10 +0000 (UTC)
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

On Fri, Sep 06, 2019 at 07:13:09PM +0000, Moger, Babu wrote:
> Adds new epyc property in PCMachineState and also in MachineState.
> This property will be used to initialize the mode specific handlers
> to generate apic ids.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
[...]
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 12eb5032a5..0001d42e50 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -299,6 +299,8 @@ struct MachineState {
>      AccelState *accelerator;
>      CPUArchIdList *possible_cpus;
>      CpuTopology smp;
> +    bool epyc;
> +

This won't scale at all when we start adding new CPU models with
different topology constraints.

I still have hope we can avoid having separate set of topology ID
functions (see my reply to "hw/386: Add new epyc mode topology
decoding functions").  But if we really have to create separate
functions, we can make them part of the CPU model table, not a
boolean machine property.

-- 
Eduardo

