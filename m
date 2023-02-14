Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA75695B8C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqCM-0003sJ-Pv; Tue, 14 Feb 2023 02:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRqCK-0003rv-Sr
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:57:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRqCJ-0002bN-8w
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:57:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so10897796wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+pMAZjJGNkTN/ZYzONoEJCeiCSywuXocB0Dj1MimHIA=;
 b=IYIkJ9/NRfIeCwRRKqXVJJg7tr2r3ZAATM+TRpfPrIotLqevdhYAhH9so95fJyKHb5
 I6WVZzvg0vhUI2pnsfKAKwlf93DGNEe0U/f325/IC/nK77fKflHL576KCAgHYFVnfItF
 WG/4TGeUgITD5agU7/RPLmCFtrjdqf14Tw/oWBRk3JJ3KEIRqfOPSMfWTDDnTVVuru1O
 yiyD/0hyH+2wN6skNkb4SnNcxdyHSbzP5AM47e2VQk2WsVC57Pr0CyCKDIiKgC+3kL7R
 cZJ1XUnFwPLvYm6JImDegb5MPoykdBKASpaBdO4fcJP06swjxatSWjhuVExAf68Twae9
 JvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+pMAZjJGNkTN/ZYzONoEJCeiCSywuXocB0Dj1MimHIA=;
 b=OjSBAaSLgwiJTTEdPPTqoYEONxGxw0jaEO6qO/jv+CLX2up7L75xZlYPt7dHCSEsX9
 4Glfu2eKn8g4cxa7Ar2BtnfTC0QpqbzWUizc8EpSTMf5lj5dD1keMK231kh24yK3AzSl
 ERuqRZwP+OTzcwszqmFiiFsbySWl/aTug8SfGMAy7JdV0vTbxt2sFiCEIbaTbO4pXhAD
 mRIWmSaktwPoaJmCsmGx4aeFhLUIqKDX9ntrvQLE8cNz6rkkQZ/Xw/FGSn+5/DCQGnxp
 4uhNzTmOk9cfqeMi+CX/bJtPcKTmciu9+kboWdvi9XzO8flU0wP7J4Seg9zXjpIt0Qz4
 OJVw==
X-Gm-Message-State: AO0yUKXhEPa8rMnG5gHSMl+dJrp9yN7W4sduJUdvQlasHEJQOCLPvzje
 1vtDEa13qm4v/BcurRZT/f6EOg==
