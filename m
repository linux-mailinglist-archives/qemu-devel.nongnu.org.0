Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BE622949
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osiie-0002Zk-Ng; Wed, 09 Nov 2022 05:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osiib-0002Ys-Pp; Wed, 09 Nov 2022 05:54:06 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osiiZ-0007nI-L5; Wed, 09 Nov 2022 05:54:05 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C79B63200ABD;
 Wed,  9 Nov 2022 05:54:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 09 Nov 2022 05:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667991240; x=1668077640; bh=00
 41iSouXpxDRKWE/CsCQMZxOsJDjYxFMKANeMoVsC4=; b=DCnVm0hvad3x9GRFzo
 NeO79ztZcSeufJcoajHdQyklvRoFgeF/pwz8+LNzVTqzOX6XUQa/AlDNc4Q8/Ql2
 9KLm6gZ6rNFV/3klX9AmPIPgWA7dJxBN5ZxL+AThy9GnH03R4vdBk8VbyIQIknZj
 kVPORNhOIUIuqp81JCGGlNzH3FGG6NjAGPT490GroqVzYOcnvlkrNMy70TUugoF3
 6uW6QeSYvhvFh4i4MbILVGKuwsjOfyXx29hAl86vi9u3mfYvCEZaGUl1IxZsaJdT
 1ytM+wFKiIIW0PRcD74V6jFzDJ0M9cMpUryms9eO7mOid4fOOnLRXDkyQ1H2MaBV
 KYJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1667991240; x=1668077640; bh=0041iSouXpxDR
 KWE/CsCQMZxOsJDjYxFMKANeMoVsC4=; b=OrEQT+hDOe3EjKVj7X1Id5uxwJFBD
 cDEMRsvXPGUYHwdkdJIa5wcg0KK/S/Gz3TSaADUpMckZSDi0pkP8gHe/nXhvZY46
 wSYtp/3+Y8pr6MS00lt/FPHt729wsrs245AWT2G/F0K6agTj+wlKGp2T26YcZeAk
 2CF+cpcQWojsSZQs7aTMhxGZuMpGSq+5Y5P8jWGt8HXzrweaQmgyYAzIr/H4kZk4
 xdpdpsqSLr2WZsISv7qr0H2HE2GuKdOI3UTC55Siy68CLftK15VTP1Ks+W+25+i1
 KsJ7+LNx9nkbaYfHFaz+jb+CkZ4wgJLq1jueQWcOOnHqBGlcIkBumLbxw==
X-ME-Sender: <xms:yIZrY2PzjGEoIcV5gWvgiVKNGuWpDOZwU6i6VbJqwqUGeQRUiDT4Bw>
 <xme:yIZrY0-v6KwaJUGvXA7Xku0Hfejm-z5wk5QXJsyhFz9m9jZJUw6bqT4g0ISwYy3M2
 nyXlnn-BQvNPVSpK0s>
X-ME-Received: <xmr:yIZrY9T2x8KELzMd_OZx2JPhMyOdx2lP2PO8Wo-gDFAcfI4m4vUEdJuuaiwC4yQYIEZ9mge2Qdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepudekvdfgueejvdfgvdefffffhfehiedtieejkeelfedvhfegvddvtdefueekgfeu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yIZrY2v8OT8PVCQROwzRop2DI5Y0PQMt-FnmNTIUGnjKeSJOoGt41w>
 <xmx:yIZrY-dfYL1S5HGsG6uTR15JCjfYgV8aRBojAWzyFq1VLdbOTah5Sw>
 <xmx:yIZrY637DHSJLDjE_hADciZ2fUPHM1bs7qvIASgjv13yF4mrgjFEzA>
 <xmx:yIZrY-5Jpr6cC5M9xAQpDPuUNUZX4RNfyWYmY6M2AjyvOukpDyuBMQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 05:53:59 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 0/2] hw/nvme: errp fixes
Date: Wed,  9 Nov 2022 11:53:55 +0100
Message-Id: <20221109105357.30430-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=304; i=k.jensen@samsung.com;
 h=from:subject; bh=FJKvMDpkLo+5lxCoib736lsfTuKy8s4QSCdXVUEt2GE=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNrhsX9RH6BM6Ky/lpRod15RLDEgzutPYuwRPgd
 Sjv8oBc9TYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJja4bFAAoJEE3hrzFtTw3pGF
 oH/1qB6o1299azVQzsh+DzGsHcmzUx5MTlILqeqF6ECN115GCo6zQoZNh+ZGM4vJF1fsl+VaRLjScK
 2yeDGnlsQaQNOEbhFUOb8igAxQnFviKkArudJQdACeccKwmA1vySHPQuaGP5FqJMat5Mj0yaWSh7CM
 3V5zNznzaSOqIh7x6yMr8skurpWWycMwi+jaHPXQNlbNRJrvTZy07fMNauAsOMdcpGizJuwwwJuYcm
 14Sv/BENMhRoM725WGrR/vYlTGQ2jJ1E1g+dt/ypmnpH5u/mrCrU4LRw6t+TKYi7ljMXw00whYwTjN
 hrRYXF2UwYZA2/LSuOpgkKpPDfmpqxVXSc66lh
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Fix a couple of invalid errp usages.

Klaus Jensen (2):
  hw/nvme: fix incorrect use of errp/local_err
  hw/nvme: cleanup error reporting in nvme_init_pci()

 hw/nvme/ctrl.c | 60 ++++++++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

-- 
2.38.1


