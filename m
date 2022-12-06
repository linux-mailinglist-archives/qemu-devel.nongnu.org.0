Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9F643BC4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 04:19:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2OTO-0002uV-Ax; Mon, 05 Dec 2022 22:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2OTN-0002uD-0i
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 22:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2OTL-0004Ms-9Y
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 22:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670296697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wf6ndJwAIVG8/OBvNhMnnkXjDKewjJcxNPpqfpfYJ1k=;
 b=TnCpZtrhJ0jHNS26DoZWnq8MqaYQ4oZw8/Oscz7nCADCpot47yZsFM10mwK5jacrd0E1cG
 ygX75tq8H+0uR1s48s+VbZMbliB4emofTds3Ex8fS89o/GwoOQz2sgxzjKZUnPeX2XUS9O
 Eo7Wy42DkTq7nSfLMbl1l8pspFl/Mg0=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-qQxa8IBGN-6zzIyx01Hp-A-1; Mon, 05 Dec 2022 22:18:14 -0500
X-MC-Unique: qQxa8IBGN-6zzIyx01Hp-A-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-144a21f5c25so2049126fac.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 19:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wf6ndJwAIVG8/OBvNhMnnkXjDKewjJcxNPpqfpfYJ1k=;
 b=6meriwfSolAsM/zkC24QM7Nezl7ohInTmqZG/ePeHc/JycGuFrkkrDdQijntjHKvSK
 fzsFk5FFOZwhhhCXCKtWxiN4jC84JHKEDj3Q0t2qm5UEKYgR7pS98s5J7rTqlMijDXQU
 SV3fNZucCSgGvPexR72WVXLYRXSzOc6dt8Cfpo2uRmBiZv+PCBq251A/aOAmxD6U3UPG
 VWF3STvxZbj5PUL7iEmdMLGEmFG8IfqlDhPrQqKh4MI+UW5fd/R7V51lICRMMwkSp49e
 h3NTxsw9aZgwQzCy3W6WmRay1LqetWaQOZz73aFqra5EmjO74AJmsejIidIfz/1PTLXD
 r1kQ==
X-Gm-Message-State: ANoB5plGTRAxvOQzhZ4VDf9gcxnMV9b+pnawqaLazKUE5RKUfTp3zlCJ
 +ka1ag+jwFqQ+/vxMLsRe1zC7091+EgflyaevDMt5vmgSEFRt9RfxYg9LQeZD0YZ7jyM3T+6PGC
 Sjf90UChDOhOQr8nJfXPuE7zT+Ewjrxg=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr2537264oab.280.1670296694044; 
 Mon, 05 Dec 2022 19:18:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5+pDepMJA7ADOCNtiS2Yyru9aDW5ONpFZaXavSID8xOu3PTNi7GeTxgpDOOvRuK9LoyhjvQPMaYXTxAtLlZP4=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr2537257oab.280.1670296693836; Mon, 05
 Dec 2022 19:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com> <Y4Yr5WvfioOJWOEX@x1n>
 <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
 <Y4d0HokcV/tg0wlk@x1n>
 <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
 <Y4jBMkNEFqUA7edN@x1n>
 <CACGkMEszjH02RPRy5ps7JBqkELCqLSdcCCLyPLoxY155zh8BgQ@mail.gmail.com>
 <Y458YMavxao9XSwL@x1n>
In-Reply-To: <Y458YMavxao9XSwL@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Dec 2022 11:18:03 +0800
Message-ID: <CACGkMEut82E-c_w_0MUPOwYDLkcM+mt127dbs3bkhATDSr6JQg@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Dec 6, 2022 at 7:19 AM Peter Xu <peterx@redhat.com> wrote:
>
> Jason,
>
> On Mon, Dec 05, 2022 at 12:12:04PM +0800, Jason Wang wrote:
> > I'm fine to go without iova-tree. Would you mind to post patches for
> > fix? I can test and include it in this series then.
>
> One sample patch attached, only compile tested.

I don't see any direct connection between the attached patch and the
intel-iommu?

>
> I can also work on this but I'll be slow in making progress, so I'll add it
> into my todo.  If you can help to fix this issue it'll be more than great.

Ok, let me try but it might take some time :)

> No worry on the ownership or authorship of the patch if you agree on the
> change and moving forward with this when modifying - just take it over!

Ok.

Thanks

>
> Thanks!
>
> --
> Peter Xu


