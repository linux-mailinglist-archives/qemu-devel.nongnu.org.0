Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03F40F4A5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:20:25 +0200 (CEST)
Received: from localhost ([::1]:45182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRA2g-0005X0-UC
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mRA0G-0004Nl-OV
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mRA0E-00029u-1X
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631870268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrhO1h0Y9oOM90Y5qh34SC8BRRS854lYKCJE6MZ9HaE=;
 b=iAtTg3nP0WABgqbC/csy8m8K2BahcR6MjkJ8t3V16cLPtaCcB8pxDPgQXTC8EA5cYePVhf
 HUC6le98qIRVBa1kVmWWRBRh4pxsF02kgkuVXfNrnY7kzFoxSVwWuYsa0YLIwJW7+p5n9g
 ao2VN2kpTyoCeXA3pGa2WOcSHmr8SfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-IvhNEsJIOcCY8GBynGA7Eg-1; Fri, 17 Sep 2021 05:17:44 -0400
X-MC-Unique: IvhNEsJIOcCY8GBynGA7Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DB24BAF8A;
 Fri, 17 Sep 2021 09:17:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0906D5D6B1;
 Fri, 17 Sep 2021 09:17:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
In-Reply-To: <YURYvaOpya498Xx2@yekko>
Organization: Red Hat GmbH
References: <YURYvaOpya498Xx2@yekko>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 17 Sep 2021 11:17:01 +0200
Message-ID: <87k0jfh88i.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, slp@redhat.com, f4bug@amsat.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, alex.bennee@linaro.org, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17 2021, David Gibson <david@gibson.dropbear.id.au> wrote:

> Hi all,
>
> At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> whether Rust supported all the host/build platforms that qemu does,
> which is obviously vital if we want to make Rust a non-optional
> component of the build.
>
> I've added the information to our wiki at:
> 	https://wiki.qemu.org/RustInQemu

Thank you for doing that!

>
> TBH, the coverage is not as good as I expected.  Linux, macOS and
> Windows are pretty much ok, with the exception of Linux on Sparc.
> There are a lot of gaps in *BSD support, however.

Yes :(

Do we actually have an idea what we would require? I'm surprised that
there are so many targets without host tools or without std support (but
maybe they are only missing small things.)

>
> I've included some notes on where the information comes from, and some
> uncertainties in there.
>
> I've made an effort to get the information correct, but double
> checking would be appreciated.

I did not spot any errors on a quick cross check, but I'm not really
sure about what the BSDs support.

>
> I haven't yet looked into the packaging situation for the Rust
> toolchain on various platforms and distros, but I still intend to do
> so.


