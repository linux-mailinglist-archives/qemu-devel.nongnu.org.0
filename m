Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A755533C7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:38:04 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3e4x-00062z-0D
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rmetrich@redhat.com>)
 id 1o3ZUT-0002eL-DE
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rmetrich@redhat.com>)
 id 1o3ZUP-0006gY-Q8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655801040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMT1pMVH3J7/th/cZ/NLy0aDbr+hFcv/sjAX8G55hXE=;
 b=W0E2yWm48qtGuAEu/U3k4BxTD8WMhBMr624/azdoabnxzTrSMhq4mER6dGw3QUbGHDZsMg
 rxFh6AgwBmcp5ft0H0V0/0qii2tOdwiL2xZed9gRe3dTbWhxc6stgSVFf+PbHDrXDYpSD7
 g3r0YMOOOKsqwt2wVbc41+RsVqrkyds=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-1wtWM5ZMMGuXQeDdhVhCiw-1; Tue, 21 Jun 2022 04:42:42 -0400
X-MC-Unique: 1wtWM5ZMMGuXQeDdhVhCiw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so8150617wmb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 01:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=gMT1pMVH3J7/th/cZ/NLy0aDbr+hFcv/sjAX8G55hXE=;
 b=Ljy8ei0dVegFtlRrFqa6IvK9yyiiGyvdfVxwmOB7JTJexkCjEIxIhRGampRjfD7C6Q
 9nA/Rb0l3Ofe4zzdtnD8lZQew7btYUFhyhenmHsMI2lzCYDP0pQdwhYk5MDwzbSTPcyH
 8gF4cf1GV7n72+m+9IZqZ/qKHho5I96nLsF3A29juq1b0UPuhwBxacJNlWAJ9aW+gbrF
 0QumI4iRTkvNi3zgsXcLO/zd77GrgOZyA67UdW7DvTVlvew+33b7+cCAK7EUMvKxYzHd
 rTbOP0zjYS9w8ThpqHoS0/injivOKXK2hIzPfTj+Xt+9+DuZIBHesofm+oBxWNVT8grq
 nGwg==
X-Gm-Message-State: AJIora+cQyPqndrosUobf1qRh+ItMOslPVi1SJD18ERRHDY/utU99zAY
 bkHwULSCANXV4qXiJFIZs4khcLg335LrL779kMVX98+wSk7A8RTZb5UM7hZlu17G6tTmuy0lQb0
 dyjI4V6zZ3f08VEs=
X-Received: by 2002:a05:6000:1844:b0:219:be72:177f with SMTP id
 c4-20020a056000184400b00219be72177fmr27810963wri.218.1655800961769; 
 Tue, 21 Jun 2022 01:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUMhNc7g7p/jTqD6jD8fY4XexYAoTLV3ZM5vhdBKwhfpSaYBremz1s7ApfUfddqdIzw5ma7g==
X-Received: by 2002:a05:6000:1844:b0:219:be72:177f with SMTP id
 c4-20020a056000184400b00219be72177fmr27810941wri.218.1655800961458; 
 Tue, 21 Jun 2022 01:42:41 -0700 (PDT)
Received: from [192.168.1.40] (82-64-217-13.subs.proxad.net. [82.64.217.13])
 by smtp.gmail.com with ESMTPSA id
 c130-20020a1c3588000000b0039c798b2dc5sm21297287wma.8.2022.06.21.01.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 01:42:40 -0700 (PDT)
Message-ID: <330400e6-5a5f-7f59-b93c-0a3dd5ce47b6@redhat.com>
Date: Tue, 21 Jun 2022 10:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: qemu-ga guest-exec & SELinux
Content-Language: fr-FR
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: selinux@lists.fedoraproject.org, QEMU <qemu-devel@nongnu.org>
References: <CAJ+F1C+8y2yNjf4GHirtHSxGASPHy9n7u++39WDhcgDn2p_M8Q@mail.gmail.com>
 <YrBGm4Aar1DMmy1H@redhat.com>
From: =?UTF-8?Q?Renaud_M=c3=a9trich?= <rmetrich@redhat.com>
In-Reply-To: <YrBGm4Aar1DMmy1H@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fluvt0CIHh2NIx42VemK8N0I"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rmetrich@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Jun 2022 09:33:50 -0400
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fluvt0CIHh2NIx42VemK8N0I
Content-Type: multipart/mixed; boundary="------------NeiW7RPgEKI09GpLxtFPFq0o";
 protected-headers="v1"
