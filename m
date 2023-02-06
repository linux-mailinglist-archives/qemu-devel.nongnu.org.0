Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851868BAC4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOz2G-0004Vz-Gx; Mon, 06 Feb 2023 05:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOz24-0004VB-UW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:47:36 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOz1o-0005ex-MM
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:47:31 -0500
Received: by mail-pf1-x42a.google.com with SMTP id ay1so8034842pfb.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jq/TPsQOr+fX/ld8N/tCbNw9ltehKsM3bQMorpYe4Vw=;
 b=wOWO1wYM3zksyDmG3fhrX03fwEjcUkxN9uVu7jSJdcy1dMzVaayqKr74KMfdXRIv95
 VBgnmiGKwCK5wD4s/7rJz/cYHogPx3/xZFHBLfPUHToqk4jUJlDRvppHDSGuNCuhqjDV
 +Z3gRuPPo0hLYGpUj0tuwwfvEvt+urdPWjaG6Fy9o+qsLSeDj/GvpznXfEGTvlk1lYRd
 tns/Rt2V9FZGj5fdkqyANgaQ5F0sPxI+fZ9R+FcB472oefjaU9Y3TyXnkBQT2FFLgY/a
 lJHIpdEdz4R6viq9PktAIyeG4Qts+tpOCB2lsKLdpG6NYk18EHpTMk++VWsbQLVd4XRi
 9dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jq/TPsQOr+fX/ld8N/tCbNw9ltehKsM3bQMorpYe4Vw=;
 b=ScsH9T/JDNqgkTBrk51tV7XHJon3voiXzzvUzPI0zP1vaPWC8ZQRXQtr+67r28Zbb6
 f37SWHJ3mM75rl8FsoPogWSi0TIwFkkhihqEOEgqwQ+RkZ5BMla8+FG9t3TgVx4YJF/a
 Gh4YVYIo0dKDObFEGhR5QDwwqIK7rQvhcANiDtJTRMo/erTRvJFK9EHc2HsW/B7G++Hr
 eTbgNyXiz1aTZ7ebrOX7Ce+OCILERhKTOb/Q/XEsJ0eJbdPJHn7Hps3tHgjOL1SKiwrV
 mGJZlzJzH8h/5X4lN7cNqYvXKDTJcMuKewUkrcy0a3qn1JCZbpqxY+aX96Kafv9zSZ5T
 ZU8Q==
X-Gm-Message-State: AO0yUKVPoEPcDtOG4pAy84Xl1zHkSYrkKDQMPHsr/cdajdQBdSnI7qpD
 Vc6VlDMHn+ZBK6kkE2W2mh1eBChBuPvdjVOQxftMVA==
X-Google-Smtp-Source: AK7set8kG6YeKIB++QyRi3KgxNvPhtfTVgmcr2nFvVKz6sVGAI+fu42IIp7IzCj0ANsxsND7aRNx0jRMuhDKgwU++6E=
X-Received: by 2002:aa7:9686:0:b0:58d:ce70:4683 with SMTP id
 f6-20020aa79686000000b0058dce704683mr4183631pfk.39.1675680434922; Mon, 06 Feb
 2023 02:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
 <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
 <87sffme9jj.fsf@secure.mitica>
 <21fa9ab9-524d-c44d-905a-f1feddf92099@redhat.com>
 <87357jdvvh.fsf@secure.mitica>
In-Reply-To: <87357jdvvh.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 10:47:03 +0000
Message-ID: <CAFEAcA-Vfayp=RLZbaUThbXYj=acfzS=ZTnNrmVbu6iyG2StJw@mail.gmail.com>
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
To: quintela@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, hreitz@redhat.com, 
 dgilbert@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

