Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00C659651
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 09:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBAi4-0000zB-S3; Fri, 30 Dec 2022 03:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scalingtree@proton.me>)
 id 1pBAhw-0000xE-75
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 03:25:44 -0500
Received: from mail-4324.protonmail.ch ([185.70.43.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scalingtree@proton.me>)
 id 1pBAhs-0000BA-Po
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 03:25:39 -0500
Date: Fri, 30 Dec 2022 08:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1672388733; x=1672647933;
 bh=fMA2ZNeMwaz5DbuniKVGv7Uhkszk4oAvhvyyLzk1WtM=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Kzh639DQ8WvwSbiGaFM/MUnuhl2vlI/DKHL4BwYrQhu2oxlT2golu4E7CHOwKHgaT
 s09nlKqBzeJQhoL5TQj8OR6ArAr8rdfb/b6cqaSgZizu7srxR5PxXtn37ffhkVyI7b
 eK1eoc33+fsYq+XYRSSaeYO9ns4cuKN+24TW7/2TkEl1bPrh5wMwqIfUZRaolktXM1
 4VpdVbm/Ayhyymzpdqrz4Wq+rLHnjUIYZC/zkihIhvAXA0J/xDwip+uI9nufmmrl7w
 /qKMMUOboIDA57xF4ChY2YckXwDdR1c9CJy7/QgxjKfsnjHhuryc1vzFeD/XPMyAUS
 sGihekYoE+ToQ==
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "firecracker-maintainers@amazon.com" <firecracker-maintainers@amazon.com>,
 "criu@openvz.org" <criu@openvz.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: scalingtree <scalingtree@proton.me>
Subject: checkpoint/restore: Adding more "Getters" to the KVM API
Message-ID: <jYlRLuV_6FcjxHyjMU6duqUMCE7tU6sS5ZZqbEmLWZCxJp3phctt1oA0n9obMkVv7fMQGXCIbwC53erkFxNI33XYvnrOpS8fY7mfUC0mu5c=@proton.me>
Feedback-ID: 64659969:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.24; envelope-from=scalingtree@proton.me;
 helo=mail-4324.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi lists,

(Re-sending as plain text.)

We are in the process of using an external tool (CRIU) to checkpoint/restor=
e a KVM-enabled virtual machine. Initially we target the hypervisor kvmtool=
 but the extension, if done well, should allow to checkpoint any hypervisor=
: like Qemu or firecracker.

CRIU can checkpoint and restore most of the application (or the VMM in our =
case) state except the state of the kernel module KVM. To overcome this lim=
itation, we need more getters in the KVM API to extract the state of the VM=
.

One example of a missing getter is the one for the guest memory. There is a=
 KVM_SET_MEMORY API call. But there is no equivalent getter: KVM_GET_MEMORY=
.=C2=A0

Can we add such getters to the KVM API? Any idea of the difficulty? I think=
 one of the difficulties will be to get the state of the architecture-speci=
fic state of KVM: for now, we are targetting Intel x86_64 architecture (VT-=
X).

Any feedback will be appreciated.

Best Regards,
ScalingTree


