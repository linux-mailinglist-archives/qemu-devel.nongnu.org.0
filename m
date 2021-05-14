Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A38380E2D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:28:12 +0200 (CEST)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhafb-0001jJ-7L
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhaYQ-000327-HJ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhaYL-0006Jc-3Y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoA5I1rhxnWbSJXX+ahnTdqOQpo7STIPhnW6Z6xa3iI=;
 b=clJMIq4OZAHYkrwDM0n5eXwDmoOfZJ7QfCg3JUwo/lU/Fig12g1YMclDbEkIPWcFbXjzOc
 ZQlEmdUCcV2Kbj1o+vdfHLHqBpC6dMnNa2T6kuaoYq7eGqeR1Ul0NJpcVdIZFe9TCsgilh
 8tkuzEYs3z60jV8XQUzDOXTjYbmEkXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-yhgM57TROoO3eopas9togg-1; Fri, 14 May 2021 12:20:32 -0400
X-MC-Unique: yhgM57TROoO3eopas9togg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54007800D55;
 Fri, 14 May 2021 16:20:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC02460CEB;
 Fri, 14 May 2021 16:20:28 +0000 (UTC)
Date: Fri, 14 May 2021 17:20:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
Message-ID: <YJ6jSeu3Uz4g6cCK@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
 <61071d36-b700-8546-c19b-09c4e582bdfe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <61071d36-b700-8546-c19b-09c4e582bdfe@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Mirela Grujic <mirela.grujic@greensocs.com>, mark.burton@greensocs.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 06:00:37PM +0200, Paolo Bonzini wrote:
> On 14/05/21 14:48, Mirela Grujic wrote:
> > 
> > With our approach, transitioning to the QMP configuration suppose to
> > happen gradually, i.e. we still specify some configuration options via
> > command line. For your approach to be applicable to our use case we
> > would at least need a QMP equivalent for the following:
> > 
> > qemu-system-riscv64 \
> >      -M sifive_dt \
> >      -cpu rv64,i=true,g=false,m=true,a=true,f=true,d=true,c=true,s=false,u=false,x-b=true,pmp=true,mmu=false,num-pmp-regions=8
> > \
> >      -smp 1 \
> >      -device ...
> > 
> > AFAIU from the materials you shared, we would need to add -cpu and
> > -device, but I don't see any reason why we wouldn't do this.
> 
> -cpu is indeed the big one that I had not looked at so far, while -device
> should be mostly covered by the existing device_add command.
> 
> One possibility for -cpu is to make it an argument of machine-set too. For
> example the above would be
> 
> { 'execute': 'machine-set', arguments: {
>     'type': 'sifive_dt',
>     'smp': { 'cpus': 1 },
>     'cpu': { 'model': 'rv64', 'i': true, 'g': false, ... }
> }

CPUs are a little complex because they have association with both machine
types and accelerator backends.  You have 'accel-set' being issued after
'machine-set', but the 'host' CPU model is only valid if you have set
the KVM accelerator, not TCG.

It is desirable that you get an error report about bad CPU at the time
you specify the CPU config, rather than have that error delayed to when
a later command runs and invalidates your CPU choice.

This is a long winded way of saying either 'accel-set' should be
run before 'machine-set', or 'cpu' would have to be set as its own
command or as part of 'accel-set'.

My gut feeling though is accel-set would be more logical being done
first, as that also influences the set of features available in other
areas of QEMU configuration. Was there a reason you listed it after
machine-set ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