T24gTW9uLCA2IEZlYiAyMDIzIGF0IDA4OjQ2LCBKdWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRo
YXQuY29tPiB3cm90ZToNCj4gIDMxLzY1OSBxZW11OnF0ZXN0K3F0ZXN0LWFhcmNoNjQgLyBxdGVz
dC1hYXJjaDY0L21pZ3JhdGlvbi10ZXN0ICAgICAgICAgICAgICAgICAgIEVSUk9SICAgICAgICAg
IDQ4LjIzcyAgIGtpbGxlZCBieSBzaWduYWwgNiBTSUdBQlJUDQo+ID4+PiBHX1RFU1RfREJVU19E
QUVNT049L2hvbWUvZ2l0bGFiLXJ1bm5lci9idWlsZHMvLUxDZmNKMlQvMC9xZW11LXByb2plY3Qv
cWVtdS90ZXN0cy9kYnVzLXZtc3RhdGUtZGFlbW9uLnNoIFFURVNUX1FFTVVfSU1HPS4vcWVtdS1p
bWcgUVRFU1RfUUVNVV9CSU5BUlk9Li9xZW11LXN5c3RlbS1hYXJjaDY0IE1BTExPQ19QRVJUVVJC
Xz0xMjQgUVRFU1RfUUVNVV9TVE9SQUdFX0RBRU1PTl9CSU5BUlk9Li9zdG9yYWdlLWRhZW1vbi9x
ZW11LXN0b3JhZ2UtZGFlbW9uIC9ob21lL2dpdGxhYi1ydW5uZXIvYnVpbGRzLy1MQ2ZjSjJULzAv
cWVtdS1wcm9qZWN0L3FlbXUvYnVpbGQvdGVzdHMvcXRlc3QvbWlncmF0aW9uLXRlc3QgLS10YXAg
LWsNCj4g4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCVIOKcgCAg4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCVDQo+IHN0ZGVycjoNCj4gQnJva2VuIHBpcGUNCj4gLi4vdGVzdHMvcXRlc3QvbGlicXRl
c3QuYzoxOTA6IGtpbGxfcWVtdSgpIGRldGVjdGVkIFFFTVUgZGVhdGggZnJvbSBzaWduYWwgMTEg
KFNlZ21lbnRhdGlvbiBmYXVsdCkgKGNvcmUgZHVtcGVkKQ0KPiBUQVAgcGFyc2luZyBlcnJvcjog
VG9vIGZldyB0ZXN0cyBydW4gKGV4cGVjdGVkIDQxLCBnb3QgMTIpDQo+ICh0ZXN0IHByb2dyYW0g
ZXhpdGVkIHdpdGggc3RhdHVzIGNvZGUgLTYpDQo+IOKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0KPg0KPiBJIGRvbid0IGtub3cg
aGF0IHRvIGRvIHdpdGggdGhpczoNCj4gLSB0aGlzIGlzIGFhcmNoNjQgdGNnDQo+IC0gdGhpcyAq
d29ya3MqIG9uIGYzNywgb3IgYXQgbGVhc3QgSSBjYW4ndCByZXByb2R1Y2UgYW55IGVycm9yIHdp
dGggbWFrZQ0KPiAgIGNoZWNrIG9uIG15IGJveCwgYW5kIEkgKnRoaW5rKiBteSBjb25maWd1cmF0
aW9uIGlzIHF1aXRlIGV4dGVuc2l2ZSAoYXMNCj4gICBmYXIgYXMgSSBrbm93IGV2ZXJ5dGhpbmcg
dGhhdCBjYW4gYmUgY29tcGlsZWQgaW4gZmVkb3JhIHdpdGggcGFja2FnZXMNCj4gICBpbiB0aGUg
ZGlzdHJvKToNCg0KPiAtIEl0IGdpdmVzIGEgc2VnbWVudGF0aW9uIGZhdWx0LiAgTm90aGluZyBl
bHNlLg0KPg0KPiBDYW4gd2UgZ2V0IGF0IGxlYXN0IGEgYmFja3RyYWNlIHRvIHdvcmsgZnJvbSB0
aGVyZT8NCg0KSW1wcm92aW5nIHRoZSB0ZXN0IHByb2dyYW0gLyB0ZXN0IGhhcm5lc3MgdG8gcHJv
dmlkZSBiZXR0ZXINCmluZm9ybWF0aW9uIHdvdWxkIGhlbHAuIFVsdGltYXRlbHkgaWYgd2UncmUg
Z29pbmcgdG8gYmUNCmRvaW5nIENJIGluIGdpdGxhYiB0aGlzIGlzIGEgbmVjZXNzaXR5IC0tIGFs
bCB3ZSBhcmUgZXZlcg0KZ29pbmcgdG8gaGF2ZSBpcyB3aGF0ZXZlciB0aGUgdGVzdCBwcm9ncmFt
IGFuZCBoYXJuZXNzIGNhbg0KcHJpbnQgdG8gdGhlIGxvZ3MuLi4NCg0KdGhhbmtzDQotLSBQTU0N
Cg==

