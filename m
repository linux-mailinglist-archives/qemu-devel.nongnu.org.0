Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E863B3227BA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:25:54 +0100 (CET)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETx3-00037K-UQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lETtx-0000V0-A3; Tue, 23 Feb 2021 04:22:41 -0500
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lETtt-0007ZG-Ta; Tue, 23 Feb 2021 04:22:40 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614072124; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=KI9QLjifrWj7+2pzMzK0LOgtnhnU6kZMssr6HySwS8qWbX6oqtSOtDdxUlNHwzL/uKvZR8EfPdF43Wsw0GwHP/eIAiQ8S2oH2OiBDtEQU1NBydKSeU556SPx4JbaBypLFdtDTEPtObEtn9dhzj/oSy8x3fPgdmXCoBE2ozE8kWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1614072124;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7pwgiyDeiJg+c6BKRE8zO5DPgkPguciczDMASm8djCk=; 
 b=qbRPiuHlN+AkoL3D3+r9n+DkEXDzTPvVm150QlFU/XcRyVf15BUwF5itsHnNdYOYgYPqIII3EKNZF9YyQ77Z/umiY8sofq+fU5ygJUvD/rO9IZGmi/I7SqssART9Sw49tCEZfD6H2k8AEdyyM3BFhfnSSv14Jzs7cm4om6OGPYo=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614072124; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Message-ID:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=7pwgiyDeiJg+c6BKRE8zO5DPgkPguciczDMASm8djCk=;
 b=d+i3LokEhTTu+PNqf5q7yzZWo7IWPn65tt3cPC9Eg0NLbAW7xv+5cSg7ZVu+DLgO
 JHLS8ojliWse9pWRABlGMdt2X3tazHRLE4r+Jhf5VCj+++f7RCLeACZ0HGo3LiXsw7P
 CQQsTu+yEQAB0JBI0a7VD+RqxM9RqsI9kv6pY138=
Received: from localhost (ec2-18-134-147-35.eu-west-2.compute.amazonaws.com
 [18.134.147.35]) by mx.zoho.com.cn
 with SMTPS id 1614072122383989.6813412343807;
 Tue, 23 Feb 2021 17:22:02 +0800 (CST)
Date: Tue, 23 Feb 2021 09:21:53 +0000
From: Fam Zheng <fam@euphon.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20210223092153.GA122030@ip-172-44-255-31>
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default
 with 'null-co' driver
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <20210222173532.GA117898@ip-172-44-255-31>
 <5f6c8e8f-ccc9-7098-0fb0-53ec1da33466@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5f6c8e8f-ccc9-7098-0fb0-53ec1da33466@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-02-22 18:55, Philippe Mathieu-Daud=E9 wrote:
> On 2/22/21 6:35 PM, Fam Zheng wrote:
> > On 2021-02-19 15:09, Philippe Mathieu-Daud=E9 wrote:
> >> On 2/19/21 12:07 PM, Max Reitz wrote:
> >>> On 13.02.21 22:54, Fam Zheng wrote:
> >>>> On 2021-02-11 15:26, Philippe Mathieu-Daud=E9 wrote:
> >>>>> The null-co driver doesn't zeroize buffer in its default config,
> >>>>> because it is designed for testing and tests want to run fast.
> >>>>> However this confuses security researchers (access to uninit
> >>>>> buffers).
> >>>>
> >>>> I'm a little surprised.
> >>>>
> >>>> Is changing default the only way to fix this? I'm not opposed to
> >>>> changing the default but I'm not convinced this is the easiest way.
> >>>> block/nvme.c also doesn't touch the memory, but defers to the device
> >>>> DMA, why doesn't that confuse the security checker?
> >>
> >> Generally speaking, there is a balance between security and performanc=
e.
> >> We try to provide both, but when we can't, my understanding is securit=
y
> >> is more important.
> >=20
> > Why is hiding the code path behind a non-default more secure? What is
> > not secure now?
>=20
> Se we are back to the problem of having default values.
>=20
> I'd like to remove the default and have the option explicit,
> but qemu_opt_get_bool() expects a 'default' value.
>=20
> Should we rename qemu_opt_get_bool() -> qemu_opt_get_bool_with_default()
> and add a simpler qemu_opt_get_bool()?

My point is I still don't get the full context of the problem this
series is trying to solve. If the problem is tools are confused, I would
like to understand why. What is the thing that matters here, exactly?

But there's always been nullblk.ko in kernel that doesn't lie in the
name. If we change the default we are not very honest any more about
what the driver actually does.

Even if null-co:// and null-aio:// is a bad idea, then let's add
zero-co://co and zero-aio://, and deprecate null-*://.

Fam


