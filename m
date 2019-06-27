Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E9580C6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 12:49:00 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgRxa-000574-FR
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 06:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53344)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hgRvd-0004T6-Rn
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hgRvc-0001J5-S6
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:46:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20264)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hgRvZ-0001Fs-Qx; Thu, 27 Jun 2019 06:46:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5695EC1EB214;
 Thu, 27 Jun 2019 10:46:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10DA45D9E2;
 Thu, 27 Jun 2019 10:46:40 +0000 (UTC)
Date: Thu, 27 Jun 2019 12:46:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 27 Jun 2019 10:46:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 26, 2019 at 06:56:54PM +0200, Auger Eric wrote:
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index f500ccb6d31b..b7b719dba57f 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5324,7 +5324,16 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  
> >      /* Bits other than [3:0] are RAZ/WI.  */
> >      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> > -    raw_write(env, ri, value & 0xf);
> > +    value &= 0xf;
> > +
> > +    if (value) {
> > +        /* get next vq that is smaller than or equal to value's vq */
> > +        uint32_t vq = value + 1;
> > +        vq = arm_cpu_vq_map_next_smaller(cpu, vq + 1);
> > +        value = vq - 1;
> spec says:
> 
> "if an unsupported vector length is requested in ZCR_ELx, the
> implementation is required to select the largest
> supported vector length that is less than the requested length. This
> does not alter the value of ZCR_ELx.LEN.
> "
> 
> So I understand the value written in the reg should not be unmodified.
>

Sorry, I can't parse what you're trying to tell me here. Here we have
to write 'value', because that's what the guest is trying to do. As the
spec says in your quote, we have to pick the length the guest wants, or
the next smaller valid one, so that's what the code above does. So are
you just stating that you agree with this hunk of the code?

Thanks,
drew