X-Google-Smtp-Source: AK7set91w2UFWdgbr1bDFzl9YiRvCRGcqC+COe8aBkRb9/pBRpk+2U2Gb6CMc3l02cRntDQ53zNlTQ==
X-Received: by 2002:a05:600c:3085:b0:3d9:e5f9:984c with SMTP id
 g5-20020a05600c308500b003d9e5f9984cmr1154031wmn.2.1676361473178; 
 Mon, 13 Feb 2023 23:57:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:59b6:5cf7:7f59:1fb4?
 ([2a01:e0a:5cc:caa0:59b6:5cf7:7f59:1fb4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b003dd8feea827sm21497707wmq.4.2023.02.13.23.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 23:57:52 -0800 (PST)
Message-ID: <67ea040b-d52e-53e2-4927-841d534cb72d@linaro.org>
Date: Tue, 14 Feb 2023 08:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/4] target/ppc: fix warning with clang-15
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-5-pierrick.bouvier@linaro.org>
 <f2184bc0-6f02-4719-3f43-221d641c7ec6@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <f2184bc0-6f02-4719-3f43-221d641c7ec6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

T24gMi8xNC8yMyAwODoxNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDEzLzIvMjMgMTc6MTMsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBXaGVuIGNvbXBp
bGluZyBmb3Igd2luZG93cy1hcm02NCB1c2luZyBjbGFuZy0xNSwgaXQgcmVwb3J0cyBhIHNv
bWV0aW1lcw0KPj4gdW5pbml0aWFsaXplZCB2YXJpYWJsZS4gVGhpcyBzZWVtcyB0byBiZSBh
IGZhbHNlIHBvc2l0aXZlLCBhcyBhIGRlZmF1bHQNCj4+IGNhc2UgZ3VhcmRzIHN3aXRjaCBl
eHByZXNzaW9ucywgcHJldmVudGluZyB0byByZXR1cm4gYW4gdW5pbml0aWFsaXplZA0KPj4g
dmFsdWUsIGJ1dCBjbGFuZyBzZWVtcyB1bmhhcHB5IHdpdGggYXNzZXJ0IGRlZmluaXRpb24u
DQo+Pg0KPj4gU2V0dGluZyB0aGUgcm5kIHZhcmlhYmxlIHRvIHplcm8gZG9lcyBub3QgaHVy
dCBhbnl3YXkuDQo+Pg0KPj4gLi4vdGFyZ2V0L3BwYy9kZnBfaGVscGVyLmM6MTQxOjEzOiBl
cnJvcjogdmFyaWFibGUgJ3JuZCcgaXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyICdp
ZicgY29uZGl0aW9uIGlzIHRydWUgWy1XZXJyb3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXpl
ZF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBhc3NlcnQoMCk7IC8qIGNhbm5vdCBnZXQgaGVy
ZSAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fg0KPj4gLi4vaW5jbHVkZS9xZW11L29z
ZGVwLmg6MjI5OjIwOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdhc3NlcnQnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICNkZWZpbmUgYXNzZXJ0KHgpICBnX2Fzc2VydCh4KSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+DQo+PiAv
Y2xhbmdhcm02NC9iaW4vLi4vaW5jbHVkZS9nbGliLTIuMC9nbGliL2d0ZXN0dXRpbHMuaDoy
MzU6NDk6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ2dfYXNzZXJ0JyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiBHX0xJS0VMWSAoZXhwcikgOyBlbHNlIFwNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+
PiAvY2xhbmdhcm02NC9iaW4vLi4vaW5jbHVkZS9nbGliLTIuMC9nbGliL2dtYWNyb3MuaDox
MTg2OjI1OiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdHX0xJS0VMWScNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPj4gLi4vdGFyZ2V0L3BwYy9kZnBfaGVscGVyLmM6MTQ0OjQyOiBub3Rl
OiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQ0KPj4gICAgICAgZGVjQ29udGV4dFNl
dFJvdW5kaW5nKCZkZnAtPmNvbnRleHQsIHJuZCk7DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
UGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4gLS0t
DQo+PiAgICB0YXJnZXQvcHBjL2RmcF9oZWxwZXIuYyB8IDQgKystLQ0KPj4gICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvdGFyZ2V0L3BwYy9kZnBfaGVscGVyLmMgYi90YXJnZXQvcHBjL2RmcF9oZWxw
ZXIuYw0KPj4gaW5kZXggY2MwMjQzMTZkNS4uMGI0YjI4MDY4MyAxMDA2NDQNCj4+IC0tLSBh
L3RhcmdldC9wcGMvZGZwX2hlbHBlci5jDQo+PiArKysgYi90YXJnZXQvcHBjL2RmcF9oZWxw
ZXIuYw0KPj4gQEAgLTY5LDcgKzY5LDcgQEAgc3RydWN0IFBQQ19ERlAgew0KPj4gICAgDQo+
PiAgICBzdGF0aWMgdm9pZCBkZnBfcHJlcGFyZV9yb3VuZGluZ19tb2RlKGRlY0NvbnRleHQg
KmNvbnRleHQsIHVpbnQ2NF90IGZwc2NyKQ0KPj4gICAgew0KPj4gLSAgICBlbnVtIHJvdW5k
aW5nIHJuZDsNCj4+ICsgICAgZW51bSByb3VuZGluZyBybmQgPSAwOw0KPj4gICAgDQo+PiAg
ICAgICAgc3dpdGNoICgoZnBzY3IgJiBGUF9EUk4pID4+IEZQU0NSX0RSTjApIHsNCj4+ICAg
ICAgICBjYXNlIDA6DQo+PiBAQCAtMTA2LDcgKzEwNiw3IEBAIHN0YXRpYyB2b2lkIGRmcF9w
cmVwYXJlX3JvdW5kaW5nX21vZGUoZGVjQ29udGV4dCAqY29udGV4dCwgdWludDY0X3QgZnBz
Y3IpDQo+PiAgICBzdGF0aWMgdm9pZCBkZnBfc2V0X3JvdW5kX21vZGVfZnJvbV9pbW1lZGlh
dGUodWludDhfdCByLCB1aW50OF90IHJtYywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IFBQQ19ERlAgKmRmcCkNCj4+
ICAgIHsNCj4+IC0gICAgZW51bSByb3VuZGluZyBybmQ7DQo+PiArICAgIGVudW0gcm91bmRp
bmcgcm5kID0gMDsNCj4gDQo+IENvdWxkIERFQ19ST1VORF9ERUZBVUxUIGJlIGNsZWFyZXI/
DQo+IA0KDQpJIG1pc3NlZCB0aGF0IG1hY3JvIGRlZmluaXRpb24sIGFuZCB0aGF0IHNlZW1z
IGxpa2UgYSBnb29kIGRlZmF1bHQgDQp2YWx1ZS4gSSdsbCBjaGFuZ2UgdG8gdGhpcy4NCg==


