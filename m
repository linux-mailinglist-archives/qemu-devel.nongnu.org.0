Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DE455B13
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:59:06 +0100 (CET)
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mng4H-0003Mq-AP
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng2x-0001WR-Fl
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng2t-0002KA-EK
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637236657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K7Z1FmQhbS1YeqeK/D+jlDFCISyoex0Pc1TsZOU7JFE=;
 b=YuSi316mjSV0ExDdpbynFO68OJ0FBwvcZrcUhviUCF4+siHNM8hIQgnBs1Rb4R9sG360uA
 gXqSclLQ/or/SoZpXBOcwfp88GL7IhWWh+XtE6+FY5pYnivlqTMAPzmagQ+tiZBu8RUQsH
 GAucOOSxsTkEr5GevMrNDyS3jcH2haY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-9LPE2tciMK-ibwmaTTCv1w-1; Thu, 18 Nov 2021 06:57:36 -0500
X-MC-Unique: 9LPE2tciMK-ibwmaTTCv1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so4230568wma.5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 03:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7EmqYWJWGBCSmNNClcASnUtLTtWlbqvAanBXVKoD1c=;
 b=xWvKLS7xGtOvkoOuXvt7j9743+QxR5C0DmvqKeIaHXStyHyNfqH1CCqbBHWqMAAyw/
 l/IkWqqzTmIZ7SZlfQRUeKKp/kxKFMy5jb+DfO5mH6rmk6PvZlNiZ5G2o6+PDoYf1J+r
 JPlpImJn5k779+zepxtcHuEd5/s262AM7DliyUN2VAhyfgTAMN2TpijZ0kJxn039PMBd
 RoIVM41poZxB0234joIEuMll0nc0rc8ocQACluXreyoePebW8dTSXYOsdNMHqry+4JZr
 +IPk4YiKkrYrgJPNjvbcaPa8p762E77uShY2RFF3RszzCB79Zxa9EEmvuvnpoGtdfBUO
 eKkg==
X-Gm-Message-State: AOAM533V0fqa1GdbH+a/hnGS+q1txXHhjWA0C2qmirsBVJGw5fN+aN+A
 aLKXWRVWYIIBLyl46jokSDZpCnZilSmjunEIqfU3aFCPgsGW9z8gj8VB/3wIYFp9UDQd2ssjI6s
 HFfwpB29YWMravd2x5tJF6UenL8A3/NgfTyvc2EOqUQTnliiwcH/KN+ZT7xnVV7fv
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr29477594wrs.81.1637236655481; 
 Thu, 18 Nov 2021 03:57:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWw/nwQ2Nnqnxl2getDbA3amMPQ1VODqwV4HFEvSzuyX0cLDea5iaAeVP5wqjNmMdiK9WiUQ==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr29477568wrs.81.1637236655308; 
 Thu, 18 Nov 2021 03:57:35 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 t189sm2776732wma.8.2021.11.18.03.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 03:57:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
Date: Thu, 18 Nov 2021 12:57:31 +0100
Message-Id: <20211118115733.4038610-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial fix for CVE-2021-3507.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)=0D
  tests/qtest/fdc-test: Add a regression test for CVE-2021-3507=0D
=0D
 hw/block/fdc.c         |  8 ++++++++=0D
 tests/qtest/fdc-test.c | 20 ++++++++++++++++++++=0D
 2 files changed, 28 insertions(+)=0D
=0D
--=20=0D
2.31.1=0D
=0D


