Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76BD6C691E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:07:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfKee-0008Ej-D0; Thu, 23 Mar 2023 09:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guzebing@bytedance.com>)
 id 1pfJJC-0002gj-1c
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:40:42 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <guzebing@bytedance.com>)
 id 1pfJJ6-0006TN-8I
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:40:41 -0400
Received: by mail-ua1-x934.google.com with SMTP id g23so14723036uak.7
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679571626;
 h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Liq102oHzfodSL1plr24Q+Vi5VRKRypFUDuWWKLJfsk=;
 b=KrXcg87eJp9bqaM7E/yXofnsZI7IKnvXN10ReJ7xLHGaqIHyWTiJhAoHKL1xLRuQZ+
 c2na02cyWPb4FDlqSlI5RY8f4ieY7OFGpZvm0Tc5iY3/Q/qCCyua/6rOmbR8RHZ8clFF
 +s+cPQsVbLKPFE3YM1TrsHxwitz8Iv3HKPEap38dzg2lDhhot71RRsbk74XxWsAgC4D+
 F+Yca+hdTx9DBWxLNqIcRe8mC16Z8ZPEtwnHdZffDRj6/N56bkQD7iel65CRMvadgyaD
 e13XAUMkjrOdWBe/zQL/P8wMyTsAM1fzGM8sl6mDa640k0UiqXCB6g82WBnUybngAa++
 LPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679571626;
 h=to:subject:message-id:date:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Liq102oHzfodSL1plr24Q+Vi5VRKRypFUDuWWKLJfsk=;
 b=308fLQseQ7mdkN9IhWGXs+tFzkuvmFfnKG0m/l4aDE/lQm+Njv/ONqBivVZNnAVPyC
 DasrZm6cB1DDy8oqpaQBdBbCxqo5FZ+kzW5EUGVoc53h0MAQn4vKDEQFTbA/bEPTaCt+
 mHP4raCq8nAq3l4dYNo5XzhR7DvfF+FYXidPYxg9DBTc85F/9JarjNVQDWwuuRuSXBND
 yMXUjnSBN1hp8Ks/hfsmouwAZpjycXvjI0jHVp6huoBdJLCKyw5aAsubFCTpTPnJvVA7
 QjY60002TlG2qDTc12CHnuqQpTu62PwLqK6xfMFbbZMqcEVP71OZ7Ztlh6upnZwdexbh
 kjDA==
X-Gm-Message-State: AO0yUKWezO+nPt0sZel99Ht0Y1hJ65MjC5K6vDv3/UnDs5p3mhcL2Tdu
 RqTw4ULfLp/4n2ULPCYdHZc1ufCle+5tPKa9BPNlmsijsNobcixJ
X-Google-Smtp-Source: AK7set/gfBkRsoaLfQjsVLNfWz4n8t3TGiy/TLvugXgRp3Qu3pkwRLwQ4aOs14vPoNolK1nEHB6CztyVkDclOwsVdKk=
X-Received: by 2002:a1f:a30e:0:b0:436:60d2:a6da with SMTP id
 m14-20020a1fa30e000000b0043660d2a6damr1562402vke.2.1679571626533; Thu, 23 Mar
 2023 04:40:26 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Thu, 23 Mar 2023 04:40:25 -0700
Mime-Version: 1.0
Date: Thu, 23 Mar 2023 04:40:25 -0700
Message-ID: <CABo-RjvJXm50RM985aXtgs61Skec44UJryQH3oyroWppdYGmNw@mail.gmail.com>
Subject: vhost-user's disk can support physical_block_size=4096,
 logical_block_size=512?
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002cc8da05f78fbe86"
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=guzebing@bytedance.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Mar 2023 09:06:39 -0400
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
Reply-to:  =?UTF-8?B?6aG+5rO95YW1?= <guzebing@bytedance.com>
From:  =?UTF-8?B?6aG+5rO95YW1?= via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000002cc8da05f78fbe86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello community,

