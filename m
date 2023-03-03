Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E16A9361
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1P4-00076I-8U; Fri, 03 Mar 2023 04:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pY1P1-00074L-Nl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pY1P0-0002ag-1n
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677834512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3N1OBi/+ZAjl0M2ytXL6Vw3KRnhNu+YB51+HBh3604g=;
 b=eY0n/4grdEuQqBbuYCCxThZqKjvYAs7ZP39+Kv7KX0dsEwUC1sepHt+Xqktph37Re7/pRF
 nfoZn0UtVlf+gFujpG9fr2eg/KZbzFuRhbCJyTWLa7IotVtQUZPlEecBFkC0x3N31/71NG
 Gpr6UmEWH1rv6AU2ozM29bdYJhIQiLQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-bfX5fJdjP4qpeao_fsJIiw-1; Fri, 03 Mar 2023 04:08:31 -0500
X-MC-Unique: bfX5fJdjP4qpeao_fsJIiw-1
Received: by mail-wr1-f72.google.com with SMTP id
 y11-20020a056000168b00b002ce179d1b90so268949wrd.23
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677834509;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3N1OBi/+ZAjl0M2ytXL6Vw3KRnhNu+YB51+HBh3604g=;
 b=0IlX7+rcV00LPnCS2Y7jpGTuYQLds1hwIFQW758KXwS6WW17Gtw60EXnsaAVFZFOj+
 e0tTk625SaKUNewO9ZlyYvmdtnpbi0nSAYoeoI0r/jRAS2s1W24x3tX0YsJEaGmgHnAz
 KJ9zXFIUp0fbtod9Y+9yqn/knPbjBDCJBaPd8ZGlqEOufiGdxTyS0CAKrxKBrJyWOdOd
 h7iVBYlihfFz6s+70iC7nergz/Kkeztq02HAB9j5MgdeyiqG9mRAAzzxEiztdmUh7p2w
 9pRTTXbiLxAksllAgBW4YAnWyARuaYQsmi8asZZ4W5ddHtgSVE/ixCd9gS7nbdOwL003
 dm+Q==
X-Gm-Message-State: AO0yUKVvmsQrlSrBTeH48+X4FxlTgWEeQXBCbrVo07Pn+ks6lwtJ8BSE
 r2LEv1hNwehDLUh2yPlePvANJFPTsbEXwl9Lr4E6bmFJ0QYfOZfexLdYOmVmDfg/pWQWxTmysFK
 gV7GCUbEc1nyiSbI=
X-Received: by 2002:adf:fc0a:0:b0:2c7:6cd3:638a with SMTP id
 i10-20020adffc0a000000b002c76cd3638amr823087wrr.65.1677834509767; 
 Fri, 03 Mar 2023 01:08:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/2xWrzfEnVNdJSBKfB/zcqpBfUx5KNQbKjib6W85RXvyfa83Uww0Llfv2bkEfyeP6NawLYmw==
X-Received: by 2002:adf:fc0a:0:b0:2c7:6cd3:638a with SMTP id
 i10-20020adffc0a000000b002c76cd3638amr823067wrr.65.1677834509334; 
 Fri, 03 Mar 2023 01:08:29 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a5d4445000000b002c70a0e2cd0sm1541202wrr.101.2023.03.03.01.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 01:08:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
In-Reply-To: <20230302172211.4146376-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 2 Mar 2023 17:22:11 +0000")
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Mar 2023 10:08:27 +0100
Message-ID: <87ilfii4ms.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

UGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiB3cm90ZToNCj4gbWlncmF0
aW9uLXRlc3QgaGFzIGJlZW4gZmxha3kgZm9yIGEgbG9uZyB0aW1lLCBib3RoIGluIENJIGFuZA0K
PiBvdGhlcndpc2U6DQo+DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8t
L2pvYnMvMzgwNjA5MDIxNg0KPiAoYSBGcmVlQlNEIGpvYikNCj4gICAzMi82NDggRVJST1I6Li4v
dGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBlcnMuYzoyMDU6d2FpdF9mb3JfbWlncmF0aW9uX3N0
YXR1czogYXNzZXJ0aW9uIGZhaWxlZDogKGdfdGVzdF90aW1lcl9lbGFwc2VkKCkgPCBNSUdSQVRJ
T05fU1RBVFVTX1dBSVRfVElNRU9VVCkgRVJST1INCj4NCj4gb24gYSBsb2NhbCBtYWNvcyB4ODYg
Ym94Og0KPiDilrYgIDM0LzYyMSBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVs
cGVycy5jOjE1MTptaWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6IGFzc2VydGlvbiBmYWlsZWQ6ICgh
Z19zdHJfZXF1YWwoc3RhdHVzLCAiZmFpbGVkIikpIEVSUk9SDQo+ICAzNC82MjEgcWVtdTpxdGVz
dCtxdGVzdC1pMzg2IC8gcXRlc3QtaTM4Ni9taWdyYXRpb24tdGVzdCAgICAgICAgICAgICAgICAg
ICAgICAgICBFUlJPUiAgICAgICAgICAxNjguMTJzICAga2lsbGVkIGJ5IHNpZ25hbCA2IFNJR0FC
UlQNCj4g4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCVIOKcgCAg4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCVDQo+IHN0ZGVycjoNCj4gcWVtdS1zeXN0ZW0taTM4NjogRmFpbGVkIHRvIHBlZWsgYXQg
Y2hhbm5lbA0KPiBxdWVyeS1taWdyYXRlIHNob3dzIGZhaWxlZCBtaWdyYXRpb246IFVuYWJsZSB0
byB3cml0ZSB0byBzb2NrZXQ6IEJyb2tlbiBwaXBlDQo+ICoqDQo+IEVSUk9SOi4uLy4uL3Rlc3Rz
L3F0ZXN0L21pZ3JhdGlvbi1oZWxwZXJzLmM6MTUxOm1pZ3JhdGVfcXVlcnlfbm90X2ZhaWxlZDog
YXNzZXJ0aW9uIGZhaWxlZDogKCFnX3N0cl9lcXVhbChzdGF0dXMsICJmYWlsZWQiKSkNCj4NCj4g
KHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCj4g4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQo+DQo+
IOKWtiAgMzcvNjIxIEVSUk9SOi4uLy4uL3Rlc3RzL3F0ZXN0L21pZ3JhdGlvbi1oZWxwZXJzLmM6
MTUxOm1pZ3JhdGVfcXVlcnlfbm90X2ZhaWxlZDogYXNzZXJ0aW9uIGZhaWxlZDogKCFnX3N0cl9l
cXVhbChzdGF0dXMsICJmYWlsZWQiKSkgRVJST1INCj4gIDM3LzYyMSBxZW11OnF0ZXN0K3F0ZXN0
LXg4Nl82NCAvIHF0ZXN0LXg4Nl82NC9taWdyYXRpb24tdGVzdCAgICAgICAgICAgICAgICAgICAg
IEVSUk9SICAgICAgICAgIDE3NC4zN3MgICBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0KPiDi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUg4pyA
ICDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUN
Cj4gc3RkZXJyOg0KPiBxdWVyeS1taWdyYXRlIHNob3dzIGZhaWxlZCBtaWdyYXRpb246IFVuYWJs
ZSB0byB3cml0ZSB0byBzb2NrZXQ6IEJyb2tlbiBwaXBlDQo+ICoqDQo+IEVSUk9SOi4uLy4uL3Rl
c3RzL3F0ZXN0L21pZ3JhdGlvbi1oZWxwZXJzLmM6MTUxOm1pZ3JhdGVfcXVlcnlfbm90X2ZhaWxl
ZDogYXNzZXJ0aW9uIGZhaWxlZDogKCFnX3N0cl9lcXVhbChzdGF0dXMsICJmYWlsZWQiKSkNCj4N
Cj4gKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCj4NCj4gSW4gdGhl
IGNhc2VzIHdoZXJlIEkndmUgbG9va2VkIGF0IHRoZSB1bmRlcmx5aW5nIGxvZywgdGhpcyBzZWVt
cyB0bw0KPiBiZSBpbiB0aGUgbWlncmF0aW9uL211bHRpZmQvdGNwL3BsYWluL2NhbmNlbCBzdWJ0
ZXN0LiAgRGlzYWJsZSB0aGF0DQo+IHNwZWNpZmljIHN1YnRlc3QgYnkgZGVmYXVsdCB1bnRpbCBz
b21lYm9keSBjYW4gdHJhY2sgZG93biB0aGUNCj4gdW5kZXJseWluZyBjYXVzZS4gRW50aHVzaWFz
dHMgY2FuIG9wdCBiYWNrIGluIGJ5IHNldHRpbmcNCj4gUUVNVV9URVNUX0ZMQUtZX1RFU1RTPTEg
aW4gdGhlaXIgZW52aXJvbm1lbnQuDQo+DQo+IFdlIG1pZ2h0IG5lZWQgdG8gZGlzYWJsZSBtb3Jl
IHBhcnRzIG9mIHRoaXMgdGVzdCBpZiB0aGlzIGlzbid0DQo+IHN1ZmZpY2llbnQgdG8gZml4IHRo
ZSBmbGFraW5lc3MuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxh
QHJlZGhhdC5jb20+DQoNCkRvIHlvdSB3YW50IGl0IHRvIGdvIHRocm91Z2ggdGhlIG1pZ3JhdGlv
biB0cmVlLCBvciBnZXQgaXQgZGlyZWN0bHksIGFzDQp5b3Ugd2FudC4NCg0KSSBsb3N0IG15IGFj
Y2VzcyB0byB0aGUgQVJNIHNlcnZlciBmb3IgdGhpcyB3ZWVrIGFuZCB3YXMgbm90IGFibGUgdG8N
CmludmVzdGlnYXRlIHRoaXMgaXNzdWUgOi0oDQo=


