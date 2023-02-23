Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F166A0554
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 10:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8He-0004H8-DM; Thu, 23 Feb 2023 04:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pV8Hd-0004H0-BN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 04:53:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pV8Hb-00080k-JE
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 04:53:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so9550520wms.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/STTILjJPst6RaxLAz+p6bqSEHmpOJa6kwCnJJ8vZo=;
 b=A9GyooGz13n/llFovO7JtwTsUPyWSiuTL6VQvoX9W3pGNbGIzTdhDs1osO4E+tBfsG
 4PxoU/MG5KooKoMzyk1zuS+L2FNeO3e6urb/KO4zbSvQ1D3TqdBW3VkOw3yDjwm6GbQf
 G4fxCW07icK1hI77c6nUD/E9svZ9kNEpiYNa+C+z6Pjxb7cJQYwXx46ZMG1zF+vUoudp
 DbzehmsKy+uefjPn1ztIxs9dC2pRQGQpS6uLAbEhBvzuLCav7uXg0INoonvRH3mfHi4f
 rQTeCo/pruC2ZlVCyxe1QdqSbwo6P+hUINJ4XzLrlyhG2ntsnZ8kx9yBr6dccF7xgxaZ
 WoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/STTILjJPst6RaxLAz+p6bqSEHmpOJa6kwCnJJ8vZo=;
 b=nJT//z4fYdrwWQPpKcRh/VBDa+hq8+BnsFhCU0yDU3+UUtkHzFLAZ95iwTr/GWM7KU
 60UZseKHf4tLZ8Khpbrmg8Amq1n/LpFdp5A2XL4/70oc26fxLWod2xjH01SgTHzUS/5p
 dcXmellpq9a02wQKiBaX0G2df2UQWEWDWgqROIDN/gqhV4eLe2fnaY6WXgBthBQHPvG6
 Us6DoA5keeuSNl7P06adDDdWuT3E8Dzfv/4Rs16D9EOJDn6ZQBzb9y/iN5e75W/Maow2
 zc63avCljQDQgj/Ix3JwfA05TTUNnPN0iZRxhrAlqk0UnmlFLJfVh+VCHHywju1yyofm
 3SeA==
X-Gm-Message-State: AO0yUKW/cmqNehV+e6Fz5KK/g/sdCwHticEOSH1/ApVKimAWpPnLlvoT
 +poei9vOVP2UeesVQGh+IAZbsw==
X-Google-Smtp-Source: AK7set/5ayZttB6zojKTXXIWESutDIVY5N/HNuyyvQWaYOfuWtZr94oTgcmmqCGp/2S/P2mZ0WSX7g==
X-Received: by 2002:a05:600c:328a:b0:3dc:50bc:da70 with SMTP id
 t10-20020a05600c328a00b003dc50bcda70mr8051022wmp.10.1677145977474; 
 Thu, 23 Feb 2023 01:52:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:d3bf:25f2:e2d9:935c?
 ([2a01:e0a:5cc:caa0:d3bf:25f2:e2d9:935c])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003df245cd853sm13208620wmq.44.2023.02.23.01.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 01:52:57 -0800 (PST)
Message-ID: <b6c9041f-d54d-af07-0966-810d2cfbe975@linaro.org>
Date: Thu, 23 Feb 2023 10:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mttcg: warning to user about memory ordering
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: bobby.prani@gmail.com
References: <7d380f61-b104-0fcd-47af-8712ffa01668@linaro.org>
 <f5b820d8-68ce-d280-4025-3473fa2a5a13@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f5b820d8-68ce-d280-4025-3473fa2a5a13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

T24gMi8yMi8yMyAyMDoxNCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDIvMjIv
MjMgMDY6MjgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBIZWxsbywNCj4+DQo+PiBX
aGVuIHVzaW5nIG11bHRpIHRocmVhZCB0Y2csIGEgd2FybmluZyBpcyBlbWl0dGVkIHRvIHVz
ZXIgaWYgbW9kZWxzIGZvciBndWVzdCBhbmQgaG9zdCBhcmUNCj4+IG5vdCBjb21wYXRpYmxl
IChsaWtlIHFlbXUtc3lzdGVtLXg4Nl82NCBydW5uaW5nIG9uIGFhcmNoNjQgaG9zdCkNCj4+
DQo+PiBhY2NlbC90Y2cvdGNnLWFsbC5jOg0KPj4gMTYxwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICghY2hlY2tfdGNnX21lbW9yeV9vcmRlcnNfY29tcGF0aWJsZSgpKSB7DQo+PiAx
NjLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3YXJuX3JlcG9ydCgiR3Vlc3Qg
ZXhwZWN0cyBhIHN0cm9uZ2VyIG1lbW9yeSBvcmRlcmluZyAiDQo+PiAxNjPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidGhhbiB0
aGUgaG9zdCBwcm92aWRlcyIpOw0KPj4gMTY0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZXJyb3JfcHJpbnRmKCJUaGlzIG1heSBjYXVzZSBzdHJhbmdlL2hhcmQgdG8gZGVi
dWcgZXJyb3JzXG4iKTsNCj4+IDE2NcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pg0K
Pj4gSG93ZXZlciwgaW4gdGNnL3RjZy1vcC5jLCBhbGwgbG9hZC9zdG9yZXMgYXJlIGVtaXR0
aW5nIG1lbW9yeSBiYXJyaWVycyB1c2luZw0KPj4gdGNnX2dlbl9yZXFfbW8sIHdoaWNoIGxl
dHMgdGhpbmsgaXQncyBhbHJlYWR5IGltcGxlbWVudGVkIGZvciBhbnkgaG9zdC9ndWVzdCBj
b21iaW5hdGlvbg0KPj4gKHdhcyBhZGRlZCBpbiBiMzJkYzMpLg0KPj4NCj4+IEluIHlvdXIg
b3BpbmlvbiwgYXJlIHRoZXJlIHN0aWxsIGNvcm5lciBjYXNlcyB0aGF0IGFyZSBub3QgY292
ZXJlZCBjb3JyZWN0bHk/IElmIG5vLA0KPj4gc2hvdWxkIHdlIGRyb3AgdGhpcyBzY2FyeSB3
YXJuaW5nPw0KPiANCj4gU2VlDQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11
LWRldmVsLzIwMjEwMzE2MjIwNzM1LjIwNDgxMzctMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnLw0KPiBodHRwczovL2dpdGxhYi5jb20vcnRoNzY4MC9xZW11Ly0vY29tbWl0cy90
Y2ctbWItc21hbGwvDQo+IA0KPiBJdCBuZXZlciBnb3QgbWVyZ2VkIGJlY2F1c2UgaXQgZGlk
bid0IGFjdHVhbGx5IHNvbHZlIHRoZSBzMzkweCBvbiBhYXJjaDY0IHByb2JsZW0uICBJDQo+
IGFzc3VtZSB0aGVyZSdzIHNvbWV0aGluZyBJJ3ZlIG1pc3NlZC4NCj4gDQoNClRoYW5rcyBm
b3IgdGhlIHBvaW50ZXJzLg0KDQo+IA0KPiByfg0K

