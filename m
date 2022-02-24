Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E64C2156
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 02:50:46 +0100 (CET)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN3HJ-0004sj-29
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 20:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wliang@stu.xidian.edu.cn>)
 id 1nN3Fo-0004Cx-4e
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 20:49:12 -0500
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222]:38339)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <wliang@stu.xidian.edu.cn>) id 1nN3Fl-00054P-6D
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 20:49:11 -0500
Received: by ajax-webmail-sr0414.icoremail.net (Coremail) ; Thu, 24 Feb 2022
 09:49:00 +0800 (GMT+08:00)
X-Originating-IP: [39.128.6.192]
Date: Thu, 24 Feb 2022 09:49:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wliang@stu.xidian.edu.cn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: Fix a potential Use-after-free in virtio_iommu_handle_command()
 (v6.2.0).
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210401(fdb522e2)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-ac60dc67-ddbe-4478-9127-1d3314495f10-icoremail.net
In-Reply-To: <6381b8e6-c0d6-03aa-7b30-a47c724a6747@gmail.com>
References: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
 <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
 <6381b8e6-c0d6-03aa-7b30-a47c724a6747@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <37bb38c6.324.17f296acf3d.Coremail.wliang@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAnTFwN5BZiCB0EAA--.357W
X-CM-SenderInfo: pzolt0vj6v33wo0lvxldqovvfxof0/1tbiAQMMA1wR-vU9jgAKsy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=209.97.182.222;
 envelope-from=wliang@stu.xidian.edu.cn;
 helo=zg8tmja5ljk3lje4mi4ymjia.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cj4gPiB0aGFua3MgZm9yIHlvdXIgcmVwb3J0IGFuZCBwYXRjaCAtIGJ1dCB0byBtYWtlIHN1cmUg
dGhhdCB0aGUgcmlnaHQgCj4gPiBwZW9wbGUgZ2V0IGF0dGVudGlvbiwgcGxlYXNlIHVzZSB0aGUg
c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBzY3JpcHQgdG8gCj4gPiBnZXQgYSBsaXN0IG9mIHBl
b3BsZSB3aG8gc2hvdWxkIGJlIG9uIENDOiwgb3IgbG9vayBpbnRvIHRoZSBNQUlOVEFJTkVSUyAK
PiA+IGZpbGUgZGlyZWN0bHkgKGZvciB0aGUgbmV4dCB0aW1lIC0gdGhpcyB0aW1lLCBJJ3ZlIEND
OmVkIHRoZW0gbm93IGFscmVhZHkpLgo+IAo+IFlvdSBjYW4gZmluZCB0aGUgY29udHJpYnV0aW9u
IGd1aWRlbGluZXMgaGVyZToKPiBodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21hc3Rlci9kZXZl
bC9zdWJtaXR0aW5nLWEtcGF0Y2guaHRtbAoKCgpUaGFuayB5b3Ugc28gbXVjaCEKWW91IGd1eXMg
YXJlIHNvIGtpZCEgVGhhdCByZW1pbmRzIG1lIGhvdyBiZWF1dGlmdWwgdGhlIHdvcmxkIGlzLgpI
YXZlIGEgZ29vZCBkYXkhCgpUaGFua3MsCldlbnRhbwo=