I have a disk with both logical and physical sector size being 4096. I have
a qcow2 image which is built from a virtual machine has legacy 512 bytes
sector size.
I use spdk-vhost as the backend storage.

The commandline of qemu is like this:
/usr/bin/qemu-system-x86_64  \
-nographic \
-name debug-threads=3Don -nic none  -m 8G,slots=3D3,maxmem=3D16G -mem-preal=
loc
-cpu host  -enable-kvm  -M q35 \
-smp 8,sockets=3D4,cores=3D2,threads=3D1 \
-object
memory-backend-file,id=3Dram-node0,mem-path=3D/dev/hugepages,share=3Dyes,si=
ze=3D8G,host-nodes=3D0,policy=3Dbind
\
-numa node,nodeid=3D0,cpus=3D'0-7',memdev=3Dram-node0 \
-device
pcie-root-port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunctio=
n=3Don,addr=3D0x2
\
-object iothread,id=3Diothread1 \
-object iothread,id=3Diothread2 \
-device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=
=3D0x2.0x1
\
-device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=
=3D0x2.0x2
\
-device pcie-root-port,port=3D0x13,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=
=3D0x2.0x3
\
-device pcie-root-port,port=3D0x14,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=
=3D0x2.0x4
\
*-chardev
socket,id=3Dcharvirtio-disk1,path=3D/var/run/spdk/qemu/disk0.sock,reconnect=
=3D1 \*
*-device
vhost-user-blk-pci-non-transitional,chardev=3Dcharvirtio-disk1,bus=3Dpci.4,=
addr=3D0x0,id=3Dvirtio-disk1,num-queues=3D2,bootindex=3D0
\*


The result is that the system can=E2=80=99t start normally.
As I konw, there are 2 questios:
1=E3=80=81Seabios can't support sector size of 4096.
2=E3=80=81The qcow2 image which is built with sector size of 512 can=E2=80=
=99t interpreted
with sector size of 4096. The key point is MBR partion table.


I have konwn that QEMU is supposed to emulate 512 byte sectors on top of a
4k sector disk on the host. The command line is like this:
'physical_block_size=3D4096,logical_block_size=3D512=E2=80=99.

Unfortunately, When I add 'physical_block_size=3D4096,logical_block_size=3D=
512=E2=80=99
to vhost-user-blk-pci-non-transitional, qemu print error:
Property 'vhost-user-blk-pci-non-transitional.physical_block_size' not
found.

Can we have a plan to support params of
'physical_block_size=3D4096,logical_block_size=3D512=E2=80=99
to vhost-user-blk-pci-non-transitional? Or any other advice on how to
possibly work around this?
Thank you very much!

--0000000000002cc8da05f78fbe86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"editor_version_1.30.6_syBbdafn" style=3D"word-break:break-word">=
<div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"><div class=
=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><span style=
=3D"font-size:14px"><span style=3D"font-family:courier,monospace"><span sty=
le=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,255,255)">H=
ello community,</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><br></div></div><div style=3D"mar=
gin-top:4px;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"fon=
t-size:14px"><span style=3D"font-weight:400"><span style=3D"font-size:14px"=
><span style=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0=
,0)"><span style=3D"background-color:rgb(255,255,255)">I have a disk with b=
oth logical and physical sector size being 4096. I have a qcow2 image which=
 is built from a virtual machine has legacy 512 bytes sector size.</span></=
