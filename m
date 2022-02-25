Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CF14C3CDF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:04:40 +0100 (CET)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRqR-000605-Mo
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:04:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wliang@stu.xidian.edu.cn>)
 id 1nNRkt-0002Hf-UK
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 22:58:55 -0500
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222]:59783)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <wliang@stu.xidian.edu.cn>) id 1nNRkq-000265-O2
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 22:58:54 -0500
Received: by ajax-webmail-sr0414.icoremail.net (Coremail) ; Fri, 25 Feb 2022
 11:58:43 +0800 (GMT+08:00)
X-Originating-IP: [39.128.6.55]
Date: Fri, 25 Feb 2022 11:58:43 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wliang@stu.xidian.edu.cn
To: eric.auger@redhat.com
Subject: Re: Fix a potential Use-after-free in virtio_iommu_handle_command()
 (v6.2.0).
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210401(fdb522e2)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-ac60dc67-ddbe-4478-9127-1d3314495f10-icoremail.net
In-Reply-To: <a300d2f3-e545-7793-2601-fec1cbbd601a@redhat.com>
References: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
 <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
 <a300d2f3-e545-7793-2601-fec1cbbd601a@redhat.com>
Content-Type: multipart/mixed; 
 boundary="----=_Part_10078_1773841531.1645761523882"
MIME-Version: 1.0
Message-ID: <26faef1d.aa6.17f2f07f0b4.Coremail.wliang@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwDXGJbzUxhif6cEAA--.1264W
X-CM-SenderInfo: pzolt0vj6v33wo0lvxldqovvfxof0/1tbiAQEOA1wR-vcG2AAEsT
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUJw
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_10078_1773841531.1645761523882
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgYWxsLAoKSGVyZSBpcyBhIG5ldyBwYXRjaCB3aXRoIFNpZ25lZC1vZmYtYnkgdGFncy4KVGhl
IG9sZCBvbmUgaXMgd3JvbmcgZm9yIGl0IGRpZCd0IGhhdmUgU2lnbmVkLW9mZi1ieSB0YWdzLgpJ
IGFtIGxvb2tpbmcgZm9yd2FyZCB0byB5b3VyIGNvbmZpcm1hdGlvbi4KClRoYW5rcywKV2VudGFv
Cg==
------=_Part_10078_1773841531.1645761523882
Content-Type: text/x-patch; 
	name=0001-Fix-a-potential-Use-after-free-in-virtio_iommu_handl.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Fix-a-potential-Use-after-free-in-virtio_iommu_handl.patch"

RnJvbSA4ZWNlNDJiZGExMDk5YTlhMGRmNTg0Y2FjMjQ3OGVjNWE2ZTgzOTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW50YW9fTGlhbmcgPFdlbnRhb19MaWFuZ19nQDE2My5jb20+
CkRhdGU6IEZyaSwgMjUgRmViIDIwMjIgMTE6NDk6NTQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBG
aXggYSBwb3RlbnRpYWwgVXNlLWFmdGVyLWZyZWUgaW4KIHZpcnRpb19pb21tdV9oYW5kbGVfY29t
bWFuZCgpICh2Ni4yLjApLgoKU2lnbmVkLW9mZi1ieTogV2VudGFvX0xpYW5nIDxXZW50YW9fTGlh
bmdfZ0AxNjMuY29tPgotLS0KIGh3L3ZpcnRpby92aXJ0aW8taW9tbXUuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3ZpcnRpby1p
b21tdS5jIGIvaHcvdmlydGlvL3ZpcnRpby1pb21tdS5jCmluZGV4IGFhOWMxNmExN2IuLmEzOTQ5
MDEzNDcgMTAwNjQ0Ci0tLSBhL2h3L3ZpcnRpby92aXJ0aW8taW9tbXUuYworKysgYi9ody92aXJ0
aW8vdmlydGlvLWlvbW11LmMKQEAgLTY1Nyw2ICs2NTcsNyBAQCBvdXQ6CiAgICAgICAgIHZpcnRp
b19ub3RpZnkodmRldiwgdnEpOwogICAgICAgICBnX2ZyZWUoZWxlbSk7CiAgICAgICAgIGdfZnJl
ZShidWYpOworICAgICAgICBidWYgPSBOVUxMOwogICAgIH0KIH0KIAotLSAKMi4yNS4xCgo=
------=_Part_10078_1773841531.1645761523882--


