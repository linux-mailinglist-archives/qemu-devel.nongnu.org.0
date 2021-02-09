Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CA131520D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:52:05 +0100 (CET)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UN2-00041V-4z
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6673f5bb6=acatan@amazon.com>)
 id 1l9UGX-0006Zt-Gw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:45:21 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:2078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6673f5bb6=acatan@amazon.com>)
 id 1l9UGV-0002Os-IJ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1612881920; x=1644417920;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=NxMwBdmyc4sNOrz14IYPg0zdZ8oD1VtXNjDeDxomoG8=;
 b=FVy7Iiq09G2D97UZFdwdYBeE++SOg2Pq08Yh7vUHIVKZxsBX8mbYxc38
 Nfw+D/PrVXKkEmg8qxYU9XUcGfoAcBS61Vzriu9Vh0xyTMciVTBoVI0sS
 AZIF0tkVY8Al+zyJurX9LJq9nm/eMPCiJH7MWRe5MiQFAZJF46MzpFwEJ o=;
X-IronPort-AV: E=Sophos;i="5.81,165,1610409600"; d="scan'208";a="85049893"
Subject: Re: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
Thread-Topic: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Feb 2021 14:45:04 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4F2E12E4314; Tue,  9 Feb 2021 14:45:01 +0000 (UTC)
Received: from EX13D20UWA002.ant.amazon.com (10.43.160.176) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Feb 2021 14:45:00 +0000
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13D20UWA002.ant.amazon.com (10.43.160.176) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Feb 2021 14:44:59 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.010;
 Tue, 9 Feb 2021 14:44:58 +0000
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
Thread-Index: AQHW+L9CWTm14fGsAkOMfnzzQsViX6pExcWAgAtOiQA=
Date: Tue, 9 Feb 2021 14:44:58 +0000
Message-ID: <6D86B655-C57C-4E58-87D2-507D62E3B820@amazon.com>
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-2-git-send-email-acatan@amazon.com>
 <YBk/7YzxqPJM3Bm8@kroah.com>
In-Reply-To: <YBk/7YzxqPJM3Bm8@kroah.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.130]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4110FB330449B40B4E7F8905E6D7C0E@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=6673f5bb6=acatan@amazon.com; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -124
X-Spam_score: -12.5
X-Spam_bar: ------------
X-Spam_report: (-12.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

T24gMDIvMDIvMjAyMSwgMTQ6MDUsICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+IHdyb3RlOg0KDQogICAgT24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDc6MjQ6NTNQTSArMDIw
MCwgQWRyaWFuIENhdGFuZ2l1IHdyb3RlOg0KICAgID4gK0VYUE9SVF9TWU1CT0woc3lzZ2VuaWRf
YnVtcF9nZW5lcmF0aW9uKTsNCg0KICAgIEVYUE9SVF9TWU1CT0xfR1BMKCk/ICBJIGhhdmUgdG8g
YXNrLi4uDQoNCkdvb2QgY2F0Y2ghIFdpbGwgdXBkYXRlLg0KDQoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIChSb21hbmlhKSBTLlIuTC4gcmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6
YXIgU3RyZWV0LCBVQkM1LCBmbG9vciAyLCBJYXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21h
bmlhLiBSZWdpc3RlcmVkIGluIFJvbWFuaWEuIFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEv
MjAwNS4K


