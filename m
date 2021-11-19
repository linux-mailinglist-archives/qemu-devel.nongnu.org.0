Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF705456C3E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:19:54 +0100 (CET)
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo03m-0008CE-0u
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo017-0005JA-9I
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo014-0002cx-KJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NEtY9MflrU0AITQm4NNEpCxk5bmL8SYYCm/5vT10CWU=;
 b=fteLMHLZX3t3D+2qrSaGko9du9le2wdjE/WLspZALUO03nR+Jd7ETDheZvnlFbdYx9jBbZ
 hdA209yJZy4qBSrXV0eisP2mxJ3TMa9j+xcbVTfhmlbnZjyGoEIKE7qjDgq9lSt3u5kQSU
 QvMv+no8PCmD1LMEu2km28hx0pcAYh4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-Z_-RsmjoOUSFMzOVjDzOyA-1; Fri, 19 Nov 2021 04:17:04 -0500
X-MC-Unique: Z_-RsmjoOUSFMzOVjDzOyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so4448248wmr.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NZIzyK6JiWHKLm1sQkjynqfqZz8V1cyEV75QUaGKYQ=;
 b=MD5WSJPiIQtEczz6Tlhk3YfBLRR5o0oVvQ+ElnUNNaIDELjFBXy28ALrgHT6phpTDy
 EEjvGQU0u7NFa8SwBFxO/MvpJMfTlylt379QyJjWjPUqi4umDaLM9jHEmBSYHu5b6/hj
 sXUWJLYB+1Bb8a+m8R1EDttSNAs1M9jmyHWbwJJ/U6pAZCJQgKlyAqHap0LWEkwTdK31
 GNuZUg0lC8UtL6rhI5HWjtwVcQtVyKLi+IjEpTsr4CSJDe1rpFzVlCBwzNu2aPR8UEw+
 KJaChu3NpSODEBcielGELKwndhyWurrXW2j1J/2Rgh0qKXZUoKzqtgYlwjuK2YhSUVOb
 UEAg==
X-Gm-Message-State: AOAM531rZD57AO/hZ1+27jHmGug6b+U2tL4vCbRT12UQDIgtFnlsD2eI
 H2PV2ldKOPiZLQz5NlO7G+i7uJG7nXHXp5JsVOA7Lu5I7nJwa443m9mfudcvkyuXbKUB4TO5fem
 Abe20+2+xzcGErC0CVIE/9xeN3CUCiiB+eduFS0fj57ZUcoF5u+noF8LzAQfXqyJO
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr5483885wrr.152.1637313423439; 
 Fri, 19 Nov 2021 01:17:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6Y5V3FyKyLq/KwdcwKWSai2mVVd13KExMkN9JfsFYk/8RmDLs2COqae043WMruyWpO2AlFA==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr5483832wrr.152.1637313423182; 
 Fri, 19 Nov 2021 01:17:03 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o9sm2361300wrs.4.2021.11.19.01.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:17:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 0/3] misc: Spell QEMU all caps
Date: Fri, 19 Nov 2021 10:16:58 +0100
Message-Id: <20211119091701.277973-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace Qemu -> QEMU.=0D
=0D
Supersedes: <20211118143401.4101497-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  docs: Spell QEMU all caps=0D
  misc: Spell QEMU all caps=0D
  qga: Spell QEMU all caps=0D
=0D
 docs/devel/modules.rst                 |  2 +-=0D
 docs/devel/multi-thread-tcg.rst        |  2 +-=0D
 docs/devel/style.rst                   |  2 +-=0D
 docs/devel/ui.rst                      |  4 ++--=0D
 docs/interop/nbd.txt                   |  6 +++---=0D
 docs/interop/qcow2.txt                 |  8 ++++----=0D
 docs/multiseat.txt                     |  2 +-=0D
 docs/system/device-url-syntax.rst.inc  |  2 +-=0D
 docs/system/i386/sgx.rst               | 26 +++++++++++++-------------=0D
 docs/u2f.txt                           |  2 +-=0D
 qapi/block-core.json                   |  2 +-=0D
 python/qemu/machine/machine.py         |  2 +-=0D
 qga/installer/qemu-ga.wxs              |  6 +++---=0D
 scripts/checkpatch.pl                  |  2 +-=0D
 scripts/render_block_graph.py          |  2 +-=0D
 scripts/simplebench/bench-backup.py    |  4 ++--=0D
 scripts/simplebench/bench_block_job.py |  2 +-=0D
 target/hexagon/README                  |  2 +-=0D
 tests/guest-debug/run-test.py          |  4 ++--=0D
 tests/qemu-iotests/testenv.py          |  2 +-=0D
 20 files changed, 42 insertions(+), 42 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