From: =?UTF-8?Q?Renaud_M=c3=a9trich?= <rmetrich@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: selinux@lists.fedoraproject.org, QEMU <qemu-devel@nongnu.org>
Message-ID: <330400e6-5a5f-7f59-b93c-0a3dd5ce47b6@redhat.com>
Subject: Re: qemu-ga guest-exec & SELinux
References: <CAJ+F1C+8y2yNjf4GHirtHSxGASPHy9n7u++39WDhcgDn2p_M8Q@mail.gmail.com>
 <YrBGm4Aar1DMmy1H@redhat.com>
In-Reply-To: <YrBGm4Aar1DMmy1H@redhat.com>

--------------NeiW7RPgEKI09GpLxtFPFq0o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgdGhlcmUsDQoNCkknbSB0aGUgQlogcmVwb3J0ZXIuDQoNCkkgdGhpbmsgdGhlIHNhZmUg
c29sdXRpb24gaXMgdG8gcHJvdmlkZSBzb21ldGhpbmcgc2ltaWxhciB0byB3aGF0IHdhcyAN
CmRvbmUgZm9yIHZtdG9vbHM6IGhhdmUgYSBjb250ZXh0IHN3aXRjaGluZyB0byBiZWNvbWUg
c29ydCBvZiANCiJ1bmNvbmZpbmVkIiBkb21haW4uDQoNClRoaXMgY29udGV4dCBzd2l0Y2gg
aGFzIHRvIGhhcHBlbiBvbmx5IHRoZSBleGVjdXRvciBhbmQgd2UgYWxyZWFkeSBoYXZlIA0K
YSBzb2x1dGlvbiwgSSBkb2N1bWVudGVkIGl0IGluIHRoZSBCWi4NCg0KSSBkb24ndCB0aGlu
ayBoYXZpbmcgYW4gYWRkaXRpb25hbCBib29sZWFuIGlzIG5lY2Vzc2FyeSwgdW5sZXNzIHdl
IHdhbnQgDQp0byByZXN0cmljdCB0aGUgY29tbWFuZHMgdGhlIGd1ZXN0IGNhbiBleGVjdXRl
Lg0KDQpOb3RlIHRoYXQgb24gUkhFTCB0aGUgZnVuY3Rpb25hbGl0eSBpcyBkaXNhYmxlZCBi
eSBkZWZhdWx0ICgiZ3Vlc3QtZXhlYyIgDQppcyBibGFja2xpc3RlZCksIHdlIG1heSBhZGQg
YSBub3RlIGluIHRoZSAvZXRjL3N5c2NvbmZpZy9xZW11LWdhIGZpbGUgDQpzdGF0aW5nIHRo
YXQgYWxsb3dpbmcgc3VjaCBjb21tYW5kIGlzIHJpc2t5Lg0KDQpSZW5hdWQuDQoNCkxlIDYv
MjAvMjIgw6AgMTI6MDYsIERhbmllbCBQLiBCZXJyYW5nw6kgYSDDqWNyaXTCoDoNCj4gT24g
TW9uLCBKdW4gMjAsIDIwMjIgYXQgMDE6NDQ6MDVQTSArMDQwMCwgTWFyYy1BbmRyw6kgTHVy
ZWF1IHdyb3RlOg0KPj4gSGkhDQo+Pg0KPj4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29t
L3Nob3dfYnVnLmNnaT9pZD0yMDkzMzU1ICgiQVZDcyB3aGVuIHRyeWluZyB0bw0KPj4gZXhl
Y3V0ZSBhIGNvbW1hbmQgdGhyb3VnaCBxZW11LWdhICgiZ3Vlc3QtZXhlYyIgY29tbWFuZCki
KSBkZXNjcmliZXMgYW4NCj4+IGlzc3VlIHdpdGggZmVkb3JhL3JoZWwgU0VMaW51eCBydWxl
cywgd2hlcmUgc29tZSBwcm9ncmFtIGV4ZWN1dGlvbnMgYXJlDQo+PiBkZW5pZWQuDQo+Pg0K
Pj4gcWVtdS1nYSBoYXMgInZpcnRfcWVtdV9nYV90IiBjb250ZXh0LCBhbmQgaXMgbm90IGFs
bG93ZWQgdG8gZXhlY3V0ZQ0KPj4gYmluYXJpZXMgdGhhdCBhcmUgbm90ICJiaW5fdCIsIGlp
dWMuIFRoZSBzdWdnZXN0aW9uIGZyb20gUmVuYXVkIE3DqXRyaWNoIGlzDQo+PiBmb3IgcWVt
dS1nYSBleGVjIGNvbW1hbmQgdG8gbGF1bmNoIHRoZSB1c2VyIHByb2dyYW0gdGhyb3VnaCBh
biBoZWxwZXINCj4+IHByb2dyYW0gdGhhdCB3b3VsZCBoYXZlIHRoZSB2aXJ0X3FlbXVfZ2Ff
dW5jb25maW5lZF9leGVjX3QgY29udGV4dCwgYW5kDQo+PiBhcHByb3ByaWF0ZSBydWxlcyBp
biBzZWxpbnV4IChzaW1pbGFyIHRvIGZzZnJlZXplLWhvb2sgcnVsZXMpLCBzbyBhbnkNCj4+
IHByb2dyYW0gY2FuIGJlIGV4ZWN1dGVkLiBxZW11LWdhIHdvdWxkIHRodXMgc2hpcCBhbmQg
dXNlIHRoYXQgaGVscGVyLCBpbg0KPj4gYWxsIE9TLCB0byBhdm9pZCB2YXJ5aW5nIGNvZGUg
cGF0aHMuDQo+Pg0KPj4gRG9lcyB0aGF0IHNvdW5kIHJlYXNvbmFibGUgb3Igc2hvdWxkIHdl
IHRyeSB0byBmaW5kIGEgc29sdXRpb24gd2l0aCBTRUxpbnV4DQo+PiBydWxlcyBpbnN0ZWFk
Pw0KPiBJIHRob3VnaHQgd2FzIGRpZCBub3QgYWxsb3cgcWVtdS1nYSB0byBleGVjdXRlIGJp
bmFyaWVzIGF0IGFsbCwgcmVnYXJkbGVzcw0KPiBvZiB3aGV0aGVyIHRoZXkncmUgYmluX3Qg
b3Igbm90LiAgVGhlICdndWVzdC1leGVjJyBjb21tYW5kIGlzIGVzc2VudGlhbGx5DQo+IGEg
Z2lhbnQgaG9sZSB0aGF0IGRlZmVhdHMgdGhlIHB1cnBvc2Ugb2YgY29uZmluaW5nIHFlbXUt
Z2Egd2l0aCBTRUxpbnV4DQo+IGF0IGFsbCBJTUhPLg0KPg0KPiBJTUhPIGV4ZWN1dGlvbiBv
ZiBleHRlcm5hbCBjb21tYW5kcyBzaG91bGQgb25seSBiZSBhbGxvd2VkIGFmdGVyIHRvZ2ds
aW5nDQo+IGEgU0VMaW51eCBib29sZWFuIHR1bmFibGUuDQo+DQo+DQo+IFdpdGggcmVnYXJk
cywNCj4gRGFuaWVsDQo=

