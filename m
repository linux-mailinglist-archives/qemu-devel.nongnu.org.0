Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245F1F64A6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 11:23:55 +0200 (CEST)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjJRC-0002MF-Gs
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 05:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1jjJQK-0001r8-5M
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 05:23:00 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25631
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1jjJQJ-0002ig-AD
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 05:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591867378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SOign7aM3DN6WwjcQ2ZwX1fFhVD00M+FxXDvrfnmeYo=;
 b=fKWZVZpwEteKWS/SKWxN+kqooN06+P1uIYpn6ZFfivmh2Ohq0R3Llo/ZfGJ0vbJ4Fv6rHB
 GCT01UdGSCdK8QDp+7amBdGn34o14rNwnhh62bjfQnHVNLijsU2EMpGTPZ1IQTjZSC16DU
 PfGK0KNzArZfa1yTxgHkQxVtQSDC3I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-KwslGrjfP-ObqI8spx7J0g-1; Thu, 11 Jun 2020 05:22:56 -0400
X-MC-Unique: KwslGrjfP-ObqI8spx7J0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA82C107ACCD;
 Thu, 11 Jun 2020 09:22:55 +0000 (UTC)
Received: from [10.36.113.1] (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 068737FCF9;
 Thu, 11 Jun 2020 09:22:53 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] spapr: Forbid nested KVM-HV in pre-power9 compat
 mode
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <159186635896.48605.3457464705220760573.stgit@bahia.lan>
 <159186660803.48605.11792415961949917926.stgit@bahia.lan>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <11c1f62d-c258-d338-b5a6-e42f5ce5295f@redhat.com>
Date: Thu, 11 Jun 2020 11:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159186660803.48605.11792415961949917926.stgit@bahia.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/2020 11:10, Greg Kurz wrote:
> Nested KVM-HV only works on POWER9.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/ppc/spapr_caps.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 2cb7ba8f005a..e86a7c350444 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -409,6 +409,8 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
>                                      uint8_t val, Error **errp)
>  {
>      ERRP_AUTO_PROPAGATE();
> +    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
> +
>      if (!val) {
>          /* capability disabled by default */
>          return;
> @@ -418,6 +420,14 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
>          error_setg(errp, "No Nested KVM-HV support in TCG");
>          error_append_hint(errp, "Try appending -machine cap-nested-hv=off\n");
>      } else if (kvm_enabled()) {
> +        if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
> +                              spapr->max_compat_pvr)) {
> +            error_setg(errp, "Nested KVM-HV only supported on POWER9");
> +            error_append_hint(errp,
> +                              "Try appending -machine max-cpu-compat=power9\n");
> +            return;
> +        }
> +
>          if (!kvmppc_has_cap_nested_kvm_hv()) {
>              error_setg(errp,
>                         "KVM implementation does not support Nested KVM-HV");
> 
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


