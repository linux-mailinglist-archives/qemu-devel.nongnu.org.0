Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CF620BD4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKdf-00033V-QC; Tue, 08 Nov 2022 04:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1osKde-00033M-6g
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:11:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1osKdc-0003D3-5P
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667898678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5K/Glvr43IoW8l0mBtERZGtXSvPgZ03afIlt3deVlc=;
 b=Es6ZDu7bGivmaJiQ/pASrixRifAPDe1xzkQfnjD/Xdj1QgaqbG0mmeDY42vbaaIicF7pdw
 mfeOtk24+H5vFyA3aLEAYhmn237bphTx7j8fCA10U3mFYzE27oL7EOpD/G5GtICFq4ez9W
 s3el1l7SKwmzSDWQD1XU3nLv0ZEQP2k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-dn23iUFzPim4f03h3DBy0g-1; Tue, 08 Nov 2022 04:11:17 -0500
X-MC-Unique: dn23iUFzPim4f03h3DBy0g-1
Received: by mail-qk1-f200.google.com with SMTP id
 w13-20020a05620a424d00b006e833c4fb0dso12254934qko.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5K/Glvr43IoW8l0mBtERZGtXSvPgZ03afIlt3deVlc=;
 b=EpBwaqYj1oksD0B+flRa8kpgw1MjsPMjiwmPvMSY62jQckT7xuSDjBB/61wgx4W8/g
 fXbQJNFfXgIZFQzBRa473+JWDy1BgsTpT9H/redC2wZu8KjS0AhNJRPaSBvfjznTMi4X
 oGlIUe3MiRAtKlYhWVauVOIN9AAcOaZnU4P2CQlRF+O3JMi20ybucyuVrEbB0NAV/KQp
 awGUumCj4qlSZnstDSVjvGogt8A/AiFatX2EMgwLHPhIdS8xJFIMq4yxuGvSP4AQW3yf
 hqgNFmeMNkxMz3zxwFeEKCp9ZlV1vZCSmN8WeFG6/trktyiYbTF+Edl+gvypLnIyfh6U
 54Aw==
X-Gm-Message-State: ACrzQf2FG1yqly+r00e6l1aKh5haGp1myCFAlbNADQfPQCQfdodwAUd2
 zhgKjouqodX7ko5roZyYiXrRVgI0SO0ZEkYIQx5WUMY2yw6px1cFMxB8Yn3uAZcUfjmTwefm2WP
 vmsxX8bTBFqXtiv1OmE+hkH7PrPvOgSU=
X-Received: by 2002:a05:620a:68c:b0:6fa:2ef6:a395 with SMTP id
 f12-20020a05620a068c00b006fa2ef6a395mr31597540qkh.598.1667898677366; 
 Tue, 08 Nov 2022 01:11:17 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4QriuT8CPE0vePZqXI1pvqSWqmvGiFHub/1yurmlPCFbhcQm6hezUH9FbPL9hm2e/rcaeHmlM+ySwIF5eQt3Q=
X-Received: by 2002:a05:620a:68c:b0:6fa:2ef6:a395 with SMTP id
 f12-20020a05620a068c00b006fa2ef6a395mr31597529qkh.598.1667898677130; Tue, 08
 Nov 2022 01:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <0864b291-c9b7-bdff-bda4-124ff7c8d957@linaro.org>
In-Reply-To: <0864b291-c9b7-bdff-bda4-124ff7c8d957@linaro.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 8 Nov 2022 10:11:06 +0100
Message-ID: <CAA8xKjUiF7MgRZp+y4vt64Xkf7cAAtGZzCxJZ6YN1eyEU4c3Pw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, XRivenDell@outlook.com, 
 coc.cyqh@gmail.com, ningqiang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
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

On Mon, Nov 7, 2022 at 8:12 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 7/11/22 11:35, Mauro Matteo Cascella wrote:
> > Make sure to reset data_count if it's equal to (or exceeds) block_size.
> > This prevents an off-by-one read / write when accessing s->fifo_buffer
> > in sdhci_read_dataport / sdhci_write_dataport, both called right after
> > sdhci_buff_access_is_sequential.
> >
> > Fixes: CVE-2022-3872
> > Reported-by: RivenDell <XRivenDell@outlook.com>
> > Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> > Reported-by: ningqiang <ningqiang1@huawei.com>
> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > ---
> >   hw/sd/sdhci.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index 306070c872..aa2fd79df2 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState *s)
> >   static inline bool
> >   sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
> >   {
> > +    if (s->data_count >=3D (s->blksize & BLOCK_SIZE_MASK)) {
> > +        s->data_count =3D 0;
> > +    }
>
> You avoid an off-by-one but now the model doesn't work per the spec.

Note that a similar thing is done in sdhci_{read,write}_dataport. But
it's true that this is probably not enough (e.g. no update of
s->prnsts). Thank you for sending
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg01161.html.

> Not really what the best fix IMHO.
>
> >       if ((s->data_count & 0x3) !=3D byte_num) {
> >           trace_sdhci_error("Non-sequential access to Buffer Data Port =
register"
> >                             "is prohibited\n");
>
> I wonder why sdhci_data_transfer() indiscriminately sets
> SDHC_SPACE_AVAILABLE in the write path (at least without
> clearing the FIFO first).
>
> The fix could be:
>
> -- >8 --
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> @@ -955,5 +955,5 @@ static void sdhci_data_transfer(void *opaque)
>           } else {
>               s->prnsts |=3D SDHC_DOING_WRITE | SDHC_DAT_LINE_ACTIVE |
> -                    SDHC_SPACE_AVAILABLE | SDHC_DATA_INHIBIT;
> +                                           SDHC_DATA_INHIBIT;
>               sdhci_write_block_to_card(s);
>           }
> ---
>
> Bin, what do you think?
>
> Regards,
>
> Phil.
>

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


