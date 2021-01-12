Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3AA2F2EE4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:20:05 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIea-00032f-N3
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=639db6d60=acatan@amazon.com>)
 id 1kzIbS-0001mZ-14
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:16:50 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:21028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=639db6d60=acatan@amazon.com>)
 id 1kzIbP-0001Fx-Uf
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1610453808; x=1641989808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tF+5LWSipsSfv/MpNTU2XOkSQBgOPGBmsF5sLnQRVvI=;
 b=lZ6x0kZeyffbEZcLdyUpOk+X6fjf96W5tGlcRYOeK7EvH/dP0KLm4LPF
 LEL4q4t3k8B/WT/oOonfJGuxTzDsqjmj7JCLQbQ6Py6lpECb0q2mcNPOI
 p61JppAHaZoq9yhRgPE/Qfie1pr3ZIruTgcNK+4vU0FO09SUChP49ZPJl s=;
X-IronPort-AV: E=Sophos;i="5.79,341,1602547200"; d="scan'208";a="77011747"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 12 Jan 2021 12:16:39 +0000
Received: from EX13D08EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1E6F6100F90; Tue, 12 Jan 2021 12:16:29 +0000 (UTC)
Received: from uf6ed9c851f4556.ant.amazon.com (10.43.161.68) by
 EX13D08EUB004.ant.amazon.com (10.43.166.158) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 12 Jan 2021 12:16:15 +0000
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <linux-s390@vger.kernel.org>
Subject: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
Date: Tue, 12 Jan 2021 14:15:58 +0200
Message-ID: <1610453760-13812-1-git-send-email-acatan@amazon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.43.161.68]
X-ClientProxiedBy: EX13D50UWC001.ant.amazon.com (10.43.162.96) To
 EX13D08EUB004.ant.amazon.com (10.43.166.158)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=639db6d60=acatan@amazon.com; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason@zx2c4.com, dgunigun@redhat.com, mst@redhat.com, ghammer@redhat.com,
 vijaysun@ca.ibm.com, 0x7f454c46@gmail.com, mhocko@kernel.org,
 oridgar@gmail.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 corbet@lwn.net, mpe@ellerman.id.au, rafael@kernel.org, ebiggers@kernel.org,
 borntraeger@de.ibm.com, sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de,
 jannh@google.com, raduweis@amazon.com, asmehra@redhat.com,
 Adrian Catangiu <acatan@amazon.com>, graf@amazon.com, rppt@kernel.org,
 luto@kernel.org, gil@azul.com, colmmacc@amazon.com, tytso@mit.edu,
 gregkh@linuxfoundation.org, areber@redhat.com, ebiederm@xmission.com,
 ovzxemul@gmail.com, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Adrian Catangiu <acatan@amazon.com>
From: Adrian Catangiu via <qemu-devel@nongnu.org>

