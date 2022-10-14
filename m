Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F45FED04
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:12:51 +0200 (CEST)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojIcS-0006jI-9H
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojIYG-0000t2-7C
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:08:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojIYD-0005yI-Ue
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:08:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id bk15so6987568wrb.13
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS1IB1XREnR8KmNVOEsfM22GWkyOJKUf+hw6J5zm4ok=;
 b=Z7lFb7b5chra99nGUi3FCKu7WihvArwjmD8LaiEePzrzusJZCipb5hIIY9JtDbk2oP
 FHAFntpmdPrUZXhnBwrjybNN9XIo2082CTAKa6S5boANzyOZB9T3l+NZIJCXI9H5BGi5
 eEXtCiYjj3fr3rvz5UvLhf8be9iNt2Vsym/VLjn4vbuD64sy4RKq+LsK5SnFYm1BKRzG
 cqrgwuy7xw7p/+VBtn7atBh1bn/QE/g9fOo8TjtD7Bk7yFPYIwElJcQz1YHj04Gu2M67
 4GsqC2Vo81+KBF4+5vKx7L1T59wawAeqzAgqkkjUmp6D3DiHr6mzOyCpOxzbyTSEB6bP
 2Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bS1IB1XREnR8KmNVOEsfM22GWkyOJKUf+hw6J5zm4ok=;
 b=u2LnaEFuk1aVB1wifX8YwbQiBzV0euIRTRolWKdf/r6RGDVhV5nRL3KIkQ7mavrEva
 PjxB1vgzJZBEAAYHplcvzChvkGmTtPm0KOQjNoSMBgqrG3jAhN2MCsmd+xLOMnEKsf1r
 mgfL23rwDmsjdgO22Rysml0p7WfTMC8/O+9+xXRJzqX24+CsBEaPxe1tvCzQDgrttqp3
 lyOJrInjKH2l4Na9sldsz6F0+TP4aLY0eBshJRdbBTAa5kMtuf81eTZn06upA2UC9mv3
 w6meZIXthuILvbcgVV+cUjEpEg2thLn+VZZh2b2sCjk1uPhGll7CBhiRUC+lBVSazH7F
 XgWw==
X-Gm-Message-State: ACrzQf1P+3/Ev1oJriL9ek6jmDlR0cz/dDHbnAQlppFV8P4U7N6RSMVO
 I46Qgb4XOF9L+xndjMaFfw9fKA==
X-Google-Smtp-Source: AMsMyM4ECiMitY/groHOwygiWrU8D95V43KJ41O4YyZGTSxSojzV4YD8J58O/ljHfB56xsfZP3G+nA==
X-Received: by 2002:a5d:588e:0:b0:22e:5601:f6d with SMTP id
 n14-20020a5d588e000000b0022e56010f6dmr2988418wrf.207.1665745703985; 
 Fri, 14 Oct 2022 04:08:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003b49bd61b19sm6482923wmm.15.2022.10.14.04.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 04:08:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B366E1FFB7;
 Fri, 14 Oct 2022 12:08:21 +0100 (BST)
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-8-mst@redhat.com>
 <3a002a6a-9135-ad45-3fed-7dd270450d0b@linux.ibm.com>
 <1c400131-59f6-f14f-e7e0-3871cc0d1815@linux.ibm.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: Re: Regression save/restore of vsock: (was [PULL 07/55] hw/virtio:
 move vm_running check to virtio_device_started)
