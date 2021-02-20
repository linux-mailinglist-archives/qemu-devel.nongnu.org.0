Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E532045B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 09:01:27 +0100 (CET)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDNCf-0008UZ-Jv
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 03:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhildenb@redhat.com>)
 id 1lDNBC-0007wQ-17
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 02:59:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dhildenb@redhat.com>)
 id 1lDNB8-00067S-W3
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 02:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613807989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3VDvSJFanH2hIBhPae6CyHl02AEv96Q5XdeEvsMuP0=;
 b=DgPPaTDU6F4PvPTSW4/E/tQzPrkZ1uLO5NZdlv1xUtu6z9VVbV788FRESby23io1KguPjV
 05X6jOVI2xbYM0eRzjGKhCEXpYvuxxwVFdLEC6QFkfVJT42lhPm9TG4hanPghHnQGfZvJZ
 3HNFUCwDijIZkLC6fVNxT0dy2A0NJqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-IIJupd3XPKmQ8w8tUw55Tg-1; Sat, 20 Feb 2021 02:59:45 -0500
X-MC-Unique: IIJupd3XPKmQ8w8tUw55Tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F09F107ACC7;
 Sat, 20 Feb 2021 07:59:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3E35C8B3;
 Sat, 20 Feb 2021 07:59:43 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F03484A7C6;
 Sat, 20 Feb 2021 07:59:42 +0000 (UTC)
From: David Hildenbrand <dhildenb@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Date: Sat, 20 Feb 2021 02:59:42 -0500 (EST)
Message-Id: <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
References: <20210219224719.GN6669@xz-x1>
In-Reply-To: <20210219224719.GN6669@xz-x1>
To: Peter Xu <peterx@redhat.com>
Thread-Topic: UFFD write-tracking migration/snapshots
Thread-Index: DZ4b6tfp+ZkdldvPGt6hOpPWGg3c8A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhildenb@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dhildenb@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

DQo+IEFtIDE5LjAyLjIwMjEgdW0gMjM6NDcgc2NocmllYiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhh
dC5jb20+Og0KPiANCj4g77u/T24gRnJpLCBGZWIgMTksIDIwMjEgYXQgMTA6MjA6NDJQTSArMDEw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+Pj4gQSBzaGl2ZXIganVzdCB3ZW50IGRvd24g
bXkgc3BpbmUuIFBsZWFzZSBkb27igJh0IGp1c3QgZm9yIHRoZSBzYWtlIG9mIGNyZWF0aW5nIGEg
c25hcHNob3QuDQo+Pj4gDQo+Pj4gKEp1c3QgaW1hZ2luZSB5b3UgZG9u4oCYdCBoYXZlIGEgc2hh
cmVkIHplcm9wYWdlLi4uKQ0KPj4gDQo+PiAuLi4gYW5kIEkganVzdCByZW1lbWJlcmVkIHdlIHJl
YWQgYWxsIG1lbW9yeSBlaXRoZXIgd2F5LiBHYWguDQo+PiANCj4+IEkgaGF2ZSBzb21lIHBhdGNo
ZXMgdG8gbWFrZSBzbmFwc2hvdHMgZmx5IHdpdGggdmlydGlvLW1lbSBzbyBleGFjdGx5IHRoYXQg
d29u4oCYdCBoYXBwZW4uIEJ1dCB0aGV5IGRlcGVuZCBvbiB2ZmlvIHN1cHBvcnQsIHNvIGl0IG1p
Z2h0IHRha2UgYSB3aGlsZS4NCj4gDQo+IFNvcnJ5IEkgY2FuJ3QgcmVhbGx5IGZvbGxvdy4NCj4g
DQoNCkxpdmUgc25hcHNob3R0aW5nIGVuZHMgdXAgcmVhZGluZyBhbGwgZ3Vlc3QgbWVtb3J5IChk
aXJ0eSBiaXRtYXAgc3RhcnRzIHdpdGggYWxsIDFzKSwgd2hpY2ggaXMgbm90IHdoYXQgd2Ugd2Fu
dCBmb3IgdmlydGlvLW1lbSAtIHdlIGRvbuKAmXQgd2FudCB0byByZWFkIGFuZCBtaWdyYXRlIG1l
bW9yeSB0aGF0IGhhcyBiZWVuIGRpc2NhcmRlZCBhbmQgaGFzIG5vIHN0YWJsZSBjb250ZW50Lg0K
DQpGb3Igb3JkaW5hcnkgbWlncmF0aW9uIHdlIHVzZSB0aGUgZ3Vlc3QgcGFnZSBoaW50IEFQSSB0
byBjbGVhciBiaXRzIGluIHRoZSBkaXJ0eSBiaXRtYXAgYWZ0ZXIgZGlydHkgYml0bWFwIHN5bmMu
IFdlbGwsIGlmIHdlIGRvbuKAmHQgZG8gYml0bWFwIHN5bmNzIHdl4oCYbGwgbmV2ZXIgY2xlYXIg
YW55IGRpcnR5IGJpdHMuIFRoYXTigJhzIHRoZSBwcm9ibGVtLg0KDQo+IEl0J2xsIGJlIGdyZWF0
IGlmIHZpcnRpby1tZW0gd29uJ3QgaGF2ZSBzaW1pbGFyIHByb2JsZW0gd2l0aCBsaXZlIHNuYXBz
aG90DQo+IGZpbmFsbHkuICBJcyB0aGF0IGlkZWEgYXBwbGljYWJsZSB0byBiYWxsb29uIHRvbywg
dGhlbj8NCg0KVGhlIGlkZWEgaXMgdG8gcmV1c2UgdGhlIFJhbURpc2NhcmRNZ3IgYXMgdG8gYmUg
aW50cm9kdWNlZCB3aXRoIHZmaW8gc3VwcG9ydCB0byB0ZWFjaCBtaWdyYXRpb24gY29kZSB3aGlj
aCBwYXJ0cyBvZiBzcGVjaWZpYyBSQU1CbG9jayBuZXZlciB0byBtaWdyYXRlLiBJdCBhdm9pZHMg
dGhlIGhhY2sgd2l0aCByZXVzaW5nIHRoZSBndWVzdCBwYWdlIGhpbnQgQVBJLg0KDQpBcyB2aXJ0
aW8tYmFsbG9vbiBpcyBub3QgYXBwbGljYWJsZSB0byBSYW1EaXNjYXJkTWdyIChhbmQgdmlydGlv
LWJhbGxvb24gaGFzIG5vIG1lbW9yeSBhYm91dCB3aGF0IGhhcyBiZWVuIGluZmxhdGVkKSBpdCB3
b27igJh0IGFmZmVjdCB2aXJ0aW8tYmFsbG9vbi4NCg0KPiANCj4gLS0gDQo+IFBldGVyIFh1DQo+
IA0K


