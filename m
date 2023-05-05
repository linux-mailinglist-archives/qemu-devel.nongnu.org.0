Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3C6F8C72
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 00:38:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv42X-00072I-Ls; Fri, 05 May 2023 18:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tbarrett@crusoeenergy.com>)
 id 1pv42W-00071r-B4
 for qemu-devel@nongnu.org; Fri, 05 May 2023 18:36:36 -0400
Received: from us-smtp-delivery-137.mimecast.com ([170.10.133.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tbarrett@crusoeenergy.com>)
 id 1pv42U-00015G-7f
 for qemu-devel@nongnu.org; Fri, 05 May 2023 18:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crusoeenergy.com;
 s=mimecast20220526; t=1683326192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ci0VLZpkJHnSH8Uuj2uCFlyo/0eHYUt+YM7h/RNq4vc=;
 b=oVGrao+PnKyyeKITcVs9/SO5UY62vpFOxq0eRupWnpVrlWHd9QyhUwyPok+6W8abM0nb2S
 A+s6TuK8QzBP7cQbJMsjeCNs4rQl4dwgdN0bW9+3j9D7h1h7u5gvfyv35RTftocDxzbZeb
 g1+roYc1GeE2rkjNUY04W8iTo+UljwY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-mMboa90ANlCmuozLRudHvA-1; Fri, 05 May 2023 18:36:31 -0400
X-MC-Unique: mMboa90ANlCmuozLRudHvA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-306311a2b99so938891f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 15:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683326189; x=1685918189;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hSAWzuxeFTC8GRWtZ32oUylx4j4Ng+njzEvu/ZUGkrI=;
 b=GQKbxb2NhZgDKzdz5nGsVVcnOTu7z4EmpRIH3iDVCEkTvi0U0kgYu/setclVCKJQKi
 JAUvht+g+Gn9b3+iX5urYUHWjPzefI+Lke+pCrpOfLBtELay0WJKNo5VhK+oeKq7IAM2
 A/KMfZrJuHIE1vUNZ23GhwMCJlJWiD0hq+ajrxtTASIDrdic+BQhn/jT6sQCvJH6bfyf
 Wr7mKiYfmluFlqAsJZNhNqGE5QnX68igaO4MkFv89plzsywiftCnm7TCq6dHxJojJ+ZH
 t4xN2sF1r7qNAb+ngWX4u+NDze8jW+oRznXGL8nhqGE2MfSnwIEJbPokpcId+ycOVTAM
 FkyQ==
X-Gm-Message-State: AC+VfDyACu89sUw3712fZty2dJgkY1rbetvO4QDumHNG4eLZB2HO3o6h
 VQ4pCpdDFJJfZAqbWzL6Sz23b3tl8vlXMjWLv6+6gyaaywJmCCjCiNwDBNqA8jIJsCJOmV2JGbi
 xZw6QQ5fQlsSqZ6L0yt9Ix1ZNQ2BfEBnXxtBCkhYwOZzPHUUy7wgAeGGo0EvOfCooHhJOeBv6Ws
 mHNPTVSmock1vuhBxymTAx8HI0i6+GMJKGv80wPJSKEqbKLCE=
X-Received: by 2002:a5d:688a:0:b0:306:2b53:e7de with SMTP id
 h10-20020a5d688a000000b003062b53e7demr2168063wru.28.1683326189618; 
 Fri, 05 May 2023 15:36:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FCM8EGwFdWkEjkLref9Lk1x8nkFg6xlJTMGH1Um4574y29KK5i0KOy0I0jGwMAx2zH+98obXsiI6Oudzj4YY=
X-Received: by 2002:a5d:688a:0:b0:306:2b53:e7de with SMTP id
 h10-20020a5d688a000000b003062b53e7demr2168060wru.28.1683326189222; Fri, 05
 May 2023 15:36:29 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Barrett <tbarrett@crusoeenergy.com>
Date: Fri, 5 May 2023 15:36:18 -0700
Message-ID: <CAMr20=BiqOWaM0yp7mpt83ODSmtKJD5ueE0zOT8ZAsErC4qgkw@mail.gmail.com>
Subject: Question: PCIe P2P Guidance
To: qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: crusoeenergy.com
Content-Type: multipart/alternative; boundary="0000000000008cd19205faf9eb53"
Received-SPF: pass client-ip=170.10.133.137;
 envelope-from=tbarrett@crusoeenergy.com;
 helo=us-smtp-delivery-137.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008cd19205faf9eb53
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have been struggling for a few months now with achieving full bandwidth
PCIe P2P in a qemu virtual machine. I am working with a number of PCIe
endpoints (NVIDIA A100 GPUs and Mellanox ConnectX 7 Infiniband NICs) behind
a PCIe switch. In all configurations I have tried, P2P traffic gets router
back to the root complex. Does. Anyone have guidance on whether full
bandwidth PCIe P2P is even supported by qemu?

Through my research, I have found have found two main approaches to solve
this.

[ 1 ] ATS came up frequently In my research. Unfortunetaly, I do not
believe that all of my PCIe endpoints support the use of ATS for P2P
traffic. at the very least, toggling the DirectTrans flag on my PCI switch
didn=E2=80=99t have any affect on bandwidth on either the host or the guest=
. I=E2=80=99m
think that this might be a dead end.

[ 2 ] Another potential option is to disable ACS on the PCIe switch and
pass all devices on the same switch to a virtual machine. Based on
everything that I have read, this =E2=80=9Cshould=E2=80=9D work. When toggl=
ing the
RequestRedir flag on the PCIe switch using =E2=80=9Csetpci=E2=80=9D, P2P ba=
ndwidth
increased and decreased as expected on the host. However, the P2P bandwidth
did not increase or decrease in the guest.

I can=E2=80=99t really explain the behavior that I am seeing in approach [ =
2 ].
Should disabling the RequestRedir flag on a PCIe switch enable P2P traffic
between different IOMMU groups? If not, why?

Best,
Thomas

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--0000000000008cd19205faf9eb53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I =
have been struggling for a few months now with achieving full bandwidth PCI=
e P2P in a qemu virtual machine. I am working with a number of PCIe endpoin=
ts (NVIDIA A100 GPUs and Mellanox ConnectX 7 Infiniband NICs) behind a PCIe=
 switch. In all configurations I have tried, P2P traffic gets router back t=
o the root complex. Does. Anyone have guidance on whether full bandwidth PC=
Ie P2P is even supported by qemu?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Through my research, I have found have found two main approaches =
to solve this.</div><div dir=3D"auto"><br></div><div dir=3D"auto">[ 1 ] ATS=
 came up frequently In my research. Unfortunetaly, I do not believe that al=
l of my PCIe endpoints support the use of ATS for P2P traffic. at the very =
least, toggling the DirectTrans flag on my PCI switch didn=E2=80=99t have a=
ny affect on bandwidth on either the host or the guest. I=E2=80=99m think t=
hat this might be a dead end.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">[ 2 ] Another potential option is to disable ACS on the PCIe switch a=
nd pass all devices on the same switch to a virtual machine. Based on every=
thing that I have read, this =E2=80=9Cshould=E2=80=9D work. When toggling t=
he RequestRedir flag on the PCIe switch using =E2=80=9Csetpci=E2=80=9D, P2P=
 bandwidth increased and decreased as expected on the host. However, the P2=
P bandwidth did not increase or decrease in the guest.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I can=E2=80=99t really explain the behavior =
that I am seeing in approach [ 2 ]. Should disabling the RequestRedir flag =
on a PCIe switch enable P2P traffic between different IOMMU groups? If not,=
 why?<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><di=
v dir=3D"auto">Thomas</div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div>
<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">The information contained in this communication from the sender i=
s confidential. It is intended solely for use by the recipient and others a=
uthorized to receive it. If you are not the recipient, you are hereby notif=
ied that any disclosure, copying, distribution or taking action in relation=
 of the contents of this information is strictly prohibited and may be unla=
wful.</p></body></html>

--0000000000008cd19205faf9eb53--


