Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4776331520B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:51:38 +0100 (CET)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UMb-0002sl-Ax
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6673f5bb6=acatan@amazon.com>)
 id 1l9UHz-0008DU-Ii
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:46:51 -0500
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:12510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6673f5bb6=acatan@amazon.com>)
 id 1l9UHy-00035f-2n
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1612882010; x=1644418010;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=2Kb1dO0tX9Q/3hXhOyQc4Gtm6ISVV1Qd2tBwheSAix0=;
 b=GeibcOyzCyVnqpFx07M964Utmfgh6o6r3V8daWbP9FhicFgwYnCNIDul
 gGcd8O6y0QCU2XB0kTqGWGaG330X/HAWdlkMMGs7UsgFQVQn+kg3dD8h6
 rPOHP6ld9eLVgN3+3WBsezfaiSvUD9dmojZSTcvNnqjgL3DGbLoz61K1Q Y=;
X-IronPort-AV: E=Sophos;i="5.81,165,1610409600"; d="scan'208";a="80855438"
Subject: Re: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
Thread-Topic: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 09 Feb 2021 14:46:38 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1363EA2196; Tue,  9 Feb 2021 14:46:35 +0000 (UTC)
Received: from EX13D20UWC004.ant.amazon.com (10.43.162.41) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Feb 2021 14:46:34 +0000
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13D20UWC004.ant.amazon.com (10.43.162.41) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Feb 2021 14:46:33 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.010;
 Tue, 9 Feb 2021 14:46:32 +0000
From: "Catangiu, Adrian Costin" <acatan@amazon.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "Graf (AWS), Alexander" <graf@amazon.de>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "0x7f454c46@gmail.com"
 <0x7f454c46@gmail.com>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>, "jannh@google.com" <jannh@google.com>,
 "w@1wt.eu" <w@1wt.eu>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "luto@kernel.org" <luto@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>, "Woodhouse, David"
 <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>, "Singh, Balbir"
 <sblbir@amazon.com>, "Weiss, Radu" <raduweis@amazon.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "mst@redhat.com" <mst@redhat.com>, "mhocko@kernel.org"
 <mhocko@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "pavel@ucw.cz"
 <pavel@ucw.cz>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "areber@redhat.com" <areber@redhat.com>, "ovzxemul@gmail.com"
 <ovzxemul@gmail.com>, "avagin@gmail.com" <avagin@gmail.com>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>, "gil@azul.com"
 <gil@azul.com>, "asmehra@redhat.com" <asmehra@redhat.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>, "vijaysun@ca.ibm.com"
 <vijaysun@ca.ibm.com>, "oridgar@gmail.com" <oridgar@gmail.com>,
 "ghammer@redhat.com" <ghammer@redhat.com>
Thread-Index: AQHW+L9CWTm14fGsAkOMfnzzQsViX6pExriAgAtOBYA=
Date: Tue, 9 Feb 2021 14:46:32 +0000
Message-ID: <CA221922-DFEE-4771-9590-FADDB74F7399@amazon.com>
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-2-git-send-email-acatan@amazon.com>
 <YBlAueoh12esXR2A@kroah.com>
In-Reply-To: <YBlAueoh12esXR2A@kroah.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.130]
Content-Type: text/plain; charset="utf-8"
Content-ID: <078DDECD943E3742BC3EFEB9511AA280@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=6673f5bb6=acatan@amazon.com; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -151
X-Spam_score: -15.2
X-Spam_bar: ---------------
X-Spam_report: (-15.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDIvMDIvMjAyMSwgMTQ6MDksICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+IHdyb3RlOg0KDQogICAgT24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDc6MjQ6NTNQTSArMDIw
MCwgQWRyaWFuIENhdGFuZ2l1IHdyb3RlOg0KICAgID4gK3N0YXRpYyBsb25nIHN5c2dlbmlkX2lv
Y3RsKHN0cnVjdCBmaWxlICpmaWxlLA0KICAgID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJn
KQ0KDQogICAgVmVyeSBvZGQgaW5kZW50YXRpb24gc3R5bGUsIGNoZWNrcGF0Y2gucGwgZGlkbid0
IGNhdGNoIHRoaXM/DQoNCkNoZWNrcGF0Y2gucGwgaXMgaGFwcHkgd2l0aCB0aGlzLCB5ZXMuDQpX
aWxsIGNoYW5nZSBpdCB0byBhIHNpbmdsZSB0YWIgbm9uZXRoZWxlc3Mgc2luY2UgaXQgZG9lcyBs
b29rIHdlaXJkIDopDQoNCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgKFJvbWFuaWEpIFMu
Ui5MLiByZWdpc3RlcmVkIG9mZmljZTogMjdBIFNmLiBMYXphciBTdHJlZXQsIFVCQzUsIGZsb29y
IDIsIElhc2ksIElhc2kgQ291bnR5LCA3MDAwNDUsIFJvbWFuaWEuIFJlZ2lzdGVyZWQgaW4gUm9t
YW5pYS4gUmVnaXN0cmF0aW9uIG51bWJlciBKMjIvMjYyMS8yMDA1Lgo=


