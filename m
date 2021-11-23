Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B145A156
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:22:51 +0100 (CET)
Received: from localhost ([::1]:37478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTsw-00074L-Vw
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTny-0000kM-6a
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTnv-00062j-1s
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637666257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MVxA5W7ZsIiAVuRW6yZygZ0miHJUefS+m5RAprZnhTY=;
 b=Hwi5GD0IIFSyvPMZSJY0Sbxg+0/r6dvPQrsoWVk/auGusXwQUi8Ux72nlmuK23p/ZyLaiL
 MSeWfCbFyPOFoL5ENNR8mekpSs3zgASIMsCQSDs3oEFsQYNXtjXzfMx+jMKqpw+C3kZTz6
 9jDBl68k9ZOyjOvp9guu3ldcS1Y/rts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-t7KoqftxNZ6wlEAMF2-Imw-1; Tue, 23 Nov 2021 06:17:36 -0500
X-MC-Unique: t7KoqftxNZ6wlEAMF2-Imw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so3656898wrp.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 03:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TqnDEn2lu4bYvqd68ZnTNg9+r+qCSqA2AcgMe0eNJc4=;
 b=K6WF5CjPYyGJ80Gy8adrHFvcJsZ/4ZOOEm368VzAB5x5M0w8unBBJmq+v408fyr9IC
 mh7DFf+q6K1wvJPNG3SO6cCCbd4tGNo4/Wvm+vf4C1hYyroyXK07bvQ+KK4Qb3WRYX/H
 Nzb93sNPyEz6nzM+8fjbHs3JVA1Ec+hjBMbT04xbNAtqjPdVFHPwrmWI0Oc6SFqYgBO+
 +dQJOzExMdJQhlkE/Mn8n+EeMifndez2sa4DMZi7AWbDF4FyJgzhbaxLurZk/0GV25aP
 iLsgnKzmgW41XC4q//8wjUBPXA3mtHoeeJYD+SNW5oGvxsIY90RKf0jCVqeUBsQepyKv
 hx4w==
X-Gm-Message-State: AOAM531rzEuJK6uiset1egyja18HiBSRoZwd4CWwUP5C8BC03QKgL2/l
 UMD+WMFs+LH4GRHC/AggbHSQJWmVNsL5W+CeQatrctRER/5FjqJypgb0alua+JgJoMp7kfU90G9
 5KAr/BCIcklBI6tG/A375m2b6YiFQBDWsBogTmCcPoEZnTFhjKWoGyDVMH9uaV1PW
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr6280706wrm.229.1637666255044; 
 Tue, 23 Nov 2021 03:17:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5/Lhux6d5Wx7hiqZUEM6nF1aElAInIhpawKrd2lTYaGyGk4V+rdmRxteU5g5x3MlfX+MnNA==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr6280651wrm.229.1637666254758; 
 Tue, 23 Nov 2021 03:17:34 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b6sm854306wmq.45.2021.11.23.03.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:17:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/2] hw/scsi/lsi53c895a: Fix guest-triggerable
 assert() in lsi_do_dma()
Date: Tue, 23 Nov 2021 12:17:30 +0100
Message-Id: <20211123111732.83137-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial fix for this long due bug.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/scsi/lsi53c895a: Do not abort when DMA requested and no data queued=0D
  tests/qtest: Add fuzz-lsi53c895a-test=0D
=0D
 hw/scsi/lsi53c895a.c               |  3 +-=0D
 tests/qtest/fuzz-lsi53c895a-test.c | 52 ++++++++++++++++++++++++++++++=0D
 MAINTAINERS                        |  1 +=0D
 tests/qtest/meson.build            |  1 +=0D
 4 files changed, 55 insertions(+), 2 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c=0D
=0D
--=20=0D
2.33.1=0D
=0D


