Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05E3BF2B3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:08:01 +0200 (CEST)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1HaB-0003YW-Mj
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1HZM-0002u5-Kb
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1HZI-0001RB-Be
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625702822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=WJwUDU6SpLrWcVAqN4fJ51qzs2uQDc+Fk3Nv4+mvsKk=;
 b=apeKYLj0K+2QKy8XgM+7q5rOFY+patbK1iVYI20bMOXVQhxn4tiZea1ju3Lxg8/xVG8hpE
 +v4dwnhxTgp2l+lGsFpvdBtDpUTi2PPLXfp9f+sn4NRV3YFjjRG3te7NMV0gUVLc2GQRco
 zBAKlsljVP5DNVMqzkMCP6asrBUcbhw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-420hiVmdOfubtdVGfCrwEQ-1; Wed, 07 Jul 2021 20:07:00 -0400
X-MC-Unique: 420hiVmdOfubtdVGfCrwEQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 t10-20020a170902b20ab029011b9ceafaafso1116624plr.11
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 17:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:cc
 :subject:from:to:date:message-id:in-reply-to;
 bh=WJwUDU6SpLrWcVAqN4fJ51qzs2uQDc+Fk3Nv4+mvsKk=;
 b=tD/gZVIeGQMiJFU7QdqBw6mNaHuLPbQTJuKncXzFuRN4X+D1G+CK4nqNKcJq87+XWP
 xKxxP1t63koV/DjpSXvpxbI1oRqWhmMv5O0jO7F0JXemYj0CTtUFTiFl7IYQARe43Oss
 aiPCAI67rcgq4D4Ni2XU2Y5/O5nrS3UeJVjvsEPaTIHe8gXFNfsOwnHPuYmtmvljJKEM
 rs4egRhgySvKVyuwEo00KHInS5o5Y47FnOzdNmToQvgHB9fTDrAJ7h3Aub1BDbgcskVu
 fsucd3j+K4RhJScebYa55ujkhMWkaeZaXk8BkRRyjqHMuLMj7q5HrTo9Pvu1LGYzQUl/
 tIRQ==
X-Gm-Message-State: AOAM531iOSgvb/4VupLXWVqYLQr8Ba7H+FP1l1c5dZo5mevVcVYjAjU5
 6QZHVCrgrLe8hGTS18nQEsV7Vc/Jc3PUDEvKraBJuh2ky5dlR4E6mIJHaej0eqR9rbXUNPfeqia
 XdfYfMpq5jLlulxQ=
X-Received: by 2002:a63:a805:: with SMTP id o5mr29072767pgf.328.1625702819827; 
 Wed, 07 Jul 2021 17:06:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+L9ijTCy4edgKQs4Y90gmPx6DvZ7jjBFPViAWNsUch/2QHHitEXcJBVKGCYwic0HdLMmqfA==
X-Received: by 2002:a63:a805:: with SMTP id o5mr29072753pgf.328.1625702819656; 
 Wed, 07 Jul 2021 17:06:59 -0700 (PDT)
Received: from localhost ([2601:1c0:4600:3f84:cb33:5075:e7f0:7862])
 by smtp.gmail.com with ESMTPSA id p53sm343711pfw.108.2021.07.07.17.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 17:06:59 -0700 (PDT)
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] numa: Parse initiator= attribute before cpus=
 attribute
From: "Connor Kuehl" <ckuehl@redhat.com>
To: "Michal Privoznik" <mprivozn@redhat.com>, <qemu-devel@nongnu.org>
Date: Wed, 07 Jul 2021 17:06:28 -0700
Message-Id: <CCNBJITSOBH8.362UBSX2EQTUE@redhat>
In-Reply-To: <cover.1625662776.git.mprivozn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: imammedo@redhat.com, tao3.xu@intel.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed Jul 7, 2021 at 6:40 AM PDT, Michal Privoznik wrote:
> See 2/2 for explanation. The first patch is just cosmetics.
>
> Michal Privoznik (2):
> numa: Report expected initiator
> numa: Parse initiator=3D attribute before cpus=3D attribute
>
> hw/core/machine.c | 3 ++-
> hw/core/numa.c | 45 +++++++++++++++++++++++----------------------
> 2 files changed, 25 insertions(+), 23 deletions(-)
>
> --
> 2.31.1

For the series:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


