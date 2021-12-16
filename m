Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B733D477B29
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:58:10 +0100 (CET)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxv17-0004My-SQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxuyV-0001xq-9C
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxuyT-0007Ia-M1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639677324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Urlydxg+2BSyKrwnBQwUCV/SCY0+vc92ieEZk/sGhs=;
 b=EjOzcctXcg3diEAu5EHgHHzsy2YL1Eoy1w7UxpJKjW/a5O3e2+qQqSLKhU/8ZGos1gOAZq
 BqcUU3PlofaRlpQHZDUQyfxxSbbl+bALM0Vn9f7BU9JxWIBr/PAswTD/8yGukcW9lBCT/k
 ckv8oyDVVfiET0UjPwpla8KT4vqRKAQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-wf9SjYATMGS4Ja6iu5ISFA-1; Thu, 16 Dec 2021 12:55:21 -0500
X-MC-Unique: wf9SjYATMGS4Ja6iu5ISFA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso1802676wra.23
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/q5mbobjymTvMb3JoeQARok1xStZGc6TvlOlvh2Z7eU=;
 b=nF+QRYlo8Dc44AJLrS6RUEeaFZd7DoqFrZMRjyDWGFqI1i7ic97O6qGghpuA9qV1oj
 nsTO1i/kZUkcspGg4hMtsh+H+w3YHJiZSUL4dS6OJoDKujNfGppdbp8e7mreDXBJqrsy
 MUi7dtWJt/A0EdCUi3DBi3MoFkTcHmilHtHJ9TBo+80RibntGtmCDE7hG6j01d8+wPGh
 NTZn+uXaAQTZfPvKFuaiGr1BrPF2KW6P0I5P8qOjqDRMEoZ31ovIoqn1xp58FGcfKcxG
 kRijH7Wf9tw8Ymojqbt82ujqHFHxDBM6HCwRSpUQmMMyb/g2DN+R3gsebKCzH950TlQe
 V22g==
X-Gm-Message-State: AOAM532J7ZwmSVuVm6GIAdZrguQoHGbWAnmoEsh/sdX5rebzhyZo/n/P
 W9ACUpxaUgJRUB0F4oKNEANXbVetNmw2URNaLDn3W2uyyInF49xrHNoFZ3tWLFiE63Z4r+q6Lai
 PfG3VTPt4wdExc8rE3rIfnukPXv8H8uPst3dzwSAoNOFqWWJohXU1mMrs6TXC83Li
X-Received: by 2002:a7b:c341:: with SMTP id l1mr6210671wmj.60.1639677320410;
 Thu, 16 Dec 2021 09:55:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/8Ulrgr7fZaqAk6+dPlwQ0OZ/IdHkb+B8LQwyA1Ax3APoO1COY9fAykJG6ouXlglk7iLHNQ==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr6210629wmj.60.1639677320045;
 Thu, 16 Dec 2021 09:55:20 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w17sm5817985wmc.14.2021.12.16.09.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:55:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/nvme: Fix CVE-2021-3929 (DMA re-entrancy exploitation)
Date: Thu, 16 Dec 2021 18:55:08 +0100
Message-Id: <20211216175510.884749-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Keith Busch <kbusch@kernel.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the DMA API allow passing MemTxAttrs argument and=0D
returning MemTxResult (with MEMTX_BUS_ERROR in particular),=0D
we can restrict the NVMe controller to memories (prohibitting=0D
accesses by the DMA engine to devices) and block yet another=0D
DMA re-entrancy attack.=0D
=0D
I'll will try to get a reproducer (and authorization to commit=0D
it as qtest) from the reporter.=0D
=0D
Based-on: <20211216123558.799425-1-philmd@redhat.com>=0D
"hw: Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 2)"=0D
https://lore.kernel.org/qemu-devel/20211216123558.799425-1-philmd@redhat.co=
m/=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/nvme/ctrl: Do not ignore DMA access errors=0D
  hw/nvme/ctrl: Prohibit DMA accesses to devices (CVE-2021-3929)=0D
=0D
 hw/nvme/ctrl.c | 9 +++++----=0D
 1 file changed, 5 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


