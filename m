Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5236DC295
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 04:16:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plh3Q-0006lb-Bh; Sun, 09 Apr 2023 22:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1plh3L-0006l1-G4
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 22:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1plh3I-000891-1X
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 22:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681092878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3Gq5txhaueoqrBbJSprGFe4ZyBAoBo+zAszxXvgLkU=;
 b=Ds4pbGQiArslzlHFsuoLCD95rb4zNTW+SC6nWCrYA/YMvF9tIMInrtCNvu83cVtAbaEcKl
 x+9OXdbJLfD+MKatVhB/ggZMW5u62i3ttzUOitl1A+LvTIvUROIrKL2ceDXyKhSZE1xeHQ
 fHeY1kXqt2VX+WtZ1PcotBWCUNRkLrY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-6KNH_mrVNSGPLw2AyzrchQ-1; Sun, 09 Apr 2023 22:14:33 -0400
X-MC-Unique: 6KNH_mrVNSGPLw2AyzrchQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 k18-20020a056830151200b006a11baeb49bso680129otp.4
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 19:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681092873; x=1683684873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3Gq5txhaueoqrBbJSprGFe4ZyBAoBo+zAszxXvgLkU=;
 b=eGM8jn1UNv/Z3oGu6Una9K2n8kv5N+e7h0AK+KDFSNzIQO59yk4LkUVuEZgIkaqcjx
 Nt2z6ObrtPVZZWlgp+lyO+r1NJSHsx2WQdiz7dhssXZSU03No6lb+Amiq9cxA1+HKkjR
 7QXgUl1PhI8iHhWAbQMLbkF6/Uf/mFgAHTsnrGjWEh5N2OweLctN1maIs7iVn+IEH5ZZ
 PErAYkveX+UvVAxL6XR/tsfJpfdfzKBKPuBKwH53xtfUD3V7AysAB4JBqPWFGtrHxLMw
 UBymBk1JtylBNEl0bR9SXoWElIvRdRh4x6+zCH2arh8yfJ3G9FCvD4ebWv2IUll2zvUz
 3GqA==
X-Gm-Message-State: AAQBX9dbp1rCdK2v7ce1jXcVIAvQFpSdVC/86lEIWN+RZssQiF2DtMzc
 Pv4cCfQone0ndHspjDkBYdviOkF1whXt082N+Q7U6jYTAhv0Khfd9/BR73+znWqAuEE06bEqZ9V
 AfWcnM4pjZzo7frEp/oz1Tudi58Y49es=
X-Received: by 2002:a54:4483:0:b0:37f:ab56:ff42 with SMTP id
 v3-20020a544483000000b0037fab56ff42mr2384394oiv.9.1681092872819; 
 Sun, 09 Apr 2023 19:14:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWZ9VYE6BkTkESWlKBg3Lla7kH48WfLkspjlkaH84HjJgBhWn41iEiJxwCzJ/2IIZfZNGj6QzJLl7fcPw9d50=
X-Received: by 2002:a54:4483:0:b0:37f:ab56:ff42 with SMTP id
 v3-20020a544483000000b0037fab56ff42mr2384384oiv.9.1681092872584; Sun, 09 Apr
 2023 19:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
In-Reply-To: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Apr 2023 10:14:21 +0800
Message-ID: <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Longpeng <longpeng2@huawei.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Apr 5, 2023 at 7:38=E2=80=AFPM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> Hi!
>
> As mentioned in the last upstream virtio-networking meeting, one of
> the factors that adds more downtime to migration is the handling of
> the guest memory (pin, map, etc). At this moment this handling is
> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
> destination device waits until all the guest memory / state is
> migrated to start pinning all the memory.
>
> The proposal is to bind it to the char device life cycle (open vs
> close), so all the guest memory can be pinned for all the guest / qemu
> lifecycle.
>
> This has two main problems:
> * At this moment the reset semantics forces the vdpa device to unmap
> all the memory. So this change needs a vhost vdpa feature flag.

Is this true? I didn't find any codes to unmap the memory in
vhost_vdpa_set_status().

Thanks

> * This may increase the initialization time. Maybe we can delay it if
> qemu is not the destination of a LM. Anyway I think this should be
> done as an optimization on top.
>
> Any ideas or comments in this regard?
>
> Thanks!
>


