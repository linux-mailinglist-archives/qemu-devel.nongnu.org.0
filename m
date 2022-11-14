Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F69628F12
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujB2-0001Vb-US; Mon, 14 Nov 2022 18:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ouidh-0001X6-Ar
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ouiQB-0003uf-J4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=2VIvflBMWgyN4h43g14YAxJaVuIVonMkn+8nOvEeCEc=;
 b=UXFgq8nJUxzNm9bkdty/DIsQyj1dGtfosItfamsXA6aHjOylSKwwOnyxXR+DvhitScO9T5
 w50X6rDAMJPvL9iBKfkR6mnZNZOS9diLgSP8gd878GC+VC73SD1/tRKcCnqF9I3YjxOnFv
 rKno/xg1XHqDFxWHBFuwa452yYXbhKA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-zM4uougPPEyt2UShheidpA-1; Mon, 14 Nov 2022 17:58:13 -0500
X-MC-Unique: zM4uougPPEyt2UShheidpA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i9-20020a1c3b09000000b003cfbaa32cfdso4603771wma.2
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 14:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2VIvflBMWgyN4h43g14YAxJaVuIVonMkn+8nOvEeCEc=;
 b=2/0wUDkyUTL4LWBhlRL5EDkemD446tSY0DP0JOrnjyGNvcRlQnpkKpkE2IYCQ7Swi3
 mbyGsoUWg6VYcQeHHE2UTsQ2RUTd03692xINNQKPsEgCsgB1Aml8cp49zw/dsVMBG/dI
 xfm97/7tcQu1Qq42DAaTrNHk1lQrN6bdvLnlgPcbKCy1ZoYA23KA3Bjjbby6ZFEw3vLx
 MXgyG7l4Tp7BbVq9l5WJOu4Vj+prYnqpyMc+qpzkCBkY3x83FM5tw/VMzVJ5KHT6S5cm
 GJvI6raI6QQmnfkjJmJfyTjJ/39Dp3AgPC7+oIaGkqOIPNxFgvP9aAfp7uPDT8HiXerC
 Gn6A==
X-Gm-Message-State: ANoB5pmPQSVDkHLPUQKCKZMKXgh4DKpH5GZYM8FOhN95AeM2vG/oe6i3
 CLmmEtdRNaUtz8eRPvlNAQhvyxA330dahLg5FiWyF5re0AXK3FJPmndfoPpQcBpWAxHXEsRRJKm
 J+UrtpOJNAG5t23QioMknIFRLe2t8WJw=
X-Received: by 2002:a5d:4301:0:b0:236:8130:56e7 with SMTP id
 h1-20020a5d4301000000b00236813056e7mr8853824wrq.309.1668466691810; 
 Mon, 14 Nov 2022 14:58:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JLMQ0lHpR/OadUTPPCfYXMwxqRsP4RqhDoWDPoGuDcTmWRLjeMbDW+GV0h6ELNUGKIc66YxvfK62/pFzRlvA=
X-Received: by 2002:a5d:4301:0:b0:236:8130:56e7 with SMTP id
 h1-20020a5d4301000000b00236813056e7mr8853815wrq.309.1668466691468; Mon, 14
 Nov 2022 14:58:11 -0800 (PST)
MIME-Version: 1.0
From: Pawel Polawski <ppolawsk@redhat.com>
Date: Mon, 14 Nov 2022 23:58:00 +0100
Message-ID: <CABchEG2dNgOPnm9K6AJsiWb8z=dOaKe0yjrvxqyU3gdWygQaNw@mail.gmail.com>
Subject: [qemu-devel]
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000771c9305ed762c30"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ppolawsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Nov 2022 18:47:40 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000771c9305ed762c30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I am trying to check qemu virtual cpu boundaries when running a custom
edk2 based firmware build. For that purpose I want to run qemu with more
than 1024 vCPU:
$QEMU
-accel kvm
-m 4G
-M q35,kernel-irqchip=3Don,smm=3Don
-smp cpus=3D1025,maxcpus=3D1025 -global mch.extended-tseg-mbytes=3D128
-drive if=3Dpflash,format=3Draw,file=3D${CODE},readonly=3Don
-drive if=3Dpflash,format=3Draw,file=3D${VARS}
-chardev stdio,id=3Dfwlog
-device isa-debugcon,iobase=3D0x402,chardev=3Dfwlog "$@"

The result is as follows:
QEMU emulator version 7.0.50 (v7.0.0-1651-g9cc1bf1ebc-dirty)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested
(1025) exceeds the recommended cpus supported by KVM (8)
Number of SMP cpus requested (1025) exceeds the maximum cpus supported by
KVM (1024)

