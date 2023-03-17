Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1136BE66C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 11:19:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd79a-0000Hp-4d; Fri, 17 Mar 2023 06:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pd79V-0000HT-Bn
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 06:17:38 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pd79S-0001Yy-3D
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 06:17:36 -0400
Received: by mail-pg1-x52a.google.com with SMTP id d10so2564925pgt.12
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 03:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679048251;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdYfV/WbuaxTt/GtRseRWF+jR5LuEMvVCte9pVvd1sA=;
 b=vpJCbrhicgGrttEE4frjVn6Q2HlXpjgT7Z+fSCDOWTlG/1NJfEX+Jfdg6mksfRG+bW
 nGCbBJ1DsGuXRSZ5qQBrlFPDQvv6cO/T0kVpugYNi49uUAfW9qyfqCgt3tH/AF6H8fCe
 xAfTLUQnGaFbTaO8z3pOiaa6f2Fh/o7YVQG8ejW0iUTtAnLluf5HL9ls8gDsf4aXe5BC
 ZxBa6jTGPXkRM+1ftS1bBd0J0LRDw075uknYqF0cOfAOKZPYpdzpHpcarXjqvRDy5kNv
 c/gmZmmQf0ZC+Xq5noZL1V7S9UBT1Ajjm+0Gm48r/xkmADyAbUD6laFFyK9BezyvnVYt
 62yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679048251;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OdYfV/WbuaxTt/GtRseRWF+jR5LuEMvVCte9pVvd1sA=;
 b=m/l7/DrowuToKtvr5bP/kwG6XebubnmmFJcdYy63cwzufeej5pOioPt5Hn5o/G+n8T
 nwgPBdHYVuGn0K2p/fQ0+tUo9Bt8rtXcmS98yHsRrnvNuO8kb5aiByRhcqrrqct5o0D+
 OibmMERG+DE6d2dNy2/4wBV5yEDnKW3qR9wQTl+HUM2VJ6pYh4BbaOCAZguFGN1reOcF
 7R6/ubUvr0pymOM+0bD892DxbQ0tgbyudQYep08eqbxtkB7fG4Xikpjv99ZlIg5olixv
 tlOVIHxgwcJE+SRPeoY+Sm3kJLQcG/iVGJqaONIYL/i1pElLgSmKxjY3edglxLu+pxd0
 Rbog==
X-Gm-Message-State: AO0yUKUS5ZgW9gSJr8jajjunD9O7NwTDGZkFRa4Bv8Bbl1oN/q7feMOE
 nC9U6oUXaMunjO0ELtxUSKnwZuY9eItNFH9Z9KC7vbjorRKKinyU
X-Google-Smtp-Source: AK7set9T0wE1F3Ob/EneN0W+Iwn+Fbj9zMKtp4SgHT3gdVvDrorDElIlOpfiiAaWHJN28InrDnbudnaozSqWtxjFRak=
X-Received: by 2002:a65:5348:0:b0:502:e4df:5f3f with SMTP id
 w8-20020a655348000000b00502e4df5f3fmr1712019pgr.6.1679048250730; Fri, 17 Mar
 2023 03:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
 <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
In-Reply-To: <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 10:17:19 +0000
Message-ID: <CAFEAcA-n+9N+0ZuE6MSD1aMBeGYAJTbQe=j1-2K=SgD_Ly6nEA@mail.gmail.com>
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

