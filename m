Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69A6F2486
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:06:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjJu-0001T5-E6; Sat, 29 Apr 2023 08:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1psjJr-0001Sm-0L
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:04:51 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1psjJo-0002YK-CV
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:04:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 40CFB20B50;
 Sat, 29 Apr 2023 12:04:37 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sat, 29 Apr
 2023 14:04:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004aa4931dc-06d2-46f7-a0d9-7ae1561a32e7,
 826560AAE7B1345DB1E132E3D16F8F6966FFD366) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Sat, 29 Apr 2023 14:04:30 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/9p: fix potential leak in v9fs_rreaddir()
Message-ID: <20230429140430.05b286a1@bahia>
In-Reply-To: <E1psh5T-0002XN-1C@lizzy.crudebyte.com>
References: <E1psh5T-0002XN-1C@lizzy.crudebyte.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 1de159cc-9b98-405f-8b32-e1e1ac087f8b
X-Ovh-Tracer-Id: 564357331328997853
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvtddgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieetteeigfetgfekudffledtgfdvueelhfdvfeetvdetueejuedvheduhffgueeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvddpjeekrdduleejrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhgpohhsshestghruhguvggshihtvgdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=groug@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Christian !

On Sat, 29 Apr 2023 11:25:33 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Free allocated directory entries in v9fs_rreaddir() if argument
> `entries` was passed as NULL, to avoid a memory leak. It is
> explicitly allowed by design for `entries` to be NULL. [1]
> 
> [1] https://lore.kernel.org/all/1690923.g4PEXVpXuU@silver
> 
> Reported-by: Coverity (CID 1487558)
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Good catch Coverity ! :-)

Reviewed-by: Greg Kurz <groug@kaod.org>

I still have a suggestion. See below.

>  tests/qtest/libqos/virtio-9p-client.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
> index e4a368e036..b8adc8d4b9 100644
> --- a/tests/qtest/libqos/virtio-9p-client.c
> +++ b/tests/qtest/libqos/virtio-9p-client.c
> @@ -594,6 +594,8 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>  {
>      uint32_t local_count;
>      struct V9fsDirent *e = NULL;
> +    /* only used to avoid a leak if entries was NULL */
> +    struct V9fsDirent *unused_entries = NULL;
>      uint16_t slen;
>      uint32_t n = 0;
>  
> @@ -612,6 +614,8 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>              e = g_new(struct V9fsDirent, 1);
>              if (entries) {
>                  *entries = e;
> +            } else {
> +                unused_entries = e;
>              }
>          } else {
>              e = e->next = g_new(struct V9fsDirent, 1);

This is always allocating and chaining a new entry even
though it isn't needed in the entries == NULL case.

> @@ -628,6 +632,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>          *nentries = n;
>      }
>  
> +    v9fs_free_dirents(unused_entries);

This is going to loop again on all entries to free them.

>      v9fs_req_free(req);
>  }
>  

If this function is to be called one day with an enormous
number of entries and entries == NULL case, this might
not scale well.

What about only allocating a single entry in this case ?

E.g.

@@ -593,7 +593,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
                    struct V9fsDirent **entries)
 {
     uint32_t local_count;
-    struct V9fsDirent *e = NULL;
+    g_autofree struct V9fsDirent *e = NULL;
     uint16_t slen;
     uint32_t n = 0;
 
@@ -611,10 +611,12 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
         if (!e) {
             e = g_new(struct V9fsDirent, 1);
             if (entries) {
-                *entries = e;
+                *entries = g_steal_pointer(e);
             }
         } else {
-            e = e->next = g_new(struct V9fsDirent, 1);
+            if (entries) {
+                e = e->next = g_new(struct V9fsDirent, 1);
+            }
         }
         e->next = NULL;
         /* qid[13] offset[8] type[1] name[s] */


