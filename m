Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F932986C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:39:13 +0100 (CET)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1Um-00009H-Nl
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lH1Ti-0007xG-5c; Tue, 02 Mar 2021 04:38:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:30872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lH1Te-00038a-DS; Tue, 02 Mar 2021 04:38:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 64A4C7462D3;
 Tue,  2 Mar 2021 10:37:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4335874581E; Tue,  2 Mar 2021 10:37:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 41F9C7456B7;
 Tue,  2 Mar 2021 10:37:59 +0100 (CET)
Date: Tue, 2 Mar 2021 10:37:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
In-Reply-To: <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
Message-ID: <8bb2465d-9353-ca99-d98a-d91416d7f527@eik.bme.hu>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021, Alexey Kardashevskiy wrote:
> On 02/03/2021 14:35, David Gibson wrote:
>> Alexey or Zoltan, any thoughts on how non-PAPR versions of this would
>> call into qemu to get the non-guest parts of VOF to execute?
>
> Non-PAPR could do it as we do it for soft breakpoints in KVM - some 
> predefined illegal instruction which KVM knows that it is used for soft 
> breakpoints.

So far I've thought I'd need to implement TYPE_PPC_VIRTUAL_HYPERVISOR 
interface in the machine for the code in target/ppc/excp_helper.c to 
forward client syscalls to QEMU where I could handle the VOF related calls 
but not sure this is the best way. This could be OK for the initial boot 
when nothing else should use syscalls yet but with RTAS this may not work 
as the guest OS could also use syscalls so to avoid conflicts we may need 
to shut down the virtual hypervisor on quiesce which means I may need a 
minimal guest only rtas for pegasos2 (which would be OK as I think it's 
only used for shutdown/reboot anyway). Also may need some changes to allow 
empty callbacks in vhyp to be ignored when I only want to implement 
hypercall method but that's just adding checks to only call non-NULL 
callbacks in PPCVirtualHypervisorClass.

There's also an old patch from Benjamin Herrenschmidt to add MOL OSI which 
is a similar hypercall interface:
https://github.com/ozbenh/qemu/commit/6dc8803641e323030ffd01ad8ce0dcf081896698
This might also be useful later to use MOL paravirtual drivers to speed up 
MacOSX emulation. but I haven't looked at the details yet.

Any other ideas?

Regards,
BALATON Zoltan

