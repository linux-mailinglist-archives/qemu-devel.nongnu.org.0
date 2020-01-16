Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AF413DC12
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 14:35:01 +0100 (CET)
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is5Ia-0006JT-9x
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 08:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1is5HU-0005GS-9Y
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 08:33:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1is5HQ-0008HO-HH
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 08:33:52 -0500
Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80]:50113)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1is5HQ-0008GG-AY
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 08:33:48 -0500
Received: from player699.ha.ovh.net (unknown [10.108.35.12])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id E3FE011AFAF
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 14:33:45 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 3F206E45759F;
 Thu, 16 Jan 2020 13:33:44 +0000 (UTC)
Date: Thu, 16 Jan 2020 14:33:42 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 03/11] 9pfs: validate count sent by client with
 T_readdir
Message-ID: <20200116143342.4d518b30@bahia.lan>
In-Reply-To: <0edf21d2cb2a6cf22ba1065bf451b44ad5962cbd.1578957500.git.qemu_oss@crudebyte.com>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
 <0edf21d2cb2a6cf22ba1065bf451b44ad5962cbd.1578957500.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7365918669363976512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdehgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.109.80
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

On Mon, 13 Jan 2020 23:22:08 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> A good 9p client sends T_readdir with "count" parameter that's
> sufficiently smaller than client's initially negotiated msize
> (maximum message size). We perform a check for that though to
> avoid the server to be interrupted with a "Failed to encode
> VirtFS reply type 41" error message by bad clients.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a5fbe821d4..30da2fedf3 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2426,6 +2426,7 @@ static void coroutine_fn v9fs_readdir(void *opaque)
>      int32_t count;
>      uint32_t max_count;
>      V9fsPDU *pdu = opaque;
> +    V9fsState *s = pdu->s;
>  
>      retval = pdu_unmarshal(pdu, offset, "dqd", &fid,
>                             &initial_offset, &max_count);
> @@ -2434,6 +2435,13 @@ static void coroutine_fn v9fs_readdir(void *opaque)
>      }
>      trace_v9fs_readdir(pdu->tag, pdu->id, fid, initial_offset, max_count);
>  
> +    if (max_count > s->msize - P9_IOHDRSZ) {

P9_IOHDRSZ relates to Twrite. The Rreaddir message has a smaller header
of size 11:

size[4] Rreaddir tag[2] count[4]

> +        max_count = s->msize - P9_IOHDRSZ;
> +        warn_report_once(
> +            "9p: bad client: T_readdir with count > msize - P9_IOHDRSZ"
> +        );
> +    }
> +
>      fidp = get_fid(pdu, fid);
>      if (fidp == NULL) {
>          retval = -EINVAL;