It is not clear to me if I am hitting qemu limitation or KVM limitation
here.
I have changed hardcoded 1024 limits in hw/i386/* files but the limitation
is still presented.

Can someone advise what I should debug next looking for those vCPU limits?

Best regards,
Pawel

--=20

Pawe=C5=82 Po=C5=82awski

Red Hat <https://www.redhat.com/> Virtualization

ppolawsk@redhat.com
@RedHat <https://twitter.com/redhat>   Red Hat
<https://www.linkedin.com/company/red-hat>  Red Hat
<https://www.facebook.com/RedHatInc>
<https://red.ht/sig>

--000000000000771c9305ed762c30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Everyone,</div><div><br></div><div>I am trying to =
check qemu virtual cpu boundaries when running a custom</div><div>edk2 base=
d firmware build. For that purpose I want to run qemu with more than 1024 v=
CPU:<br></div><div>$QEMU</div><div>-accel kvm</div><div>-m 4G</div><div>-M =
q35,kernel-irqchip=3Don,smm=3Don</div><div>-smp cpus=3D1025,maxcpus=3D1025 =
-global mch.extended-tseg-mbytes=3D128</div><div>-drive if=3Dpflash,format=
=3Draw,file=3D${CODE},readonly=3Don</div><div>-drive if=3Dpflash,format=3Dr=
aw,file=3D${VARS}</div><div>-chardev stdio,id=3Dfwlog</div><div>-device isa=
-debugcon,iobase=3D0x402,chardev=3Dfwlog &quot;$@&quot;<br></div><div><br><=
/div><div>The result is as follows:<br></div><div>QEMU emulator version 7.0=
.50 (v7.0.0-1651-g9cc1bf1ebc-dirty)<br>Copyright (c) 2003-2022 Fabrice Bell=
ard and the QEMU Project developers<br>qemu-system-x86_64: -accel kvm: warn=
ing: Number of SMP cpus requested (1025) exceeds the recommended cpus suppo=
rted by KVM (8)<br>Number of SMP cpus requested (1025) exceeds the maximum =
cpus supported by KVM (1024)</div><div><br></div><div>It is not clear to me=
 if I am hitting qemu limitation or KVM limitation here.</div><div>I have c=
hanged hardcoded 1024 limits in hw/i386/* files but the limitation is still=
 presented.</div><div><br></div><div>Can someone advise what I should debug=
 next looking for those vCPU limits?</div><div><br></div><div>Best regards,=
</div><div>Pawel<br></div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"c=
olor:rgb(0,0,0);font-family:RedHatText,sans-serif;font-weight:bold;margin:0=
px;padding:0px;font-size:14px;text-transform:capitalize"><span>Pawe=C5=82 P=
o=C5=82awski</span><span style=3D"text-transform:uppercase;color:rgb(170,17=
0,170);margin:0px"></span></p><p style=3D"color:rgb(0,0,0);font-family:RedH=
atText,sans-serif;font-size:12px;margin:0px;text-transform:capitalize"><spa=
n><span><span><a href=3D"https://www.redhat.com/" target=3D"_blank">Red Hat=
</a> Virtualization<br></span></span></span></p><p style=3D"color:rgb(0,0,0=
);font-family:RedHatText,sans-serif;margin:0px;font-size:12px"><span style=
=3D"margin:0px;padding:0px"><a href=3D"mailto:ppolawsk@redhat.com" style=3D=
"color:rgb(0,0,0);margin:0px" target=3D"_blank">ppolawsk@redhat.com</a>=C2=
=A0 =C2=A0</span> <span><br></span></p><div style=3D"color:rgb(0,0,0);font-=
family:RedHatText,sans-serif;font-size:12px;margin-bottom:8px"><div><a href=
=3D"https://twitter.com/redhat" title=3D"twitter" style=3D"background:trans=
parent url(&quot;https://marketing-outfit-prod-images.s3-us-west-2.amazonaw=
s.com/3780bd4ede961ef3cd4108b8c0e80186/web-icon-twitter.png&quot;) no-repea=
t scroll 0px 50%/13px auto;color:rgb(0,0,0);display:inline-block;line-heigh=
t:20px;padding-left:13px" target=3D"_blank"><span style=3D"margin-left:2px"=
>@RedHat</span></a>=C2=A0=C2=A0=C2=A0<a href=3D"https://www.linkedin.com/co=
mpany/red-hat" title=3D"LinkedIn" style=3D"background:transparent url(&quot=
;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.com/8d3507e3c6=
b6c9ad10e301accf1a4af0/web-icon-linkedin.png&quot;) no-repeat scroll 0px 50=
%/12px auto;color:rgb(0,0,0);display:inline-block;line-height:20px;padding-=
left:12px;margin:0px 4px 0px 3px;padding-top:1px" target=3D"_blank"><span s=
tyle=3D"margin-left:4px">Red Hat</span></a>=C2=A0=C2=A0<a href=3D"https://w=
ww.facebook.com/RedHatInc" title=3D"Facebook" style=3D"background:transpare=
nt url(&quot;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.co=
m/220b85e2f100025e94cb1bcd993bd51d/web-icon-facebook.png&quot;) no-repeat s=
croll 0px 50%/11px auto;color:rgb(0,0,0);display:inline-block;line-height:2=
0px;padding-left:13px" target=3D"_blank"><span>Red Hat</span></a></div></di=
v><a href=3D"https://red.ht/sig" target=3D"_blank"><img src=3D"https://stat=
ic.redhat.com/libs/redhat/brand-assets/latest/corp/logo.png" width=3D"90" h=
eight=3D"auto"></a><br></div></div></div></div>

--000000000000771c9305ed762c30--


