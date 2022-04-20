Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D348508D8E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:43:32 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDQR-0004qs-9r
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhD2b-0006uI-5s
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhD2Y-0007um-Ta
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650471530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpLopmsYxeUw3nAOYCDRrtP4DGR4MNVvrmGL7t7bOdI=;
 b=P9yRiWyQ+mMNKLYFt5YL74v0MR55NeWKGpeBSxmS5a7HGaw61JdfP7wJUSMWElOxs6CsWo
 LskPDiihlIaQ8ssRkJW2CWtaSjMLRSCXRBs4+8RcozDY+qB0UZs00ogvVrNfny3z0DQTfL
 bm5Cf3eZeGtnsZ5IfrWoF8OTiKsz5e0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-SDYWDJq1PvyRICxHaSDpow-1; Wed, 20 Apr 2022 12:18:48 -0400
X-MC-Unique: SDYWDJq1PvyRICxHaSDpow-1
Received: by mail-yb1-f200.google.com with SMTP id
 a18-20020a25bad2000000b0063360821ea7so1885031ybk.15
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PpLopmsYxeUw3nAOYCDRrtP4DGR4MNVvrmGL7t7bOdI=;
 b=J8CGdZJLL2uWo+gBGQfUxBcR5PwouzZ4skTVGTiW/8QL7Rto6cpILBUaLN2uzfiIXq
 Mkg6q4qkZVG0fLhtozxSIsSNzZwkQJiwhj05r+0sUS7zxNhpF2XLyrONvzMowEodNkI7
 TnUXcspYRqB9lQvml7v2Y1WaiIPrRf+0cjyff0TsW2u3wUNYoOTs0Kx2WQK7xHxwxsjH
 8eaQ/maSDgBQev7Bjyma8DIn00iZbUKlQwn82TL4uIWRe1iDbMpaaT67+Tro/4bBE6fz
 62msFR39m6VuY+QtfsSd/n2yCn5PYPSjPaHxNWibBLd5W8HROhDhBgFVXiNYccBiSwWh
 RyqQ==
X-Gm-Message-State: AOAM533fXpW85vlVM56rv/o25xIELsXbyRmMQxYgYKKCJMBX0TprN+k4
 g775W4P5xYfRpZL5VnwrdznDBwh4DrAqtyJ3FTV168FKIeNeNyF/2z3eBIfAgn2jYr92GS3MpEe
 WI0jU/h6tA772/7GLQshOXk5ncN1+BEY=
X-Received: by 2002:a81:f10f:0:b0:2d6:935e:c3f8 with SMTP id
 h15-20020a81f10f000000b002d6935ec3f8mr22017279ywm.325.1650471528090; 
 Wed, 20 Apr 2022 09:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF79N86AlYe3sjdDQlPUzyqWqUhdztDREzZ0aI8WxrtsBQjDn1VGh52iU6iWSazxsn6KzV7Sxxlm90WSI/Q2I=
X-Received: by 2002:a81:f10f:0:b0:2d6:935e:c3f8 with SMTP id
 h15-20020a81f10f000000b002d6935ec3f8mr22017265ywm.325.1650471527922; Wed, 20
 Apr 2022 09:18:47 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Apr 2022 09:18:47 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
 <20220420160311.248079-3-abologna@redhat.com>
 <YmAxjNgNWT2FNh8r@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YmAxjNgNWT2FNh8r@redhat.com>
Date: Wed, 20 Apr 2022 09:18:47 -0700
Message-ID: <CABJz62PnnGYV=6qiFYL2Y0+dg61P+nv0VvRUnP1cJkU6THcMEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: build-platforms: Clarify stance on minor
 releases and backports
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:15:08PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Apr 20, 2022 at 06:03:11PM +0200, Andrea Bolognani wrote:
> > These changes match those made in the following libvirt commits:
> >
> >   2ac78307af docs: Clarify our stance on backported packages
> >   78cffd450a docs: Spell out our policy concerning minor releases
> >
> > Since QEMU's platform support policy is based on libvirt's, it
> > makes sense to mirror these recent changes made to the latter.
> >
> > The policy is not altered significantly - we're simply spelling
> > out some rules that were likely already being implicitly
> > enforced.
>
> Indeed, I think that's basically defacto the case already.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks! Are you going to bring these in through one of your trees, or
do I need to bug someone else so that they will pick them up? :)

--=20
Andrea Bolognani / Red Hat / Virtualization


