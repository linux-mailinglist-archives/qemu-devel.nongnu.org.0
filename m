Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC326FE1F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 15:21:56 +0200 (CEST)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJGKp-0001HV-Pq
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 09:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJGEv-0004hu-67
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:15:49 -0400
Resent-Date: Fri, 18 Sep 2020 09:15:49 -0400
Resent-Message-Id: <E1kJGEv-0004hu-67@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJGEt-0000lF-5u
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:15:48 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600434938; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LtHPzotVMA38iEbzM/oJYxSohE7txFGypLAGztnFywH9xISgpmrYYhnZvVQQil3t/5WFnkX1JwbMzIOJzG+LfMW2gI/7JZsgK6v0RGGLKLm4u+Jtz8LmCovse8pHOeX13ULS7qf8Pu9XLf6a4vRFjO4YIxB03NuVJWFHfqYGN9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600434938;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=o78dEpAidMxUC9egYpaY5gF3tncjxR+4TATJgCq0lnA=; 
 b=N4Vp7rrSiMBjJRQm0+BHHJYXunN8N7kjSgym220Cyc71/n8qTGXYS4ABSTydtLZgnte1JrsS8GBCAhSw+N3O6l6p3chYVQtDJCnlTQnes5zaewa27Afn8yG8EGi6U5Sq+DVccXKKlezxAMvtX5hd297/SOnjROzplsiMZkFXfBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600434938248430.72690166731763;
 Fri, 18 Sep 2020 06:15:38 -0700 (PDT)
Subject: Re: [PATCH] virtio-gpu-3d: fix abnormal display after a warm reboot
Message-ID: <160043493690.8478.5815484391787377156@66eaa9a8a123>
In-Reply-To: <20200918111632.37354-1-zhangguoqing.kernel@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhangguoqing.kernel@bytedance.com
Date: Fri, 18 Sep 2020 06:15:38 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 09:13:24
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
Cc: qemu-devel@nongnu.org, liuqi.16@bytedance.com,
 zhangguoqing.kernel@bytedance.com, kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxODExMTYzMi4zNzM1
NC0xLXpoYW5nZ3VvcWluZy5rZXJuZWxAYnl0ZWRhbmNlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmll
cyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJl
bG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTi9BLiBJbnRlcm5hbCBlcnJvciB3aGlsZSByZWFk
aW5nIGxvZyBmaWxlCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNo
ZXcub3JnL2xvZ3MvMjAyMDA5MTgxMTE2MzIuMzczNTQtMS16aGFuZ2d1b3Fpbmcua2VybmVsQGJ5
dGVkYW5jZS5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

