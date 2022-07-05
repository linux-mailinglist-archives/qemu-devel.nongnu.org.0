Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BBA56672A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:59:21 +0200 (CEST)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fKy-00074a-S2
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1o8fJx-0005pv-C6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:58:17 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1o8fJv-0008Op-5I
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:58:17 -0400
Received: by mail-lj1-x233.google.com with SMTP id s14so13874433ljs.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=6SZf1jwD70JEMWul0ibLZwjs1mlkUiiGOr0baTVrrns=;
 b=QNj7wLGaLKdGhbTwr9qA0+uOEKlqnq9M4Y5nBeyRpGWTIY9nf0D51EdDjg3HR4Ugo+
 h2PDSYDVfBcbrIzyF196P2i7/O1d59euKY2dcnIcmjQrzLC3LkQez+K0Oyty4wbN6yXh
 yL8Ie5F8zFaSqPjCOSYu/pzb0/fGrKcy/NIzFTEYu3gae6ik5m7RlmLz31/MwWt3dwMm
 87IOqhTY3zXtu7RGfne4V9qC/d6YHKnxlsfjqqJNOVav33TDpPQ0ClNnYICy2ftE1mD2
 SHt2QsHphhuO6c1wrbXAsOSLGoR4Tbb6/ZFfQ56uN6kzj5padKYWtaPmaIUQpzZmg2I1
 NPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6SZf1jwD70JEMWul0ibLZwjs1mlkUiiGOr0baTVrrns=;
 b=Jl7aN17z7Bc8F2/4on6xgeO4rb4MGc/HsTsRwr4HSL7JNxLZLKMlJj745QO20SEHS+
 ELH6YXmaIstpTKCe85GnRelDyUmDp7a6mRTiUhxAdLxDfDpdk0TYi8c6RVQFD083WtC1
 F25PwG/Wp4avqIvtqmoArlN+9xT1ti3jTN0fAqq6AizbZOcPtZotEpkhMH0lKATiQWyO
 3bnDu56LEkY9G9l857uZTaKtNN4h1t0MEtOElDO3BnF3YRpnvYGibKPCWL12fgp0htjr
 N/mP2JTfFR4tAl2qYleEUzoCwo62bEWuuwYFTviiXnHvOJnBcdJF4d1CFIbzVvgbUsmg
 Wo8Q==
X-Gm-Message-State: AJIora+WXYczbybE1pJXvT3BBb+BSzMbtFadnd23uMoaHcC19TuW6KK/
 DUMXEnTEmZPGsofIeNV5J3E2DgHkv3plm3VFeQV7ASG7QOphpQ==
X-Google-Smtp-Source: AGRyM1sfGwN0qmNyK8P/L6+luOG5Ita2w4P6PeBVdLopTCWUEfPTSh+cdGSOk0T+/dDSGiiRQr6Ikgk3LAJHbgd8b3c=
X-Received: by 2002:a05:651c:170e:b0:25a:6e96:c495 with SMTP id
 be14-20020a05651c170e00b0025a6e96c495mr19388416ljb.2.1657015090158; Tue, 05
 Jul 2022 02:58:10 -0700 (PDT)
MIME-Version: 1.0
From: Yu Zhang <yu.zhang@ionos.com>
Date: Tue, 5 Jul 2022 11:57:59 +0200
Message-ID: <CAHEcVy7gC_h4Nei3m6KMvFkjTAFR6XkJcw+AMoxJ3r9CMXp=-Q@mail.gmail.com>
Subject: questions about QMP commands - "block-export-add" and "nbd-server-add"
To: qemu-devel <qemu-devel@nongnu.org>, Gioh Kim <gi-oh.kim@ionos.com>, 
 Alexei Pastuchov <alexei.pastuchov@ionos.com>,
 Jinpu Wang <jinpu.wang@ionos.com>, 
 Fuad Faron <fuad.faron@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="000000000000d633bc05e30be3d1"
Received-SPF: permerror client-ip=2a00:1450:4864:20::233;
 envelope-from=yu.zhang@ionos.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d633bc05e30be3d1
Content-Type: text/plain; charset="UTF-8"

Hi All,

since QEMU-5.2, the QMP command "nbd-server-add" was deprecated and
replaced with "block-export-add" [1].

Arguments for the two are different. For using "block-export-add", "id" and
"node-name" are needed, of which "id" is "device" for "nbd-server-add", and
"node-name" can be obtained from the querying result of "query-block". As
shown by an example below:

{ "execute": "query-block" }
{"return": [..., {..., "device": "drive-virtio-disk5", ...: {...:
{"virtual-size": 53687091200, "filename": "/dev/md0", "format": "raw", ...}
, ..., "node-name": "#block349", ...}, "qdev":
"/machine/peripheral/virtio-disk5/virtio-backend", "type": "unknown"}]}

