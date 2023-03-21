Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC66C2D93
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXy6-00067f-TG; Tue, 21 Mar 2023 05:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1peXy3-00066E-T1
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1peXy2-0003JD-IT
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679389661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hu43Sg8yuoRC+qatd3snuBVPDw8wh8d6kRDH6JKSXEM=;
 b=h9n3qg6p5N3RAJ98d2dAkqunTfEVYyKPdsKCZ7HYuL+aMWATl1U+dGYy8sA/ECAZ+Ya9Ih
 M1yXYxUxaTiIojVtm96Glue2XsW5/u0Cn+aTHH0vlwsC7P38GjJaTqe9TjtXwZJ6ARtEw5
 YXB4BCIMf86tRivYCu1VHCHRtRn3tAc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-rMxznwC6P16xLb7Bql9Afw-1; Tue, 21 Mar 2023 05:07:40 -0400
X-MC-Unique: rMxznwC6P16xLb7Bql9Afw-1
Received: by mail-ua1-f71.google.com with SMTP id
 x15-20020a9f3e8f000000b0074d03a2ef63so7682025uai.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679389659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu43Sg8yuoRC+qatd3snuBVPDw8wh8d6kRDH6JKSXEM=;
 b=C66qtBu6wHw8J36wqYiFQqfOFl7D9fu6w8beBsb8BzlWoEYuaUPjU8VhuzP+aNtnoD
 aja4YT8f2u7kMDgQlkjvn8AUelOQa4WxyhRNQp+u1W/LIXvc8K/CT5KC+mR+iU55ecGu
 gz6OyhDcs1P9pVWqFU4R8cgaOetiKBQui8XYDk8kf7IdAAkmk85qbfG1yBnZ4jBH5rHp
 TYEaU7zMMoSqW4b1fsT5nn7S6CVCrDorGEfn3JVk5dQzkZ9aDITlslGcdGtwGDpaIrZJ
 pYRqLGMCXey5bVqzchIJksuCyFh92M8TIfC4DkarRUhhrh5NwM+3Xxo1sdcBh6CMqUCJ
 kQUA==
X-Gm-Message-State: AO0yUKWRCgpzt8/GKuMf6Id/WUrOe2yrnsfCecIquvLDCzkh2v2gJKLv
 0mcRp09IQOkH5Pk7ChQuS8tixJnC8aXL/EdVk0NSwutaI1gLqGbtnxFPz3KuSMa14SRm5DYxdDz
 FZsDS9W68tRKzt6DbZH2qU4dyl/+oKlxJ/tbqnndIuA==
X-Received: by 2002:a1f:9bcb:0:b0:40e:fee9:667a with SMTP id
 d194-20020a1f9bcb000000b0040efee9667amr779828vke.3.1679389659543; 
 Tue, 21 Mar 2023 02:07:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+VqvzEv6kfel2At7SNIYBeMydOHU0IHkSqKRRYCRameMcwTxa//AKW54ZjCf4WiIwNFxpZDdbrJ/ZioPwq9KE=
X-Received: by 2002:a1f:9bcb:0:b0:40e:fee9:667a with SMTP id
 d194-20020a1f9bcb000000b0040efee9667amr779819vke.3.1679389659304; Tue, 21 Mar
 2023 02:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <10513163.6254.1678726591818@app134031.ytz3.service-now.com>
 <CAMPkWoO9bX5SE8TdTeaNsRkrusVUFjNjSV_P9GP--=iE4ePJoA@mail.gmail.com>
In-Reply-To: <CAMPkWoO9bX5SE8TdTeaNsRkrusVUFjNjSV_P9GP--=iE4ePJoA@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 21 Mar 2023 10:07:28 +0100
Message-ID: <CAA8xKjWOpX6=C1L8dM8ry2L=11T0fUmbC_LibCi1AV6x+eMTkg@mail.gmail.com>
Subject: Re: [PATCH v1] hw/pvrdma: Protect against buggy or malicious guest
 driver
To: Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: marcel.apfelbaum@gmail.com, qemu-devel@nongnu.org, soulchen8650@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
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

Hi Yuval,

Dropping <qemu-security> and <secalert@redhat.com>. This is CVE-2023-1544.

The patch looks good to me. Thank you.

On Mon, Mar 20, 2023 at 1:07=E2=80=AFPM Yuval Shaia <yuval.shaia.ml@gmail.c=
om> wrote:
>
> Hi,
> Patch is currently under review.
> From my end, it was tested and proved to solve the problem.
>
> To follow up you may need to check qemu-devel@nongnu.org from time to tim=
e.
>
> Marcel, any feedback?

--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


