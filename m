Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6A36A7B2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 16:10:00 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lafSR-00008X-Aq
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 10:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caodongli@tsinghua.edu.cn>)
 id 1lacqO-0003Y4-LB
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 07:22:35 -0400
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27]:40947)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <caodongli@tsinghua.edu.cn>) id 1lacqK-00026y-GH
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 07:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tsinghua.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Mime-Version:Message-ID:Content-Type:Content-Transfer-Encoding;
 bh=1JSFFp+L71AeMd+IMYWCr/jMVWMRvLoezOrlt8eHsuA=; b=MMaFIg1sEA/KK
 HFbYXTFKpz9S24o4P6f4jgk5r7TCpAkUj/rToiQGwU2O4s90ctIuDXwRplyMVLTp
 QSW8Gw+emevtzxlo6xosavW+/1u3P+5zchzM3G5VgZzf2vlnpX6IggQiVNDSmV6M
 GImq2dVakTklRt0imPVs9CwGsrhxTU=
Received: from DESKTOP-9MDAR6M (unknown [36.112.24.10])
 by web4 (Coremail) with SMTP id ywQGZQD3OobgUIVg5_PmAQ--.11286S2;
 Sun, 25 Apr 2021 19:22:09 +0800 (CST)
Date: Sun, 25 Apr 2021 19:22:09 +0800
From: "caodongli@tsinghua.edu.cn" <caodongli@tsinghua.edu.cn>
To: mst <mst@redhat.com>, marcel.apfelbaum <marcel.apfelbaum@gmail.com>, 
 pbonzini <pbonzini@redhat.com>, 
 richard.henderson <richard.henderson@linaro.org>, 
 ehabkost <ehabkost@redhat.com>
Subject: [PATCH] hw/i386: Expand the range of CPU topologies between smp and
 maxcpus
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.273[cn]
Mime-Version: 1.0
Message-ID: <2021042519220937479214@tsinghua.edu.cn>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64
X-CM-TRANSID: ywQGZQD3OobgUIVg5_PmAQ--.11286S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr4fGFW3uw1ktFWkXw4rAFb_yoWxtFXE9r
 17Zws7Wr4kXrW7KasFkrZ7Jrs5Aw40kw1rua98try7XFW8A34YyrnIqa97XFZ7G3ZrZryD
 JFyxJFyfurnxGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb-8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
 80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
 zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
 8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4xvF2IEb7IF0Fy264kE64k0F24l
 FcxC0VAYjxAxZF0Ex2IqxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JwCE64xvF2IEb7IF0F
 y7YxBIdaVFxhVjvjDU0xZFpf9x07jYeHgUUUUU=
X-CM-SenderInfo: xfdrv0pqjoxqxwvl0wxkxdhvlgxou0/
Received-SPF: pass client-ip=165.227.154.27;
 envelope-from=caodongli@tsinghua.edu.cn;
 helo=zg8tmty1ljiyny4xntqumjca.icoremail.net
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 25 Apr 2021 10:03:22 -0400
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "like.xu" <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2hhbmdlIHRoZSBjcml0ZXJpYSBmb3IgdGhlIGluaXRpYWwgQ1BVIHRvcG9sb2d5IGFuZCBtYXhj
cHVzLCB1c2VyIGNhbgpoYXZlIG1vcmUgc2V0dGluZ3MKClNpZ25lZC1vZmYtYnk6IERvbmdsaSBD
YW8gPGNhb2RvbmdsaUBraW5nc29mdC5jb20+Ci0tLQogaHcvaTM4Ni9wYy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
aHcvaTM4Ni9wYy5jIGIvaHcvaTM4Ni9wYy5jCmluZGV4IDhhODRiMjUuLmVmMmU4MTkgMTAwNjQ0
Ci0tLSBhL2h3L2kzODYvcGMuYworKysgYi9ody9pMzg2L3BjLmMKQEAgLTc1MSw3ICs3NTEsNyBA
QCB2b2lkIHBjX3NtcF9wYXJzZShNYWNoaW5lU3RhdGUgKm1zLCBRZW11T3B0cyAqb3B0cykKICAg
ICAgICAgICAgIGV4aXQoMSk7CiAgICAgICAgIH0KCi0gICAgICAgIGlmIChzb2NrZXRzICogZGll
cyAqIGNvcmVzICogdGhyZWFkcyAhPSBtcy0+c21wLm1heF9jcHVzKSB7CisgICAgICAgIGlmIChz
b2NrZXRzICogZGllcyAqIGNvcmVzICogdGhyZWFkcyA+IG1zLT5zbXAubWF4X2NwdXMpIHsKICAg
ICAgICAgICAgIGVycm9yX3JlcG9ydCgiSW52YWxpZCBDUFUgdG9wb2xvZ3kgZGVwcmVjYXRlZDog
IgogICAgICAgICAgICAgICAgICAgICAgICAgICJzb2NrZXRzICgldSkgKiBkaWVzICgldSkgKiBj
b3JlcyAoJXUpICogdGhyZWFkcyAoJXUpICIKICAgICAgICAgICAgICAgICAgICAgICAgICAiIT0g
bWF4Y3B1cyAoJXUpIiwKLS0gCjEuOC4zLjEKCgoKCgpjYW9kb25nbGlAdHNpbmdodWEuZWR1LmNu
CgoK


