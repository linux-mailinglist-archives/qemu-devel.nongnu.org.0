Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79547028AC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:34:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUa8-0003JP-Eh; Mon, 15 May 2023 05:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyUa0-0003Fi-RW
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:33:21 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyUZx-0003oc-VE
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:33:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DEBA1208FC;
 Mon, 15 May 2023 09:33:12 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 11:33:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002bc025b9f-53d4-46c5-8955-a44e98163dcb,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1e9cca41-dee9-9765-757e-ab059f2985ca@kaod.org>
Date: Mon, 15 May 2023 11:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/21] qemu-file: Remove total from
 qemu_file_total_transferred_*()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, <qemu-devel@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, <qemu-block@nongnu.org>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>, Fam Zheng <fam@euphon.net>, Thomas Huth
 <thuth@redhat.com>, Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-7-quintela@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230508130909.65420-7-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 53545c35-485a-4988-b0bc-dc97c6e0fa87
X-Ovh-Tracer-Id: 18183283497437793177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpfhgrmhesvghuphhhohhnrdhnvghtpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdphhgrrhhshhhpsgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhhitg
 hhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhlvghosghrrghssehrvgguhhgrthdrtghomhdpphgvthgvrhigsehrvgguhhgrthdrtghomhdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.93,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/8/23 15:08, Juan Quintela wrote:
> Function is already quite long.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>   migration/block.c     |  4 ++--
>   migration/migration.c |  2 +-
>   migration/qemu-file.c |  4 ++--
>   migration/qemu-file.h | 10 +++++-----
>   migration/savevm.c    |  6 +++---
>   migration/vmstate.c   |  5 ++---
>   6 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index a37678ce95..12617b4152 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -747,7 +747,7 @@ static int block_save_setup(QEMUFile *f, void *opaque)
>   static int block_save_iterate(QEMUFile *f, void *opaque)
>   {
>       int ret;
> -    uint64_t last_bytes = qemu_file_total_transferred(f);
> +    uint64_t last_bytes = qemu_file_transferred(f);
>   
>       trace_migration_block_save("iterate", block_mig_state.submitted,
>                                  block_mig_state.transferred);
> @@ -799,7 +799,7 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
>       }
>   
>       qemu_put_be64(f, BLK_MIG_FLAG_EOS);
> -    uint64_t delta_bytes = qemu_file_total_transferred(f) - last_bytes;
> +    uint64_t delta_bytes = qemu_file_transferred(f) - last_bytes;
>       return (delta_bytes > 0);
>   }
>   
> diff --git a/migration/migration.c b/migration/migration.c
> index e17a6538b4..b1cfb56523 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2621,7 +2621,7 @@ static MigThrError migration_detect_error(MigrationState *s)
>   /* How many bytes have we transferred since the beginning of the migration */
>   static uint64_t migration_total_bytes(MigrationState *s)
>   {
> -    return qemu_file_total_transferred(s->to_dst_file) +
> +    return qemu_file_transferred(s->to_dst_file) +
>           stat64_get(&mig_stats.multifd_bytes);
>   }
>   
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index f3cb0cd94f..6ebc2bd3ec 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -709,7 +709,7 @@ int coroutine_mixed_fn qemu_get_byte(QEMUFile *f)
>       return result;
>   }
>   
> -uint64_t qemu_file_total_transferred_fast(QEMUFile *f)
> +uint64_t qemu_file_transferred_fast(QEMUFile *f)
>   {
>       uint64_t ret = f->total_transferred;
>       int i;
> @@ -721,7 +721,7 @@ uint64_t qemu_file_total_transferred_fast(QEMUFile *f)
>       return ret;
>   }
>   
> -uint64_t qemu_file_total_transferred(QEMUFile *f)
> +uint64_t qemu_file_transferred(QEMUFile *f)
>   {
>       qemu_fflush(f);
>       return f->total_transferred;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index d758e7f10b..ab164a58d0 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -68,7 +68,7 @@ void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
>   int qemu_fclose(QEMUFile *f);
>   
>   /*
> - * qemu_file_total_transferred:
> + * qemu_file_transferred:
>    *
>    * Report the total number of bytes transferred with
>    * this file.
> @@ -83,19 +83,19 @@ int qemu_fclose(QEMUFile *f);
>    *
>    * Returns: the total bytes transferred
>    */
> -uint64_t qemu_file_total_transferred(QEMUFile *f);
> +uint64_t qemu_file_transferred(QEMUFile *f);
>   
>   /*
> - * qemu_file_total_transferred_fast:
> + * qemu_file_transferred_fast:
>    *
> - * As qemu_file_total_transferred except for writable
> + * As qemu_file_transferred except for writable
>    * files, where no flush is performed and the reported
>    * amount will include the size of any queued buffers,
>    * on top of the amount actually transferred.
>    *
>    * Returns: the total bytes transferred and queued
>    */
> -uint64_t qemu_file_total_transferred_fast(QEMUFile *f);
> +uint64_t qemu_file_transferred_fast(QEMUFile *f);
>   
>   /*
>    * put_buffer without copying the buffer.
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 032044b1d5..e33788343a 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -927,9 +927,9 @@ static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
>   static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
>                                      JSONWriter *vmdesc)
>   {
> -    uint64_t old_offset = qemu_file_total_transferred_fast(f);
> +    uint64_t old_offset = qemu_file_transferred_fast(f);
>       se->ops->save_state(f, se->opaque);
> -    uint64_t size = qemu_file_total_transferred_fast(f) - old_offset;
> +    uint64_t size = qemu_file_transferred_fast(f) - old_offset;
>   
>       if (vmdesc) {
>           json_writer_int64(vmdesc, "size", size);
> @@ -2956,7 +2956,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>           goto the_end;
>       }
>       ret = qemu_savevm_state(f, errp);
> -    vm_state_size = qemu_file_total_transferred(f);
> +    vm_state_size = qemu_file_transferred(f);
>       ret2 = qemu_fclose(f);
>       if (ret < 0) {
>           goto the_end;
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 351f56104e..af01d54b6f 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -361,7 +361,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>                   void *curr_elem = first_elem + size * i;
>   
>                   vmsd_desc_field_start(vmsd, vmdesc_loop, field, i, n_elems);
> -                old_offset = qemu_file_total_transferred_fast(f);
> +                old_offset = qemu_file_transferred_fast(f);
>                   if (field->flags & VMS_ARRAY_OF_POINTER) {
>                       assert(curr_elem);
>                       curr_elem = *(void **)curr_elem;
> @@ -391,8 +391,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>                       return ret;
>                   }
>   
> -                written_bytes = qemu_file_total_transferred_fast(f) -
> -                                    old_offset;
> +                written_bytes = qemu_file_transferred_fast(f) - old_offset;
>                   vmsd_desc_field_end(vmsd, vmdesc_loop, field, written_bytes, i);
>   
>                   /* Compressed arrays only care about the first element */


