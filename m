Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035DC603FA8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 11:34:35 +0200 (CEST)
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5T7-0005He-Ga
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 05:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ol5NW-0002NM-KG
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ol5NI-0002L8-2x
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666171711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ad5CF6EKEuBa+q+rAaTMfkU1alKMAyFz8sSBfPBJU3I=;
 b=Ms0bbEUgObs6CWqx6YQp/PMh135p90Ak1S7CyTCZ2/jsmWw/v1JmNoZhf/AZ7Uw2BXAO/T
 n9hpcPsAwpMAOWJiD0PpAf+0OGhDZexSOuryl3BFHnruJnUbXfQ7Q5Uzci2Y3eRnposzlG
 XhEuBObTASOHzV98AYWwnmZ4ewXXRD4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-i18qHJt6PAyiT2X3xQGv1w-1; Wed, 19 Oct 2022 05:28:30 -0400
X-MC-Unique: i18qHJt6PAyiT2X3xQGv1w-1
Received: by mail-qt1-f200.google.com with SMTP id
 bz12-20020a05622a1e8c00b0039ae6e887ffso12282045qtb.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ad5CF6EKEuBa+q+rAaTMfkU1alKMAyFz8sSBfPBJU3I=;
 b=Tb541rKMk4pvIRCJE6CecWXYRn+y84YBC7ExMqJ6ummWuuLPud7hGh3VKAmmQhY/PP
 5mziYCEzXbAQU0qT6uU3R99KHDBlbmmEVN0QvuFpIvWGrhPIjLxNk6CaYNRJ+Xw+8IP0
 /e81gck90giyTJXHJCcxtpGsOuy8xdVic6KweNGatcbviHU7hBEBFkDoNE71xefxZrrc
 GimA21o+tufs7ZSoCgsnUzFUHe3oN/ac9WAB7aiJIMOLxEFK1tMPXsotKw55hzY9Cu+f
 KFgVSn2x984FMtfJ2EK/Fw1bv1273cA11k6wWiYqZMx/chveFsMSjSRvKbQpgZ5tdHlw
 r/Gg==
X-Gm-Message-State: ACrzQf3CSshCfGh8h/DQx9tkj42R8/kBAa1+DfdZ9D2BGCwoErMIQu6y
 USQAyUWnmy6tefL4idB71jBXAwzzloRAM3ZMVpKtzyMpQsFE7AcH/eVfCdoz+upkYL/S2MoaW8i
 ihdvPSZ8DcZT1rSM=
X-Received: by 2002:a05:620a:430d:b0:6d3:9dc9:d83d with SMTP id
 u13-20020a05620a430d00b006d39dc9d83dmr4785076qko.224.1666171709676; 
 Wed, 19 Oct 2022 02:28:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Lk5tNVNH/u+c280U0ko98AEPSPrPLgr7dQzV+LXwcuwVQZ6MLUVYLBpfeK9foAd8HWGGFyA==
X-Received: by 2002:a05:620a:430d:b0:6d3:9dc9:d83d with SMTP id
 u13-20020a05620a430d00b006d39dc9d83dmr4785063qko.224.1666171709382; 
 Wed, 19 Oct 2022 02:28:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-54.web.vodafone.de.
 [109.43.179.54]) by smtp.gmail.com with ESMTPSA id
 z21-20020ac84555000000b00398df095cf5sm3649253qtn.34.2022.10.19.02.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 02:28:28 -0700 (PDT)
Message-ID: <64cc3efd-f83c-9a7e-352d-899548634077@redhat.com>
Date: Wed, 19 Oct 2022 11:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 09/18] tests/qtest: Use send/recv for socket
 communication
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng
 <bin.meng@windriver.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-10-bmeng.cn@gmail.com> <87o7u9axjr.fsf@linaro.org>
 <CAEUhbmVEXtQNQgC9Cuz05ChiwrK0a0FuWCDfKEkL_E9wpapvbA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmVEXtQNQgC9Cuz05ChiwrK0a0FuWCDfKEkL_E9wpapvbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

