Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF33DBB05
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:48:21 +0200 (CEST)
Received: from localhost ([::1]:41186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ToC-0006Hk-B9
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m9TnL-0005Z0-8M
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:47:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m9TnH-0005gP-H9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627656441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fty85GH/AGPJGfJOJJ7A1Zv90VpYcHWR6yPKH13erWQ=;
 b=KKKTY8f+GmfWdBlf1ctZleAD3b6wtZUfmg7RGzF70ZGPWDsRHkuMr5w1MGCx9aBasAfFos
 uLFZh+LtQ741i40p3tpoYeuhhrKT6QQjTaJZaEdmO7IaIT9FkWZZ3ZRxeXE0+3/cAneK7h
 1gYgw0FtlCJwdsmdsY3fldZMaOedwX0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-tgjCA0QXMSSWdmEfkCp2Lw-1; Fri, 30 Jul 2021 10:47:18 -0400
X-MC-Unique: tgjCA0QXMSSWdmEfkCp2Lw-1
Received: by mail-oo1-f70.google.com with SMTP id
 b32-20020a4a98e30000b029026222bb0380so3588152ooj.23
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 07:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:date
 :message-id:from:to:cc:subject:references:in-reply-to;
 bh=fty85GH/AGPJGfJOJJ7A1Zv90VpYcHWR6yPKH13erWQ=;
 b=mZPQQ6vlhiHFHYjv5VQW+HqT4TaE0nh/XhMoKrzeeOHCn2D0XZ+Xf5fpvqp73xweR2
 b3QflphzbQD5UtsR3sZ1iHoUCf+pdToiQ8+VGFsfcaKe7LTkmXCvs/590IQYHCvMAO0W
 NPu6SOEK3fgJ5Q/e6mO7krgi2MKc2Heo0aNr83ZGFlMtAucXW9PLQEZd4H8OS/IDeIe8
 2UTVZyTW0X5vtYyyp50HUl1TN8SZtHOW4Xl1cHqfp6ZSKXG43kyMischXr4oRrlQEAHZ
 +u4JjEbbHhmhGD34kZ8blJsoeFwCIdXUfSVOMqbsNFUIsRLD9wLSyKNJ4lOSWheACO9Q
 5MNg==
X-Gm-Message-State: AOAM531Av7QUdh+ArCCYoI8S+nkmYBqaE0vFaBsMEWhjfh6vg1HoXWPr
 aq4DpUSiO4ovV10r34XbTmEYvYt7VHXd/pjWXNsng6T5lMzbg6xyYRv43VyuDsqe5hRaqebNlbB
 Hjbg+xd3HzjiDm68=
X-Received: by 2002:a9d:1d7:: with SMTP id e81mr2338271ote.106.1627656437800; 
 Fri, 30 Jul 2021 07:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/CvYpRp1ScPmBJYrLhBB7VsWvLvAaYm1Ai5iBmRj7hmMCloXcG2uaoKV8ti8AMrNNjIo3Tw==
X-Received: by 2002:a9d:1d7:: with SMTP id e81mr2338249ote.106.1627656437548; 
 Fri, 30 Jul 2021 07:47:17 -0700 (PDT)
Received: from localhost (ip68-103-222-15.ks.ok.cox.net. [68.103.222.15])
 by smtp.gmail.com with ESMTPSA id i205sm317804oif.14.2021.07.30.07.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 07:47:17 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 30 Jul 2021 09:47:16 -0500
Message-Id: <CD6K1W4R8HRF.3G3JJ2YD4C8I3@fedora>
From: "Connor Kuehl" <ckuehl@redhat.com>
To: "Dov Murik" <dovmurik@linux.ibm.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
 <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
 <05d0ae90-a45f-157b-d37c-942bc0442449@redhat.com>
 <203b655c-809b-b418-f61c-982e587fa9f2@linux.ibm.com>
In-Reply-To: <203b655c-809b-b418-f61c-982e587fa9f2@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, Tobin
 Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu Jul 29, 2021 at 2:31 PM CDT, Dov Murik wrote:
> The OVMF companion series has been reviewed by the new OVMF maintainer
> and merged to edk2 master branch as of edk2 commit 514b3aa08ece [1].
>
> [1] https://github.com/tianocore/edk2/commit/514b3aa08ece

Awesome! Unfortunately, it's looking like we'll have to wait[1] for QEMU to
thaw before this series goes in.

Connor

[1] https://wiki.qemu.org/Planning/6.1


