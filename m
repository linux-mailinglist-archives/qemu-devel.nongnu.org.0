Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3406D198E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:15:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi9tS-0000C4-Pd; Fri, 31 Mar 2023 04:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pi9tK-0000BM-IO
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pi9tH-0006ES-4g
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680250422;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llU5Q4RVR6+mBDZt1ZybpdUqjw47E78xceF3oxXZTFk=;
 b=PTBQmx7IUN1n5z1RXs89G3cL3H3NDzf2jNPc7cprs6bbA0ineDNSbIj+dNqVv8j5iWqsVR
 bcAQLUSoCSNsbDuVA3iVd+Q8PNdeS3N+odUIddlJb3yqwByHPpKNpZynlVwgdplLu747h3
 ytgZQ2FyyTOAQoU3EYPpy1cFihwq210=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-D4tW6CxPNs6EjkuPEaTykg-1; Fri, 31 Mar 2023 04:13:38 -0400
X-MC-Unique: D4tW6CxPNs6EjkuPEaTykg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D54B884341;
 Fri, 31 Mar 2023 08:13:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C704020C82;
 Fri, 31 Mar 2023 08:13:36 +0000 (UTC)
Date: Fri, 31 Mar 2023 09:13:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
Message-ID: <ZCaWLehDbWTAJtIi@redhat.com>
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
 <CACGkMEs1hRNLL67W96MO3eMg4H=ex4bYvFxcUkNPgfXXbOvo3A@mail.gmail.com>
 <ZCVJoi7YQlt3axba@redhat.com>
 <CACGkMEugLOsQJz_Hie1-0WLbPEiC2B_7y=RVqqmGi8-aqBfHXQ@mail.gmail.com>
 <ZCaSzxCmqtec/Vin@redhat.com>
 <CACGkMEuMgbxci4LLrmSqth73Mv8kriHX42=y==26mJPFHMzRLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEuMgbxci4LLrmSqth73Mv8kriHX42=y==26mJPFHMzRLA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 31, 2023 at 04:03:39PM +0800, Jason Wang wrote:
> On Fri, Mar 31, 2023 at 3:59 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Mar 31, 2023 at 03:48:18PM +0800, Jason Wang wrote:
> > > On Thu, Mar 30, 2023 at 4:34 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Thu, Mar 30, 2023 at 02:54:32PM +0800, Jason Wang wrote:
> > > > > On Thu, Mar 30, 2023 at 8:33 AM Andrew Melnychenko <andrew@daynix.com> wrote:
> > > > >
> > > > > Who or how the ABI compatibility is preserved between libvirt and Qemu?
> > > >
> > > > There's no real problem with binary compatibility to solve any more.
> > > >
> > > > When libvirt first launches a QEMU VM, it will fetch the eBPF programs
> > > > it needs from that running QEMU using QMP. WHen it later needs to
> > > > enable features that use eBPF, it already has the program data that
> > > > matches the running QEMU
> > >
> > > Ok, then who will validate the eBPF program? I don't think libvirt can
> > > trust what is received from Qemu otherwise arbitrary eBPF programs
> > > could be executed by Qemu in this way. One example is that when guests
> > > escape to Qemu it can modify the rss_bpf__elf_bytes. Though
> > > BPF_PROG_TYPE_SOCKET_FILTER gives some of the restrictions, we still
> > > need to evaluate side effects of this. Or we need to find other ways
> > > like using the binary in libvirt or use rx filter events.
> >
> > As I mentioned, when libvirt first launches QEMU it will fetch the
> > eBPF programs and keep them for later use. At that point the guest
> > CPUs haven't started running, and so QEMU it still sufficiently
> > trustworthy.
> 
> Well, this means the QMP command is safe only before Qemu starts to
> run VCPU. I'm not sure this is a good design. Or at least we need to
> fail the QMP command if VCPU starts to run.

Currently QEMU has the ability to just create the eBPF programs itself
at will, when it is launched in a privileged scenario regardless of
guest CPU state. In terms of QMP, the reporting of QEMU PIDs for its
various vCPU, I/O threads is also not to be trusted after vCPU starts
if the guest workload is not trustworthy.  I feel this is more of docs
problem to explain the caveats that apps should be aware of.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


