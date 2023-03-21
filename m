Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE096C3CFA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 22:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pejq9-00071K-PE; Tue, 21 Mar 2023 17:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pejq6-00070b-Ie
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 17:48:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pejq4-00058T-Us
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 17:48:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso11901899wmb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679435293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NYFC2uoTfU8j1+UKS3OFw33rKZJQTBVIH1oPFtmPJ9Y=;
 b=SuocZ80bsUBP1dz6CKNU10voVmEBKbrFbLZNvf32IsLSX08ecs1UXtFR3TKmDkn8yl
 J0DoTSkcO8VKyPmIfH9Nz/RBMNTGZvZmqkIj4NDn0pGBMq5cjUAJa2u8i7UnipEZP5Gc
 u7s1cyEKJDeRX3kXqUMOUfP/YTQ0+ps7rXDDOnNpEmq/8+2o80qHLNvc7kS2ysWWl4B9
 k0JIKOcpIe8oPT8UKsDVQHEvQEqKz6QTYNYNl/xbNPSPn/fAmMJ3a7lNkoLTZj7PnF2K
 nSPfMlSxbH4lsWmHL6A37b3owSHpWqk3Sf7xXMb52uOfUFhL4Yr5aPprkn3gY6mRxlr+
 FNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679435293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYFC2uoTfU8j1+UKS3OFw33rKZJQTBVIH1oPFtmPJ9Y=;
 b=mpWsGd86CeZe6hH7TAGryFV+bFprqcUX127XagPnFaXHVm9b0Xk3HsG4Nc/pMsI6uO
 e/+f7i3fhwPX42eK3/2py69hivuj618QpM+cix8cmP6x72KXJl2G1pCFRfxNWh9ysDre
 2h3pzhvKaq1px2CFBq29xXkKYTNQAcb8LkTiqvhqf3X1dnLuyn0FucIH1UlaPGXn46oT
 sJ/w0+rSfs3DVZHjR7mhXGLOjrz2SB9TbOeXlceoG4iMtCtwxgtXYQK+PtqTfSVXOiBm
 +V5VOpYXANqnGiYTc/bSYw4kx3qDl2JGUl0i5S0XRT/SV5fdaoMbFoXRHAMIhhwup00H
 xsiQ==
X-Gm-Message-State: AO0yUKVEnG726BpvYNOXu4JUFE7XAvaHWbhi1ySXrF18cSUsTWDbPzAt
 wKHuWVzcioV5ef2J/vaDDbe9oioCp+QXENgrhOo=
X-Google-Smtp-Source: AK7set9QQ1fhYaOnmBJikUzfD4E6ZWWSPQ6Z3Uc/VrZplXUMAGc9lx2+K7aKOvVDkHGTRIhPxfUIrg==
X-Received: by 2002:a1c:7714:0:b0:3ed:c84c:7efe with SMTP id
 t20-20020a1c7714000000b003edc84c7efemr35755wmi.7.1679435292894; 
 Tue, 21 Mar 2023 14:48:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5cc:caa0:1f0d:1c02:17f3:df40?
 ([2a01:e0a:5cc:caa0:1f0d:1c02:17f3:df40])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a1cf701000000b003ee42696acesm2153807wmh.16.2023.03.21.14.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 14:48:12 -0700 (PDT)
Message-ID: <cfde8400-2df9-73d7-3eb0-b3a81f838311@linaro.org>
Date: Tue, 21 Mar 2023 22:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/4] qga/vss-win32: fix warning for clang++-15
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-4-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20230221153006.20300-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

