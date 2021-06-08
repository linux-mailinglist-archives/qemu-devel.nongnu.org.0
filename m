Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E23539F0EE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:28:58 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqX6W-0007W6-Qr
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=786c6b92e=graf@amazon.de>)
 id 1lqX5a-00067W-Ah
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:27:58 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217]:51661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=786c6b92e=graf@amazon.de>)
 id 1lqX5Y-0006vM-Dp
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1623140876; x=1654676876;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PiOnhgNEvmhKQQ8E04TWZ+nTZWAX8WGgm5qVfYhMf2s=;
 b=isT8wVlgenFEr2zUCxr8NvTSpo/uNhqG9nPQA3fatH7sAwivqWs0unzn
 Lfdnz6wIROZLXW5wmuSq6mpsjQQZSv93rO+zl6CB4LyY4+YoNvlRmWobJ
 laoahkOkBPRRy+GXyj7lJdPTaK3PYMf/QgBYuu8BSXwzNHu7xMS/NPHzj w=;
X-IronPort-AV: E=Sophos;i="5.83,257,1616457600"; 
   d="scan'208";a="5461049"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 08 Jun 2021 08:27:39 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id EAB12A1DF3; Tue,  8 Jun 2021 08:27:38 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Tue, 8 Jun 2021 08:27:38 +0000
Received: from [192.168.19.4] (10.43.160.137) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Tue, 8 Jun 2021 08:27:36 +0000
Message-ID: <cacf8101-ff35-9238-f567-c3638b2c15a2@amazon.com>
Date: Tue, 8 Jun 2021 10:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:90.0)
 Gecko/20100101 Thunderbird/90.0
Subject: Re: [PATCH 1/6] hyper-v: Overlay abstraction for synic event and msg
 pages
Content-Language: en-US
To: Siddharth Chandrasekaran <sidcha@amazon.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha.dev@gmail.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
References: <cover.1621885749.git.sidcha@amazon.de>
 <a997ef48d649f553869b614ba7d256a97f59a48e.1621885749.git.sidcha@amazon.de>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <a997ef48d649f553869b614ba7d256a97f59a48e.1621885749.git.sidcha@amazon.de>
X-Originating-IP: [10.43.160.137]
X-ClientProxiedBy: EX13D05UWC002.ant.amazon.com (10.43.162.92) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=786c6b92e=graf@amazon.de; helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

CgpPbiAyNC4wNS4yMSAyMTo1NCwgU2lkZGhhcnRoIENoYW5kcmFzZWthcmFuIHdyb3RlOgo+IENh
cHR1cmUgb3ZlcmxheSBwYWdlIHNlbWFudGljIHZhcmlhYmxlcyBpbnRvICdzdHJ1Y3Qgb3Zlcmxh
eV9wYWdlJyBhbmQKPiBhZGQgbWV0aG9kcyB0aGF0IG9wZXJhdGUgb3ZlciBpdC4gQWRhcHQgZXhp
c3Rpbmcgc3luaWMgZXZlbnQgYW5kIG1lc2FnZQo+IHBhZ2VzIHRvIHVzZSB0aGVzZSBtZXRob2Rz
IHRvIHNldHVwIGFuZCBtYW5hZ2Ugb3ZlcmxheXMuCj4gCj4gU2luY2UgYWxsIG92ZXJsYXkgcGFn
ZXMgdXNlIGJpdCAwIG9mIHRoZSBHUEEgdG8gaW5kaWNhdGUgaWYgdGhlIG92ZXJsYXkKPiBpcyBl
bmFibGVkLCB0aGUgY2hlY2tzIGZvciB0aGlzIGJpdCBpcyBtb3ZlZCBpbnRvIHRoZSB1bmlmaWVk
IG92ZXJsYXlpbmcKPiBtZXRob2QgaHlwZXJ2X292ZXJsYXlfdXBkYXRlKCkgc28gdGhlIGNhbGxl
ciBkb2VzIG5vdCBuZWVkIHRvIGNhcmUgYWJvdXQKPiBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
aWRkaGFydGggQ2hhbmRyYXNla2FyYW4gPHNpZGNoYUBhbWF6b24uZGU+CgpSZXZpZXdlZC1ieTog
QWxleGFuZGVyIEdyYWYgPGdyYWZAYW1hem9uLmNvbT4KCgpBbGV4CgoKCkFtYXpvbiBEZXZlbG9w
bWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNj
aGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdl
dHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpT
aXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


