Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30635318D80
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:37:08 +0100 (CET)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAD5e-00044r-Sy
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACvy-0004pZ-EG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACvv-0003Xm-LJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613053622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XsXBKOaL/bLrpVDnZKiYx2c2DW8FWlH6tKJaD2xMCTw=;
 b=QXKZgjiDO/hGz2DV1FCMRFTunxG4qz9hNVQkM5BMSK6ZSdDMkDrGB1m2gvMsm4l+tr4MT1
 9Zp6kwdxh2ppN7oRppxLRgN42bjID/Brd9U5FxlcJcry6EFrTAQZYriNvj0+z0zK0MzGv2
 ThaiYbvjpYjfDSwQZUgFR1+AFa5hSlo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-pUUx0lsuPsWiGw4RGv3LNA-1; Thu, 11 Feb 2021 09:27:00 -0500
X-MC-Unique: pUUx0lsuPsWiGw4RGv3LNA-1
Received: by mail-ej1-f70.google.com with SMTP id n25so4934449ejd.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsXBKOaL/bLrpVDnZKiYx2c2DW8FWlH6tKJaD2xMCTw=;
 b=DPXBE8i5zUKcz4eaauvS6d9zsi5CIlh9PlCOboKuuqH46Ujj78EzJHgKkHlp+R4Zec
 8T7HE21RAr2o7aAmb4tvwDIQcwd4ERS6WBcYLVLM/oOkoSrmCmSfvFLLarODTS9OImK9
 l65qid71g91X0hax5G6aO37Bnn3azS9lnq7OScOBjZ1s50G+qTP33Aqo6IcIf+pD3fuH
 ZQkDyOsI5bMyqGFgBvBSA0zbgMLHlKUuoScnehPbZ1nxP14AiDsUaHI7JnJ9j8jUiZdA
 0J2J6+87RR/m0A4mCp2guWlSy10q16dt/aFwUnOzKM9MOpEgQakab0oilaA4tXrKEAUK
 wCvg==
X-Gm-Message-State: AOAM531H9iAhTRSYae11UNnaE7mhqWN4aH7BYU9m7vqTrbClRu6VRPFG
 fkSjkle/JUd8AzNyQ0ROuJOnEUK0YOjtwScvDZ/eXXavCAxcE/wT/HigI4js5PPjMsaYhuFZCw5
 iMwNzQhFlgKUuWx/HH8uDY6vBwQImLgkJRp8m65SNgjV/+64GgzzLzZIBaZPH2371
X-Received: by 2002:a17:906:c051:: with SMTP id
 bm17mr8459620ejb.493.1613053619226; 
 Thu, 11 Feb 2021 06:26:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGR2gG5ACLY2bckwadlG8JodGyxhgKjO6rPfvNLKYv+XiwAcuPBuq8r/DpTcdxOSjS26Aq8Q==
X-Received: by 2002:a17:906:c051:: with SMTP id
 bm17mr8459585ejb.493.1613053618926; 
 Thu, 11 Feb 2021 06:26:58 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q13sm4644981ejy.20.2021.02.11.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:26:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
Date: Thu, 11 Feb 2021 15:26:54 +0100
Message-Id: <20210211142656.3818078-1-philmd@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The null-co driver doesn't zeroize buffer in its default config,=0D
because it is designed for testing and tests want to run fast.=0D
However this confuses security researchers (access to uninit=0D
buffers).=0D
=0D
A one-line patch supposed which became a painful one, because=0D
there is so many different syntax to express the same usage:=0D
=0D
 opt =3D qdict_new();=0D
 qdict_put_str(opt, "read-zeroes", "off");=0D
 null_bs =3D bdrv_open("null-co://", NULL, opt, BDRV_O_RDWR | BDRV_O_PROTOC=
OL,=0D
                     &error_abort);=0D
