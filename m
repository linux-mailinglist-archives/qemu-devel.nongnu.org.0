Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE944403A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:58:26 +0100 (CET)
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miDyL-0006Ze-Fi
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miDwO-0004Vc-4U
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miDwL-0000eD-6J
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635936979;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3o68slE+fkBJ3qbS0x7IioqLfPSTRyl2yOpATQ7PDs=;
 b=D8np651AtfUWrYffrExc6TdFdpB2vTDbMK8aZkc1hjTsrvNfaqu3Sp7mRE/NVMtYwVqZjK
 hbfxI4ixZnE8Fk6GAIVpdBqCzH1PuLdrCJ5Mrlcd2/wkR4hDXBLmpFWPmik0mi9aZFjUCT
 ZsdeFAri+kr/q0v7cNH4BfwrZ9eUh0s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-sqWzdtMHOgicmdqKPzHPSg-1; Wed, 03 Nov 2021 06:56:18 -0400
X-MC-Unique: sqWzdtMHOgicmdqKPzHPSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso893609wms.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 03:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3o68slE+fkBJ3qbS0x7IioqLfPSTRyl2yOpATQ7PDs=;
 b=lmRKSHmGySqOqBGXhR9bgDY49QpTq+lLs3JO3PxJqzj8ggYFFrXohacNeqjaZpZktl
 wwJgKFmEVOL0UsnvKGDL7quMGVXkDsa8LyP2LA0vVov78aTRvVrB3XuZqnSbqBcGJfFq
 KrdM+CXpYNYmQLkOUoju8798bG/oR38WQxeYFuKUwImFi8gnw7A11U9dTkGcZqTTumvG
 IS4z5sVxrA+0jG/GgMPqjhnxymqYAV9dphUFGH8TIi2pP/kgMTtMXpvsamJNfsYo/05Y
 GAd90ZVLLSZgPVgd8mLDCe+G1/nULmEwL2fOCxHgSUGdEbtbcBLL05yyNa85VRo/C/s6
 rJBQ==
X-Gm-Message-State: AOAM5312NnCrTs75/UmvPj9hWs0e3y07jrPznumPHumVyR1npy7HFeBz
 qEITBRpQr/ks0gu2aVp07lsG7mSgJ4DZO8a91jOD61Pusw8NBWzESmycWGIqY8T9aORF95kWuP/
 kkPUiMJfXmGn1l8Y=
X-Received: by 2002:adf:e387:: with SMTP id e7mr44253517wrm.412.1635936977150; 
 Wed, 03 Nov 2021 03:56:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwED6YdrPmW5KcFgSF/1PXiqQ0D9kanLDs6KLWBFlHosz0KLJ88WF8kT/zfCtUt4qgzX/OT8w==
X-Received: by 2002:adf:e387:: with SMTP id e7mr44253499wrm.412.1635936977033; 
 Wed, 03 Nov 2021 03:56:17 -0700 (PDT)
Received: from localhost ([178.139.225.234])
 by smtp.gmail.com with ESMTPSA id b10sm1684663wrt.36.2021.11.03.03.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 03:56:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v3 1/2] vhost: Rename last_index to last_vq_index
In-Reply-To: <20211103100131.1983272-2-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Wed, 3 Nov 2021 11:01:30 +0100")
References: <20211103100131.1983272-1-eperezma@redhat.com>
 <20211103100131.1983272-2-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 03 Nov 2021 11:56:14 +0100
Message-ID: <87fssd7bjl.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> The doc of this field points out that last_index is the last vq index.
> Since last_index can cause confusion if seen out of context, renaming
> to last_vq_index, aligning with vq_index.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


