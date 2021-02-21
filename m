Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D8320E87
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 00:24:34 +0100 (CET)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDy5Z-0005B4-3X
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 18:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDy4W-0004c7-4q
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 18:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDy4T-0004uS-Ch
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 18:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613949802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8255LiaqyaaXISOnL/MUQmckRLZztvftKm4uWNUfkx4=;
 b=iKmKEjw9uQHXc+tiMH5TsTZlH6vKOAYUS7FsLYZ0QFpgnE74ww6BA0bsji61HGJ96XJ2+K
 OHIV/hEN9U0bd0K95fbAjvUEm6bxg0okgp+qO0zJTe7N+Y2ZugFt00bNhvDVVR7kDn9H58
 drbipa8tOowRLDN6dsUyvh0hy2d+EfA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-40ixYRyPMi6XibQyRmT_vA-1; Sun, 21 Feb 2021 18:23:21 -0500
X-MC-Unique: 40ixYRyPMi6XibQyRmT_vA-1
Received: by mail-wr1-f70.google.com with SMTP id v1so5384525wru.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 15:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=8255LiaqyaaXISOnL/MUQmckRLZztvftKm4uWNUfkx4=;
 b=VjxHpLu761n2Ia3ehlCtvGVlJupJPVae8+bRJV3u4LSbljQ6MxH5qNRRGpPmILTjH6
 sL2yARftJUgDc+SA6kkOWis0cvsy7Ux7/tR6Dy9myKqCZGflV/ibsT97/Ubexyd1QKNY
 Mvhi9Ulz00geGb93jnGw2wjw7rx1SGkCS3/hdLaTwEyE8FhNM5IRwAouoqL5XeKarbVN
 CZjD+bAA/0T9dBEapOLq9W8/w63eluo1k5ywyUHAO7hvpUYptpVgw/Q/fZKNO+3e9Bk5
 BwzNoaQdoh0Am2x96S4wT4YPhB5WMce8X/xu6ZRUrw5xAcZxylQm4ZapM1//1wBfeuEu
 y3fQ==
X-Gm-Message-State: AOAM532L4/oUgBkcNwEKpEiTL4LDO2bjkcgq+005nfZb/XJW5ZUhZwLs
 fGaNongy2nIHAENpvkak/39Be248nUAvY7KTmVlkCPUbNScDHKq6xN6WTqoLulUmBknHUAgt3Ba
 r0rghfMZXtD0/XNg=
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr11230263wrt.41.1613949799970; 
 Sun, 21 Feb 2021 15:23:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznNLK4eUebr08h0Z+SURfMdn8fP5NMgvwx7ZNO+ByZCAMxk65RidStDAiG1pF/rWkMIdVx8w==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr11230250wrt.41.1613949799804; 
 Sun, 21 Feb 2021 15:23:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k1sm25766047wrx.77.2021.02.21.15.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 15:23:19 -0800 (PST)
To: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Can we run QEMU Avocado tests without root access?
Message-ID: <04391605-1413-f944-6e17-8a4bc50608b5@redhat.com>
Date: Mon, 22 Feb 2021 00:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: avocado-devel <avocado-devel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On a system I want to run the QEMU integration tests I got:

$ make check-venv
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
  VENV    build/tests/venv
The virtual environment was not created successfully because ensurepip
is not
available.  On Debian/Ubuntu systems, you need to install the python3-venv
package using the following command.

    apt-get install python3-venv

You may need to use sudo with that command.  After installing the
python3-venv
package, recreate your virtual environment.

Failing command: ['build/tests/venv/bin/python3', '-Im', 'ensurepip',
'--upgrade', '--default-pip']

make: *** [/home/philmd/qemu/tests/Makefile.include:98:
build/tests/venv] Error 1

However I could do:

$ python3 -m pip install --user virtualenv
Collecting virtualenv
  Downloading virtualenv-20.4.2-py2.py3-none-any.whl (7.2 MB)
     |████████████████████████████████| 7.2 MB 6.4 MB/s
Collecting distlib<1,>=0.3.1
  Downloading distlib-0.3.1-py2.py3-none-any.whl (335 kB)
     |████████████████████████████████| 335 kB 6.4 MB/s
Collecting appdirs<2,>=1.4.3
  Downloading appdirs-1.4.4-py2.py3-none-any.whl (9.6 kB)
Requirement already satisfied: six<2,>=1.9.0 in
/usr/lib/python3/dist-packages (from virtualenv) (1.15.0)
Collecting filelock<4,>=3.0.0
  Downloading filelock-3.0.12-py3-none-any.whl (7.6 kB)
Installing collected packages: distlib, appdirs, filelock, virtualenv
Successfully installed appdirs-1.4.4 distlib-0.3.1 filelock-3.0.12
virtualenv-20.4.2

$ virtualenv --version
virtualenv 20.4.2 from
/home/philmd/.local/lib/python3.9/site-packages/virtualenv/__init__.py

Note, there is still the old tests/venv/ dir created bug:

$ make check-venv
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
make: Nothing to be done for 'check-venv'.

Although it might be true... If I don't have root access, there is
nothing to be done ¯\_(ツ)_/¯

Thanks,

Phil.


