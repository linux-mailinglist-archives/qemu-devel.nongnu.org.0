Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18154CD90E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:25:25 +0100 (CET)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAk8-0006S1-EI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:25:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQAgO-0003VE-UX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:21:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQAgK-0005zl-Vz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646410888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbneCF3DIeqO4FvY0WyvetBBtqmm1Mf6uJLLFQfEngw=;
 b=a51uDdC918Z3q01H6hnCjDPOC5Spc1vKKnIL31wbMF45MNPESPn3bO+o6Kz/XpmGKrFSt4
 ddIQhIEMTSrF4eN7/qj4+ecU1mcXyjL1nuBPm3cD5AtmmxScBr4TldB0iURDCTI1EazfAU
 8f0GP4WTF2nQcs/rFbxHKw/AdL+HpFY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-PKkeOmJdOvGgpeeNNFuy4Q-1; Fri, 04 Mar 2022 11:21:25 -0500
X-MC-Unique: PKkeOmJdOvGgpeeNNFuy4Q-1
Received: by mail-ua1-f71.google.com with SMTP id
 l5-20020ab03d85000000b0034ac8e179c3so2378868uac.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 08:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbneCF3DIeqO4FvY0WyvetBBtqmm1Mf6uJLLFQfEngw=;
 b=3xiD4Ryrm8Tit6YFZme6pEPccRpMdxF3wv6+jZIyazgfPkx2OTghu1LQbCnUGUP/MT
 LSth16Q8+T6abT0QwZbLzW9M9yYHldXB2AmlyxkYCY70MKt2RrtOrIIBSQeYYDsga2qQ
 8NKFXH9mBlQQEKAELOGEe0KYNCJZT6N1R5A7e8yg6CpiYQrl1bOUkQ1PBoQjOFMXSgYz
 Q7kRPucXcKyw2kxGaFA88MdZzVwsFGJA+hFqui/mPvs7jDsl4LhBN0c7YbEqBwtWuhZ/
 YwC/LepFNT2SoaqBr5PzALZBC4fyxX9s7H5MXSInnjmAIseXXYv6kMBWnpiVv2bhrnkT
 Jogg==
X-Gm-Message-State: AOAM5324iJse/wgK5+weqn4VDW5+Oy6JfyPSGwrijj3E9ZF6mgqmTcK2
 T6PBEW5cmfK9MxSbXsQ7jkKNBhMB5abj8oz9Bhzjazg/JcnSpstm4YCgY/krJ1MzpNMjacbA9Gv
 6iusH6ZYCH+4YXQmc9OeJiEEy318LRoI=
X-Received: by 2002:a67:fc13:0:b0:31c:5602:12f with SMTP id
 o19-20020a67fc13000000b0031c5602012fmr17744349vsq.38.1646410884282; 
 Fri, 04 Mar 2022 08:21:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvR5mn8LkIs+j/2ololuFM1hpP09qrCKcdkYGSEgbNzngPYnaZJIfDMeDohPBlkN1Eu0b02GLnjNgr1vm8AUo=
X-Received: by 2002:a67:fc13:0:b0:31c:5602:12f with SMTP id
 o19-20020a67fc13000000b0031c5602012fmr17744331vsq.38.1646410883966; Fri, 04
 Mar 2022 08:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20220303205902.4106779-1-jsnow@redhat.com>
 <20220303205902.4106779-2-jsnow@redhat.com>
 <20220303224341.zkiv7gzcmirogwf7@redhat.com>
