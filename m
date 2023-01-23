Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDABA677638
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJs5D-0003S0-M8; Mon, 23 Jan 2023 03:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1pJs59-0003Rf-05
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:21:35 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1pJs56-0001sR-E3
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:21:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9C8862289A;
 Mon, 23 Jan 2023 08:21:21 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 23 Jan
 2023 09:21:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003c236452c-ce6a-415c-b31e-4eb968f8763a,
 50F971C67E06351E5895DAE5ED0110D8D9269BCE) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 23 Jan 2023 09:21:19 +0100
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
CC: Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Yajun Wu
 <yajunw@nvidia.com>, Peter Maydell <peter.maydell@linaro.org>, Parav Pandit
 <parav@nvidia.com>, <qemu-stable@nongnu.org>
Subject: Re: [PATCH 0/2] vhost-user: Remove the nested event loop to unbreak
 the DPDK use case
Message-ID: <20230123092119.074e456b@bahia>
In-Reply-To: <20230119172424.478268-1-groug@kaod.org>
References: <20230119172424.478268-1-groug@kaod.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 16678e64-6888-4caa-84ef-e2033f55300c
X-Ovh-Tracer-Id: 4864169075651353010
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddujedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffheefheevleetieetheffjeetgfdttedtlefgieelfffhgedvteekvddttdehleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhrvgguhhgrthdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgughhilhgsvghrthesrhgvughhrghtrdgtohhmpdhmrgigihhmvgdrtghoqhhuvghlihhnsehrvgguhhgrthdrtghomhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdphigrjhhunhifsehnvhhiughirgdrtghomhdpphgvthgvrhdrmhgrhiguvghllh
 eslhhinhgrrhhordhorhhgpdhprghrrghvsehnvhhiughirgdrtghomhdpqhgvmhhuqdhsthgrsghlvgesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 18:24:22 +0100
Greg Kurz <groug@kaod.org> wrote:

> The nested event loop was introduced in QEMU 6.0 to allow servicing
> of requests coming from the slave channel while waiting for an ack
> from the back-end on the master socket. It turns out this is fragile
> and breaks if the servicing of the slave channel causes a new message
> to be sent on the master socket. This is exactly what happens when
> using DPDK as reported in [0].
> 
> The only identified user for the nested loop is DAX enablement that
> isn't upstream yet. Just drop the code for now. Some more clever
> solution should be designed when the need to service concurrent
> requests from both channels arises again.
> 
> Greg Kurz (2):
>   Revert "vhost-user: Monitor slave channel in vhost_user_read()"
>   Revert "vhost-user: Introduce nested event loop in vhost_user_read()"
> 
>  hw/virtio/vhost-user.c | 100 ++++-------------------------------------
>  1 file changed, 8 insertions(+), 92 deletions(-)
> 

Hi Michael,

Can you please merge this series as you kindly proposed in [0] ?
This will help to fix [1] which is currently blocking downstream
testing.

Cheers,

--
Greg

[0] https://lore.kernel.org/qemu-devel/20230118060102-mutt-send-email-mst@kernel.org/
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2155173

