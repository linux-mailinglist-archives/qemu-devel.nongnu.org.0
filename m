Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656976F3D20
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 07:48:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptiqN-00035Q-01; Tue, 02 May 2023 01:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ptiqD-000326-CA
 for qemu-devel@nongnu.org; Tue, 02 May 2023 01:46:22 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ptiqB-0000Ei-3I
 for qemu-devel@nongnu.org; Tue, 02 May 2023 01:46:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 51AE72076E;
 Tue,  2 May 2023 05:46:06 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 2 May
 2023 07:46:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00494e2fdc7-8fb3-4c5d-b251-26bd979d4795,
 D682ABDF648864B595B91A03587218697AC05C80) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 2 May 2023 07:46:04 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/9p: fix potential leak in v9fs_rreaddir()
Message-ID: <20230502074604.37477603@bahia>
In-Reply-To: <2011937.24IBG10sf5@silver>
References: <E1psh5T-0002XN-1C@lizzy.crudebyte.com>
 <20230429140430.05b286a1@bahia> <2011937.24IBG10sf5@silver>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 07a3075f-3048-46ab-a11b-26fc65033919
X-Ovh-Tracer-Id: 11789860876621093341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvhedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejfedtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdekhedvgeduhfdvhffhheekudekveekvedviefglefgffekueffgfelteekjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvddpjeekrdduleejrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhgpohhsshestghruhguvggshihtvgdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 29 Apr 2023 15:20:12 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Saturday, April 29, 2023 2:04:30 PM CEST Greg Kurz wrote:
> > Hi Christian !
> 
> Hi there, it's been a while! :)
> 
> > On Sat, 29 Apr 2023 11:25:33 +0200
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > 
> > > Free allocated directory entries in v9fs_rreaddir() if argument
> > > `entries` was passed as NULL, to avoid a memory leak. It is
> > > explicitly allowed by design for `entries` to be NULL. [1]
> > > 
> > > [1] https://lore.kernel.org/all/1690923.g4PEXVpXuU@silver
> > > 
> > > Reported-by: Coverity (CID 1487558)
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > 
> > Good catch Coverity ! :-)
> 
> Yeah, this Coverity report is actually from March and I ignored it so far,
> because the reported leak could never happen with current test code. But Paolo
> brought it up this week, so ...
> 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > 
> > I still have a suggestion. See below.
> > 
> > >  tests/qtest/libqos/virtio-9p-client.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
> > > index e4a368e036..b8adc8d4b9 100644
> > > --- a/tests/qtest/libqos/virtio-9p-client.c
> > > +++ b/tests/qtest/libqos/virtio-9p-client.c
> > > @@ -594,6 +594,8 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> > >  {
> > >      uint32_t local_count;
> > >      struct V9fsDirent *e = NULL;
> > > +    /* only used to avoid a leak if entries was NULL */
> > > +    struct V9fsDirent *unused_entries = NULL;
> > >      uint16_t slen;
> > >      uint32_t n = 0;
> > >  
> > > @@ -612,6 +614,8 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> > >              e = g_new(struct V9fsDirent, 1);
> > >              if (entries) {
> > >                  *entries = e;
> > > +            } else {
> > > +                unused_entries = e;
> > >              }
> > >          } else {
> > >              e = e->next = g_new(struct V9fsDirent, 1);
> > 
> > This is always allocating and chaining a new entry even
> > though it isn't needed in the entries == NULL case.
> > 
> > > @@ -628,6 +632,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> > >          *nentries = n;
> > >      }
> > >  
> > > +    v9fs_free_dirents(unused_entries);
> > 
> > This is going to loop again on all entries to free them.
> > 
> > >      v9fs_req_free(req);
> > >  }
> > >  
> > 
> > If this function is to be called one day with an enormous
> > number of entries and entries == NULL case, this might
> > not scale well.
> > 
> > What about only allocating a single entry in this case ?
> > 
> > E.g.
> > 
> > @@ -593,7 +593,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> >                     struct V9fsDirent **entries)
> >  {
> >      uint32_t local_count;
> > -    struct V9fsDirent *e = NULL;
> > +    g_autofree struct V9fsDirent *e = NULL;
> >      uint16_t slen;
> >      uint32_t n = 0;
> >  
> > @@ -611,10 +611,12 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> >          if (!e) {
> >              e = g_new(struct V9fsDirent, 1);
> >              if (entries) {
> > -                *entries = e;
> > +                *entries = g_steal_pointer(e);
> 
> g_steal_pointer(e) just sets `e` to NULL and returns its old value, so ...
> 
> >              }
> >          } else {
> > -            e = e->next = g_new(struct V9fsDirent, 1);
> > +            if (entries) {
> > +                e = e->next = g_new(struct V9fsDirent, 1);
> > +            }
> 
> ... this `else` block would never be reached and no list assembled.
> 
> >          }
> >          e->next = NULL;
> >          /* qid[13] offset[8] type[1] name[s] */
> 
> And even if above's issue was fixed, then it would cause a use-after-free for
> the last element in the list if entries != NULL and caller trying to access
> the last element afterwards. So you would still need a separate g_autofree
> pointer instead of tagging `e` directly, or something like this after loop
> end:
> 
>   if (entries)
>     g_steal_pointer(e);
> 
> Which would somehow defeat the purpose of using g_autofree though.
> 
> I mean, yes this could be addressed, but is it worth it? I don't know. Even
> this reported leak is a purely theoretical one, but I understand if people
> want to silence a warning.
> 

Yeah you're right.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 