Date: Fri, 14 Oct 2022 12:07:17 +0100
In-reply-to: <1c400131-59f6-f14f-e7e0-3871cc0d1815@linux.ibm.com>
Message-ID: <87czauoe6y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpDaHJpc3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGxpbnV4LmlibS5jb20+IHdyaXRl
czoNCg0KPiBBbSAxNC4xMC4yMiB1bSAwOTozMCBzY2hyaWViIENocmlzdGlhbiBCb3JudHJhZWdl
cjoNCj4+IEFtIDEwLjEwLjIyIHVtIDE5OjI5IHNjaHJpZWIgTWljaGFlbCBTLiBUc2lya2luOg0K
Pj4+IEZyb206IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4+Pg0KPj4+
IEFsbCB0aGUgYm9pbGVycGxhdGUgdmlydGlvIGNvZGUgZG9lcyB0aGUgc2FtZSB0aGluZyAob3Ig
c2hvdWxkIGF0DQo+Pj4gbGVhc3QpIG9mIGNoZWNraW5nIHRvIHNlZSBpZiB0aGUgVk0gaXMgcnVu
bmluZyBiZWZvcmUgYXR0ZW1wdGluZyB0bw0KPj4+IHN0YXJ0IFZpcnRJTy4gUHVzaCB0aGUgbG9n
aWMgdXAgdG8gdGhlIGNvbW1vbiBmdW5jdGlvbiB0byBhdm9pZA0KPj4+IGdldHRpbmcgYSBjb3B5
IGFuZCBwYXN0ZSB3cm9uZy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4+PiBNZXNzYWdlLUlkOiA8MjAyMjA4MDIwOTUwMTAu
MzMzMDc5My0xMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPj4+IFJldmlld2VkLWJ5OiBNaWNo
YWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+PiBUaGlzIHJlc3VsdHMgaW4gYSByZWdy
ZXNzaW9uIGZvciBvdXIgczM5MHggQ0kgd2hlbiBkb2luZw0KPj4gc2F2ZS9yZXN0b3JlIG9mIGd1
ZXN0cyB3aXRoIHZzb2NrOg0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjMcKg
IDB4MDAwMDAzZmY5YTI0ODU4MCByYWlzZSAobGliYy5zby42ICsgMHg0ODU4MCkNCj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIzLCoCAweDAwMDAwM2ZmOWEyMmI1YzAgYWJvcnQg
KGxpYmMuc28uNiArIDB4MmI1YzApDQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICMzwqAgMHgwMDAwMDNmZjlhMjQwOWRhIF9fYXNzZXJ0X2ZhaWxfYmFzZSAobGliYy5zby42ICsg
MHg0MDlkYSkNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIzTCoCAweDAwMDAw
M2ZmOWEyNDBhNGUgX19hc3NlcnRfZmFpbCAobGliYy5zby42ICsgMHg0MGE0ZSkNCj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIzXCoCAweDAwMDAwMmFhMmQ2OWEwNjYgdmhvc3Rf
dnNvY2tfY29tbW9uX3ByZV9zYXZlIChxZW11LXN5c3RlbS1zMzkweCArIDB4MzlhMDY2KQ0KPj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjNsKgIDB4MDAwMDAyYWEyZDU1NTcwZSB2
bXN0YXRlX3NhdmVfc3RhdGVfdiAocWVtdS1zeXN0ZW0tczM5MHggKyAweDI1NTcwZSkNCj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIzfCoCAweDAwMDAwMmFhMmQ1NTYyMTggdm1z
dGF0ZV9zYXZlX3N0YXRlIChxZW11LXN5c3RlbS1zMzkweCArIDB4MjU2MjE4KQ0KPj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjOMKgIDB4MDAwMDAyYWEyZDU3MGJhNA0KPj4gcWVt
dV9zYXZldm1fc3RhdGVfY29tcGxldGVfcHJlY29weV9ub25faXRlcmFibGUgKHFlbXUtc3lzdGVt
LXMzOTB4ICsNCj4+IDB4MjcwYmE0KQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAjOcKgIDB4MDAwMDAyYWEyZDU3MTBiNiBxZW11X3NhdmV2bV9zdGF0ZV9jb21wbGV0ZV9wcmVj
b3B5IChxZW11LXN5c3RlbS1zMzkweCArIDB4MjcxMGI2KQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjMTAgMHgwMDAwMDJhYTJkNTY0ZDBlIG1pZ3JhdGlvbl9jb21wbGV0aW9u
IChxZW11LXN5c3RlbS1zMzkweCArIDB4MjY0ZDBlKQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAjMTEgMHgwMDAwMDJhYTJkOGRiMjVjIHFlbXVfdGhyZWFkX3N0YXJ0IChxZW11
LXN5c3RlbS1zMzkweCArIDB4NWRiMjVjKQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAjMTIgMHgwMDAwMDNmZjlhMjk2MjQ4IHN0YXJ0X3RocmVhZCAobGliYy5zby42ICsgMHg5
NjI0OCkNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIzEzIDB4MDAwMDAzZmY5
YTMxMTgzZSB0aHJlYWRfc3RhcnQgKGxpYmMuc28uNiArIDB4MTExODNlKQ0KPj4gDQo+DQo+DQo+
IFNvbWV0aGluZyBsaWtlDQo+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdnNvY2suYyBi
L2h3L3ZpcnRpby92aG9zdC12c29jay5jDQo+IGluZGV4IDdkYzNjNzM5MzEyMi4uYjRkMDU2YWU2
ZjAxIDEwMDY0NA0KPiAtLS0gYS9ody92aXJ0aW8vdmhvc3QtdnNvY2suYw0KPiArKysgYi9ody92
aXJ0aW8vdmhvc3QtdnNvY2suYw0KPiBAQCAtNzMsNiArNzMsMTAgQEAgc3RhdGljIHZvaWQgdmhv
c3RfdnNvY2tfc2V0X3N0YXR1cyhWaXJ0SU9EZXZpY2UgKnZkZXYsIHVpbnQ4X3Qgc3RhdHVzKQ0K
PiAgICAgIGJvb2wgc2hvdWxkX3N0YXJ0ID0gdmlydGlvX2RldmljZV9zdGFydGVkKHZkZXYsIHN0
YXR1cyk7DQo+ICAgICAgaW50IHJldDsNCj4gICsgICAgaWYgKCF2ZGV2LT52bV9ydW5uaW5nKSB7
DQo+ICsgICAgICAgIHNob3VsZF9zdGFydCA9IGZhbHNlOw0KPiArICAgIH0NCj4gKw0KPiAgICAg
IGlmICh2aG9zdF9kZXZfaXNfc3RhcnRlZCgmdnZjLT52aG9zdF9kZXYpID09IHNob3VsZF9zdGFy
dCkgew0KPiAgICAgICAgICByZXR1cm47DQo+ICAgICAgfQ0KPg0KPiBoZWxwcy4NCj4NCj4gVGhl
IHByb2JsZW0gc2VlbXMgdG8gYmUgdGhhdCB2aXJ0aW9fZGV2aWNlX3N0YXJ0ZWQgZG9lcyBpZ25v
cmUNCj4gdm1fcnVubmluZyB3aGVuIHVzZV9zdGFydCBpcyBzZXQuDQoNCldvdWxkbid0IGl0IG1h
a2UgbW9yZSBzZW5zZSB0byByZS1vcmRlciB0aGUgY2hlY2sgdGhlcmUsIHNvbWV0aGluZyBsaWtl
Og0KDQogIHN0YXRpYyBpbmxpbmUgYm9vbCB2aXJ0aW9fZGV2aWNlX3N0YXJ0ZWQoVmlydElPRGV2
aWNlICp2ZGV2LCB1aW50OF90IHN0YXR1cykNCiAgew0KICAgICAgaWYgKCF2ZGV2LT52bV9ydW5u
aW5nKSB7DQogICAgICAgICAgcmV0dXJuIGZhbHNlOw0KICAgICAgfQ0KDQogICAgICBpZiAodmRl
di0+dXNlX3N0YXJ0ZWQpIHsNCiAgICAgICAgICByZXR1cm4gdmRldi0+c3RhcnRlZDsNCiAgICAg
IH0NCg0KICAgICAgcmV0dXJuIHN0YXR1cyAmIFZJUlRJT19DT05GSUdfU19EUklWRVJfT0s7DQog
IH0NCg0KSXMgdGhlIHByb2JsZW0gdGhhdCB2ZGV2LT5zdGFydGVkIGdldHMgZmlsbGVkIGR1cmlu
ZyB0aGUgbWlncmF0aW9uIGJ1dA0KYmVjYXVzZSB0aGUgVk0gaXNuJ3QgcnVubmluZyB5ZXQgd2Ug
Y2FuIG5ldmVyIGFjdHVhbGx5IHJ1bj8NCg0KLS0gDQpBbGV4IEJlbm7DqWUNCg==

