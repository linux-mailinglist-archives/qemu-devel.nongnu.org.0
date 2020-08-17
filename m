Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9A2466C3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 14:58:55 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7ej0-0002bn-AF
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 08:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1k7eiK-0002Ax-J5
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:58:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20533
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1k7eiJ-0002Jl-4Q
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597669089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKg+v3SwlD/iaDP3tuckVhVX8roN3XFhbrk1W85mmkI=;
 b=Ed0udv76kMQYUxSaO+01J2dH5WEDDy73h7Pfofsd/Sxg+nJrBG1BL1QAe05/Xe3kVTy/pH
 6EPCvtO8EVzaglemAijXjXbG3c0TVZrMY4D2BKdkDNR6DmCBx6JgJuz2Mrhinkiyr2UsLL
 fI2iws71Tu1D3PJY3YCEtVT1PjvbLH8=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-V0VkZza8MXqeWLgrxLJIpg-1; Mon, 17 Aug 2020 08:58:07 -0400
X-MC-Unique: V0VkZza8MXqeWLgrxLJIpg-1
Received: by mail-il1-f200.google.com with SMTP id o18so11903645ill.20
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 05:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YKg+v3SwlD/iaDP3tuckVhVX8roN3XFhbrk1W85mmkI=;
 b=ozeVL02vbXZJzTw7bl/SPDe/5X/IVeLaS9v1cLjF8xOJDrXQZ77Cc0Kg0pybLviiU+
 mux1wmdQqIuW0dYcM5TumPvr7uoKz5/taVATNgTU3Y5JEZB/+cg9QvbafXVfkb0U+TZ3
 hOf1kbNbzKmM1xeHgjospgKwt6Gmc6bCU08dFgDiO+cPRVqcQ+4RdZOH46MsvBGyMCdu
 ieJBfMoMWtbFlBPCbbsqUr26rUTDgehAuPUywt00fJoTX/rmDb0Wkx6Q+sbibV7oVyCM
 T99gKLsoq3g54EIhQCoAsUGANBoMKyEuqd8nBqjKJNAvis1joC2ouF+DWjv4MclwxjcM
 YGpw==
X-Gm-Message-State: AOAM531R3y70ahQUCHS7OUZo7LOZRU/q6/q9alM9bNNjlgi86mGR0m1f
 IYSepZ0GO3M6dXS/5CCLEhSNYzvZeAMmDpY3K0DeMLGKcXhoXE3eIe73wLENdycHs/D6ZeZOCQu
 ah/p1eM9XeFuewGhfgsd0MQwdmDGqrw8=
X-Received: by 2002:a92:4f:: with SMTP id 76mr9508845ila.11.1597669086917;
 Mon, 17 Aug 2020 05:58:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7vZpXa+5MnKkiXIwx94pRoQ2YTsEATRJd9t9qL4F1dq/KmNCSi2HbuPJ1JemUrb2wtFi2Sfq5RdpcJL/dpYQ=
X-Received: by 2002:a92:4f:: with SMTP id 76mr9508831ila.11.1597669086713;
 Mon, 17 Aug 2020 05:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200817120056.56751-1-marcandre.lureau@redhat.com>
 <20200817120056.56751-2-marcandre.lureau@redhat.com>
 <20200817122135.cmi2lfhoggsfpx3d@sirius.home.kraxel.org>
In-Reply-To: <20200817122135.cmi2lfhoggsfpx3d@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 Aug 2020 16:57:55 +0400
Message-ID: <CAMxuvawcpPEE0e4gEpe1ihFtibuJf0-wFAWuWtuURPAjwOVqXg@mail.gmail.com>
Subject: Re: [PATCH 1/4] edid: use physical dimensions if available
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlureau@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 00:24:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Aug 17, 2020 at 4:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Aug 17, 2020 at 04:00:53PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Add width_mm/height_mm to qemu_edid_info, and use it if it is
> > set (non-zero) to generate the EDID.
>
> Any specific reason why you switch from dpi to xmm/ymm?

Not really, but there is no DPI information from Gtk. I also find it
difficult to reason with DPI, dimensions are simpler to check about
correctness imho (I take the ruler from my desk for example ;). And
also DPI is a space density, without horizontal and vertical
distinction.

So by giving width/height in mm we actually have something more
correct and easier to debug imho. No?


