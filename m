Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD4321F32
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:32:30 +0100 (CET)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEG0T-0002XC-L4
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lEFuQ-0006zi-8E
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:26:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lEFuL-0002Rj-0V
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614018368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2e6MkVWwxmzlfIya7uHh/HD3wCkBl4pUGeJg5rgvAY=;
 b=WqXi4yF8b9aPWL3nBFXrJk3fGR4Pzva+0+0P9pYmZK6BShkbQu2Xr4zNhGL+FEKLF2vZpz
 FntbvABQx+Bjc+scHhUKyQ2ZmDXctQsonn36b5uazz6kT5c6ZtD6T3xnornBMKI8yavj15
 oZYIk6gd5WgHuQ7WMFg280z6N/ofGeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-AOQcfYLrOLWtnpxCPJehtg-1; Mon, 22 Feb 2021 13:26:04 -0500
X-MC-Unique: AOQcfYLrOLWtnpxCPJehtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 228CB6D4EC;
 Mon, 22 Feb 2021 18:26:03 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9753160C04;
 Mon, 22 Feb 2021 18:25:52 +0000 (UTC)
Date: Mon, 22 Feb 2021 19:25:49 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <20210222182549.GA2875719@angien.pipo.sk>
References: <875z2knoa5.fsf@dusky.pond.sub.org>
 <ceb5d0f8-3022-e91a-006b-5ac6e5862e4a@redhat.com>
 <20210222182232.GZ2875719@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <20210222182232.GZ2875719@angien.pipo.sk>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 19:22:49 +0100, Peter Krempa wrote:
> On Mon, Feb 22, 2021 at 18:42:00 +0100, Paolo Bonzini wrote:
> > On 22/02/21 15:57, Markus Armbruster wrote:
> > > * The block layer's pseudo-protocol "json:" (which can get embedded in
> > >    image headers)
> > 
> > If it gets embedded in image headers, I don't think we'll be able to
> > deprecate it ever.  We'd need to keep a converter for old images, at which
> > point it's simpler to keep the extensions.
> 
> The converter or better 'fixer' actually doesn't need to be able to
> interpret the old string, just accept a new. IOW it's more of a
> documentation problem, because qemu-img can already do that since it's
> able to write invalid JSON without interpreting it:

[...]

I forgot to add that such strings would be user-originated in the first
place. The qemu-generated one are (presumably) correct JSON.


