Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1A26E9CF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 02:11:25 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJ3zo-00071i-Ki
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 20:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ3yo-0006OH-CL; Thu, 17 Sep 2020 20:10:22 -0400
Resent-Date: Thu, 17 Sep 2020 20:10:22 -0400
Resent-Message-Id: <E1kJ3yo-0006OH-CL@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ3yl-00085O-Jj; Thu, 17 Sep 2020 20:10:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600387813; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Df/JmMnm2qzaDoJyE+CZk2HedBpU56svCFwKKbx0l5Pu6G5DqaBVrChKIm6tOx2Pvqn9QWvJJ/mRU+DURpeUah3sURfh0E/fUmS+Buj9dNGUHfYmn51XpH6D4ZDNUh0LGW0y8Sy+O9v15jCp0nLWXUsvAKQDmfUJ4qntnaSRo1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600387813;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=9CY5yCOPRa9gnumi+sYom/2GvRJo2ojT1k3yoayRiv0=; 
 b=hxp50l+LK/BEzDojjypLmB3KytweMhmOhtuClfSyIXEPrsAGDlOMags2heLdaet1lC7DnSQQCSwnFDAWtszANf1bkY6jiavks0wk9/CIdMf3MNinbu7zm05bzwy5mh8HU1+qmnJT6T6wxkyOtLutC7gX6NE4hz7T+K/9/zFq9qg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600387812749456.5704245919708;
 Thu, 17 Sep 2020 17:10:12 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Fix SVE splice
Message-ID: <160038781140.8478.12061062067317454042@66eaa9a8a123>
In-Reply-To: <20200918000500.2690937-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Thu, 17 Sep 2020 17:10:12 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 20:10:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxODAwMDUwMC4yNjkw
OTM3LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBm
YWlsZWQgYnVpbGQgdGVzdCBvbiBGcmVlQlNEIGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxz
IGJlbG93LgoKCgoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3
Lm9yZy9sb2dzLzIwMjAwOTE4MDAwNTAwLjI2OTA5MzctMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnL3Rlc3RpbmcuRnJlZUJTRC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

