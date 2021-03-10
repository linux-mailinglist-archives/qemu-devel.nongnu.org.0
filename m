Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1933346E1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:34:50 +0100 (CET)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3fV-0006sH-JT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cQ-0005Hh-My
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cM-00033h-Ax
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a5Y71k6jxX/i30Cu8UoX30UyiI8niSHES/8R7QtmEZ4=;
 b=jJH4JbbBVEGXnIDCqFNQRWseHWoHdu9WazXafNWf1RW3XfRgxnXdKHdmKXuO8bbyDylmkS
 YsTfgspM8ncS1mMG0+bLQ2r+t/SjYZ7WhfxxNwcRcGNN9OjAG9mKOvTiFzu6QqPKIRBKdx
 DyllVIvrDfy0faqmQ1z6cYwYU49jrh4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-17RE5tmiNsuGFPR5xiZP1w-1; Wed, 10 Mar 2021 13:31:27 -0500
X-MC-Unique: 17RE5tmiNsuGFPR5xiZP1w-1
Received: by mail-ed1-f69.google.com with SMTP id u2so8784493edj.20
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jrNoyhPmxXBLcw0fT5MqJEKFnSLfDPVsps/j3AcwPc=;
 b=OvNzZD0IMqljr4I9R2h651o2MHOfZl4EPHd54Fn6ukdJsyro60iihM0MOulEkTyliU
 yCkCJQNFTJNS0hngA59K6RhbJwQ2DorKqGdmQGZqyknY+zJdxl99+Z00o9pe5HnqL6j1
 tLP+X48Xk6ZcmyX2MmPi/bUcL/CyHz41+Ilu6o76Wy06bUlOqiroSeYEkiQ9MoXwjs3I
 d4Yjrc6ICcclXx+pf0U2Bky4UyXLI0XfHeF5DxgFs5EGR0f2IlHOBNM8Kf/qbsqVkhoN
 akpy4w8mskti1/IdMlIUBZR+z+TJY63dXKscsJX2NZa+ANjrcI1jCeLFfByles+kfRHB
 ztpw==
X-Gm-Message-State: AOAM532d5WOghfUpt8kPqDQ1a/xhUp+J5CzdzDN+/VnIUPoC+V3w3Wck
 6GC1BGSBhYzovmPiptzcEtPy9QHSWrjmWX5HXTVMyjG5KAxw1y+uzzGTWh5c++PvAG9u65Ax5JX
 2cvdStgNUynAIGoEij0DLZDYGk4oIPKndAieZn01MnhKbqVL617N6ShWjdVfrGvpl
X-Received: by 2002:a17:906:688:: with SMTP id u8mr4969161ejb.38.1615401086416; 
 Wed, 10 Mar 2021 10:31:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMPKTh7oGyBC5pDP+fLiLK9fQd8gcwCEBpefnT+4JNLwyu9AqXdTD2LtW3eHiVhgos7KWz2A==
X-Received: by 2002:a17:906:688:: with SMTP id u8mr4969135ejb.38.1615401086238; 
 Wed, 10 Mar 2021 10:31:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id jx22sm130741ejc.105.2021.03.10.10.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:31:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/7] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Wed, 10 Mar 2021 19:31:16 +0100
Message-Id: <20210310183123.1212612-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a look at the patch from Miroslav trying to silence a=0D
compiler warning which in fact is a nasty bug. Here is a fix.=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html=0D
=0D
Since v5:=0D
- addressed Stefano's review comments:=0D
- add now patch fixing in6_address offset=0D
=0D
Since v4:=0D
- reworked again, tested it with Fedora Raw Hide=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  net/eth: Use correct in6_address offset in _eth_get_rss_ex_dst_addr()=0D
  net/eth: Simplify _eth_get_rss_ex_dst_addr()=0D
  net/eth: Better describe _eth_get_rss_ex_dst_addr's offset argument=0D
  net/eth: Check size earlier in _eth_get_rss_ex_dst_addr()=0D
  net/eth: Check iovec has enough data earlier=0D
  net/eth: Read ip6_ext_hdr_routing buffer before accessing it=0D
  net/eth: Add an assert() and invert if() statement to simplify code=0D
=0D
 net/eth.c                      | 46 ++++++++++++++---------------=0D
 tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  1 +=0D
 tests/qtest/meson.build        |  1 +=0D
 4 files changed, 78 insertions(+), 23 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-e1000e-test.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


