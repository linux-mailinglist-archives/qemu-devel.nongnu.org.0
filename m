Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA1F4ABAEF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:34:13 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2Hc-0007xQ-0b
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:34:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nH2Cd-0005Wg-P0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nH2Ca-0000q0-Pm
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644233339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kTw3b5GQXslcVwaWfeWQjFxclpIA0hAsaQR+cPLUUG4=;
 b=NsuRbNg9PBlkofPTK8zC9fMlHqxzVeLJ1e4sOfjntseC5LA8PkTRo6rnWyoreYoannes1m
 I+WDmtvKF0ExQcoAnnzg5cPPGfj5FDop6wtjBK3tkON3Ipuvn0x+sHAUufNl0Wq2Tm6zrc
 Yb64i6O8QybRlj7Y9BkyyApnofrBCOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-blKL7dAvO66tm3gy3luHUQ-1; Mon, 07 Feb 2022 06:28:56 -0500
X-MC-Unique: blKL7dAvO66tm3gy3luHUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC8F8519E1;
 Mon,  7 Feb 2022 11:28:55 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AABEB62D79;
 Mon,  7 Feb 2022 11:28:51 +0000 (UTC)
Date: Mon, 7 Feb 2022 12:28:47 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <YgECb9o2EwkUldzz@angien.pipo.sk>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk> <YgDpYTpdk9hJeL6v@angien.pipo.sk>
 <CAARzgwyjH70AaEZ=DNSARP++KJfAi2wZkpx6uOhpW0jEigf16A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwyjH70AaEZ=DNSARP++KJfAi2wZkpx6uOhpW0jEigf16A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 16:50:28 +0530, Ani Sinha wrote:
> On Mon, Feb 7, 2022 at 3:12 PM Peter Krempa <pkrempa@redhat.com> wrote:
> >
> > On Mon, Feb 07, 2022 at 10:36:42 +0100, Peter Krempa wrote:
> > > On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > > > On Mon, 7 Feb 2022 09:14:37 +0100
> > > > Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > [...]
> >
> > > Even if we change it in libvirt right away, changing qemu will break
> > > forward compatibility. While we don't guarantee it, it still creates
> > > user grief.
> >
> > I've filed an upstream issue:
> >
> > https://gitlab.com/libvirt/libvirt/-/issues/272
> 
> I can look into this bug. Feel free to assign it to me.

No need to. I've noticed that we already call query-hotpluggable-cpus
so with a simple modification the VM startup code path can be easily
fixed so I've done so.


