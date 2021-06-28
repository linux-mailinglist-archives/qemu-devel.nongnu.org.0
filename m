Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE573B5D39
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:37:54 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpaL-0002lx-6n
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxpV7-0003hN-Do
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxpV2-0001TA-O4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624879944;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xdi8Wn2/gUuwEca2TWSt1v/uH6X0Th+LRRyoxc6Rn4U=;
 b=NwHrO+y03L9/mq2BcCgbeo9E5QmQ+x18APjT1UFRkQLl4qUre7AgDe/0fBIxaeLEFAJKyj
 3lyh6zGe3hIsdcHywPGxyBFxpyt9l8AKXW9deQJP7+PuxEBok95AyLto6aLpPryeXiFcsj
 NyZ9nt/1zPgJ0Bdd8kGjUe9nL+fmB3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418--frHanaTPyCqHUqQ4E8b4Q-1; Mon, 28 Jun 2021 07:32:10 -0400
X-MC-Unique: -frHanaTPyCqHUqQ4E8b4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD4C919057A0;
 Mon, 28 Jun 2021 11:32:07 +0000 (UTC)
Received: from redhat.com (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22EE65D9CA;
 Mon, 28 Jun 2021 11:31:59 +0000 (UTC)
Date: Mon, 28 Jun 2021 12:31:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <YNmzLTSIQrLPm6TF@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
 <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <CAFEAcA9X9fYAFAux4h2n00kYpTgxkNcJg6Ako7s6ndU4KWTJyQ@mail.gmail.com>
 <YNHzqHMkfSWCHA3i@redhat.com>
 <909af1cb-7e7b-7532-06b5-69cd9487e001@huawei.com>
MIME-Version: 1.0
In-Reply-To: <909af1cb-7e7b-7532-06b5-69cd9487e001@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 07:14:02PM +0800, wangyanan (Y) wrote:
> Hi Daniel,
> 
> On 2021/6/22 22:28, Daniel P. Berrangé wrote:
> > On Tue, Jun 22, 2021 at 03:15:18PM +0100, Peter Maydell wrote:
> > > On Tue, 22 Jun 2021 at 15:11, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > The QEMU man page says this explicitly
> > > > 
> > > >                   For the PC target, the number of cores per die, the
> > > >      number of threads per cores, the number of dies per packages and the
> > > >      total number of sockets can be specified. Missing values will be
> > > >      computed. If any on the three values is given, the total number of
> > > >      CPUs n can be omitted.
> > > Anybody feel like submitting a patch to fix the typo? Should read
> > > "If any of"...
> > Actually looking at the broader text for -smp, the whole thing just needs
> > to be rewritten from scratch IMHO. I'll send a patch....
> Do you have any plan to rewrite the -smp text in qemu-options.hx recently?
> 
> I suggest that we explain in more detail how the missing values will
> be computed, so that qemu users can have a clear image of what a
> -smp parameter collection would be parsed out if they are using an
> incomplete cmdline and have read the man page.
> 
> Also if we all agree to prefer cores over sockets for all arches since
> machine type 6.2, I'll be glad to add this change for the man page
> and update the parsing helpers in next version of this patch series.

I wrote a docs update on friday, which I've just sent out as a short
patch series with yourself CC'd.  I wrote it such that we can easily
update it again, if we want to prefer cores over sockets.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


