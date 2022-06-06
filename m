Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBC53E5B4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:28:04 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFaF-0004uC-8d
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nyFK8-0003vA-Oc
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:11:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nyFK2-0000ER-I8
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654531875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eMfTTxgRDbox2PCZLDG/GCAm3AQVDLV8L58jOKpqoRs=;
 b=NnKxL6D4bOnlO4Ll8AX4m9mCdCVy+MSbwhC8V6rB2acfCpurAUz0AKte5Sj4He9hBXm2H7
 919IYynYc87fOixTocVSk+geTHgRy6yaTbE+QUBu+sXRmSPjsPqFjNf3GeH2FjH9hkghDG
 7XL34uqLtEVaxGLaPX3R6DluXyHEw/o=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-TpALWQLjMfu87ra24D97DA-1; Mon, 06 Jun 2022 12:11:14 -0400
X-MC-Unique: TpALWQLjMfu87ra24D97DA-1
Received: by mail-il1-f199.google.com with SMTP id
 i18-20020a926d12000000b002d1b13b896cso11931067ilc.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 09:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eMfTTxgRDbox2PCZLDG/GCAm3AQVDLV8L58jOKpqoRs=;
 b=PUfqzR3t9YMJEPEZtEtZoLlg5MiCr04xp5tVGv3L+WlMlgxop6kDegJDFEhyGJA5Kz
 5y6BakiZQ4FdGUgINR1ISkN11jIvbuMfhl4bkeiVkhMdlzAnVaS4lhUcPipMJR6nm48P
 STyNkAVw0FAq6F9dmcrc2wL46W2yWzhJxsnuwn5A6g+MOGXrwyL97gPVYDD3B5P72R3u
 uNlzI73SjVShRNOvgcgAvICb5keCtbcRLZ7EYzzZbuMoc74Ij0/zz/+JfXKvM67wxQxw
 8pdouQh18fFJhRKYXqywPlj8MjXXKGY7xZNMuCcy115LDbQ0Pu/Xh6cJEP9BlclpEZz/
 6lPg==
X-Gm-Message-State: AOAM5308kQdWf4kWBCzOOqkeKKDnatDnvOBZIPx1QDuaqQcjLnXQ/NYD
 7+LN2ObsJ14jEXmVtQODW1YBJOE9Uul+zkLdflDUnCNcQvZHUVmkR5bNN5oNDsIu68rJXRRhkX7
 pJDJz8zGyiEO4ZlxMYwlbBNVt62kmstk=
X-Received: by 2002:a6b:7e07:0:b0:669:4644:9300 with SMTP id
 i7-20020a6b7e07000000b0066946449300mr4677026iom.88.1654531874168; 
 Mon, 06 Jun 2022 09:11:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdVNLVdKLVMwqy6CMecS4qstlUk0hRs24MUSwTIlkOycnncIEbM4EEW/4T0wh45CyZb5xZvUs+gdbeL4ZhThY=
X-Received: by 2002:a6b:7e07:0:b0:669:4644:9300 with SMTP id
 i7-20020a6b7e07000000b0066946449300mr4677014iom.88.1654531873948; Mon, 06 Jun
 2022 09:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
 <20220527142506.wkl2al5vtle45qji@redhat.com>
 <YpS9Y0p18HJSNFsq@stefanha-x1.localdomain>
In-Reply-To: <YpS9Y0p18HJSNFsq@stefanha-x1.localdomain>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 6 Jun 2022 17:10:38 +0100
Message-ID: <CAELaAXx23BK86W6oEzo9DANj=KCTpXAwDu0E85BGj19UW0M3VQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, 
 "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, 
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the feedback, and apologies for the delayed response.

On Mon, May 30, 2022 at 1:49 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> If you find it's safe to change to -EINVAL then that's consistent with
> how file I/O syscalls work and I think it would be nice.

Switching to -EINVAL on negative bytes sounds good to me, but perhaps
it should be done as a separate series. For now, switching just
bdrv_{pread,pwrite}() to -EIO will make them consistent with all of
bdrv_{preadv,pwritev}() and bdrv_co_{pread,pwrite,preadv,pwritev}(),
accomplishing the purpose of this series with less changes and
auditing.

I can work on a subsequent series that changes -EIO to -EINVAL on
negative bytes for all the bdrv_...() and blk_...() functions.

Would this make sense?

Alberto