VGhpcyBmZWF0dXJlIGlzIGFpbWVkIGF0IHZpcnR1YWxpemVkIG9yIGNvbnRhaW5lcml6ZWQgZW52
aXJvbm1lbnRzCndoZXJlIFZNIG9yIGNvbnRhaW5lciBzbmFwc2hvdHRpbmcgZHVwbGljYXRlcyBt
ZW1vcnkgc3RhdGUsIHdoaWNoIGlzIGEKY2hhbGxlbmdlIGZvciBhcHBsaWNhdGlvbnMgdGhhdCB3
YW50IHRvIGdlbmVyYXRlIHVuaXF1ZSBkYXRhIHN1Y2ggYXMKcmVxdWVzdCBJRHMsIFVVSURzLCBh
bmQgY3J5cHRvZ3JhcGhpYyBub25jZXMuCgpUaGUgcGF0Y2ggc2V0IGludHJvZHVjZXMgYSBtZWNo
YW5pc20gdGhhdCBwcm92aWRlcyBhIHVzZXJzcGFjZQppbnRlcmZhY2UgZm9yIGFwcGxpY2F0aW9u
cyBhbmQgbGlicmFyaWVzIHRvIGJlIG1hZGUgYXdhcmUgb2YgdW5pcXVlbmVzcwpicmVha2luZyBl
dmVudHMgc3VjaCBhcyBWTSBvciBjb250YWluZXIgc25hcHNob3R0aW5nLCBhbmQgYWxsb3cgdGhl
bSB0bwpyZWFjdCBhbmQgYWRhcHQgdG8gc3VjaCBldmVudHMuCgpTb2x2aW5nIHRoZSB1bmlxdWVu
ZXNzIHByb2JsZW0gc3Ryb25nbHkgZW5vdWdoIGZvciBjcnlwdG9ncmFwaGljCnB1cnBvc2VzIHJl
cXVpcmVzIGEgbWVjaGFuaXNtIHdoaWNoIGNhbiBkZXRlcm1pbmlzdGljYWxseSByZXNlZWQKdXNl
cnNwYWNlIFBSTkdzIHdpdGggbmV3IGVudHJvcHkgYXQgcmVzdG9yZSB0aW1lLiBUaGlzIG1lY2hh
bmlzbSBtdXN0CmFsc28gc3VwcG9ydCB0aGUgaGlnaC10aHJvdWdocHV0IGFuZCBsb3ctbGF0ZW5j
eSB1c2UtY2FzZXMgdGhhdCBsZWQKcHJvZ3JhbW1lcnMgdG8gcGljayBhIHVzZXJzcGFjZSBQUk5H
IGluIHRoZSBmaXJzdCBwbGFjZTsgYmUgdXNhYmxlIGJ5CmJvdGggYXBwbGljYXRpb24gY29kZSBh
bmQgbGlicmFyaWVzOyBhbGxvdyB0cmFuc3BhcmVudCByZXRyb2ZpdHRpbmcKYmVoaW5kIGV4aXN0
aW5nIHBvcHVsYXIgUFJORyBpbnRlcmZhY2VzIHdpdGhvdXQgY2hhbmdpbmcgYXBwbGljYXRpb24K
Y29kZTsgaXQgbXVzdCBiZSBlZmZpY2llbnQsIGVzcGVjaWFsbHkgb24gc25hcHNob3QgcmVzdG9y
ZTsgYW5kIGJlCnNpbXBsZSBlbm91Z2ggZm9yIHdpZGUgYWRvcHRpb24uCgpUaGUgZmlyc3QgcGF0
Y2ggaW4gdGhlIHNldCBpbXBsZW1lbnRzIGEgZGV2aWNlIGRyaXZlciB3aGljaCBleHBvc2VzIGEK
cmVhZC1vbmx5IGRldmljZSAvZGV2L3N5c2dlbmlkIHRvIHVzZXJzcGFjZSwgd2hpY2ggY29udGFp
bnMgYQptb25vdG9uaWNhbGx5IGluY3JlYXNpbmcgdTMyIGdlbmVyYXRpb24gY291bnRlci4gTGli
cmFyaWVzIGFuZAphcHBsaWNhdGlvbnMgYXJlIGV4cGVjdGVkIHRvIG9wZW4oKSB0aGUgZGV2aWNl
LCBhbmQgdGhlbiBjYWxsIHJlYWQoKQp3aGljaCBibG9ja3MgdW50aWwgdGhlIFN5c0dlbklkIGNo
YW5nZXMuIEZvbGxvd2luZyBhbiB1cGRhdGUsIHJlYWQoKQpjYWxscyBubyBsb25nZXIgYmxvY2sg
dW50aWwgdGhlIGFwcGxpY2F0aW9uIGFja25vd2xlZGdlcyB0aGUgbmV3ClN5c0dlbklkIGJ5IHdy
aXRlKClpbmcgaXQgYmFjayB0byB0aGUgZGV2aWNlLiBOb24tYmxvY2tpbmcgcmVhZCgpIGNhbGxz
CnJldHVybiBFQUdBSU4gd2hlbiB0aGVyZSBpcyBubyBuZXcgU3lzR2VuSWQgYXZhaWxhYmxlLiBB
bHRlcm5hdGl2ZWx5LApsaWJyYXJpZXMgY2FuIG1tYXAoKSB0aGUgZGV2aWNlIHRvIGdldCBhIHNp
bmdsZSBzaGFyZWQgcGFnZSB3aGljaApjb250YWlucyB0aGUgbGF0ZXN0IFN5c0dlbklkIGF0IG9m
ZnNldCAwLgoKU3lzR2VuSWQgYWxzbyBzdXBwb3J0cyBhIG5vdGlmaWNhdGlvbiBtZWNoYW5pc20g
ZXhwb3NlZCBhcyB0d28gSU9DVExzCm9uIHRoZSBkZXZpY2UuIFNZU0dFTklEX0dFVF9PVVREQVRF
RF9XQVRDSEVSUyBpbW1lZGlhdGVseSByZXR1cm5zIHRoZQpudW1iZXIgb2YgZmlsZSBkZXNjcmlw
dG9ycyB0byB0aGUgZGV2aWNlIHRoYXQgd2VyZSBvcGVuIGR1cmluZyB0aGUgbGFzdApTeXNHZW5J
ZCBjaGFuZ2UgYnV0IGhhdmUgbm90IHlldCBhY2tub3dsZWRnZWQgdGhlIG5ldyBpZC4KU1lTR0VO
SURfV0FJVF9XQVRDSEVSUyBibG9ja3MgdW50aWwgdGhlcmUgYXJlIG5vIG9wZW4gZmlsZSBoYW5k
bGVzIG9uCnRoZSBkZXZpY2Ugd2hpY2ggaGF2ZW7igJl0IGFja25vd2xlZGdlZCB0aGUgbmV3IGlk
LiBUaGVzZSB0d28gaW50ZXJmYWNlcwphcmUgaW50ZW5kZWQgZm9yIHNlcnZlcmxlc3MgYW5kIGNv
bnRhaW5lciBjb250cm9sIHBsYW5lcywgd2hpY2ggd2FudCB0bwpjb25maXJtIHRoYXQgYWxsIGFw
cGxpY2F0aW9uIGNvZGUgaGFzIGRldGVjdGVkIGFuZCByZWFjdGVkIHRvIHRoZSBuZXcKU3lzR2Vu
SWQgYmVmb3JlIHNlbmRpbmcgYW4gaW52b2tlIHRvIHRoZSBuZXdseS1yZXN0b3JlZCBzYW5kYm94
LgoKVGhlIHNlY29uZCBwYXRjaCBpbiB0aGUgc2V0IGFkZHMgYSBWbUdlbklkIGRyaXZlciB3aGlj
aCBtYWtlcyB1c2Ugb2YKdGhlIEFDUEkgdm1nZW5pZCBkZXZpY2UgdG8gZHJpdmUgU3lzR2VuSWQg
YW5kIHRvIHJlc2VlZCBrZXJuZWwgZW50cm9weQpvbiBWTSBzbmFwc2hvdHMuCgotLS0KCnYzIC0+
IHY0OgoKICAtIHNwbGl0IGZ1bmN0aW9uYWxpdHkgaW4gdHdvIHNlcGFyYXRlIGtlcm5lbCBtb2R1
bGVzOiAKICAgIDEuIGRyaXZlcnMvbWlzYy9zeXNnZW5pZC5jIHdoaWNoIHByb3ZpZGVzIHRoZSBn
ZW5lcmljIHVzZXJzcGFjZQogICAgICAgaW50ZXJmYWNlIGFuZCBtZWNoYW5pc21zCiAgICAyLiBk
cml2ZXJzL3ZpcnQvdm1nZW5pZC5jIGFzIFZNR0VOSUQgYWNwaSBkZXZpY2UgZHJpdmVyIHRoYXQg
c2VlZHMKICAgICAgIGtlcm5lbCBlbnRyb3B5IGFuZCBhY3RzIGFzIGEgZHJpdmluZyBiYWNrZW5k
IGZvciB0aGUgZ2VuZXJpYwogICAgICAgc3lzZ2VuaWQKICAtIHJlbmFtZWQgL2Rldi92bWdlbmlk
IC0+IC9kZXYvc3lzZ2VuaWQKICAtIHJlbmFtZWQgdWFwaSBoZWFkZXIgZmlsZSB2bWdlbmlkLmgg
LT4gc3lzZ2VuaWQuaAogIC0gcmVuYW1lZCBpb2N0bHMgVk1HRU5JRF8qIC0+IFNZU0dFTklEXyoK
ICAtIGFkZGVkIOKAmG1pbl9nZW7igJkgcGFyYW1ldGVyIHRvIFNZU0dFTklEX0ZPUkNFX0dFTl9V
UERBVEUgaW9jdGwKICAtIGZpeGVkIHJhY2VzIGluIGRvY3VtZW50YXRpb24gZXhhbXBsZXMKICAt
IHZhcmlvdXMgc3R5bGUgbml0cwogIC0gcmViYXNlZCBvbiB0b3Agb2YgbGludXMgbGF0ZXN0Cgp2
MiAtPiB2MzoKCiAgLSBzZXBhcmF0ZSB0aGUgY29yZSBkcml2ZXIgbG9naWMgYW5kIGludGVyZmFj
ZSwgZnJvbSB0aGUgQUNQSSBkZXZpY2UuCiAgICBUaGUgQUNQSSB2bWdlbmlkIGRldmljZSBpcyBu
b3cgb25lIHBvc3NpYmxlIGJhY2tlbmQuCiAgLSBmaXggaXNzdWUgd2hlbiB0aW1lb3V0PTAgaW4g
Vk1HRU5JRF9XQUlUX1dBVENIRVJTCiAgLSBhZGQgbG9ja2luZyB0byBhdm9pZCByYWNlcyBiZXR3
ZWVuIGZzIG9wcyBoYW5kbGVycyBhbmQgaHcgaXJxCiAgICBkcml2ZW4gZ2VuZXJhdGlvbiB1cGRh
dGVzCiAgLSBjaGFuZ2UgVk1HRU5JRF9XQUlUX1dBVENIRVJTIGlvY3RsIHNvIGlmIHRoZSBjdXJy
ZW50IGNhbGxlciBpcwogICAgb3V0ZGF0ZWQgb3IgYSBnZW5lcmF0aW9uIGNoYW5nZSBoYXBwZW5z
IHdoaWxlIHdhaXRpbmcgKHRodXMgbWFraW5nCiAgICBjdXJyZW50IGNhbGxlciBvdXRkYXRlZCks
IHRoZSBpb2N0bCByZXR1cm5zIC1FSU5UUiB0byBzaWduYWwgdGhlCiAgICB1c2VyIHRvIGhhbmRs
ZSBldmVudCBhbmQgcmV0cnkuIEZpeGVzIGJsb2NraW5nIG9uIG9uZXNlbGYuCiAgLSBhZGQgVk1H
RU5JRF9GT1JDRV9HRU5fVVBEQVRFIGlvY3RsIGNvbmRpdGlvbmVkIGJ5CiAgICBDQVBfQ0hFQ0tQ
T0lOVF9SRVNUT1JFIGNhcGFiaWxpdHksIHRocm91Z2ggd2hpY2ggc29mdHdhcmUgY2FuIGZvcmNl
CiAgICBnZW5lcmF0aW9uIGJ1bXAuCgp2MSAtPiB2MjoKCiAgLSBleHBvc2UgdG8gdXNlcnNwYWNl
IGEgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHUzMiBWbSBHZW4gQ291bnRlcgogICAgaW5zdGVh
ZCBvZiB0aGUgaHcgVm1HZW4gVVVJRAogIC0gc2luY2UgdGhlIGh3L2h5cGVydmlzb3ItcHJvdmlk
ZWQgMTI4LWJpdCBVVUlEIGlzIG5vdCBwdWJsaWMKICAgIGFueW1vcmUsIGFkZCBpdCB0byB0aGUg
a2VybmVsIFJORyBhcyBkZXZpY2UgcmFuZG9tbmVzcwogIC0gaW5zZXJ0IGRyaXZlciBwYWdlIGNv
bnRhaW5pbmcgVm0gR2VuIENvdW50ZXIgaW4gdGhlIHVzZXIgdm1hIGluCiAgICB0aGUgZHJpdmVy
J3MgbW1hcCBoYW5kbGVyIGluc3RlYWQgb2YgdXNpbmcgYSBmYXVsdCBoYW5kbGVyCiAgLSB0dXJu
IGRyaXZlciBpbnRvIGEgbWlzYyBkZXZpY2UgZHJpdmVyIHRvIGF1dG8tY3JlYXRlIC9kZXYvdm1n
ZW5pZAogIC0gY2hhbmdlIGlvY3RsIGFyZyB0byBhdm9pZCBsZWFraW5nIGtlcm5lbCBzdHJ1Y3Rz
IHRvIHVzZXJzcGFjZQogIC0gdXBkYXRlIGRvY3VtZW50YXRpb24KICAtIHZhcmlvdXMgbml0cwog
IC0gcmViYXNlIG9uIHRvcCBvZiBsaW51cyBsYXRlc3QKCkFkcmlhbiBDYXRhbmdpdSAoMik6CiAg
ZHJpdmVycy9taXNjOiBzeXNnZW5pZDogYWRkIHN5c3RlbSBnZW5lcmF0aW9uIGlkIGRyaXZlcgog
IGRyaXZlcnMvdmlydDogdm1nZW5pZDogYWRkIHZtIGdlbmVyYXRpb24gaWQgZHJpdmVyCgogRG9j
dW1lbnRhdGlvbi9taXNjLWRldmljZXMvc3lzZ2VuaWQucnN0IHwgMjQwICsrKysrKysrKysrKysr
KysrKysrKysrKysKIERvY3VtZW50YXRpb24vdmlydC92bWdlbmlkLnJzdCAgICAgICAgICB8ICAz
NCArKysrCiBkcml2ZXJzL21pc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysK
IGRyaXZlcnMvbWlzYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJz
L21pc2Mvc3lzZ2VuaWQuYyAgICAgICAgICAgICAgICAgfCAyOTggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvdmlydC9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8
ICAxNCArKwogZHJpdmVycy92aXJ0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAxICsK
IGRyaXZlcnMvdmlydC92bWdlbmlkLmMgICAgICAgICAgICAgICAgICB8IDE1MyArKysrKysrKysr
KysrKysrCiBpbmNsdWRlL3VhcGkvbGludXgvc3lzZ2VuaWQuaCAgICAgICAgICAgfCAgMTggKysK
IDkgZmlsZXMgY2hhbmdlZCwgNzc1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL21pc2MtZGV2aWNlcy9zeXNnZW5pZC5yc3QKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3ZpcnQvdm1nZW5pZC5yc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21pc2Mvc3lzZ2VuaWQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC92bWdl
bmlkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvbGludXgvc3lzZ2VuaWQuaAoK
LS0gCjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIChSb21hbmlhKSBTLlIuTC4g
cmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6YXIgU3RyZWV0LCBVQkM1LCBmbG9vciAyLCBJ
YXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21hbmlhLiBSZWdpc3RlcmVkIGluIFJvbWFuaWEu
IFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEvMjAwNS4K


