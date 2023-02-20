Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5E69D3CF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBTa-0001h3-Ck; Mon, 20 Feb 2023 14:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUBTP-0001fO-TS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUBTN-0000db-UK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676919909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6t9ViPeToZrmGbMf+ISOeDpwBmcksoBTd722qb6RGTQ=;
 b=Zb6N/ekBpVEDBLEmJtgO+7xel9l9CvJJXga/T1U19fN7XskdE08Lhd7eJVxM2bRAjI9OP5
 ikdQEGEWF46prAefne36AtQR1/qIQGMCrFVYxijgGL/fHvXb+MBeSVsRzyd9NlyovUW69l
 HaPrbRzSuHnrUDpsGLLHz0FZzA1xpk4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-dDq___SsNXy14TiDbuQGkA-1; Mon, 20 Feb 2023 14:05:08 -0500
X-MC-Unique: dDq___SsNXy14TiDbuQGkA-1
Received: by mail-pl1-f198.google.com with SMTP id
 j18-20020a170903025200b00198aa765a9dso1186530plh.6
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6t9ViPeToZrmGbMf+ISOeDpwBmcksoBTd722qb6RGTQ=;
 b=xpm8G6gC6xMqSVUGJhSqDKAQI3YeSW55YssU1FxEw43MRtB8q/9Dw3pervkMsKrFXp
 vG3HWyc+VhCIDLc4Pz4Kj2LVh35vqLe1oFDZILoM/NDyzy2NKUnEDRZ2zb6Eh2Xr7yst
 zoiYU81bRRKCtY5WSRIPXiX2qXUWnSvhy5mKVkKT5ZJmzg75Ek5woauADGbc+clRtqBK
 sn/7HntcDCQXpexmBXzEQtTP7vB9I9Z717ekH1ZPMTOg6vopLJyobcIClhuOLzQYMklC
 8hGzv9DshNhtuuHxoyWwAanjplgUu90NeCFZ2YfTJq1/F2CH6sMVhcQhBioZUhsv8hjD
 /sZA==
X-Gm-Message-State: AO0yUKXXAt+8RS0RQFw09x86GHUn4cSIQuKmsYRZinyT1xzRMMQ+11fV
 FLLD2bimOupGVrx2o7uoyrXUn6vuUNFHM7ETu1DLCUgqLVq67bXO8JbPC9hQAmjPZzCLw7vIBkI
 /YoosfRd5H0/9T7q2tw9CZJVYoi1bNwE=
X-Received: by 2002:a17:90b:380b:b0:233:a695:f441 with SMTP id
 mq11-20020a17090b380b00b00233a695f441mr289347pjb.54.1676919907339; 
 Mon, 20 Feb 2023 11:05:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/DLFG3V0NOkgSgi+It3Lp7vuI04jykXE5cLWBPfUJ9X6G5ks3EWBqO8JIS4VYVoUlyzM8LOjpgq98rbnHjTGY=
X-Received: by 2002:a17:90b:380b:b0:233:a695:f441 with SMTP id
 mq11-20020a17090b380b00b00233a695f441mr289344pjb.54.1676919907037; Mon, 20
 Feb 2023 11:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20230217103130.42077-1-f.ebner@proxmox.com>
 <e5446443-7ba6-0d6c-5ec7-e853ea03f71d@linaro.org>
In-Reply-To: <e5446443-7ba6-0d6c-5ec7-e853ea03f71d@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 20 Feb 2023 14:04:55 -0500
Message-ID: <CAFn=p-b6EWttwNGRatTMBxYXChHBte985bVcS0n=UWrf=eTL=g@mail.gmail.com>
Subject: Re: [PATCH] hw/ide/ahci: trace ncq write command as write instead of
 read
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 20, 2023 at 3:12 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 17/2/23 11:31, Fiona Ebner wrote:
> > Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
> > Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> > ---
> >
> > Or should it be sorted alphabetically below execute_ncq_command_unsup?
> > I felt read and write belong close together and this reflects the
> > positions in the code.
> >
> >   hw/ide/ahci.c       | 4 ++--
> >   hw/ide/trace-events | 1 +
> >   2 files changed, 3 insertions(+), 2 deletions(-)
>
> > diff --git a/hw/ide/trace-events b/hw/ide/trace-events
> > index 15d7921f15..5ef344ae73 100644
> > --- a/hw/ide/trace-events
> > +++ b/hw/ide/trace-events
> > @@ -91,6 +91,7 @@ ahci_populate_sglist_short_map(void *s, int port) "ah=
ci(%p)[%d]: mapped less tha
> >   ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64=
_t off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
> >   ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ=
 transfer finished"
> >   execute_ncq_command_read(void *s, int port, uint8_t tag, int count, i=
nt64_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
> > +execute_ncq_command_write(void *s, int port, uint8_t tag, int count, i=
nt64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64
>
> Note that ideally the tag format should be '%u' (pre-existing).
>
> I'll carry this patch along with other QDev IDE patches I plan to merge
> (with John's blessing).

Sounds good to me, thank you Phil.

--js


