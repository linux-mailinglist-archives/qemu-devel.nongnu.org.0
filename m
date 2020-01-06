Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DFA13122C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 13:31:56 +0100 (CET)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioRY3-0001QO-9S
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 07:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ioRWi-0000zz-FG
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 07:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ioRWh-0001ug-0N
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 07:30:32 -0500
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:34700)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ioRWg-0001se-Q6
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 07:30:30 -0500
Received: from player759.ha.ovh.net (unknown [10.108.35.232])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 8809589C4A
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 13:30:28 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 946ACDE89F06;
 Mon,  6 Jan 2020 12:30:26 +0000 (UTC)
Date: Mon, 6 Jan 2020 13:30:24 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 2/9] 9pfs: validate count sent by client with T_readdir
Message-ID: <20200106133024.2ce31324@bahia.lan>
In-Reply-To: <4866c87cb19f3191b977fc7fbe2857abf1da80b6.1576678644.git.qemu_oss@crudebyte.com>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
 <4866c87cb19f3191b977fc7fbe2857abf1da80b6.1576678644.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2910451261973240128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 49
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddggeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucgoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehgihhthhhusgdrihhonecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.58.91
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Dec 2019 14:17:59 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> A good 9p client sends T_readdir with "count" parameter that's
> sufficiently smaller than client's initially negotiated msize
> (maximum message size). We perform a check for that though to
> avoid the server to be interrupted with a "Failed to encode
> VirtFS reply type 41" error message by bad clients.
> 

Hmm... doesn't v9fs_do_readdir() already take care of that ?

> Note: we should probably also check for a minimum size of
> msize during T_version to avoid issues and/or too complicated
> count/size checks later on in other requests of that client.
> T_version should submit an msize that's at least as large as
> the largest request's header size.

Do you mean that the server should expose such an msize in the
R_version response ? The 9p spec only says that the server must
return an msize <= to the one proposed by the client [1]. Not
sure we can do more than to emit a warning and/or interrupt the
server if the client sends a silly size.

[1] https://9fans.github.io/plan9port/man/man9/version.html

> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 520177f40c..30e33b6573 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2414,6 +2414,7 @@ static void coroutine_fn v9fs_readdir(void *opaque)
>      int32_t count;
>      uint32_t max_count;
>      V9fsPDU *pdu = opaque;
> +    V9fsState *s = pdu->s;
>  
>      retval = pdu_unmarshal(pdu, offset, "dqd", &fid,
>                             &initial_offset, &max_count);
> @@ -2422,6 +2423,13 @@ static void coroutine_fn v9fs_readdir(void *opaque)
>      }
>      trace_v9fs_readdir(pdu->tag, pdu->id, fid, initial_offset, max_count);
>  
> +    if (max_count > s->msize - P9_IOHDRSZ) {
> +        max_count = s->msize - P9_IOHDRSZ;

What if s->msize < P9_IOHDRSZ ?

> +        warn_report_once(
> +            "9p: bad client: T_readdir with count > msize - P9_IOHDRSZ"
> +        );
> +    }
> +
>      fidp = get_fid(pdu, fid);
>      if (fidp == NULL) {
>          retval = -EINVAL;


