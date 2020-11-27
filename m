Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E7D2C68F1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:50:59 +0100 (CET)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig1S-0000GR-AI
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifwC-0005Ln-F3
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifwA-00079W-Ra
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606491929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UB2ODbDlvei0IUIvbibbTfV2Np0PL/jF7nZGmN/JiMQ=;
 b=JSDMQp04ccQozc7WNSfuNxuIu/SlAj++E/l7cuf0F278Pcs52E76ki9Ybcy28Ls83d5S1K
 WwEHP4MvV4gBQq9UpQe2Sx61Spb4v8JiH3fasJmo2oFSzRCzJ7AKRK8uhXV/DIfUG8Dw4d
 1YFYcWCN5YQZqf6xDisE+sDEa5Nwlpw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-xInjb7xtOjmYvGof-kI35A-1; Fri, 27 Nov 2020 10:45:27 -0500
X-MC-Unique: xInjb7xtOjmYvGof-kI35A-1
Received: by mail-wm1-f72.google.com with SMTP id s10so2854875wme.0
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2+ZMtiDX35llXOofXsvo26zI9ycCBSmkfVvYHjLcYQ=;
 b=M2M+IT+6jbHl4F5sNnhwvDOiUvLRbPR4V94qxDEUiqMIxJgzwj4g3Pg4lT070B2eQq
 xZZG3EICbmaH7T6Y1xSfvutrNYXdlR1Sqt8CgLXUjzmPDlHS7xpA1/blXqwbo+NsR5N/
 qZBdak/9NE6n1mTkC8X0k6RVCK3/Ouz9CPFof3ozFsCeFBs8UGCzl6N5vJBQxy3qxXHv
 ycz8hg1MY0fhb4+lRErkh7mWPHuuqEvSy7sU5MNsU1F158ZdVVFMH55m2PSeYEVkPyqb
 spCWkZhjrH9Hoo/xBOh1S9LyiVc0zmf8hhpSToEsZYMt1VZgDoIWAnEaB16F9lWDsWY/
 AugA==
X-Gm-Message-State: AOAM531/qm/YTqaswKe7E1tK4EFZQ4xazSBmUPNtf52exeBHQPqqVFCh
 IDUbshQ4se7xS9WxozmrlFi56ds9McxNwiPEDCQS/IUw0hlAFAT3BuyXL2r7+LsWaVupYj2pkf2
 Hs9gJJFSShG2gUU8=
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr9908527wmb.87.1606491926543; 
 Fri, 27 Nov 2020 07:45:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxB5i4VbcHLP9JKc2DBna3gDW8+J5AY1xWlgTtpYSQfqvkY9YxiQLUm5imLIrrHMKuC/+CwrA==
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr9908497wmb.87.1606491926291; 
 Fri, 27 Nov 2020 07:45:26 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id s4sm15148431wro.10.2020.11.27.07.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:45:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2 0/2] net: Do not accept packets with invalid huge
 size
Date: Fri, 27 Nov 2020 16:45:22 +0100
Message-Id: <20201127154524.1902024-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This is a simple attempt to avoid the following pattern:=0D
=0D
  ssize_t pkt_size =3D get_pkt_size(); // returns errno=0D
=0D
  // no check=0D
=0D
  send_packet(size_t size=3Dpkt_size); // size casted to unsigned=0D
                                     // -> overflow=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  net: Do not accept packets bigger then NET_BUFSIZE=0D
  net: Assert no packet bigger than NET_BUFSIZE is queued=0D
=0D
 net/net.c   | 4 ++++=0D
 net/queue.c | 7 +++++++=0D
 2 files changed, 11 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


