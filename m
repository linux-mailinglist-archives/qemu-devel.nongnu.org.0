Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C9B70F9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 03:27:52 +0200 (CEST)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAlEd-0001mf-AV
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 21:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iAlCk-0000DE-LV
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 21:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iAlCi-0006V1-LU
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 21:25:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iAlCi-0006Ud-D9
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 21:25:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 76FA885539;
 Thu, 19 Sep 2019 01:25:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-8.rdu2.redhat.com [10.10.123.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6214600CC;
 Thu, 19 Sep 2019 01:25:44 +0000 (UTC)
Date: Wed, 18 Sep 2019 21:25:42 -0400
From: Cleber Rosa <crosa@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20190919012542.GC23168@localhost.localdomain>
References: <20190918070654.19356-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918070654.19356-1-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 19 Sep 2019 01:25:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RESEND PATCH] tests/acceptance: Specify arch for
 QueryCPUModelExpansion
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
Cc: philmd@redhat.com, ehabkost@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 18, 2019 at 05:06:54PM +1000, David Gibson wrote:
> At the moment this test runs on whatever the host arch is.  But it looks
> for 'unavailable-features' which is an x86 specific cpu property.  Tag it
> to always use qemu-system-x86_64.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/cpu_queries.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> I sent this a while back, but it seems to have been forgotten.  As far
> as I can tell the current logic is Just Plain Wrong, on any host other
> than x86.
> 
> diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
> index e71edec39f..af47d2795a 100644
> --- a/tests/acceptance/cpu_queries.py
> +++ b/tests/acceptance/cpu_queries.py
> @@ -18,6 +18,9 @@ class QueryCPUModelExpansion(Test):
>      """
>  
>      def test(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
>          self.vm.set_machine('none')
>          self.vm.add_args('-S')
>          self.vm.launch()
> -- 
> 2.21.0
> 

I've queued on my python-next branch.

Reviewed-by: Cleber Rosa <crosa@redhat.com>