T24gMTkvMTAvMjAyMiAwOS4wOSwgQmluIE1lbmcgd3JvdGU6DQo+IE9uIFdlZCwgT2N0IDE5
LCAyMDIyIGF0IDEyOjQ3IEFNIEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4gd3JvdGU6DQo+Pg0KPj4NCj4+IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+IHdy
aXRlczoNCj4+DQo+Pj4gRnJvbTogWHV6aG91IENoZW5nIDx4dXpob3UuY2hlbmdAd2luZHJp
dmVyLmNvbT4NCj4+Pg0KPj4+IFNvY2tldCBjb21tdW5pY2F0aW9uIGluIHRoZSBsaWJxdGVz
dCBhbmQgbGlicW1wIGNvZGVzIHVzZXMgcmVhZCgpDQo+Pj4gYW5kIHdyaXRlKCkgd2hpY2gg
d29yayBvbiBhbnkgZmlsZSBkZXNjcmlwdG9yIG9uICpuaXgsIGFuZCBzb2NrZXRzDQo+Pj4g
aW4gKm5peCBhcmUgYW4gZXhhbXBsZSBvZiBhIGZpbGUgZGVzY3JpcHRvci4NCj4+Pg0KPj4+
IEhvd2V2ZXIgc29ja2V0cyBvbiBXaW5kb3dzIGRvIG5vdCB1c2UgKm5peC1zdHlsZSBmaWxl
IGRlc2NyaXB0b3JzLA0KPj4+IHNvIHJlYWQoKSBhbmQgd3JpdGUoKSBjYW5ub3QgYmUgdXNl
ZCBvbiBzb2NrZXRzIG9uIFdpbmRvd3MuDQo+Pj4gU3dpdGNoIG92ZXIgdG8gdXNlIHNlbmQo
KSBhbmQgcmVjdigpIGluc3RlYWQgd2hpY2ggd29yayBvbiBib3RoDQo+Pj4gV2luZG93cyBh
bmQgKm5peC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFh1emhvdSBDaGVuZyA8eHV6aG91
LmNoZW5nQHdpbmRyaXZlci5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQmluIE1lbmcgPGJp
bi5tZW5nQHdpbmRyaXZlci5jb20+DQo+Pj4gUmV2aWV3ZWQtYnk6IE1hcmMtQW5kcsOpIEx1
cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPg0KPj4+IC0tLQ0KPj4+DQo+Pj4g
KG5vIGNoYW5nZXMgc2luY2UgdjIpDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+IC0g
SW50cm9kdWNlIHFlbXVfc2VuZF9mdWxsKCkgYW5kIHVzZSBpdA0KPj4+DQo+Pj4gICBpbmNs
dWRlL3FlbXUvc29ja2V0cy5oIHwgIDIgKysNCj4+PiAgIHRlc3RzL3F0ZXN0L2xpYnFtcC5j
ICAgfCAgNSArKystLQ0KPj4+ICAgdGVzdHMvcXRlc3QvbGlicXRlc3QuYyB8ICA0ICsrLS0N
Cj4+PiAgIHV0aWwvb3NkZXAuYyAgICAgICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FlbXUv
c29ja2V0cy5oIGIvaW5jbHVkZS9xZW11L3NvY2tldHMuaA0KPj4+IGluZGV4IDAzNjc0NWU1
ODYuLmFkZjJiMjFiZDkgMTAwNjQ0DQo+Pj4gLS0tIGEvaW5jbHVkZS9xZW11L3NvY2tldHMu
aA0KPj4+ICsrKyBiL2luY2x1ZGUvcWVtdS9zb2NrZXRzLmgNCj4+PiBAQCAtMzMsNiArMzMs
OCBAQCBpbnQgcWVtdV9zb2NrZXRwYWlyKGludCBkb21haW4sIGludCB0eXBlLCBpbnQgcHJv
dG9jb2wsIGludCBzdlsyXSk7DQo+Pj4gICAjZW5kaWYNCj4+Pg0KPj4+ICAgaW50IHFlbXVf
YWNjZXB0KGludCBzLCBzdHJ1Y3Qgc29ja2FkZHIgKmFkZHIsIHNvY2tsZW5fdCAqYWRkcmxl
bik7DQo+Pj4gK3NzaXplX3QgcWVtdV9zZW5kX2Z1bGwoaW50IHMsIGNvbnN0IHZvaWQgKmJ1
Ziwgc2l6ZV90IGNvdW50KQ0KPj4+ICsgICAgR19HTlVDX1dBUk5fVU5VU0VEX1JFU1VMVDsN
Cj4+PiAgIGludCBzb2NrZXRfc2V0X2NvcmsoaW50IGZkLCBpbnQgdik7DQo+Pj4gICBpbnQg
c29ja2V0X3NldF9ub2RlbGF5KGludCBmZCk7DQo+Pj4gICB2b2lkIHFlbXVfc29ja2V0X3Nl
dF9ibG9jayhpbnQgZmQpOw0KPj4+IGRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9saWJxbXAu
YyBiL3Rlc3RzL3F0ZXN0L2xpYnFtcC5jDQo+Pj4gaW5kZXggYWRlMjZjMTVmMC4uMmIwODM4
MmU1ZCAxMDA2NDQNCj4+PiAtLS0gYS90ZXN0cy9xdGVzdC9saWJxbXAuYw0KPj4+ICsrKyBi
L3Rlc3RzL3F0ZXN0L2xpYnFtcC5jDQo+Pj4gQEAgLTIzLDYgKzIzLDcgQEANCj4+PiAgICNl
bmRpZg0KPj4+DQo+Pj4gICAjaW5jbHVkZSAicWVtdS9jdXRpbHMuaCINCj4+PiArI2luY2x1
ZGUgInFlbXUvc29ja2V0cy5oIg0KPj4+ICAgI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4+
PiAgICNpbmNsdWRlICJxYXBpL3FtcC9qc29uLXBhcnNlci5oIg0KPj4+ICAgI2luY2x1ZGUg
InFhcGkvcW1wL3Fqc29uLmgiDQo+Pj4gQEAgLTM2LDcgKzM3LDcgQEAgdHlwZWRlZiBzdHJ1
Y3Qgew0KPj4+DQo+Pj4gICBzdGF0aWMgdm9pZCBzb2NrZXRfc2VuZChpbnQgZmQsIGNvbnN0
IGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUpDQo+Pj4gICB7DQo+Pj4gLSAgICBzaXplX3QgcmVz
ID0gcWVtdV93cml0ZV9mdWxsKGZkLCBidWYsIHNpemUpOw0KPj4+ICsgICAgc3NpemVfdCBy
ZXMgPSBxZW11X3NlbmRfZnVsbChmZCwgYnVmLCBzaXplKTsNCj4+Pg0KPj4+ICAgICAgIGFz
c2VydChyZXMgPT0gc2l6ZSk7DQo+Pj4gICB9DQo+Pj4gQEAgLTY5LDcgKzcwLDcgQEAgUURp
Y3QgKnFtcF9mZF9yZWNlaXZlKGludCBmZCkNCj4+PiAgICAgICAgICAgc3NpemVfdCBsZW47
DQo+Pj4gICAgICAgICAgIGNoYXIgYzsNCj4+Pg0KPj4+IC0gICAgICAgIGxlbiA9IHJlYWQo
ZmQsICZjLCAxKTsNCj4+PiArICAgICAgICBsZW4gPSByZWN2KGZkLCAmYywgMSwgMCk7DQo+
Pj4gICAgICAgICAgIGlmIChsZW4gPT0gLTEgJiYgZXJybm8gPT0gRUlOVFIpIHsNCj4+PiAg
ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+ICAgICAgICAgICB9DQo+Pj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMgYi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jDQo+
Pj4gaW5kZXggNGY0YjJkNjQ3Ny4uODIyODI2MjkzOCAxMDA2NDQNCj4+PiAtLS0gYS90ZXN0
cy9xdGVzdC9saWJxdGVzdC5jDQo+Pj4gKysrIGIvdGVzdHMvcXRlc3QvbGlicXRlc3QuYw0K
Pj4+IEBAIC00MzYsNyArNDM2LDcgQEAgdm9pZCBxdGVzdF9xdWl0KFFUZXN0U3RhdGUgKnMp
DQo+Pj4NCj4+PiAgIHN0YXRpYyB2b2lkIHNvY2tldF9zZW5kKGludCBmZCwgY29uc3QgY2hh
ciAqYnVmLCBzaXplX3Qgc2l6ZSkNCj4+PiAgIHsNCj4+PiAtICAgIHNpemVfdCByZXMgPSBx
ZW11X3dyaXRlX2Z1bGwoZmQsIGJ1Ziwgc2l6ZSk7DQo+Pj4gKyAgICBzc2l6ZV90IHJlcyA9
IHFlbXVfc2VuZF9mdWxsKGZkLCBidWYsIHNpemUpOw0KPj4+DQo+Pj4gICAgICAgYXNzZXJ0
KHJlcyA9PSBzaXplKTsNCj4+PiAgIH0NCj4+PiBAQCAtNDY4LDcgKzQ2OCw3IEBAIHN0YXRp
YyBHU3RyaW5nICpxdGVzdF9jbGllbnRfc29ja2V0X3JlY3ZfbGluZShRVGVzdFN0YXRlICpz
KQ0KPj4+ICAgICAgICAgICBzc2l6ZV90IGxlbjsNCj4+PiAgICAgICAgICAgY2hhciBidWZm
ZXJbMTAyNF07DQo+Pj4NCj4+PiAtICAgICAgICBsZW4gPSByZWFkKHMtPmZkLCBidWZmZXIs
IHNpemVvZihidWZmZXIpKTsNCj4+PiArICAgICAgICBsZW4gPSByZWN2KHMtPmZkLCBidWZm
ZXIsIHNpemVvZihidWZmZXIpLCAwKTsNCj4+PiAgICAgICAgICAgaWYgKGxlbiA9PSAtMSAm
JiBlcnJubyA9PSBFSU5UUikgew0KPj4+ICAgICAgICAgICAgICAgY29udGludWU7DQo+Pj4g
ICAgICAgICAgIH0NCj4+PiBkaWZmIC0tZ2l0IGEvdXRpbC9vc2RlcC5jIGIvdXRpbC9vc2Rl
cC5jDQo+Pj4gaW5kZXggNjBmY2JiYWViZS4uMDM0MmU3NTRlMSAxMDA2NDQNCj4+PiAtLS0g
YS91dGlsL29zZGVwLmMNCj4+PiArKysgYi91dGlsL29zZGVwLmMNCj4+PiBAQCAtNTAyLDYg
KzUwMiwzOSBAQCBpbnQgcWVtdV9hY2NlcHQoaW50IHMsIHN0cnVjdCBzb2NrYWRkciAqYWRk
ciwgc29ja2xlbl90ICphZGRybGVuKQ0KPj4+ICAgICAgIHJldHVybiByZXQ7DQo+Pj4gICB9
DQo+Pj4NCj4+PiArLyoNCj4+PiArICogQSB2YXJpYW50IG9mIHNlbmQoMikgd2hpY2ggaGFu
ZGxlcyBwYXJ0aWFsIHNlbmQuDQo+Pj4gKyAqDQo+Pj4gKyAqIFJldHVybiB0aGUgbnVtYmVy
IG9mIGJ5dGVzIHRyYW5zZmVycmVkIG92ZXIgdGhlIHNvY2tldC4NCj4+PiArICogU2V0IGVy
cm5vIGlmIGZld2VyIHRoYW4gYGNvdW50JyBieXRlcyBhcmUgc2VudC4NCj4+PiArICoNCj4+
PiArICogVGhpcyBmdW5jdGlvbiBkb24ndCB3b3JrIHdpdGggbm9uLWJsb2NraW5nIHNvY2tl
dCdzLg0KPj4+ICsgKiBBbnkgb2YgdGhlIHBvc3NpYmlsaXRpZXMgd2l0aCBub24tYmxvY2tp
bmcgc29ja2V0J3MgaXMgYmFkOg0KPj4+ICsgKiAgIC0gcmV0dXJuIGEgc2hvcnQgd3JpdGUg
KHRoZW4gbmFtZSBpcyB3cm9uZykNCj4+PiArICogICAtIGJ1c3kgd2FpdCBhZGRpbmcgKGVy
cm5vID09IEVBR0FJTikgdG8gdGhlIGxvb3ANCj4+PiArICovDQo+Pj4gK3NzaXplX3QgcWVt
dV9zZW5kX2Z1bGwoaW50IHMsIGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGNvdW50KQ0KPj4+
ICt7DQo+Pj4gKyAgICBzc2l6ZV90IHJldCA9IDA7DQo+Pj4gKyAgICBzc2l6ZV90IHRvdGFs
ID0gMDsNCj4+PiArDQo+Pj4gKyAgICB3aGlsZSAoY291bnQpIHsNCj4+PiArICAgICAgICBy
ZXQgPSBzZW5kKHMsIGJ1ZiwgY291bnQsIDApOw0KPj4+ICsgICAgICAgIGlmIChyZXQgPCAw
KSB7DQo+Pj4gKyAgICAgICAgICAgIGlmIChlcnJubyA9PSBFSU5UUikgew0KPj4+ICsgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+Pj4gKyAgICAgICAgICAgIH0NCj4+PiArICAgICAg
ICAgICAgYnJlYWs7DQo+Pj4gKyAgICAgICAgfQ0KPj4+ICsNCj4+PiArICAgICAgICBjb3Vu
dCAtPSByZXQ7DQo+Pj4gKyAgICAgICAgYnVmICs9IHJldDsNCj4+PiArICAgICAgICB0b3Rh
bCArPSByZXQ7DQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICsgICAgcmV0dXJuIHRvdGFsOw0K
Pj4+ICt9DQo+Pj4gKw0KPj4+ICAgdm9pZCBxZW11X3NldF9od192ZXJzaW9uKGNvbnN0IGNo
YXIgKnZlcnNpb24pDQo+Pj4gICB7DQo+Pj4gICAgICAgaHdfdmVyc2lvbiA9IHZlcnNpb247
DQo+Pg0KPj4gSG1tIHNvbWV0aGluZyBnb2VzIHdyb25nIGhlcmU6DQo+Pg0KPj4gRkFJTEVE
OiB0ZXN0cy9xdGVzdC9saWJxb3MvbGlicW9zLmZhLnAvLi5fbGlicXRlc3QuYy5vDQo+PiBj
YyAtbTY0IC1tY3gxNiAtSXRlc3RzL3F0ZXN0L2xpYnFvcy9saWJxb3MuZmEucCAtSXRlc3Rz
L3F0ZXN0L2xpYnFvcyAtSS4uLy4uL3Rlc3RzL3F0ZXN0L2xpYnFvcyAtSS4gLUlxYXBpIC1J
dHJhY2UgLUl1aSAtSXVpL3NoYWRlciAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91c3Iv
bGliL3g4Nl82NC1saW51eC1nbnUvZ2xpYi0yLjAvaW5jbHVkZSAtZmRpYWdub3N0aWNzLWNv
bG9yPWF1dG8gLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9Z251MTEgLU8yIC1n
IC1pc3lzdGVtIC9ob21lL2FsZXgvbHNyYy9xZW11LmdpdC9saW51eC1oZWFkZXJzIC1pc3lz
dGVtIGxpbnV4LWhlYWRlcnMgLWlxdW90ZSAuIC1pcXVvdGUgL2hvbWUvYWxleC9sc3JjL3Fl
bXUuZ2l0IC1pcXVvdGUgL2hvbWUvYWxleC9sc3JjL3FlbXUuZ2l0L2luY2x1ZGUgLWlxdW90
ZSAvaG9tZS9hbGV4L2xzcmMvcWVtdS5naXQvdGNnL2kzODYgLXB0aHJlYWQgLVVfRk9SVElG
WV9TT1VSQ0UgLURfRk9SVElGWV9TT1VSQ0U9MiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1X
cmVkdW5kYW50LWRlY2xzIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90
b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVdvbGQt
c3R5bGUtZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRz
IC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQt
cXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVs
cyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MiAtV25v
LW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUtdmFsdWUgLVduby1w
c2FiaSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLWZQSUUgLU1EIC1NUSB0ZXN0cy9xdGVz
dC9saWJxb3MvbGlicW9zLmZhLnAvLi5fbGlicXRlc3QuYy5vIC1NRiB0ZXN0cy9xdGVzdC9s
aWJxb3MvbGlicW9zLmZhLnAvLi5fbGlicXRlc3QuYy5vLmQgLW8gdGVzdHMvcXRlc3QvbGli
cW9zL2xpYnFvcy5mYS5wLy4uX2xpYnF0ZXN0LmMubyAtYyAuLi8uLi90ZXN0cy9xdGVzdC9s
aWJxdGVzdC5jDQo+PiAuLi8uLi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jOiBJbiBmdW5jdGlv
biDigJhzb2NrZXRfc2VuZOKAmToNCj4+IC4uLy4uL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6
NDMxOjE5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcWVt
dV9zZW5kX2Z1bGzigJk7IGRpZCB5b3UgbWVhbiDigJhxZW11X3dyaXRlX2Z1bGzigJk/IFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4gICAgNDMxIHwgICAg
IHNzaXplX3QgcmVzID0gcWVtdV9zZW5kX2Z1bGwoZmQsIGJ1Ziwgc2l6ZSk7DQo+PiAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0KPj4gICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgcWVtdV93cml0ZV9mdWxsDQo+PiAuLi8uLi90ZXN0cy9xdGVzdC9s
aWJxdGVzdC5jOjQzMToxOTogZXJyb3I6IG5lc3RlZCBleHRlcm4gZGVjbGFyYXRpb24gb2Yg
4oCYcWVtdV9zZW5kX2Z1bGzigJkgWy1XZXJyb3I9bmVzdGVkLWV4dGVybnNdDQo+PiBjYzE6
IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPj4NCj4+DQo+PiBkcm9w
cGluZyB0aGlzIHBhdGNoLg0KPj4NCj4gDQo+IFRoaXMgaXMgd2VpcmQuIEl0IGRvZXMgbm90
IHJlcHJvZHVjZSBvbiBteSBzaWRlLCBuZWl0aGVyIGRpZCB0aGUgUUVNVSBDSS4NCg0KSSB0
aGluayBpdCBuZWVkcyBhbiAjaW5jbHVkZSBzdGF0ZW1lbnQgZnJvbSBhbiBlYXJsaWVyIHBh
dGNoPw0KDQogIFRob21hcw0KDQoNCg==


