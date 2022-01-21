Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5B496746
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:26:28 +0100 (CET)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1QQ-0001yM-Gk
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB0uL-0007ZP-Iq
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB0uJ-0007R8-4D
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642798394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ETuHRTyVyGJq5QDzXnn4WHiYiibKnz2wQdpAJIhA9iA=;
 b=N8ocaR2074C48tPnhkuMmT3qKbL+VCQrTf19FxvooOeEAEO/4MZ07o7ApC+PGgg+75tcNh
 mhEctN+uKsru3XbUClLBPz2P7vtj0GoXov+NcwdmRxYfpfEueji3nDKOdX6q8pHJiQGVVm
 YtO21ZV3sRj0w+2LZbMNMrECa429Al4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-SunSKKJwPJm9JdbqI7h7Gg-1; Fri, 21 Jan 2022 15:53:12 -0500
X-MC-Unique: SunSKKJwPJm9JdbqI7h7Gg-1
Received: by mail-ua1-f70.google.com with SMTP id
 i25-20020ab03759000000b00308e68dcb1fso6245517uat.22
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 12:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ETuHRTyVyGJq5QDzXnn4WHiYiibKnz2wQdpAJIhA9iA=;
 b=ktTWBioXuJviaGzoK8mW7q45qK5MLM1Qk3730UcQioAq9gn3+poKrnJCpqOqKUuUY+
 ydQWCCuPmDOxlDe3/k2basd40Xn4/f81YcEkTX6rNcRWFrTZT5B57hQBGP4RYiNUhC8d
 pKgfqU5/ZHfmEJByvc483UqzU+5P1o8TDmGNMrgiTzeFaGKE0wK6dI0bFz+pPW871mw4
 de2mPgWMIXuuSCqgptOkDevrFWSD5nDAkfBzthQGLVU26pvcHjP9HS+8WePrl9zoZJ9C
 3w/XvgcHZyQokvpNogw10HI0xZCZmYkac+LGpHDnz1EpI9fGLJqbmvecfmAdH2R4nDY6
 44EA==
X-Gm-Message-State: AOAM531CDys0HMpRLQtFf1p2VmR2Wj2JeGocmJaQMaL8Wzx5S2PTi1fW
 WWDpuOaIDDA6JIkTP6abTpOYIaRH/+T2HhGML9oaIC776UKyFyoSWhzjzQRP7gIYdMC+AarzwgO
 z67sgkfcGOO4oXstfHay10SXuqGVGw3U=
X-Received: by 2002:a67:6587:: with SMTP id z129mr2366567vsb.61.1642798391761; 
 Fri, 21 Jan 2022 12:53:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIU2f+ois3mImFqqD/lozgpV98e4y/1tG8SYDWRSs0mWNR2/ZKvdlNeSqkIj1Exji1A7ANVOk7WqxWoPWtZss=
X-Received: by 2002:a67:6587:: with SMTP id z129mr2366562vsb.61.1642798391534; 
 Fri, 21 Jan 2022 12:53:11 -0800 (PST)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 15:53:01 -0500
Message-ID: <CAFn=p-boicm8NU6-jimC8qyJVfA3BymcK8687ddBWoQ5LFu6HQ@mail.gmail.com>
Subject: tests/tcg/multiarch/threadcount failing on GitLab
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lately, I've been seeing this test fail under the clang-user job; see
https://gitlab.com/jsnow/qemu/-/jobs/2002782042

make[2]: *** [../Makefile.target:156: run-threadcount] Error 124
make[1]: *** [/builds/jsnow/qemu/tests/tcg/Makefile.qemu:102:
run-guest-tests] Error 2
make: *** [/builds/jsnow/qemu/tests/Makefile.include:63:
run-tcg-tests-sh4-linux-user] Error 2

(In this branch I've staged some Python code changes, but I would hope
that's not related to this.)

--js