span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">I use spdk-vhost as the backend storage.=20
</span></span></span></span></span></div></div><div style=3D"margin-top:4px=
;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"font-size:14px=
"><span style=3D"font-weight:400"><span style=3D"font-size:14px"><span styl=
e=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0,0)"><span =
style=3D"background-color:rgb(255,255,255)"><br></span></span></span></span=
></span></div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-hei=
ght:1.6"><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weigh=
t:400"><span style=3D"font-size:14px"><span style=3D"font-family:courier,mo=
nospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:r=
gb(255,255,255)">The commandline of qemu is like this:</span></span></span>=
</span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">/usr/bin/qemu-system-x86_64=C2=A0 \</span></span></span></span></s=
pan>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-nographic \</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-name debug-threads=3Don -nic none=C2=A0 -m 8G,slots=3D3,maxmem=3D=
16G -mem-prealloc </span></span></span></span></span><span style=3D"font-we=
ight:400"><span style=3D"font-size:14px"><span style=3D"font-family:courier=
,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"background-colo=
r:rgb(255,255,255)">-cpu</span></span></span></span></span><span style=3D"f=
ont-weight:400"><span style=3D"font-size:14px"><span style=3D"font-family:c=
ourier,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"backgroun=
d-color:rgb(255,255,255)"><span>=C2=A0host=C2=A0 -enable-kvm=C2=A0 -M q35 \=
</span></span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-smp 8,sockets=3D4,cores=3D2,threads=3D1 \</span></span></span></s=
pan></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-object memory-backend-file,id=3Dram-node0,mem-path=3D/dev/hugepag=
es,share=3Dyes,size=3D8G,host-nodes=3D0,policy=3Dbind \</span></span></span=
></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-numa node,nodeid=3D0,cpus=3D&#39;0-7&#39;,memdev=3Dram-node0 \</s=
pan></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-device pcie-root-port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpc=
ie.0,multifunction=3Don,addr=3D0x2 \</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-object iothread,id=3Diothread1 \</span></span></span></span></spa=
n>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-object iothread,id=3Diothread2 \</span></span></span></span></spa=
n>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpc=
ie.0,addr=3D0x2.0x1 \</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3,bus=3Dpc=
ie.0,addr=3D0x2.0x2 \</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-device pcie-root-port,port=3D0x13,chassis=3D4,id=3Dpci.4,bus=3Dpc=
ie.0,addr=3D0x2.0x3 \</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">-device pcie-root-port,port=3D0x14,chassis=3D5,id=3Dpci.5,bus=3Dpc=
ie.0,addr=3D0x2.0x4 \</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-size:14px"><s=
pan style=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0,0)=
"><span style=3D"background-color:rgb(255,255,255)"><b>-chardev socket,id=
=3Dcharvirtio-disk1,path=3D/var/run/spdk/qemu/disk0.sock,reconnect=3D1 \</b=
></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-size:14px"><s=
pan style=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0,0)=
"><span style=3D"background-color:rgb(255,255,255)"><b>-device vhost-user-b=
lk-pci-non-transitional,chardev=3Dcharvirtio-disk1,bus=3Dpci.4,addr=3D0x0,i=
d=3Dvirtio-disk1,num-queues=3D2,bootindex=3D0 \</b></span></span></span></s=
pan>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><br></div></div><div style=3D"mar=
gin-top:4px;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"fon=
t-size:14px"><br></div></div><div style=3D"margin-top:4px;margin-bottom:4px=
;line-height:1.6"><div class=3D"" style=3D"font-size:14px"><span style=3D"f=
ont-weight:400"><span style=3D"font-size:14px"><span style=3D"font-family:c=
ourier,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"backgroun=
d-color:rgb(255,255,255)">The result is that the system can=E2=80=99t start=
 normally.</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">As I </span></span></span></span></span><span style=3D"font-weight=
:400"><span style=3D"font-size:14px"><span style=3D"font-family:courier,mon=
ospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rg=
b(255,255,255)">konw</span></span></span></span></span><span style=3D"font-=
weight:400"><span style=3D"font-size:14px"><span style=3D"font-family:couri=
er,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"background-co=
lor:rgb(255,255,255)">, there are 2 </span></span></span></span></span><spa=
n style=3D"font-weight:400"><span style=3D"font-size:14px"><span style=3D"f=
ont-family:courier,monospace"><span style=3D"color:rgb(0,0,0)"><span style=
=3D"background-color:rgb(255,255,255)">questios</span></span></span></span>=
</span><span style=3D"font-weight:400"><span style=3D"font-size:14px"><span=
 style=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0,0)"><=