U29ycnkgdG8gY29tZSBiYWNrIG9uIHRoaXMsIGJ1dCBpdCBzZWVtcyB0aGlzIHNwZWNpZmlj
IGNvbW1pdCB3YXMgbm90IA0KaW50ZWdyYXRlZCBpbiB0cnVuay4NCg0KQEtvbnN0YW50aW4g
S29zdGl1azogSWYgeW91IHBsYW4gdG8gaW50ZWdyYXRlIHRoaXMgbGF0ZXIgKGJlZm9yZSA4
LjAgDQp0YWcpLCBzb3JyeSBmb3IgdGhlIG5vaXNlLiBTaW5jZSByYzEgd2FzIHB1Ymxpc2hl
ZCB0b2RheSwgSSB0aGluayBpdCBtYXkgDQpoYXZlIGJlZW4gImxvc3QiLg0KDQpJZiBzb21l
b25lIHdhbnRzIHRvIG1lcmdlIGl0LCB0aGF0IHdvdWxkIGJlIG5pY2UuDQoNClRoYW5rcywN
ClBpZXJyaWNrDQoNCk9uIDIvMjEvMjMgMTY6MzAsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6
DQo+IFJlcG9ydGVkIHdoZW4gY29tcGlsaW5nIHdpdGggY2xhbmctd2luZG93cy1hcm02NC4N
Cj4gDQo+IC4uL3FnYS92c3Mtd2luMzIvaW5zdGFsbC5jcHA6NTM3Ojk6IGVycm9yOiB2YXJp
YWJsZSAnaHInIGlzIHVzZWQgdW5pbml0aWFsaXplZCB3aGVuZXZlciAnaWYnIGNvbmRpdGlv
biBpcyBmYWxzZSBbLVdlcnJvciwtV3NvbWV0aW1lcy11bmluaXRpYWxpemVkXQ0KPiAgICAg
IGlmICghKENvbnRyb2xTZXJ2aWNlKHNlcnZpY2UsIFNFUlZJQ0VfQ09OVFJPTF9TVE9QLCBO
VUxMKSkpIHsNCj4gICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC4uL3FnYS92c3Mtd2luMzIvaW5zdGFsbC5jcHA6
NTQ1OjEyOiBub3RlOiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQ0KPiAgICAgIHJl
dHVybiBocjsNCj4gICAgICAgICAgICAgXn4NCj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sg
Qm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPiBGaXhlczogOTE3ZWJj
YjE3MCAoInFnYS13aW46IEZpeCBRR0EgVlNTIFByb3ZpZGVyIHNlcnZpY2Ugc3RvcCBmYWls
dXJlIikNCj4gUmV2aWV3ZWQtYnk6IEtvbnN0YW50aW4gS29zdGl1ayA8a2tvc3RpdWtAcmVk
aGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgcWdhL3Zzcy13aW4zMi9pbnN0YWxsLmNwcCB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9xZ2EvdnNzLXdpbjMyL2luc3RhbGwuY3BwIGIvcWdh
L3Zzcy13aW4zMi9pbnN0YWxsLmNwcA0KPiBpbmRleCBiNTc1MDhmYmUwLi5iODA4N2U1YmFh
IDEwMDY0NA0KPiAtLS0gYS9xZ2EvdnNzLXdpbjMyL2luc3RhbGwuY3BwDQo+ICsrKyBiL3Fn
YS92c3Mtd2luMzIvaW5zdGFsbC5jcHANCj4gQEAgLTUxOCw3ICs1MTgsNyBAQCBuYW1lc3Bh
Y2UgX2NvbV91dGlsDQo+ICAgLyogU3RvcCBRR0EgVlNTIHByb3ZpZGVyIHNlcnZpY2UgdXNp
bmcgV2luc3ZjIEFQSSAgKi8NCj4gICBTVERBUEkgU3RvcFNlcnZpY2Uodm9pZCkNCj4gICB7
DQo+IC0gICAgSFJFU1VMVCBocjsNCj4gKyAgICBIUkVTVUxUIGhyID0gU19PSzsNCj4gICAg
ICAgU0NfSEFORExFIG1hbmFnZXIgPSBPcGVuU0NNYW5hZ2VyKE5VTEwsIE5VTEwsIFNDX01B
TkFHRVJfQUxMX0FDQ0VTUyk7DQo+ICAgICAgIFNDX0hBTkRMRSBzZXJ2aWNlID0gTlVMTDsN
Cj4gICANCg==

