Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EBC6A936A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:10:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1R1-0000Fe-Ba; Fri, 03 Mar 2023 04:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pY1Qy-0000Ey-UH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:10:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pY1Qw-00055a-7a
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677834633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbRso0XnADEwjX/NHog3wk2G4omVi6TXV66aSYkaobo=;
 b=ds8HkshMblIgBRCQTmke5naVs05baphQ2jZA625CfJAROkVCU0Z97843CeN8YZs93dMXz9
 nRuer2gMgu4iD5dtLvEyy/HXds3R0cgBwMWtNtueE6gx5/gDmiKaj6Q3bdhwAHqktcUgyX
 IzV+dfDRrV2ZWCRd0oYxO6Ryj0TooTA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-AGeBZp5wNbq1JE1LQwpUAQ-1; Fri, 03 Mar 2023 04:10:32 -0500
X-MC-Unique: AGeBZp5wNbq1JE1LQwpUAQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so272469wrb.20
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677834630;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbRso0XnADEwjX/NHog3wk2G4omVi6TXV66aSYkaobo=;
 b=4GKHz09lhjHLhRYKEw/z/XNWXgG6qovtnhgf6nV8L6rEFJ9rBQjqzZQbUS1RvFcMF3
 lC3Ch/4w6CLgxjUfDHe4EOdNM8+EEMQBg2GDudREB1AfmY4IvwFMGfR0YoFbuo/mEaE8
 HlSl5K2BRn4BipUXOZwx+iOal7oJrbOgiF0fZGpE/x+JKeHw2yMNL9I3s8HvRaBXUHcl
 Sk5x+5PwQXokHjSCE6A173kh6Vr4hW6m0UUTTBbwFu36OMXRRIiEJM2yex4SZ+EJIUKu
 oSV4/GzU5M3Z8MH5LdD4ivtWxSelc+GmibOvufyHs70O6+CR1EkQhxQnYXY3hfTfSuXi
 7f4Q==
X-Gm-Message-State: AO0yUKWAmuD2HvZmGd1dVfoD3FNBuSSJD7TtUwXdG+RmHTXKbRgF+Oiw
 395GLXxrvJztZSg5OEjAbyvXNQfkCOfbOfE6oOOHlT7uCumg/jaSMPWX34C5yaDgWCFdCD7EHiW
 ctPyr734oIhGhvpM=
X-Received: by 2002:a5d:6385:0:b0:2c7:e424:eeb8 with SMTP id
 p5-20020a5d6385000000b002c7e424eeb8mr731189wru.57.1677834630195; 
 Fri, 03 Mar 2023 01:10:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/59Ys0FWBLlG92I7Bym8TO7BTE0GXRbWCE6sr6c593JhQNo7RsTpbHadjGfPcFcr7qcB06Xg==
X-Received: by 2002:a5d:6385:0:b0:2c7:e424:eeb8 with SMTP id
 p5-20020a5d6385000000b002c7e424eeb8mr731174wru.57.1677834629935; 
 Fri, 03 Mar 2023 01:10:29 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b002c706c754fesm1589014wrq.32.2023.03.03.01.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 01:10:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
In-Reply-To: <ZADeLNaltLAZ9BU8@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 2 Mar 2023 17:34:36 +0000")
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Mar 2023 10:10:28 +0100
Message-ID: <87edq6i4jf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

RGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IE9uIFRo
dSwgTWFyIDAyLCAyMDIzIGF0IDA1OjIyOjExUE0gKzAwMDAsIFBldGVyIE1heWRlbGwgd3JvdGU6
DQo+PiBtaWdyYXRpb24tdGVzdCBoYXMgYmVlbiBmbGFreSBmb3IgYSBsb25nIHRpbWUsIGJvdGgg
aW4gQ0kgYW5kDQo+PiBvdGhlcndpc2U6DQo+PiANCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11
LXByb2plY3QvcWVtdS8tL2pvYnMvMzgwNjA5MDIxNg0KPj4gKGEgRnJlZUJTRCBqb2IpDQo+PiAg
IDMyLzY0OCBFUlJPUjouLi90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVscGVycy5jOjIwNTp3YWl0
X2Zvcl9taWdyYXRpb25fc3RhdHVzOiBhc3NlcnRpb24gZmFpbGVkOiAoZ190ZXN0X3RpbWVyX2Vs
YXBzZWQoKSA8IE1JR1JBVElPTl9TVEFUVVNfV0FJVF9USU1FT1VUKSBFUlJPUg0KPj4gDQo+PiBv
biBhIGxvY2FsIG1hY29zIHg4NiBib3g6DQo+PiDilrYgIDM0LzYyMSBFUlJPUjouLi8uLi90ZXN0
cy9xdGVzdC9taWdyYXRpb24taGVscGVycy5jOjE1MTptaWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6
IGFzc2VydGlvbiBmYWlsZWQ6ICghZ19zdHJfZXF1YWwoc3RhdHVzLCAiZmFpbGVkIikpIEVSUk9S
DQo+PiAgMzQvNjIxIHFlbXU6cXRlc3QrcXRlc3QtaTM4NiAvIHF0ZXN0LWkzODYvbWlncmF0aW9u
LXRlc3QgICAgICAgICAgICAgICAgICAgICAgICAgRVJST1IgICAgICAgICAgMTY4LjEycyAgIGtp
bGxlZCBieSBzaWduYWwgNiBTSUdBQlJUDQo+PiDigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJUg4pyAICDigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJUNCj4+IHN0ZGVycjoNCj4+IHFlbXUtc3lzdGVt
LWkzODY6IEZhaWxlZCB0byBwZWVrIGF0IGNoYW5uZWwNCj4+IHF1ZXJ5LW1pZ3JhdGUgc2hvd3Mg
ZmFpbGVkIG1pZ3JhdGlvbjogVW5hYmxlIHRvIHdyaXRlIHRvIHNvY2tldDogQnJva2VuIHBpcGUN
Cj4+ICoqDQo+PiBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVscGVycy5jOjE1
MTptaWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6IGFzc2VydGlvbiBmYWlsZWQ6ICghZ19zdHJfZXF1
YWwoc3RhdHVzLCAiZmFpbGVkIikpDQo+PiANCj4+ICh0ZXN0IHByb2dyYW0gZXhpdGVkIHdpdGgg
c3RhdHVzIGNvZGUgLTYpDQo+PiDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJUNCj4+IA0KPj4g4pa2ICAzNy82MjEgRVJST1I6Li4v
Li4vdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBlcnMuYzoxNTE6bWlncmF0ZV9xdWVyeV9ub3Rf
ZmFpbGVkOiBhc3NlcnRpb24gZmFpbGVkOiAoIWdfc3RyX2VxdWFsKHN0YXR1cywgImZhaWxlZCIp
KSBFUlJPUg0KPj4gIDM3LzYyMSBxZW11OnF0ZXN0K3F0ZXN0LXg4Nl82NCAvIHF0ZXN0LXg4Nl82
NC9taWdyYXRpb24tdGVzdCAgICAgICAgICAgICAgICAgICAgIEVSUk9SICAgICAgICAgIDE3NC4z
N3MgICBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0KPj4g4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVIOKcgCAg4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQo+PiBzdGRlcnI6DQo+PiBxdWVy
eS1taWdyYXRlIHNob3dzIGZhaWxlZCBtaWdyYXRpb246IFVuYWJsZSB0byB3cml0ZSB0byBzb2Nr
ZXQ6IEJyb2tlbiBwaXBlDQo+PiAqKg0KPj4gRVJST1I6Li4vLi4vdGVzdHMvcXRlc3QvbWlncmF0
aW9uLWhlbHBlcnMuYzoxNTE6bWlncmF0ZV9xdWVyeV9ub3RfZmFpbGVkOiBhc3NlcnRpb24gZmFp
bGVkOiAoIWdfc3RyX2VxdWFsKHN0YXR1cywgImZhaWxlZCIpKQ0KPj4gDQo+PiAodGVzdCBwcm9n
cmFtIGV4aXRlZCB3aXRoIHN0YXR1cyBjb2RlIC02KQ0KPj4gDQo+PiBJbiB0aGUgY2FzZXMgd2hl
cmUgSSd2ZSBsb29rZWQgYXQgdGhlIHVuZGVybHlpbmcgbG9nLCB0aGlzIHNlZW1zIHRvDQo+PiBi
ZSBpbiB0aGUgbWlncmF0aW9uL211bHRpZmQvdGNwL3BsYWluL2NhbmNlbCBzdWJ0ZXN0LiAgRGlz
YWJsZSB0aGF0DQo+PiBzcGVjaWZpYyBzdWJ0ZXN0IGJ5IGRlZmF1bHQgdW50aWwgc29tZWJvZHkg
Y2FuIHRyYWNrIGRvd24gdGhlDQo+PiB1bmRlcmx5aW5nIGNhdXNlLiBFbnRodXNpYXN0cyBjYW4g
b3B0IGJhY2sgaW4gYnkgc2V0dGluZw0KPj4gUUVNVV9URVNUX0ZMQUtZX1RFU1RTPTEgaW4gdGhl
aXIgZW52aXJvbm1lbnQuDQo+DQo+IE5vIG9iamVjdGlvbiB0byBkaXNhYmxpbmcgdGhlIHRlc3Qu
IEdpdmVuIHRoZSBtYW55IG11bHRpZmQgZml4ZXMgd2UNCj4gaGF2ZSBzZWVuLCBJIGZlYXIgdGhh
dCB1bmxpa2VseSBtYW55IG9mIHRoZSBmbGFrZXkgdGVzdHMsIHRoaXMgaXMNCj4gbm90IG1lcmVs
eSBhIHRlc3QgcHJvYmxlbSwgYnV0IHJhdGhlciBoYXMgYSBkZWNlbnQgY2hhbmNlIG9mIGJlaW5n
DQo+IGEgcmVhbCBidWcgaW4gbWlncmF0aW9uIGNvZGUuDQoNCldoYXQgaXMgcmVhbGx5IHdlaXJk
IHdpdGggdGhpcyBmYWlsdXJlIGlzIHRoYXQ6DQotIGl0IG9ubHkgaGFwcGVucyBvbiBub24teDg2
DQotIG9uIGNvZGUgdGhhdCBpcyBub3QgYXJjaCBkZXBlbmRlbnQNCi0gb24gY2FuY2VsLCB3aGF0
IHdlIHJlYWxseSBkbyB0aGVyZSBpcyBjbG9zZSBmZCdzIGZvciB0aGUgbXVsdGlmZA0KICBjaGFu
bmVsIHRocmVhZHMgdG8gZ2V0IG91dCBvZiB0aGUgcmVjdiwgaS5lLiBhZ2Fpbiwgbm90aGluZyB0
aGF0DQogIHNob3VsZCBiZSBhcmNoIGRlcGVuZGVudC4NCg0KQXMgc2FpZCBpbiB0aGUgb3RoZXIg
ZW1haWwsIEkgZXhwZWN0IHRvIGdldCBiYWNrIGFjY2VzcyB0byBBUk0gc2VydmVycw0KbmV4dCB3
ZWVrLg0KDQpMYXRlciwgSnVhbi4NCg==


