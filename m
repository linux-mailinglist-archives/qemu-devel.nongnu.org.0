Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26198A59B4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 16:47:25 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4nc3-0005H4-Mf
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 10:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i4na2-0004XX-Fj
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i4na0-0000FZ-Ar
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:45:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55028)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1i4nZy-0008HW-9t; Mon, 02 Sep 2019 10:45:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E10F308FB9A;
 Mon,  2 Sep 2019 14:45:10 +0000 (UTC)
Received: from localhost (ovpn-116-55.gru2.redhat.com [10.97.116.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AF0A60920;
 Mon,  2 Sep 2019 14:45:05 +0000 (UTC)
Date: Mon, 2 Sep 2019 11:45:03 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190902144503.GJ3694@habkost.net>
References: <20190902120222.6179-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902120222.6179-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 02 Sep 2019 14:45:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] x86: do not advertise die-id in
 query-hotpluggbale-cpus if '-smp dies' is not set
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
Cc: pkrempa@redhat.com, like.xu@linux.intel.com, mst@redhat.com,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 02, 2019 at 08:02:22AM -0400, Igor Mammedov wrote:
> Commit 176d2cda0 (i386/cpu: Consolidate die-id validity in smp context) added
> new 'die-id' topology property to CPUs and exposed it via QMP command
> query-hotpluggable-cpus, which broke -device/device_add cpu-foo for existing
> users that do not support die-id/dies yet. That's would be fine if it happened
> to new machine type only but it also happened to old machine types,
> which breaks migration from old QEMU to the new one, for example following CLI:
> 
>   OLD-QEMU -M pc-i440fx-4.0 -smp 1,max_cpus=2 \
>            -device qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id
> is not able to start with new QEMU, complaining about invalid die-id.
> 
> After discovering regression, the patch
>    "pc: Don't make die-id mandatory unless necessary"
> makes die-id optional so old CLI would work.
> 
> However it's not enough as new QEMU still exposes die-id via query-hotpluggbale-cpus
> QMP command, so the users that started old machine type on new QEMU, using all
> properties (including die-id) received from QMP command (as required), won't be
> able to start old QEMU using the same properties since it doesn't support die-id.
> 
> Fix it by hiding die-id in query-hotpluggbale-cpus for all machine types in case
> '-smp dies' is not provided on CLI or -smp dies = 1', in which case smp_dies == 1
> and APIC ID is calculated in default way (as it was before DIE support) so we won't
> need compat code as in both cases the topology provided to guest via CPUID is the same.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Queued on machine-next.

-- 
Eduardo

