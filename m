Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C47A322F91
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:25:12 +0100 (CET)
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbQt-0002sX-Kt
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lEbOL-0001aZ-F2; Tue, 23 Feb 2021 12:22:33 -0500
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lEbOD-0004s6-T1; Tue, 23 Feb 2021 12:22:32 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614100915; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=PlNjELz2G5Dcxk8F3nBuhTPY/srqZC8z7vPRxUF6+ET9m5M7VuildRgAf/BHvDRTUa06+I3hSfn6n2OhQKUK8ZVlCbMKDyhkcxNUBE8KSSWjIcbd54fLl26BgKp0GmQ6UwYr3su3j+pYnXqDE2iPkGfdRXLm0lbkG2037XN17KM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1614100915;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=YzdrOd4ul+Tl8EC5IWlq7Z8J3dZ3UEp4SG5nFzGh7mg=; 
 b=Zlk7lbZapCAnrl98yPj09Ir6aEb1kbWZrs1+evxMDfbOjkeM+OvRWpS/0UmTPLcPma0sP/7OPjiwX+xC9Wkmo7704sosySF1k1+UDNS91cWoSnp5Anrc9J9hcsOEZVHrrCPBJxAdT2AtUyCg1GPLSVYSoSiNGLQbhtFnWOoDQ6M=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614100915; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Message-ID:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=YzdrOd4ul+Tl8EC5IWlq7Z8J3dZ3UEp4SG5nFzGh7mg=;
 b=T7DIa3odpUvJ6yLnX7cm1v7dmfd8huyJdWyyxIadV8FXSdS0kakZeGpHz71oMqvK
 PpD4lygek3Zd72p1ls1xdcDNB04lhu1CgfMKsS9doeTQL/A7NcyoPnZ3sjqKzTNsMOY
 PrvJ4vp2sEr2k9N33eQ7aGzQPMkXy0WkA1QTgp5g=
Received: from localhost (ec2-18-134-147-35.eu-west-2.compute.amazonaws.com
 [18.134.147.35]) by mx.zoho.com.cn
 with SMTPS id 1614100912652266.46462297563085;
 Wed, 24 Feb 2021 01:21:52 +0800 (CST)
Date: Tue, 23 Feb 2021 17:21:45 +0000
From: Fam Zheng <fam@euphon.net>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20210223172145.GA123793@ip-172-44-255-31>
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default
 with 'null-co' driver
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <20210222173532.GA117898@ip-172-44-255-31>
 <5f6c8e8f-ccc9-7098-0fb0-53ec1da33466@redhat.com>
 <20210223092153.GA122030@ip-172-44-255-31>
 <74e3128c-b7e6-20da-c0a7-a799d1da560c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <74e3128c-b7e6-20da-c0a7-a799d1da560c@redhat.com>
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-02-23 17:01, Max Reitz wrote:
> On 23.02.21 10:21, Fam Zheng wrote:
> > On 2021-02-22 18:55, Philippe Mathieu-Daud=C3=A9 wrote:
> > > On 2/22/21 6:35 PM, Fam Zheng wrote:
> > > > On 2021-02-19 15:09, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > > On 2/19/21 12:07 PM, Max Reitz wrote:
> > > > > > On 13.02.21 22:54, Fam Zheng wrote:
> > > > > > > On 2021-02-11 15:26, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > > > > > The null-co driver doesn't zeroize buffer in its default co=
nfig,
> > > > > > > > because it is designed for testing and tests want to run fa=
st.
> > > > > > > > However this confuses security researchers (access to unini=
t
> > > > > > > > buffers).
> > > > > > >=20
> > > > > > > I'm a little surprised.
> > > > > > >=20
> > > > > > > Is changing default the only way to fix this? I'm not opposed=
 to
> > > > > > > changing the default but I'm not convinced this is the easies=
t way.
> > > > > > > block/nvme.c also doesn't touch the memory, but defers to the=
 device
> > > > > > > DMA, why doesn't that confuse the security checker?
> > > > >=20
> > > > > Generally speaking, there is a balance between security and perfo=
rmance.
> > > > > We try to provide both, but when we can't, my understanding is se=
curity
> > > > > is more important.
> > > >=20
> > > > Why is hiding the code path behind a non-default more secure? What =
is
> > > > not secure now?
> > >=20
> > > Se we are back to the problem of having default values.
> > >=20
> > > I'd like to remove the default and have the option explicit,
> > > but qemu_opt_get_bool() expects a 'default' value.
> > >=20
> > > Should we rename qemu_opt_get_bool() -> qemu_opt_get_bool_with_defaul=
t()
> > > and add a simpler qemu_opt_get_bool()?
> >=20
> > My point is I still don't get the full context of the problem this
> > series is trying to solve. If the problem is tools are confused, I woul=
d
> > like to understand why. What is the thing that matters here, exactly?
>=20
> My personal opinion is that it isn=E2=80=99t even about tools, it=E2=80=
=99s just about the
> fact that operating on uninitialized data is something that should genera=
lly
> be avoided.  For the null drivers, there is a reason to allow it
> (performance testing), but that should be a special case, not the default=
.

How do we define uninitialized data? Are buffers passed to a successful
read (2) syscall initialized? We cannot know, because it's up to the
fs/driver/storage. It's the same to bdrv_pread().

In fact block/null.c doesn't operate on uninitialized data, we should
really fix guess_disk_lchs() and similar.

>=20
> > But there's always been nullblk.ko in kernel that doesn't lie in the
> > name. If we change the default we are not very honest any more about
> > what the driver actually does.
>=20
> Then we=E2=80=99re already lying, because if we model it after /dev/null,=
 we should
> probably return -EIO on every read.

nullblk.ko is not /dev/null, it's /dev/nullb*:

https://www.kernel.org/doc/Documentation/block/null_blk.txt

Fam