In-Reply-To: <20220303224341.zkiv7gzcmirogwf7@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Mar 2022 11:21:14 -0500
Message-ID: <CAFn=p-b3KaP8zYHBDB0gZaxGgaGPtdywx9XgDtoxOgz5VYGqdQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] python/utils: add add_visual_margin() text decoration
 utility
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e4b93905d966e76e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e4b93905d966e76e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMywgMjAyMiwgNTo0MyBQTSBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNv
bT4gd3JvdGU6DQoNCj4gT24gVGh1LCBNYXIgMDMsIDIwMjIgYXQgMDM6NTg6NThQTSAtMDUwMCwg
Sm9obiBTbm93IHdyb3RlOg0KPiA+ID4+PiBwcmludChhZGRfdmlzdWFsX21hcmdpbihtc2csIHdp
ZHRoPTcyLCBuYW1lPSJDb21taXQgTWVzc2FnZSIpKQ0KPiA+IOKUj+KUgSBDb21taXQgTWVzc2Fn
ZSDilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIENCj4gPiDi
lIMgYWRkX3Zpc3VhbF9tYXJnaW4oKSB0YWtlcyBhIGNodW5rIG9mIHRleHQgYW5kIHdyYXBzIGl0
IGluIGEgdmlzdWFsDQo+ID4g4pSDIGNvbnRhaW5lciB0aGF0IGZvcmNlLXdyYXBzIHRvIGEgc3Bl
Y2lmaWVkIHdpZHRoLiBBbiBvcHRpb25hbCB0aXRsZQ0KPiA+IOKUgyBsYWJlbCBtYXkgYmUgZ2l2
ZW4sIGFuZCBhbnkgb2YgdGhlIGluZGl2aWR1YWwgZ2x5cGhzIHVzZWQgdG8gZHJhdyB0aGUNCj4g
PiDilIMgYm94IG1heSBiZSByZXBsYWNlZCBvciBzcGVjaWZpZWQgYXMgd2VsbC4NCj4gPiDilJfi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIENCj4NCj4gSSBzZWUgeW91
IGRyb3BwZWQgdGhlIHJpZ2h0IG1hcmdpbiBjb21wYXJlZCB0byBlYXJsaWVyIHZlcnNpb25zLCBi
dXQNCj4gYWdyZWUgdGhhdCB0aGlzIGlzIHN0aWxsIGEgbmljZSB2aXN1YWwgaW5kaWNhdG9yLCBh
bmQgcHJvYmFibHkgZWFzaWVyDQo+IHRvIG1haW50YWluIGluIHRoaXMgZm9ybS4gIEFuZCBpdCBn
b3QgcmlkIG9mIHRoZSB3ZWlyZCBzcGFjaW5nIG9uIHRoZQ0KPiBsZWZ0IHdoZW4gdGhlIHdyYXAg
cG9pbnQgaGl0IGF0IHRoZSB3cm9uZyB0aW1lLg0KPg0KPiA+ICsgICAgRGVjb3JhdGUgYW5kIHdy
YXAgc29tZSB0ZXh0IHdpdGggYSB2aXN1YWwgZGVjb3JhdGlvbiBhcm91bmQgaXQuDQo+ID4gKw0K
PiA+ICsgICAgVGhpcyBmdW5jdGlvbiBhc3N1bWVzIHRoYXQgdGhlIHRleHQgZGVjb3JhdGlvbiBj
aGFyYWN0ZXJzIGFyZSBzaW5nbGUNCj4gPiArICAgIGNoYXJhY3RlcnMgdGhhdCBkaXNwbGF5IHVz
aW5nIGEgc2luZ2xlIG1vbm9zcGFjZSBjb2x1bW4uDQo+ID4gKw0KPiA+ICsgICAg4pSP4pSBIEV4
YW1wbGUNCj4g4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSBDQo+ID4gKyAgICDilIMgVGhpcyBpcyB3aGF0IHRoaXMgZnVu
Y3Rpb24gbG9va3MgbGlrZSB3aXRoIHRleHQgY29udGVudCB0aGF0J3MNCj4gPiArICAgIOKUgyB3
cmFwcGVkIHRvIDcyIGNoYXJhY3RlcnMuIFRoZSByaWdodC1oYW5kIG1hcmdpbiBpcyBsZWZ0IG9w
ZW4gdG8NCj4gPiArICAgIOKUgyBhY29tbW9kYXRlIHRoZSBvY2Nhc2lvbmFsIHVuaWNvZGUgY2hh
cmFjdGVyIHRoYXQgbWlnaHQgbWFrZQ0KPiA+ICsgICAg4pSDIHByZWRpY3RpbmcgdGhlIHRvdGFs
ICJ2aXN1YWwiIHdpZHRoIG9mIGEgbGluZSBkaWZmaWN1bHQuIFRoaXMNCj4gPiArICAgIOKUgyBw
cm92aWRlcyBhIHZpc3VhbCBkaXN0aW5jdGlvbiB0aGF0J3MgZ29vZC1lbm91Z2gsIHRob3VnaC4N
Cj4gPiArDQo+IOKUl+KUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgQ0K
Pg0KPiBZZXAgLSBoYW5kLXdhdmluZyBhd2F5IFVuaWNvZGUgbWVzc2luZXNzIGlzIGNlcnRhaW5s
eSBlYXNpZXN0IDspDQo+DQoNCkkgc3RhcnRlZCByZWFkaW5nIHRoZSB1bmljb2RlIHNwZWNpZmlj
YXRpb24gZm9yIGRldGVybWluaW5nIHRoZSBudW1iZXIgb2YNCiJ2aXN1YWwgZ3JhcGhlbWUgY2x1
c3RlcnMiIGluIGEgc3RyaW5nLCBnb3QgYSBoZWFkYWNoZSwgYW5kIGdhdmUgdXAuDQoNCihTZWUg
YWxzbyB0aGUgUHlQSSBwYWNrYWdlICJncmFwaGVtZSIsIHdoaWNoIHdhcyBsYXN0IHVwZGF0ZWQg
Zm9yIHVuaWNvZGUNCjEzLjAgYW5kIGFwcGVhcnMgdW5tYWludGFpbmVkLiBJdCdzIG5vIHNtYWxs
IGFtb3VudCBvZiBjb2RlISkNCg0KSSBjb3VsZCB3cml0ZSBhIGZ1bmN0aW9uIHRoYXQgZ2l2ZXMg
YSAqcHJldHR5IGdvb2QgZXN0aW1hdGUqLCBidXQgSSBkb24ndA0Kd2FudCB0byBtYWludGFpbiBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KDQpVcndpZCBoYXMgZnVuY3Rpb25zIHRoYXQgZ2l2ZSAqZ3Jl
YXQqIGVzdGltYXRlcywgYnV0IEknZCBsaWtlIHRvIGF2b2lkDQpkZXBlbmRlbmNpZXMuDQoNCkxl
YXZpbmcgdGhlIHJpZ2h0IG1hcmdpbiBvcGVuIHdhcyB0aGUgcXVpY2tlc3QsIGNsZWFuZXN0IGhh
Y2sgOikgSSdtIGFtYXplZA0KYXQgaG93IGhhcmQgdGhpcyBpcyB0byBhY2NvbXBsaXNoLg0KDQoo
U2VlIGh0dHBzOi8vaHNpdm9uZW4uZmkvc3RyaW5nLWxlbmd0aC8gd2hpY2ggb3VnaHQgdG8gYmUg
cmVxdWlyZWQgcmVhZGluZw0KaW4gYWxsIENTIGNsYXNzZXMgZnJvbSBub3cgb24uKQ0KDQpVbHRp
bWF0ZWx5IEkgdG9vayBib3RoIHRoaXMgZGVjb3JhdGlvbiBhbmQgdGhlIGV4Y2VwdGlvbiBjb2Rl
IGludG8gdXRpbHMgYXMNCmFuIGFkbWlzc2lvbiBvZiBndWlsdCBhbmQgYSBwbGVkZ2UgdG8gbWFp
bnRhaW4gd2hhdCBJIGRpZCB3cml0ZSA7KQ0KDQoNCj4gUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2Ug
PGVibGFrZUByZWRoYXQuY29tPg0KPg0KPiBbdGFrZSB3aXRoIGEgZ3JhaW4gb2Ygc2FsdCAtIG15
IHB5dGhvbiBpcyB3ZWFrLiBCdXQgYXMgeW91IHNhaWQgaW4gdGhlDQo+IGNvdmVyIGxldHRlciwg
aXQncyBmYWlybHkgc3RyYWlnaHRmb3J3YXJkIHRvIHJlcHJvZHVjZSBhbiBlbnZpcm9ubWVudA0K
PiB3aGVyZSB5b3UgY2FuIHNlZSBpdCBpbiBhY3Rpb24gZm9yIGhhbmRzLW9uIHRlc3RpbmddDQo+
DQoNCkkndmUgbG9uZyBzaW5jZSBnaXZlbiB1cCBvbiBhbnlvbmUgdW5kZXJzdGFuZGluZyB0aGUg
UHl0aG9uIEkgd3JpdGUuDQpFZHVhcmRvIGRpZCwgc28gaGUgcXVpdC4g8J+YhQ0KDQpUaGFua3Mg
Zm9yIHRoZSByZXZpZXdzLg0KDQoNCj4NCj4gLS0NCj4gRXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNv
ZnR3YXJlIEVuZ2luZWVyDQo+IFJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkxOS0zMDEtMzI2
Ng0KPiBWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcNCj4NCj4NCg==
--000000000000e4b93905d966e76e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 3, 2022, 5:43 PM Eric Blake &lt;<a href=3D=
"mailto:eblake@redhat.com" target=3D"_blank" rel=3D"noreferrer">eblake@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Mar 0=
3, 2022 at 03:58:58PM -0500, John Snow wrote:<br>
&gt; &gt;&gt;&gt; print(add_visual_margin(msg, width=3D72, name=3D&quot;Com=
mit Message&quot;))<br>
&gt; =E2=94=8F=E2=94=81 Commit Message =E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
<br>
&gt; =E2=94=83 add_visual_margin() takes a chunk of text and wraps it in a =
visual<br>
&gt; =E2=94=83 container that force-wraps to a specified width. An optional=
 title<br>