T24gTW9uLCA2IE1hciAyMDIzIGF0IDExOjE2LCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc+IHdyb3RlOg0KPg0KPiBPbiBGcmksIDMgTWFyIDIwMjMgYXQgMTg6MzYsIFBl
dGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBJ
J3ZlIG5vdGljZWQgdGhhdCB0ZXN0LWJsb2Nram9iIHNlZW1zIHRvIGZhaWwgaW50ZXJtaXR0ZW50
bHkNCj4gPiBvbiB0aGUgbXN5czItNjRiaXQgam9iOg0KPiA+DQo+ID4gaHR0cHM6Ly9naXRsYWIu
Y29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8zODcyNTA4ODAzDQo+ID4gaHR0cHM6Ly9naXRs
YWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8zODcxMDYxMDI0DQo+ID4gaHR0cHM6Ly9n
aXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8zODY1MzEyNDQwDQo+ID4NCj4gPiBT
YW1wbGUgb3V0cHV0Og0KPiA+IHwgNTMvODkgRVJST1I6Li4vdGVzdHMvdW5pdC90ZXN0LWJsb2Nr
am9iLmM6NDk5OnRlc3RfY29tcGxldGVfaW5fc3RhbmRieToNCj4gPiBhc3NlcnRpb24gZmFpbGVk
OiAoam9iLT5zdGF0dXMgPT0gSk9CX1NUQVRVU19TVEFOREJZKSBFUlJPUg0KPiA+IDUzLzg5IHFl
bXU6dW5pdCAvIHRlc3QtYmxvY2tqb2IgRVJST1IgMC4wOHMgZXhpdCBzdGF0dXMgMw0KDQo+IEhl
cmUncyBhbiBpbnRlcm1pdHRlbnQgZmFpbHVyZSBmcm9tIG15IG1hY29zIHg4NiBtYWNoaW5lOg0K
Pg0KPiAxNzIvNjIxIHFlbXU6dW5pdCAvIHRlc3QtYmxvY2tqb2INCj4gICAgICAgICAgICBFUlJP
UiAgICAgICAgICAgMC4yNnMgICBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0KDQpBbmQgYW4g
aW50ZXJtaXR0ZW50IG9uIHRoZSBmcmVlYnNkIDEzIENJIGpvYjoNCmh0dHBzOi8vZ2l0bGFiLmNv
bS9xZW11LXByb2plY3QvcWVtdS8tL2pvYnMvMzk1MDY2NzI0MA0KDQo+Pj4gTUFMTE9DX1BFUlRV
UkJfPTE5NyBHX1RFU1RfQlVJTERESVI9L3RtcC9jaXJydXMtY2ktYnVpbGQvYnVpbGQvdGVzdHMv
dW5pdCBHX1RFU1RfU1JDRElSPS90bXAvY2lycnVzLWNpLWJ1aWxkL3Rlc3RzL3VuaXQgL3RtcC9j
aXJydXMtY2ktYnVpbGQvYnVpbGQvdGVzdHMvdW5pdC90ZXN0LWJsb2Nram9iIC0tdGFwIC1rDQri
lrYgMTc4LzY1MCAvYmxvY2tqb2IvaWRzDQogICAgICAgICAgIE9LDQoxNzgvNjUwIHFlbXU6dW5p
dCAvIHRlc3QtYmxvY2tqb2INCiAgICAgICAgICAgRVJST1IgICAgICAgICAgIDAuMzFzICAga2ls
bGVkIGJ5IHNpZ25hbCA2IFNJR0FCUlQNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAlQ0Kc3RkZXJyOg0KQXNzZXJ0aW9uIGZhaWxlZDogKGpv
Yi0+c3RhdHVzID09IEpPQl9TVEFUVVNfU1RBTkRCWSksIGZ1bmN0aW9uDQp0ZXN0X2NvbXBsZXRl
X2luX3N0YW5kYnksIGZpbGUgLi4vdGVzdHMvdW5pdC90ZXN0LWJsb2Nram9iLmMsIGxpbmUNCjQ5
OS4NCg0KDQpUQVAgcGFyc2luZyBlcnJvcjogVG9vIGZldyB0ZXN0cyBydW4gKGV4cGVjdGVkIDks
IGdvdCAxKQ0KKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCuKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
lQ0KDQpBbnlib2R5IGluIHRoZSBibG9jayB0ZWFtIGxvb2tpbmcgYXQgdGhlc2UsIG9yIHNoYWxs
IHdlIGp1c3QNCmRpc2FibGUgdGhpcyB0ZXN0IGVudGlyZWx5ID8NCg0KdGhhbmtzDQotLSBQTU0N
Cg==

