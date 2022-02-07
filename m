Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5F4AB8A0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:21:14 +0100 (CET)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH18z-0000Ti-5z
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nH0UO-00084h-QH
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nH0UK-0008LW-Sg
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644226751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xn5XF9kbZgQAjHMNm0YRFibKkFzvjSwBYZ1X+BNHbQc=;
 b=jHNSfXDXNs/IdGNE+ibYri8rMWOVg2rrR55Afhvmce4YPVjRPn8VntE8MC0x1H/tKpbPow
 rCIvbmM7i7SFoCJ248LEQ8Xv9XjjG0AYzwWfibkwXr7717iS8t3n2FHwtaaLSYuACBAoY4
 dG4s4GUJf0xGonPU7DTYg0cmUitG3r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-JF4-VjpaPqyAwJI9Rd0UYA-1; Mon, 07 Feb 2022 04:37:21 -0500
X-MC-Unique: JF4-VjpaPqyAwJI9Rd0UYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A6164A7A;
 Mon,  7 Feb 2022 09:37:19 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A8EB5F91F;
 Mon,  7 Feb 2022 09:36:45 +0000 (UTC)
Date: Mon, 7 Feb 2022 10:36:42 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <YgDoKlkP9Isdjnv8@angien.pipo.sk>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220207101843.259f517c@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> On Mon, 7 Feb 2022 09:14:37 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Sat,  5 Feb 2022 13:45:24 +0100
> > Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > 
> > > Previously CPUs were exposed in the QOM tree at a path
> > > 
> > >   /machine/unattached/device[nn]
> > > 
> > > where the 'nn' of the first CPU is usually zero, but can
> > > vary depending on what devices were already created.
> > > 
> > > With this change the CPUs are now at
> > > 
> > >   /machine/cpu[nn]
> > > 
> > > where the 'nn' of the first CPU is always zero.  
> > 
> > Could you add to commit message the reason behind the change?
> 
> regardless, it looks like unwarranted movement to me
> prompted by livirt accessing/expecting a QOM patch which is
> not stable ABI. I'd rather get it fixed on libvirt side.
> 
> If libvirt needs for some reason access a CPU instance,
> it should use @query-hotpluggable-cpus to get a list of CPUs
> (which includes QOM path of already present CPUs) instead of
> hard-codding some 'well-known' path as there is no any guarantee 
> that it will stay stable whatsoever.

I don't disagree with you about the use of hardcoded path, but the way
of using @query-hotpluggable-cpus is not really aligning well for how
it's being used.

To shed a bit more light, libvirt uses the following hardcoded path

#define QOM_CPU_PATH  "/machine/unattached/device[0]"

in code which is used to query CPU flags. That code doesn't care at all
which cpus are present but wants to get any of them. So yes, calling
query-hotpluggable-cpus is possible but a bit pointless.

In general the code probing cpu flags via qom-get is very cumbersome as
it ends up doing ~400 QMP calls at startup of a VM in cases when we deem
it necessary to probe the cpu fully.

It would be much better (And would sidestep the issue altoghether) if we
had a more sane interface to probe all cpu flags in one go, and ideally
the argument specifying the cpu being optional.

Libvirt can do the adjustment, but for now IMO the path to the first cpu
(/machine/unattached/device[0]) became de-facto ABI by the virtue that
it was used by libvirt and if I remember correctly it was suggested by
the folks dealing with the CPU when the code was added originally.

Even if we change it in libvirt right away, changing qemu will break
forward compatibility. While we don't guarantee it, it still creates
user grief.