&gt; =E2=94=83 label may be given, and any of the individual glyphs used to=
 draw the<br>
&gt; =E2=94=83 box may be replaced or specified as well.<br>
&gt; =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81<br>
<br>
I see you dropped the right margin compared to earlier versions, but<br>
agree that this is still a nice visual indicator, and probably easier<br>
to maintain in this form.=C2=A0 And it got rid of the weird spacing on the<=
br>
left when the wrap point hit at the wrong time.<br>
<br>
&gt; +=C2=A0 =C2=A0 Decorate and wrap some text with a visual decoration ar=
ound it.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 This function assumes that the text decoration characte=
rs are single<br>
&gt; +=C2=A0 =C2=A0 characters that display using a single monospace column=
.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =E2=94=8F=E2=94=81 Example =E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81<br=
>
&gt; +=C2=A0 =C2=A0 =E2=94=83 This is what this function looks like with te=
xt content that&#39;s<br>
&gt; +=C2=A0 =C2=A0 =E2=94=83 wrapped to 72 characters. The right-hand marg=
in is left open to<br>
&gt; +=C2=A0 =C2=A0 =E2=94=83 acommodate the occasional unicode character t=
hat might make<br>
&gt; +=C2=A0 =C2=A0 =E2=94=83 predicting the total &quot;visual&quot; width=
 of a line difficult. This<br>