span style=3D"background-color:rgb(255,255,255)">:</span></span></span></sp=
an></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">1=E3=80=81Seabios can&#39;t support sector size of 4096. </span></=
span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">2=E3=80=81The qcow2 image which is built with sector size of 512 c=
an=E2=80=99t interpreted with </span></span></span></span></span><span styl=
e=3D"font-weight:400"><span style=3D"font-size:14px"><span style=3D"font-fa=
mily:courier,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"bac=
kground-color:rgb(255,255,255)">sector size of 4096. The key point is MBR <=
/span></span></span></span></span><span style=3D"font-weight:400"><span sty=
le=3D"font-size:14px"><span style=3D"font-family:courier,monospace"><span s=
tyle=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,255,255)"=
>partion</span></span></span></span></span><span style=3D"font-weight:400">=
<span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace=
"><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,=
255,255)"><span>=C2=A0table.</span></span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><br></div></div><div style=3D"mar=
gin-top:4px;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"fon=
t-size:14px"><br></div></div><div style=3D"margin-top:4px;margin-bottom:4px=
;line-height:1.6"><div class=3D"" style=3D"font-size:14px"><span style=3D"f=
ont-weight:400"><span style=3D"font-size:14px"><span style=3D"font-family:c=
ourier,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"backgroun=
d-color:rgb(255,255,255)">I </span></span></span></span></span><span style=
=3D"font-weight:400"><span style=3D"font-size:14px"><span style=3D"font-fam=
ily:courier,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"back=
ground-color:rgb(255,255,255)">have konwn</span></span></span></span></span=
><span style=3D"font-weight:400"><span style=3D"font-size:14px"><span style=
=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0,0)"><span s=
tyle=3D"background-color:rgb(255,255,255)"><span>=C2=A0that QEMU is suppose=
d to emulate 512 byte sectors on top of a 4k sector disk on the host. The c=
ommand line is like this:</span></span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">&#39;physical_block_size=3D4096,logical_block_size=3D512=E2=80=99.=
</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><br></div></div><div style=3D"mar=
gin-top:4px;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"fon=
t-size:14px"><span style=3D"font-weight:400"><span style=3D"font-size:14px"=
><span style=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0=
,0)"><span style=3D"background-color:rgb(255,255,255)">Unfortunately, When =
I add &#39;physical_block_size=3D4096,logical_block_size=3D512=E2=80=99 to =
vhost-user-blk-pci-non-transitional, qemu print error:</span></span></span>=
</span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">Property &#39;vhost-user-blk-pci-non-transitional.physical_block_s=
ize&#39; not found.</span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><br></div></div><div style=3D"mar=
gin-top:4px;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"fon=
t-size:14px"><span style=3D"font-weight:400"><span style=3D"font-size:14px"=
><span style=3D"font-family:courier,monospace"><span style=3D"color:rgb(0,0=
,0)"><span style=3D"background-color:rgb(255,255,255)">Can we have a plan t=
o support params of </span></span></span></span></span><span style=3D"font-=
weight:400"><span style=3D"font-size:14px"><span style=3D"font-family:couri=
er,monospace"><span style=3D"color:rgb(0,0,0)"><span style=3D"background-co=
lor:rgb(255,255,255)">&#39;physical_block_size=3D4096,logical_block_size=3D=
512=E2=80=99 to vhost-user-blk-pci-non-transitional? Or any other advice on=
 how to possibly work around this? </span></span></span></span></span>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:courier,monospace"=
><span style=3D"color:rgb(0,0,0)"><span style=3D"background-color:rgb(255,2=
55,255)">Thank you very much!</span></span></span></span></span>
</div></div></div>

--0000000000002cc8da05f78fbe86--