--------------NeiW7RPgEKI09GpLxtFPFq0o--

--------------fluvt0CIHh2NIx42VemK8N0I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEDdWGHF0SM+2VX5h9XRKQlPtuQyYFAmKxhH8FAwAAAAAACgkQXRKQlPtuQyYz
pBAAm+JpAXs59vnVGzVViL+hveXHuyEjt2SnqEdIytcKtjazlY/mN2g1LW4rNe7FLA21FqE39J4x
nbfU6ZZ5j/bZXnHp8fpj0exVdswkXIiVsfQObfgQ9DH3VbBGCeA/PRNltfAZJD/z4IbltaYHpxAk
2vAJ0ZA6gto2tQ9dxK5ukvZp1s3muS7X4PELICXESQzJ5JN9jPLX3cgFFT8geSrMZmvd5S4ph7Pa
+18IruVcfk/iIQ3EpS1y62bzgj6eU19md1puES+e5Cv90Kbp5paqqUjUQh2jPZ9O7gOf1VbmVqBQ
TtTM6HWrGpWo7JJ9fh9ZS//VYfv9NR0YT30iRdEaUwy8ctjyzVhcx9wcOARCaQcTmMZJRaOYWDaG
7VnyLmgYrgnvk8gftlTR5S/lcbLt0cgZb47DgrONU2RX73/FtPFDt28vQEqi9IyKnUqMh4SDZbtR
f/hUerzxWxOUagzFGS7IQJWOvttlzOB0/JJMGh56Wm7xdUZVhH1Ag+v9wQ17JGdUMn7CTInc14Cs
S3nAM5rrxtpI01zg575EYf3+5iCCGI8MAziAh1Hvyg27bs8DjNJJjNy9SpsuDTjCiC4zp4AwaKv0
OhTZ9YH5zbN3EC1h0Z+bsn7S8uh711mhea398+oniOY4G8oRJr8P+9RVgMkobSPN0GsMfnE3UalK
8aw=
=Mkzb
-----END PGP SIGNATURE-----

--------------fluvt0CIHh2NIx42VemK8N0I--


