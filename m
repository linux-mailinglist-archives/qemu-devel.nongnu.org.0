Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F0E54DCEF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:31:23 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1kuP-0008C8-Dt
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1kqN-0006bZ-3k
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1kqJ-00022t-Gm
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwnhXL7dpMi8TBVUXxhDBIX6YKSBeLjo0qu+1e/iHSQ=;
 b=ibh8f7mS8tv58QJeodA2OPZNg2VII5kgiSkpBVnCVuIhhgXLF7VWC71iPLGmKfAlCFvUKA
 s3RB9+BRqRfTL/UFQsYNsGBsO2MUJ0HSemGuwtYCLtD17zo0dtuzpsYN1sR41qE3X8Rt2p
 yg8p4wojqejL/nX6v4A6dd8rgvOtQxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-KyU08PwRPPmV60KLXS6kzg-1; Thu, 16 Jun 2022 04:27:05 -0400
X-MC-Unique: KyU08PwRPPmV60KLXS6kzg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A23A03817A6B;
 Thu, 16 Jun 2022 08:27:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E950492CA5;
 Thu, 16 Jun 2022 08:27:03 +0000 (UTC)
Date: Thu, 16 Jun 2022 09:27:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>,
 Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
Message-ID: <YqrpVRJazpbMz/HE@redhat.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqoMMCbF3PBnYSn/@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 05:43:28PM +0100, Daniel P. Berrangé wrote:
> On Fri, Jun 10, 2022 at 05:58:31PM +0530, manish.mishra wrote:
> > 
> > On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
> > > On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
> > > > As of now, the multi-FD feature supports connection over the default network
> > > > only. This Patchset series is a Qemu side implementation of providing multiple
> > > > interfaces support for multi-FD. This enables us to fully utilize dedicated or
> > > > multiple NICs in case bonding of NICs is not possible.
> > > > 
> > > > 
> > > > Introduction
> > > > -------------
> > > > Multi-FD Qemu implementation currently supports connection only on the default
> > > > network. This forbids us from advantages like:
> > > > - Separating VM live migration traffic from the default network.
> > 
> > Hi Daniel,
> > 
> > I totally understand your concern around this approach increasing compexity inside qemu,
> > 
> > when similar things can be done with NIC teaming. But we thought this approach provides
> > 
> > much more flexibility to user in few cases like.
> > 
> > 1. We checked our customer data, almost all of the host had multiple NIC, but LACP support
> > 
> >     in their setups was very rare. So for those cases this approach can help in utilise multiple
> > 
> >     NICs as teaming is not possible there.
> 
> AFAIK,  LACP is not required in order to do link aggregation with Linux.
> Traditional Linux bonding has no special NIC hardware or switch requirements,
> so LACP is merely a "nice to have" in order to simplify some aspects.
> 
> IOW, migration with traffic spread across multiple NICs is already
> possible AFAICT.
> 
> I can understand that some people may not have actually configured
> bonding on their hosts, but it is not unreasonable to request that
> they do so, if they want to take advantage fo aggrated bandwidth.
> 
> It has the further benefit that it will be fault tolerant. With
> this proposal if any single NIC has a problem, the whole migration
> will get stuck. With kernel level bonding, if any single NIC haus
> a problem, it'll get offlined by the kernel and migration will
> continue to  work across remaining active NICs.
> 
> > 2. We have seen requests recently to separate out traffic of storage, VM netwrok, migration
> > 
> >     over different vswitch which can be backed by 1 or more NICs as this give better
> > 
> >     predictability and assurance. So host with multiple ips/vswitches can be very common
> > 
> >     environment. In this kind of enviroment this approach gives per vm or migration level
> > 
> >     flexibilty, like for critical VM we can still use bandwidth from all available vswitch/interface
> > 
> >     but for normal VM they can keep live migration only on dedicated NICs without changing
> > 
> >     complete host network topology.
> > 
> >     At final we want it to be something like this [<ip-pair>, <multiFD-channels>, <bandwidth_control>]
> > 
> >     to provide bandwidth_control per interface.
> 
> Again, it is already possible to separate migration traffic from storage
> traffic, from other network traffic. The target IP given will influence
> which NIC is used based on routing table and I know this is already
> done widely with OpenStack deployments.

Actually I should clarify this is only practical if the two NICs are
using different IP subnets, otherwise routing rules are not viable.
So needing to set source IP would be needed to select between a pair
of NICs on the same IP subnet.

Previous usage I've seen has always setup fully distinct IP subnets
for generic vs storage vs migration network traffic.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


