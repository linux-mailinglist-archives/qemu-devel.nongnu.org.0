Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B559321E46
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:39:58 +0100 (CET)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFBd-0005Jq-JJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lEF8l-0002kE-9t; Mon, 22 Feb 2021 12:37:02 -0500
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lEF8g-0000Vm-83; Mon, 22 Feb 2021 12:36:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614015344; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=XezYnEdg4LfvORP17x46KrXUa6VqfOxK3sjLjk+ORGH39NolsEuCBV4kPz2iNv8lvgGXwj3eFitFqWDaVWkJmKfPn4NlfUcM2RZPLvSfBURd41u+k048Le+GCwjpyiEUsncV3pqTz5oVvNGRvBO/K54t1sIOIg7GrI8CiGWfJTk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1614015344;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=BopriOb/sjo11S/fQi+5Rl8SZmNf5qwjVrUJeLn//qA=; 
 b=aqFnH5cehdc/5EzqFyj/IajzOc8fjqAGMc6pVYebsAf6Pyl6e9ABE6OyxsaiPp5+YVYFx8V8wmK6NSjxKH+3ekL+UDCuDY/m27/UrFPDC2jn9ycxx5i4r5lxRVbbQdbX2ZInt7ry1aj5fHIAqS3uQLN8JcJIzvr5mJLXyMdCa4U=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614015344; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Message-ID:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=BopriOb/sjo11S/fQi+5Rl8SZmNf5qwjVrUJeLn//qA=;
 b=gBqe68JsSYOWtwKlLc/2xsCzZl+Uay8+0AJtP9kAWfzmagq+FEOtY+fIT0SHtS70
 mIyxtZmcRnO5ms23YAGlc/pK0ZhymNpD3ItB05X0TtfeyhiJapIzuwxsZtNu99OHdj9
 xVQ903u3SPK3UyQ/vywkZCvH06csU9Hw71y1zlwI=
Received: from localhost (ec2-18-134-147-35.eu-west-2.compute.amazonaws.com
 [18.134.147.35]) by mx.zoho.com.cn
 with SMTPS id 1614015341975985.1540115418496;
 Tue, 23 Feb 2021 01:35:41 +0800 (CST)
Date: Mon, 22 Feb 2021 17:35:32 +0000
From: Fam Zheng <fam@euphon.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20210222173532.GA117898@ip-172-44-255-31>
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default
 with 'null-co' driver
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-02-19 15:09, Philippe Mathieu-Daud=E9 wrote:
> On 2/19/21 12:07 PM, Max Reitz wrote:
> > On 13.02.21 22:54, Fam Zheng wrote:
> >> On 2021-02-11 15:26, Philippe Mathieu-Daud=E9 wrote:
> >>> The null-co driver doesn't zeroize buffer in its default config,
> >>> because it is designed for testing and tests want to run fast.
> >>> However this confuses security researchers (access to uninit
> >>> buffers).
> >>
> >> I'm a little surprised.
> >>
> >> Is changing default the only way to fix this? I'm not opposed to
> >> changing the default but I'm not convinced this is the easiest way.
> >> block/nvme.c also doesn't touch the memory, but defers to the device
> >> DMA, why doesn't that confuse the security checker?
>=20
> Generally speaking, there is a balance between security and performance.
> We try to provide both, but when we can't, my understanding is security
> is more important.

Why is hiding the code path behind a non-default more secure? What is
not secure now?

Fam


