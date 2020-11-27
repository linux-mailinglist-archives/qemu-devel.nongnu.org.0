Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0712C6160
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:12:25 +0100 (CET)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiZnj-0003oq-Ry
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kiZm3-00034m-35; Fri, 27 Nov 2020 04:10:39 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:57765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kiZlw-0007h2-Gj; Fri, 27 Nov 2020 04:10:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 8BFE875D3843;
 Fri, 27 Nov 2020 10:10:28 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 27 Nov
 2020 10:10:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0030cf95699-e326-4233-8c67-b8e67fe4bc53,
 3F3A8B77B8A7D9894C8FBB5EF0C17793377DB79C) smtp.auth=groug@kaod.org
Date: Fri, 27 Nov 2020 10:10:26 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
Message-ID: <20201127101026.2ca28dc9@bahia.lan>
In-Reply-To: <13615133.E8RLdmFOkC@silver>
References: <20201126101624.55714-1-alex.chen@huawei.com>
 <2017010.0bgJjaKMus@silver> <20201126192719.7ea20846@bahia.lan>
 <13615133.E8RLdmFOkC@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: fe4e6638-fdcb-4034-8de0-bb51d13a1df8
X-Ovh-Tracer-Id: 14016327941689088419
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehgedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepiihhrghnghdriihhrghnghhhrghilhhirghngheshhhurgifvghirdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alex Chen <alex.chen@huawei.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 19:44:24 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

[...]
> > The only justification that'd deserve to be in the changelog of
> > such a patch is something like "because this is good practice
> > to rollback in case code moves to another function than main()".
> 
> Well, the actual motivation was rather a pragmatic one: to shut up a 
> sanitizer's false positive, which I can understand.
> 

Yes, this should also be mentioned in the changelog.

> Another option would be using a global variable for the fd instead of a 
> temporary on stack. That should shut up the sanitizer as well and would not 
> introduce change to the program flow.
> 

Using the same sock variable for an fd that is either passed to us
or that we create is a very poor programming choice actually... :(

So if the motivation is just to make "Euler Robot" happy and this
can be addressed as you suggest, I personally prefer that rather
than piling up fixes on broken code.

> I leave that up to Greg to decide whether or not to handle this. I'm 
> Switzerland on this one.
> 

This won't go into QEMU 5.2 anyway since we only merge fixes for
critical bugs or regressions at this point. No hurry to decide
anything now :)

> Best regards,
> Christian Schoenebeck
> 
> 


