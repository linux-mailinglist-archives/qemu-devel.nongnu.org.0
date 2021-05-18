Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2A387A30
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:41:23 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizyM-0004XL-JL
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1lixKr-0004Ql-Af
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:52:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1lixKd-0008G4-EL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:52:24 -0400
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <thomas.parrott@canonical.com>) id 1lixKY-0004K7-Kv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:52:06 +0000
Received: by mail-lj1-f200.google.com with SMTP id
 v26-20020a2e481a0000b02900bf48f13296so4328782lja.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DrbhKQqWOKZ0x68DWMp1pQVKCMcjjsnU6WhS8cwd/sc=;
 b=oOOT9l2gFtU58uvhQAP0WbjETgGI7yQdF7AwLnYkv+1qCWUsgV0zDTwP4jl0GH7OlQ
 04IbIQrAkz0gg9/DOkeBD0PBP8OULYgJ8fz6dYvE5F6qFLU4ypqtlTnHygpAV5qfReCX
 jOgSC5kyHCqLkOGYWGbS2Mm32POahZhpL1cbrJiJPnIx8cl2obd4wNMxYOnq1jcwaK9r
 YAcBAT6x3yXdnTKflK4fupwVPK8M8usCioHolrICgUs3YzUTlzHwYvlm/UWIhVNr704X
 /RE1GtOETXSqjTEOpsZnZkVFWnXxc4NBG9uq/x6wBawBCDOl8p1wN2CWryjDCZw5AGOU
 c20w==
X-Gm-Message-State: AOAM5321wVuXG0ijpjsRBoupaFzf21q4QTmrRgE5B6AMSPnpeVx+QyNB
 eC440lsFUSrMFjpEdaBa2zV90ZJoVS3yZbqmVhje3YzcuNz/JcBBJlYhjjYqggFYU68QiStDa4x
 j6f3P/j/eF5ljfCwEvcU0YR4BlQ0L+sH/Htz48x5Hkb+cLpuz
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr3692511lfl.330.1621335126155; 
 Tue, 18 May 2021 03:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzoBd2kffFSRkg+7JQNeknhKqhi+y2XpG2P+eXtiy7cAwZ+rHxusty9fjBR7+yTf8p5s86vS5egRrTR4zmRZc=
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr3692493lfl.330.1621335125918; 
 Tue, 18 May 2021 03:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Parrott <thomas.parrott@canonical.com>
Date: Tue, 18 May 2021 11:51:40 +0100
Message-ID: <CADNu6esx69UdccUHsFfinqcN=dPj0mceKX7WT755qWcPfDrwGQ@mail.gmail.com>
Subject: Adding devices via QMP's device_add don't have their bootindex
 setting respected
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003e1ce005c2988010"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=thomas.parrott@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 May 2021 09:39:06 -0400
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
Cc: marcel@redhat.com, jusual@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003e1ce005c2988010
Content-Type: text/plain; charset="UTF-8"

Due to QEMU moving towards a QMP configuration mechanism and away from
config file support, the LXD team are currently in the process of migrating
to using QMP to add devices to VMs (so that we can support the use of QEMU
6.0).

Currently we are using the `-S` flag to freeze CPU at startup, then using
QMP to add NIC devices via the `device_add` command, and then using the
`cont` command to start the VM guest.

This is working mostly fine, but there is one issue; the provided
"bootindex" property is not respected.

E.g.

device_add
{"addr":"00.0","bootindex":"0","bus":"qemu_pcie4","driver":"virtio-net-pci","id":"dev-lxd_eth0","mac":"00:16:3e:0c:69:e7","mq":"on","multifunction":"off","netdev":"lxd_eth0","vectors":"6"}

The device is seen within the VM guest and the VM BIOS, but its boot order
is last rather than first.

We've also tried using a non-zero bootindex of 1 and that has the same
effect.

After discussions on #qemu IRC channel, we found that running
`system_reset` after adding the devices allowed the `bootindex` property to
be respected.

So this looks like bug. Perhaps we can discuss it in one of the forthcoming
community calls?

Thanks
Tom Parrott

--0000000000003e1ce005c2988010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Due to QEMU moving towards a QMP configuration mechan=
ism and away from config file support, the LXD team are currently in the pr=
ocess of migrating to using QMP to add devices to VMs (so that we can suppo=
rt the use of QEMU 6.0).</div><div><br></div><div>Currently we are using th=
e `-S` flag to freeze CPU at startup, then using QMP to add NIC devices via=
 the `device_add` command, and then using the `cont` command to start the V=
M guest.<br></div><div><br></div><div>This is working mostly fine, but ther=
e is one issue; the provided &quot;bootindex&quot; property is not respecte=
d.</div><div><br></div><div>E.g.</div><div><br></div><div>device_add {&quot=
;addr&quot;:&quot;00.0&quot;,&quot;bootindex&quot;:&quot;0&quot;,&quot;bus&=
quot;:&quot;qemu_pcie4&quot;,&quot;driver&quot;:&quot;virtio-net-pci&quot;,=
&quot;id&quot;:&quot;dev-lxd_eth0&quot;,&quot;mac&quot;:&quot;00:16:3e:0c:6=
9:e7&quot;,&quot;mq&quot;:&quot;on&quot;,&quot;multifunction&quot;:&quot;of=
f&quot;,&quot;netdev&quot;:&quot;lxd_eth0&quot;,&quot;vectors&quot;:&quot;6=
&quot;}</div><div><br></div><div>The device is seen within the VM guest and=
 the VM BIOS, but its boot order is last rather than first.<br></div><div><=
br></div><div>We&#39;ve also tried using a non-zero bootindex of 1 and that=
 has the same effect.</div><div><br></div><div>After discussions on #qemu I=
RC channel, we found that running `system_reset` after adding the devices a=
llowed the `bootindex` property to be respected.</div><div><br></div><div>S=
o this looks like bug. Perhaps we can discuss it in one of the forthcoming =
community calls?<br></div><div><br></div><div>Thanks</div><div>Tom Parrott<=
br></div></div>

--0000000000003e1ce005c2988010--

