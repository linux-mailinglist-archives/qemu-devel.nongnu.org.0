Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A2628F5E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujB4-0001Zg-BE; Mon, 14 Nov 2022 18:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ouik6-0004uz-2i
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ouik4-0003I3-5c
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668467991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=9G/DJQ/4H1in/SWNlq4rcnv+JwZLpAVBZVphR/EweeM=;
 b=cp0WWUKS08WdBzNECtUkAvyfPlSbx4vX+RLrsf3MH0bpdeURGGh4H5ZbKqhTaJ4BhCjwOT
 lxZljeNPlirnP/3ILeVDA6fEIx+/swmwwzLTPqPG6t8+g7rKS6Uue1Cz0iebc/lhu2mCyQ
 4MR4JM+coLCxTy78mCa+LLmCFo8zWRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-OHNOXN7wPm-o38xuuBDxqQ-1; Mon, 14 Nov 2022 18:19:49 -0500
X-MC-Unique: OHNOXN7wPm-o38xuuBDxqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso9642066wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 15:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9G/DJQ/4H1in/SWNlq4rcnv+JwZLpAVBZVphR/EweeM=;
 b=v4jmaCdrWqJm74PDYoCdDZ3Y1C7sByBLTk632TzWA6HqmpCVRaDVWMihYw/rhlNcg9
 Bis1wgoUbgl24zr359rcfUDkVCg2gkrJg9DodfaNhiDygXRUJPyzbMgkMjRcHeQnfuCq
 smnGGuvAn4SMfNZ6h8lfGKl9z8tJB0V27arA8OuVktaSlCpUf87/n7SQ9tjhk+4I8EYe
 snWiTnYNAx//F/tVw74y2dbqc2AsyH2KrGq80XT1TO8UboXcLmTSK2FcEKykzYE4VB5U
 tGys7CEryaIX2T+Sp7nutvdePFKQcTrmP7+4UBA1dK2AGS/zfkGajPy+3GcBmYrdbcrg
 NehQ==
X-Gm-Message-State: ANoB5pm9lqxHQpm19S7UFuqe/l1oNftCD96YdCCgOzfCj49K3L8vMg1v
 t11TRsrhcmIQ305hpEfXSlNDCSn9/Q8kcgFCebpI+pwCdiCllolgWFh5ZQgxaOKCTCSokV8XkxI
 Mxi8dbj81NirN6eHrgRwUDCoH4QJAn3w=
X-Received: by 2002:a5d:548d:0:b0:236:53d3:5a48 with SMTP id
 h13-20020a5d548d000000b0023653d35a48mr9042876wrv.66.1668467988113; 
 Mon, 14 Nov 2022 15:19:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf45plVqz74RqkTT1aeJdroaEJjQ0TrrwdWAUqQYJCdNgY8nRJBj3hdo1URvqqRoTWQw3E/gjvP6Xql2B24syYw=
X-Received: by 2002:a5d:548d:0:b0:236:53d3:5a48 with SMTP id
 h13-20020a5d548d000000b0023653d35a48mr9042868wrv.66.1668467987797; Mon, 14
 Nov 2022 15:19:47 -0800 (PST)
MIME-Version: 1.0
From: Pawel Polawski <ppolawsk@redhat.com>
Date: Tue, 15 Nov 2022 00:19:35 +0100
Message-ID: <CABchEG1Prh-Emo6LoVR4Zmx9NYeigZnYFPce7=jPCZMT3=Mj5w@mail.gmail.com>
Subject: Qemu virtual CPU limitation to 1024
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bb7dc705ed76791d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ppolawsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--000000000000bb7dc705ed76791d
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

--000000000000bb7dc705ed76791d
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
</div><div>Pawel<font color=3D"#888888"><br></font></div><br clear=3D"all">=
<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font-family:Red=
HatText,sans-serif;font-weight:bold;margin:0px;padding:0px;font-size:14px;t=
ext-transform:capitalize"><span>Pawe=C5=82 Po=C5=82awski</span><span style=
=3D"text-transform:uppercase;color:rgb(170,170,170);margin:0px"></span></p>=
<p style=3D"color:rgb(0,0,0);font-family:RedHatText,sans-serif;font-size:12=
px;margin:0px;text-transform:capitalize"><span><span><span><a href=3D"https=
://www.redhat.com/" target=3D"_blank">Red Hat</a> Virtualization<br></span>=
</span></span></p><p style=3D"color:rgb(0,0,0);font-family:RedHatText,sans-=
serif;margin:0px;font-size:12px"><span style=3D"margin:0px;padding:0px"><a =
href=3D"mailto:ppolawsk@redhat.com" style=3D"color:rgb(0,0,0);margin:0px" t=
arget=3D"_blank">ppolawsk@redhat.com</a>=C2=A0 =C2=A0</span> <span><br></sp=
an></p><div style=3D"color:rgb(0,0,0);font-family:RedHatText,sans-serif;fon=
t-size:12px;margin-bottom:8px"><div><a href=3D"https://twitter.com/redhat" =
title=3D"twitter" style=3D"background:transparent url(&quot;https://marketi=
ng-outfit-prod-images.s3-us-west-2.amazonaws.com/3780bd4ede961ef3cd4108b8c0=
e80186/web-icon-twitter.png&quot;) no-repeat scroll 0px 50%/13px auto;color=
:rgb(0,0,0);display:inline-block;line-height:20px;padding-left:13px" target=
=3D"_blank"><span style=3D"margin-left:2px">@RedHat</span></a>=C2=A0=C2=A0=
=C2=A0<a href=3D"https://www.linkedin.com/company/red-hat" title=3D"LinkedI=
n" style=3D"background:transparent url(&quot;https://marketing-outfit-prod-=
images.s3-us-west-2.amazonaws.com/8d3507e3c6b6c9ad10e301accf1a4af0/web-icon=
-linkedin.png&quot;) no-repeat scroll 0px 50%/12px auto;color:rgb(0,0,0);di=
splay:inline-block;line-height:20px;padding-left:12px;margin:0px 4px 0px 3p=
x;padding-top:1px" target=3D"_blank"><span style=3D"margin-left:4px">Red Ha=
t</span></a>=C2=A0=C2=A0<a href=3D"https://www.facebook.com/RedHatInc" titl=
e=3D"Facebook" style=3D"background:transparent url(&quot;https://marketing-=
outfit-prod-images.s3-us-west-2.amazonaws.com/220b85e2f100025e94cb1bcd993bd=
51d/web-icon-facebook.png&quot;) no-repeat scroll 0px 50%/11px auto;color:r=
gb(0,0,0);display:inline-block;line-height:20px;padding-left:13px" target=
=3D"_blank"><span>Red Hat</span></a></div></div><a href=3D"https://red.ht/s=
ig" target=3D"_blank"><img src=3D"https://static.redhat.com/libs/redhat/bra=
nd-assets/latest/corp/logo.png" width=3D"90" height=3D"auto"></a><br></div>=
</div></div>

--000000000000bb7dc705ed76791d--


