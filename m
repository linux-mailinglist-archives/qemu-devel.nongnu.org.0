Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD44263076
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 17:25:42 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG1yf-0002YF-4i
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 11:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kG1xe-00022K-QF; Wed, 09 Sep 2020 11:24:38 -0400
Resent-Date: Wed, 09 Sep 2020 11:24:38 -0400
Resent-Message-Id: <E1kG1xe-00022K-QF@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kG1xc-0005TZ-KY; Wed, 09 Sep 2020 11:24:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1599665061; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jDIwk6CuqgHF8J/YXDGAXRWsjlP+P5qI95a2L/9LTXqDPxNLRwr6DUPOjArPiOhlm2a1sUYTiaS9VjAIIOrAtonLxInWbkFQ68UvGT+mJvMhktSOp9FG+7Ds6lq4K21hOlb1Piuh/PYPU4+bGCSXNKIEsKKx5s1XwtiIKQRn7wQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1599665061;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=/u8T6R+zgbNyl+L4GZWyhrDNF184fyr8gA5H/QKjptQ=; 
 b=nVgVOJMwsHhOt+hd18zffp1mDTtpSe17mDB7YBYUH5OpY/yJNNRvUnfcdeSBrZB5YHdefJftEIM/fs5XIuvJDSdf/NbMa+gqKnDSrzg82tNYIa4IxvzMHY/JlPKsX2d8V+GpCubMRAE2+LQFKKemIpcBMkqIxdvAXWJMEz7OhVY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1599665058784150.91228161529148;
 Wed, 9 Sep 2020 08:24:18 -0700 (PDT)
Subject: Re: [PATCH v7 00/13] monitor: Optionally run handlers in coroutines
Message-ID: <159966505736.15236.17489813454520562010@66eaa9a8a123>
In-Reply-To: <20200909151149.490589-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kwolf@redhat.com
Date: Wed, 9 Sep 2020 08:24:18 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 11:24:32
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, marcandre.lureau@gmail.com, stefanha@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkwOTE1MTE0OS40OTA1
ODktMS1rd29sZkByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0
ZXN0IG9uIEZyZWVCU0QgaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cuCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBzY3JpcHQgd2lsbCBi
ZSBpbnZva2VkIHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQgcG9pbnRpbmcgdG8g
YSBjb21taXQgdGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Agb2YgImJhc2UiCiMg
YnJhbmNoCmlmIHFlbXUtc3lzdGVtLXg4Nl82NCAtLWhlbHAgPi9kZXYvbnVsbCAyPiYxOyB0aGVu
CiAgUUVNVT1xZW11LXN5c3RlbS14ODZfNjQKZWxpZiAvdXNyL2xpYmV4ZWMvcWVtdS1rdm0gLS1o
ZWxwID4vZGV2L251bGwgMj4mMTsgdGhlbgogIFFFTVU9L3Vzci9saWJleGVjL3FlbXUta3ZtCmVs
c2UKICBleGl0IDEKZmkKbWFrZSB2bS1idWlsZC1mcmVlYnNkIEo9MjEgUUVNVT0kUUVNVQpleGl0
IDAKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUg
YXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA5MDkxNTExNDkuNDkwNTg5LTEta3dvbGZA
cmVkaGF0LmNvbS90ZXN0aW5nLkZyZWVCU0QvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVy
YXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxl
YXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

