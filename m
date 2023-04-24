Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F856ED524
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 21:12:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr1ai-0003IB-Lw; Mon, 24 Apr 2023 15:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1pr1ag-0003Cl-9g
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 15:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1pr1ae-00088Q-9F
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 15:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682363466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VG2J72FuY/wlCWnHhwwpZ0e3EjqieuuvwSFPRRCQ/d4=;
 b=XJIz+onFTlbCMneL4/ttxBwXxuCvs4ve6G/SEG1tBkilBmWPhx7YKd4NXWplVYh1rcYAG2
 sc3ujXQH5pfGrG3gjFsTxVGV17wk5u3V5GAvfUuR+kJrxXxDuF18nx2ruN3EWwFoGX7c1T
 d3KmXkprfsnBq6tM27yAmtw4bJr9HVs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-wrBY_qMzPMCmjtOpmoodkA-1; Mon, 24 Apr 2023 15:11:05 -0400
X-MC-Unique: wrBY_qMzPMCmjtOpmoodkA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ef34e947edso56843641cf.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 12:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682363465; x=1684955465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VG2J72FuY/wlCWnHhwwpZ0e3EjqieuuvwSFPRRCQ/d4=;
 b=lcIt0Xmmi1gmcq+i/i3vvmqi/nWEA/m5xfFwT/ARQOvHnZaroxfzJ66CMK2wF2CeO/
 QWiWm7wYfbQQEoqk60pkDgBJ0yO2DZMl4HXC9oI0TivL4F8N+sqLGAq5zIXimU3oBhSv
 5FjWrv1SpOVArRq++a+2UuGVxgNmZkXP/sYpMbNPKp2rCzQ7ppLuQpaxr1ExlQD0PG1f
 Ybnr2ChDioGHUs14AGSz2wvHUUs0Pm0EMXFU0z5BggSjWpdTl+fhxePm2z1C6XUXmqja
 XnQ2GHKYqB8SgHtxqM/I9StpsY8QY11vf8fAeZ7YkBcLBoqg+m97CbPX966G5umLCjHd
 BuYg==
X-Gm-Message-State: AAQBX9dKblAL1/tGWtM/xCQoUTq0rL44Vq54nBv1Q37lcMIPBmZ4rABn
 4/oSW99w28oPqaY1zMtyr5n7LMCfo0fXEmcykNl5YUaL/o5V9wGSMTwtrFVtHsnRAVGWrI/9USr
 WcgLycK0B9BMv7xXO+WkGr9AECJ4/oyg=
X-Received: by 2002:ac8:7d81:0:b0:3ef:5981:2e96 with SMTP id
 c1-20020ac87d81000000b003ef59812e96mr22825120qtd.4.1682363464824; 
 Mon, 24 Apr 2023 12:11:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350akO+SsAITM/jpcvxS01zHk+eusxhQUcn09l+9W9PW+8gSxj/gpgk52KvgP6NWcZRkL6BZ98icyFRBjPWulsdM=
X-Received: by 2002:ac8:7d81:0:b0:3ef:5981:2e96 with SMTP id
 c1-20020ac87d81000000b003ef59812e96mr22825094qtd.4.1682363464602; Mon, 24 Apr
 2023 12:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230419162957.16696-1-quintela@redhat.com> <ZEKqfusi5NhRzqxz@x1n>
In-Reply-To: <ZEKqfusi5NhRzqxz@x1n>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 24 Apr 2023 16:10:53 -0300
Message-ID: <CAJ6HWG6Tqd+0TNktsR-6Eg+-TJTRFafKj9aRvzS5zG_BFMuY0A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Leonardo and Peter as reviewers
To: Peter Xu <peterx@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Apr 21, 2023 at 12:23=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
>
> On Wed, Apr 19, 2023 at 06:29:57PM +0200, Juan Quintela wrote:
> > Now that David has stepped down with Migration maintainership,
> > Leonardo and Peter has volunteer to review the migration patches.
> > This way they got CC'd on every migration patch.
> >
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

Acked-by: Leonardo Bras <leobras@redhat.com>

Thanks,
Leonardo Bras


