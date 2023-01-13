Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A2669493
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGHZ9-0007K2-7Y; Fri, 13 Jan 2023 05:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGHZ5-0007Iw-7z
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGHZ2-0001Kz-Kt
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673606735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqnfHqBiC7xiFrG3j5JTQoch6P9nMQEhItT+ElF0Ipc=;
 b=Qfok3b+k+LWWdwDnyUcBEdPT+NCB79fXUesggMJnUw32oqJCyL1ODad62G3aIYoT+ORb48
 Nd1x5UP/Z5GESUhzye3+5EKl4kwBXpieQ6JL99PnIc0YQlxV9AoNLLD+/PiUTTI/1fJsc+
 8sgmZc0SiLcpW0hSofn48YR8KpaJDsU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-0mkawJ84PJOj__gVVw8qIw-1; Fri, 13 Jan 2023 05:45:34 -0500
X-MC-Unique: 0mkawJ84PJOj__gVVw8qIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECF8B3815EE6;
 Fri, 13 Jan 2023 10:45:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D913B2026D76;
 Fri, 13 Jan 2023 10:45:32 +0000 (UTC)
Date: Fri, 13 Jan 2023 11:45:31 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] qcow2: Fix theoretical corruption in store_bitmap()
 error path
Message-ID: <Y8E2S0sQgEPkb0j3@redhat.com>
References: <20230112191454.169353-1-kwolf@redhat.com>
 <20230112191454.169353-2-kwolf@redhat.com>
 <d13c9ba1-84df-dbac-adc5-8ea8b4df2dbe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d13c9ba1-84df-dbac-adc5-8ea8b4df2dbe@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 13.01.2023 um 08:30 hat Philippe Mathieu-Daudé geschrieben:
> On 12/1/23 20:14, Kevin Wolf wrote:
> > In order to write the bitmap table to the image file, it is converted to
> > big endian. If the write fails, it is passed to clear_bitmap_table() to
> > free all of the clusters it had allocated before. However, if we don't
> > convert it back to native endianness first, we'll free things at a wrong
> > offset.
> > 
> > In practical terms, the offsets will be so high that we won't actually
> > free any allocated clusters, but just run into an error, but in theory
> > this can cause image corruption.
> > 
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   block/qcow2-bitmap.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> > index bcad567c0c..3dff99ba06 100644
> > --- a/block/qcow2-bitmap.c
> > +++ b/block/qcow2-bitmap.c
> > @@ -115,7 +115,7 @@ static int update_header_sync(BlockDriverState *bs)
> >       return bdrv_flush(bs->file->bs);
> >   }
> 
> Maybe add a comment here remembering to bswap back to native endianness?
> 
> > -static inline void bitmap_table_to_be(uint64_t *bitmap_table, size_t size)
> > +static inline void bitmap_table_bswap_be(uint64_t *bitmap_table, size_t size)
> >   {
> 
> This function uses cpu_to_be64(), semantically we convert back calling
> be64_to_cpu(), but technically both functions end up being the same.

Yes, but we don't seem to have any public "neutral" functions, it's
always either from or to.

> Alternatively:
> 
>      for (i = 0; i < size; ++i) {
> -        bitmap_table[i] = cpu_to_be64(bitmap_table[i]);
> +        bswap64s(&bitmap_table[i]);
>      }

Doesn't that swap even on big endian hosts, resulting incorrectly in a
little endian table?

The closest thing we have that I can see is the be_bswap() macro in
bswap.h, but it's undefined again at the end of the header.

> > @@ -1401,9 +1401,10 @@ static int store_bitmap(BlockDriverState *bs, Qcow2Bitmap *bm, Error **errp)
> >           goto fail;
> >       }
> > -    bitmap_table_to_be(tb, tb_size);
> > +    bitmap_table_bswap_be(tb, tb_size);
> >       ret = bdrv_pwrite(bs->file, tb_offset, tb_size * sizeof(tb[0]), tb, 0);
> >       if (ret < 0) {
> > +        bitmap_table_bswap_be(tb, tb_size);
> >           error_setg_errno(errp, -ret, "Failed to write bitmap '%s' to file",
> >                            bm_name);
> >           goto fail;
> 
> Pre-existing, but consider using g_autofree for 'tb'.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

Kevin