&gt; +=C2=A0 =C2=A0 =E2=94=83 provides a visual distinction that&#39;s good=
-enough, though.<br>
&gt; +=C2=A0 =C2=A0 =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81<br>
<br>
Yep - hand-waving away Unicode messiness is certainly easiest ;)<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I started r=
eading the unicode specification for determining the number of &quot;visual=
 grapheme clusters&quot; in a string, got a headache, and gave up.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">(See also the PyPI package &quot=
;grapheme&quot;, which was last updated for unicode 13.0 and appears unmain=
tained. It&#39;s no small amount of code!)</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I could write a function that gives a *pretty good estim=
ate*, but I don&#39;t want to maintain something like that.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Urwid has functions that give *great*=
 estimates, but I&#39;d like to avoid dependencies.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Leaving the right margin open was the quickest,=
 cleanest hack :) I&#39;m amazed at how hard this is to accomplish.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">(See=C2=A0<a href=3D"https://hs=
ivonen.fi/string-length/">https://hsivonen.fi/string-length/</a> which ough=
t to be required reading in all CS classes from now on.)</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Ultimately I took both this decoration and=
 the exception code into utils as an admission of guilt and a pledge to mai=
ntain what I did write ;)</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">eblake@redhat.com</a>&gt;<br>
<br>
[take with a grain of salt - my python is weak. But as you said in the<br>
cover letter, it&#39;s fairly straightforward to reproduce an environment<b=
r>
where you can see it in action for hands-on testing]<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ve long since giv=
en up on anyone understanding the Python I write. Eduardo did, so he quit. =
=F0=9F=98=85</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for =
the reviews.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br><br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.=
org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libvirt.org=
</a><br>
<br>
</blockquote></div></div></div>

--000000000000e4b93905d966e76e--