=0D
vm.qmp('blockdev-add', driver=3D'null-co', read_zeroes=3DFalse, ...)=0D
=0D
vm.add_drive_raw("id=3Ddrive0,driver=3Dnull-co,read-zeroes=3Doff,if=3Dnone"=
)=0D
=0D
    blk0 =3D { 'node-name': 'src',=0D
        'driver': 'null-co',=0D
        'read-zeroes': 'off' }=0D
=0D
    'file': {=0D
        'driver': 'null-co',=0D
        'read-zeroes': False,=0D
    }=0D
=0D
    "file": {=0D
        "driver": "null-co",=0D
        "read-zeroes": "off"=0D
    }=0D
=0D
    { "execute": "blockdev-add",=0D
      "arguments": {=0D
          "driver": "null-co",=0D
          "read-zeroes": false,=0D
          "node-name": "disk0"=0D
        }=0D
    }=0D
=0D
opts =3D {'driver': 'null-co,read-zeroes=3Doff', 'node-name': 'root', 'size=
': 1024}=0D
=0D
qemu -drive driver=3Dnull-co,read-zeroes=3Doff=0D
=0D
qemu-io ... "json:{'driver': 'null-co', 'read-zeroes': false, 'size': 65536=
}"=0D
=0D
qemu-img null-co://,read-zeroes=3Doff=0D
=0D
qemu-img ... -o data_file=3D"json:{'driver':'null-co',,'read-zeroes':false,=
,'size':'4294967296'}"=0D
=0D
There are probably more.=0D
=0D
Anyhow, the iotests I am not sure and should be audited are 056, 155=0D
(I don't understand the syntax) and 162.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  block: Explicit null-co uses 'read-zeroes=3D3Dfalse'=0D
  block/null: Enable 'read-zeroes' mode by default=0D
=0D
 docs/devel/testing.rst                     | 14 +++++++-------=0D
 tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----=0D
 block/null.c                               |  2 +-=0D
 tests/test-bdrv-drain.c                    | 10 ++++++++--=0D
 tests/acceptance/virtio_check_params.py    |  2 +-=0D
 tests/perf/block/qcow2/convert-blockstatus |  6 +++---=0D
 tests/qemu-iotests/040                     |  2 +-=0D
 tests/qemu-iotests/041                     | 12 ++++++++----=0D
 tests/qemu-iotests/051                     |  2 +-=0D
 tests/qemu-iotests/051.out                 |  2 +-=0D
 tests/qemu-iotests/051.pc.out              |  4 ++--=0D
 tests/qemu-iotests/087                     |  6 ++++--=0D
 tests/qemu-iotests/118                     |  2 +-=0D
 tests/qemu-iotests/133                     |  2 +-=0D
 tests/qemu-iotests/153                     |  8 ++++----=0D
 tests/qemu-iotests/184                     |  2 ++=0D
 tests/qemu-iotests/184.out                 | 10 +++++-----=0D
 tests/qemu-iotests/218                     |  3 +++=0D
 tests/qemu-iotests/224                     |  3 ++-=0D
 tests/qemu-iotests/224.out                 |  8 ++++----=0D
 tests/qemu-iotests/225                     |  2 +-=0D
 tests/qemu-iotests/227                     |  4 ++--=0D
 tests/qemu-iotests/227.out                 |  4 ++--=0D
 tests/qemu-iotests/228                     |  2 +-=0D
 tests/qemu-iotests/235                     |  1 +=0D
 tests/qemu-iotests/245                     |  2 +-=0D
 tests/qemu-iotests/270                     |  2 +-=0D
 tests/qemu-iotests/283                     |  3 ++-=0D
 tests/qemu-iotests/283.out                 |  4 ++--=0D
 tests/qemu-iotests/299                     |  1 +=0D
 tests/qemu-iotests/299.out                 |  2 +-=0D
 tests/qemu-iotests/300                     |  4 ++--=0D
 32 files changed, 82 insertions(+), 60 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


