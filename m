Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB5320030
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:16:37 +0100 (CET)
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDD8f-00063k-0P
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhildenb@redhat.com>)
 id 1lDD6z-0005Eq-F7
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dhildenb@redhat.com>)
 id 1lDD6x-0001T8-JM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613769290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAkOs6PegC7KtxCJn2KfQ8yJj556d7n7hDJmWvN2sNE=;
 b=LCjB5ANasUftmpzcdmMcRjv+yzzd3waJb+GCWyCTqfvwUgA2F3Hq1vF0XSMzaGo5FoCE85
 y0zW3MKZaRPJqdVQS/zHnb7SmUERmXVU0y03O+E2KraXlC9hcgD43sPxhgod3zyALp8ehT
 mRQEK9kUQAs/G+7pmfgX1U/ruoIVtNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-dkmyjSq8M7GYR1vFY4O-fA-1; Fri, 19 Feb 2021 16:14:48 -0500
X-MC-Unique: dkmyjSq8M7GYR1vFY4O-fA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3FED108EDE1;
 Fri, 19 Feb 2021 21:14:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D961970A;
 Fri, 19 Feb 2021 21:14:46 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 586744EE0B;
 Fri, 19 Feb 2021 21:14:46 +0000 (UTC)
From: David Hildenbrand <dhildenb@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Date: Fri, 19 Feb 2021 16:14:46 -0500 (EST)
Message-Id: <B2724848-DDA8-442B-A252-E84C56752D7E@redhat.com>
References: <20210219211054.GL6669@xz-x1>
In-Reply-To: <20210219211054.GL6669@xz-x1>
To: Peter Xu <peterx@redhat.com>
Thread-Topic: UFFD write-tracking migration/snapshots
Thread-Index: /z+743EN9sJQyE3k+JFAC3WPQiwWqw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhildenb@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dhildenb@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Den Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IEFtIDE5LjAyLjIwMjEgdW0gMjI6MTAgc2NocmllYiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhh
dC5jb20+Og0KPiANCj4g77u/T24gRnJpLCBGZWIgMTksIDIwMjEgYXQgMDM6NTA6NTJQTSAtMDUw
MCwgUGV0ZXIgWHUgd3JvdGU6DQo+PiBBbmRyZXksDQo+PiANCj4+PiBPbiBGcmksIEZlYiAxOSwg
MjAyMSBhdCAwOTo1NzozN0FNICswMzAwLCBBbmRyZXkgR3J1emRldiB3cm90ZToNCj4+PiBGb3Ig
dGhlIGRpc2NhcmRzIHRoYXQgaGFwcGVuIGJlZm9yZSBzbmFwc2hvdCBpcyBzdGFydGVkLCBJIG5l
ZWQgdG8gZGlnIGludG8gTGludXggYW5kIFFFTVUgdmlydGlvLWJhbG9vbg0KPj4+IGNvZGUgbW9y
ZSB0byBnZXQgY2xlYXIgd2l0aCBpdC4NCj4+IA0KPj4gWWVzIGl0J3MgdmVyeSB0cmlja3kgb24g
aG93IHRoZSBlcnJvciBjb3VsZCB0cmlnZ2VyLg0KPj4gDQo+PiBMZXQncyB0aGluayBvZiBiZWxv
dyBzZXF1ZW5jZToNCj4+IA0KPj4gIC0gU3RhcnQgYSBndWVzdCB3aXRoIGluaXRfb25fZnJlZT0x
IHNldCBhbmQgYWxzbyBhIHZpcnRpby1iYWxsb29uIGRldmljZQ0KPj4gDQo+PiAgLSBHdWVzdCBm
cmVlcyBhIHBhZ2UgUCBhbmQgemVyb2VkIGl0IChzaW5jZSBpbml0X29uX2ZyZWU9MSkuIE5vdyBQ
IGNvbnRhaW5zDQo+PiAgICBhbGwgemVyb3MuDQo+PiANCj4+ICAtIFZpcnRpby1iYWxsb29uIHJl
cG9ydHMgdGhpcyBwYWdlIHRvIGhvc3QsIE1BRFZfRE9OVE5FRUQgc2VudCwgdGhlbiB0aGlzDQo+
PiAgICBwYWdlIGlzIGRyb3BwZWQgb24gdGhlIGhvc3QuDQo+PiANCj4+ICAtIFN0YXJ0IGxpdmUg
c25hcHNob3QsIHdyLXByb3RlY3QgYWxsIHBhZ2VzIChidXQgbm90IGluY2x1ZGluZyBwYWdlIFAg
YmVjYXVzZQ0KPj4gICAgaXQncyBjdXJyZW50bHkgbWlzc2luZykuICBMZXQncyBjYWxsIGl0ICRT
TkFQU0hPVDEuDQo+PiANCj4+ICAtIEd1ZXN0IGRvZXMgYWxsb2NfcGFnZShfX0dGUF9aRVJPKSwg
YWNjaWRlbnRhbGx5IGZldGNoaW5nIHRoaXMgcGFnZSBQIGFuZA0KPj4gICAgcmV0dXJuZWQNCj4+
IA0KPj4gIC0gU28gZmFyLCBwYWdlIFAgaXMgc3RpbGwgYWxsIHplcm8gKHdoaWNoIGlzIGdvb2Qh
KSwgdGhlbiBndWVzdCB1c2VzIHBhZ2UgUA0KPj4gICAgYW5kIHdyaXRlcyBkYXRhIHRvIGl0IChz
YXksIG5vdyBQIGhhcyBkYXRhIFAxIHJhdGhlciB0aGFuIGFsbCB6ZXJvcykuDQo+PiANCj4+ICAt
IExpdmUgc25hcHNob3Qgc2F2ZXMgcGFnZSBQLCB3aGljaCBjb250ZW50IFAxIHJhdGhlciB0aGFu
IGFsbCB6ZXJvcy4NCj4+IA0KPj4gIC0gTGl2ZSBzbmFwc2hvdCBjb21wbGV0ZWQuICBTYXZlZCBh
cyAkU05BUFNIT1QxLg0KPj4gDQo+PiBUaGVuIHdoZW4gbG9hZCBzbmFwc2hvdCAkU05BUFNIT1Qx
LCB3ZSdsbCBoYXZlIFAgY29udGFpbnMgZGF0YSBQMS4gIEFmdGVyDQo+PiBzbmFwc2hvdCBsb2Fk
ZWQsIHdoZW4gZ3Vlc3QgYWxsb2NhdGUgYWdhaW4gd2l0aCBhbGxvY19wYWdlKF9fR0ZQX1pFUk8p
IG9uIHRoaXMNCj4+IHBhZ2UgUCwgc2luY2UgZ3Vlc3Qga2VybmVsICJ0aG91Z2h0IiB0aGlzIHBh
Z2UgaXMgYWxsLXplcm8gYWxyZWFkeSBzbyBtZW16ZXJvKCkNCj4+IGlzIHNraXBwZWQgZXZlbiBp
ZiBfX0dGUF9aRVJPIGlzIHByb3ZpZGVkLiAgVGhlbiB0aGlzIHBhZ2UgUCAod2l0aCBjb250ZW50
IFAxKQ0KPj4gZ290IHJldHVybmVkIGZvciB0aGUgYWxsb2NfcGFnZShfX0dGUF9aRVJPKSBldmVu
IGlmIF9fR0ZQX1pFUk8gc2V0LiAgVGhhdCBjb3VsZA0KPj4gYnJlYWsgdGhlIGNhbGxlciBvZiBh
bGxvY19wYWdlKCkuDQo+PiANCj4+PiBBbnlob3cgSSdtIHF1aXRlIHN1cmUgdGhhdCBhZGRpbmcg
Z2xvYmFsIE1JU1NJTkcgaGFuZGxlciBmb3Igc25hcHNob3R0aW5nDQo+Pj4gaXMgdG9vIGhlYXZ5
IGFuZCBub3QgcmVhbGx5IG5lZWRlZC4NCj4+IA0KPj4gVUZGRElPX1pFUk9DT1BZIGluc3RhbGxz
IGEgemVybyBwZm4gYW5kIHRoYXQgc2hvdWxkIGJlIGFsbCBvZiBpdC4gIFRoZXJlJ2xsDQo+PiBk
ZWZpbml0ZWx5IGJlIG92ZXJoZWFkLCBidXQgaXQgbWF5IG5vdCBiZSB0aGF0IGh1Z2UgYXMgaW1h
Z2luZWQuICBMaXZlIHNuYXBzaG90DQo+PiBpcyBncmVhdCBpbiB0aGF0IHdlIGhhdmUgcG9pbnQt
aW4tdGltZSBpbWFnZSBvZiBndWVzdCB3aXRob3V0IHN0b3BwaW5nIHRoZQ0KPj4gZ3Vlc3QsIHNv
IHRha2luZyBzbGlnaHRseSBsb25nZXIgdGltZSB3b24ndCBiZSBhIGh1Z2UgbG9zcyB0byB1cyB0
b28uDQo+PiANCj4+IEFjdHVhbGx5IHdlIGNhbiBhbHNvIHRoaW5rIG9mIG90aGVyIHdheXMgdG8g
d29yayBhcm91bmQgaXQuICBPbmUgd2F5IGlzIHdlIGNhbg0KPj4gcHJlLWZhdWx0IGFsbCBndWVz
dCBwYWdlcyBiZWZvcmUgd3ItcHJvdGVjdC4gIE5vdGUgdGhhdCB3ZSBkb24ndCBuZWVkIHRvIHdy
aXRlDQo+PiB0byB0aGUgZ3Vlc3QgcGFnZSBiZWNhdXNlIHJlYWQgd291bGQgc3VmZmljZSwgc2lu
Y2UgdWZmZC13cCB3b3VsZCBhbHNvIHdvcmsNCj4+IHdpdGggemVybyBwZm4uICBJdCdzIGp1c3Qg
dGhhdCB0aGlzIHdvcmthcm91bmQgd29uJ3QgaGVscCBvbiBzYXZpbmcgc25hcHNob3QNCj4+IGRp
c2sgc3BhY2UsIGJ1dCBpdCBzZWVtcyB3b3JraW5nLiAgSXQgd291bGQgYmUgZ3JlYXQgaWYgeW91
IGhhdmUgb3RoZXINCj4+IHdvcmthcm91bmRzLCBtYXliZSBhcyB5b3Ugc2FpZCBVRkZESU9fWkVS
T0NPUFkgaXMgbm90IHRoZSBvbmx5IHJvdXRlLg0KPiANCj4gV2FpdC4uIGl0IGFjdHVhbGx5IHNl
ZW1zIHRvIGFsc28gc29sdmUgdGhlIGRpc2sgdXNhZ2UgaXNzdWUuLiA6KQ0KPiANCj4gV2Ugc2hv
dWxkIGp1c3QgbmVlZCB0byBtYWtlIHN1cmUgdG8gcHJvaGliaXQgYmFsbG9vbiBiZWZvcmUgc3Rh
cmluZyB0bw0KPiBwcmUtZmF1bHQgcmVhZCBvbiBhbGwgZ3Vlc3QgcmFtLiAgU2VlbXMgYXdrd2Fy
ZCwgYnV0IGFsc28gc2VlbXMgd29ya2luZy4uIEhtbS4uDQoNCkEgc2hpdmVyIGp1c3Qgd2VudCBk
b3duIG15IHNwaW5lLiBQbGVhc2UgZG9u4oCYdCBqdXN0IGZvciB0aGUgc2FrZSBvZiBjcmVhdGlu
ZyBhIHNuYXBzaG90Lg0KDQooSnVzdCBpbWFnaW5lIHlvdSBkb27igJh0IGhhdmUgYSBzaGFyZWQg
emVyb3BhZ2UuLi4pDQoNCg0KPiAtLSANCj4gUGV0ZXIgWHUNCj4gDQo=


