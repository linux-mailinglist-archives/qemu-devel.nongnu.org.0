Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE566DC1A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjxr-0006qd-Vo; Tue, 17 Jan 2023 06:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHjxQ-0006pa-OG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:16:56 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHjxO-0007mt-Mn
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:16:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id k13so606112plg.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xv7z0TNF33CJHWLlQURuEWKXVcoNCic6UHt7Es4tIoc=;
 b=EWi8KRbeyWuuUTBrGqNlgyLgPJBTCRbRGpwOXn6HDm8BTwNBb521F0io9/e1D9taUM
 WlS9wOR98k+PWnM01uigjJ4NYigoIvVA9Wfn8i4S+G2TDrl30So2L6sN4b2uEzrEwTgr
 Acn29/lJ6Pn/RBMzCCuenZ6Kwbo1MIecFd++VsMIyaepth9wpgOPfJ+sPAwbLMofu9bU
 vOUk0u0awzEOCwQeg/ZNMWCUhHGioJdwxUIJbO7ojc6HeurGMDqjUa3JV0MfCIsZXcAU
 FoaPBCkUNJ+GCHjKKDB2h8/Arkknh0VDzafLD1VzicFQy5K5lrxNK0iWyzjV5Oj9u9sR
 Scaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xv7z0TNF33CJHWLlQURuEWKXVcoNCic6UHt7Es4tIoc=;
 b=epbHAdfWHOiRxyPQkM6DxsvLp1GSz6nE9yYVGlCXNvXgDaLCQjnBLvSMLSJL/jG+91
 oGhap4DOr6XeI2tDYwJv6I2NpiQuv0UUDlLh9xuJIpMawqCY/J9l9R12i5YcmcYmmlvE
 Nrlj1AlSJh8I/TeNhqQXFOk4xIpGEBr1NmekRnn4LL0hRkcKoOqnakew1WPBS8MyGgSj
 HdCeJQ9L6v0BK1txpDuTRbpkruuDmtX/PI/uWpXZh4If1PwJbxQKZYqKow/5ssS7Pf7r
 hmCnzcFQJuDr+IRGyCO6chZQ/IgzHF+hzAquLVLx7v1Y6+5ceCb8msZjxgJ9CgYwDf6R
 evbw==
X-Gm-Message-State: AFqh2krdrxVtPyDsVlenxGalCDpUntUXtkYxBjCsUDnVz0VUKSRp809c
 swkpy/DPbDIfJBmQE19NRacsLnAJNnN6l6S6TNiNeA==
X-Google-Smtp-Source: AMrXdXvC+25W567DSVzcO12zClSqLEP+GFXbduzrUFxmhbsbKeCEBpX7oi4QvcDbGD8hXXLoCwYdZMIBc6mJ760Z0pU=
X-Received: by 2002:a17:90b:46c9:b0:219:e2f1:81ad with SMTP id
 jx9-20020a17090b46c900b00219e2f181admr235214pjb.19.1673954204342; Tue, 17 Jan
 2023 03:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
In-Reply-To: <Y8Z8CJoFyxB9uHqU@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 11:16:32 +0000
Message-ID: <CAFEAcA_hMpFL=Pn8hSc1BDJO3n4e5kq2dSmyWTNBfs2gRa8mjA@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gVHVlLCAxNyBKYW4gMjAyMyBhdCAxMDo0NCwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFu
Z2VAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IFNvbWV0aGluZyByYW5kb20gdGhhdCBsb29rcyBsaWtl
IGJhZCB0ZXh0IGRhdGENCj4NCj4g4pa2IDE2Ni82MTkgL3B0aW1lci9vbmVzaG90IHBvbGljeT1u
b19pbW1lZGlhdGVf77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9
77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9
77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9
77+977+977+977+977+977+977+977+977+977+977+9Li4uc25pcC4uLi7vv73vv73vv73vv73v
v73vv73vv73vv73vv73vv73vv73vv73vv70NCg0KSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgb25l
LiBUaGUgc3RyaW5nIGNvbWVzIGZyb20NCnRlc3RzL3VuaXQvcHRpbWVyLXRlc3QuYzphZGRfcHRp
bWVyX3Rlc3RzKCkgYnV0IHRoYXQNCmNvZGUgY3JlYXRlcyB0aGUgdGVzdCBzdHJpbmcgdXNpbmcg
Z19zdHJsY2F0KCkgYW5kDQpnX3N0cmR1cF9wcmludGYoKSwgc28gSSBkb24ndCBzZWUgaG93IGl0
IGNvdWxkIGVuZA0KdXAgYmVpbmcganVuaywgZXNwZWNpYWxseSBub3QgYXQgdGhhdCBwb2ludCBp
bg0KdGhlIHN0cmluZy4gSSBndWVzcyBpdCdzIHBvc3NpYmxlIHNvbWV0aGluZyBlbHNlIGluDQp0
aGUgdGVzdCBpcyBtYW5hZ2luZyB0byBjb3JydXB0IHRoZSBnX3Rlc3QgdGVzdCBuYW1lDQpzdHJp
bmdzPw0KDQo+IEFuZCB3aGF0IGkgdGhpbmsgaXMgdGVzdCBmbG9hdCBiZWluZyBvdmVybHkgdmVy
Ym9zZQ0KDQpZZXMsIHRoZSBmbG9hdCB0ZXN0cyBhcmUgbWFzc2l2ZWx5IG92ZXItdmVyYm9zZS4g
VGhpcw0KaXMgYSBwcm9ibGVtIG5vdCBqdXN0IGluIHRoZSBsZW5ndGggb2YgdGhlIHRlc3QgbG9n
DQpidXQgYWxzbyBpbiBmaW5kaW5nIHRoZSBhY3R1YWwgY2F1c2Ugb2YgYSB0ZXN0IGZhaWx1cmUs
DQpiZWNhdXNlIG9mdGVuIHRoZSBmbG9hdCB0ZXN0cyB3ZXJlIHJ1bm5pbmcgaW4gcGFyYWxsZWwN
CndpdGggdGhlIGZhaWxlZCB0ZXN0IGFuZCBwcmludCBhbGwgdGhlaXIgdmVyeSB2ZXJib3NlDQpv
dXRwdXQgYWZ0ZXIgdGhlIGZhaWxlZCB0ZXN0IG91dHB1dCwgc28geW91IGhhdmUgdG8NCnNjcm9s
bCBiYWNrIHVwIGZvciBtaWxlcyB0byBmaW5kIGl0Lg0KDQp0aGFua3MNCi0tIFBNTQ0K