{ "execute": "nbd-server-add", "arguments": { "device":
"drive-virtio-disk5", "writable": true }}
{"error": {"class": "GenericError", "desc": "Permission conflict on node
'#block349': permissions 'write' are both required by an unnamed block
device (uses node '#block349' as 'root' child) and unshared by block device
'drive-virtio-disk5' (uses node '#block349' as 'root' child)."}}

{ "execute": "block-export-add", "arguments": { "type": "nbd", "id":
"drive-virtio-disk5", "node-name": "#block349", "writable": true }}
{"error": {"class": "GenericError", "desc": "Permission conflict on node
'#block349': permissions 'write' are both required by an unnamed block
device (uses node '#block349' as 'root' child) and unshared by block device
'drive-virtio-disk5' (uses node '#block349' as 'root' child)."}}


An issue we encountered with "block-export-add" for VM live migration:

on the target server
- exported device name: drive-virtio-disk5
- node name of the exported device: #node123

on the source server
- gets the device name from target via network: driver-virtio-disk5
- gets the node name from the target via network: #node123

However, on the source server, the node name #node123 can't be identified.

Assumption: the same "device" may have different "node-name" on the source
and target servers. It seems that sending "device" is quite easy, but
sending "device" and translating it to the correct "node-name" is not quite
straightforward.
The "block-export-add" command made it somehow unnecessarily complicated.

For this reason, we would like to know:
- whether it's possible not to deprecate the use of "nbd-server-add"
command, or
- whether there is a simpler QMP command for block device migration

Thank you so much for your reply.

Yu Zhang @Compute Platform Team of IONOS SE
05.07.2022

[1] https://wiki.qemu.org/ChangeLog/5.2

--000000000000d633bc05e30be3d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>since QEMU-5.2, the QMP command &quot;nbd-s=
erver-add&quot; was deprecated and replaced with &quot;block-export-add&quo=
t; [1].<br><br>Arguments for the two are different. For using &quot;block-e=
xport-add&quot;, &quot;id&quot; and &quot;node-name&quot; are needed, of wh=
ich &quot;id&quot; is &quot;device&quot; for &quot;nbd-server-add&quot;, an=
d &quot;node-name&quot; can be obtained from the querying result of &quot;q=
uery-block&quot;. As shown by an example below:<br><br>{ &quot;execute&quot=
;: &quot;query-block&quot; }<br>{&quot;return&quot;: [..., {..., &quot;devi=
ce&quot;: &quot;drive-virtio-disk5&quot;, ...: {...:<br>{&quot;virtual-size=
&quot;: 53687091200, &quot;filename&quot;: &quot;/dev/md0&quot;, &quot;form=
at&quot;: &quot;raw&quot;, ...}<br>, ..., &quot;node-name&quot;: &quot;#blo=
ck349&quot;, ...}, &quot;qdev&quot;: &quot;/machine/peripheral/virtio-disk5=
/virtio-backend&quot;, &quot;type&quot;: &quot;unknown&quot;}]}<br><br>{ &q=
uot;execute&quot;: &quot;nbd-server-add&quot;, &quot;arguments&quot;: { &qu=
ot;device&quot;: &quot;drive-virtio-disk5&quot;, &quot;writable&quot;: true=
 }}<br>{&quot;error&quot;: {&quot;class&quot;: &quot;GenericError&quot;, &q=
uot;desc&quot;: &quot;Permission conflict on node &#39;#block349&#39;: perm=
issions &#39;write&#39; are both required by an unnamed block device (uses =
node &#39;#block349&#39; as &#39;root&#39; child) and unshared by block dev=
ice &#39;drive-virtio-disk5&#39; (uses node &#39;#block349&#39; as &#39;roo=
t&#39; child).&quot;}}<br><br>{ &quot;execute&quot;: &quot;block-export-add=
&quot;, &quot;arguments&quot;: { &quot;type&quot;: &quot;nbd&quot;, &quot;i=
d&quot;: &quot;drive-virtio-disk5&quot;, &quot;node-name&quot;: &quot;#bloc=
k349&quot;, &quot;writable&quot;: true }}<br>{&quot;error&quot;: {&quot;cla=
ss&quot;: &quot;GenericError&quot;, &quot;desc&quot;: &quot;Permission conf=
lict on node &#39;#block349&#39;: permissions &#39;write&#39; are both requ=
ired by an unnamed block device (uses node &#39;#block349&#39; as &#39;root=
&#39; child) and unshared by block device &#39;drive-virtio-disk5&#39; (use=
s node &#39;#block349&#39; as &#39;root&#39; child).&quot;}}<br><br><br>An =
issue we encountered with &quot;block-export-add&quot; for VM live migratio=
n:<br><br>on the target server<br>- exported device name: drive-virtio-disk=
5<br>- node name of the exported device: #node123<br><br>on the source serv=
er<br>- gets the device name from target via network: driver-virtio-disk5<b=
r>- gets the node name from the target via network: #node123<br><br>However=
, on the source server, the node name #node123 can&#39;t be identified.<br>=
<br>Assumption: the same &quot;device&quot; may have different &quot;node-n=
ame&quot; on the source and target servers. It seems that sending &quot;dev=
ice&quot; is quite easy, but sending &quot;device&quot; and translating it =
to the correct &quot;node-name&quot; is not quite straightforward.<div>The =
&quot;block-export-add&quot; command made it somehow unnecessarily complica=
ted.<div><br>For this reason, we would like to know:<br>- whether it&#39;s =
possible not to deprecate the use of &quot;nbd-server-add&quot; command, or=
<br>- whether there is a simpler QMP command for block device migration<br>=
<br>Thank you so much for your reply.<br><br>Yu Zhang @Compute Platform Tea=
m of IONOS SE<br>05.07.2022<br><br>[1] <a href=3D"https://wiki.qemu.org/Cha=
ngeLog/5.2">https://wiki.qemu.org/ChangeLog/5.2</a><br></div></div></div>

--000000000000d633bc05e30be3d1--

