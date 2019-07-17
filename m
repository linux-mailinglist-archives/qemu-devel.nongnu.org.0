Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D506BA78
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 12:41:55 +0200 (CEST)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnhNi-0000UN-CP
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 06:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57589)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hnhNU-0008Oc-SI
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 06:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hnhNT-0005OP-Qk
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 06:41:40 -0400
Received: from 6.mo68.mail-out.ovh.net ([46.105.63.100]:47937)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hnhNT-0005NM-Ik
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 06:41:39 -0400
Received: from player714.ha.ovh.net (unknown [10.109.146.240])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 30EA713C7D7
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 12:41:37 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 33EA77F51E3C;
 Wed, 17 Jul 2019 10:41:32 +0000 (UTC)
Date: Wed, 17 Jul 2019 12:41:31 +0200
From: Greg Kurz <groug@kaod.org>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-ID: <20190717124131.02857a72@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <156335156198.82682.8756968724044750843.stgit@lep8c.aus.stglabs.ibm.com>
References: <156335150620.82682.9535735857478533420.stgit@lep8c.aus.stglabs.ibm.com>
 <156335156198.82682.8756968724044750843.stgit@lep8c.aus.stglabs.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18113477701493758293
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieefgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.100
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v2 1/4] ppc: fix memory leak in
 spapr_caps_add_properties
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Jul 2019 03:19:43 -0500
Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:

> Free the capability name string after setting
> the capability.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_caps.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index bbb001f84a..0263c78d69 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -778,7 +778,7 @@ void spapr_caps_add_properties(SpaprMachineClass *smc, Error **errp)
>  
>      for (i = 0; i < ARRAY_SIZE(capability_table); i++) {
>          SpaprCapabilityInfo *cap = &capability_table[i];
> -        const char *name = g_strdup_printf("cap-%s", cap->name);
> +        char *name = g_strdup_printf("cap-%s", cap->name);
>          char *desc;
>  
>          object_class_property_add(klass, name, cap->type,
> @@ -786,11 +786,13 @@ void spapr_caps_add_properties(SpaprMachineClass *smc, Error **errp)
>                                    NULL, cap, &local_err);
>          if (local_err) {
>              error_propagate(errp, local_err);
> +            g_free(name);
>              return;
>          }
>  
>          desc = g_strdup_printf("%s", cap->description);
>          object_class_property_set_description(klass, name, desc, &local_err);
> +        g_free(name);
>          g_free(desc);
>          if (local_err) {
>              error_propagate(errp, local_err);
> 
> 


