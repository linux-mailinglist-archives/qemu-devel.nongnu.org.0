Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705932781A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:13:54 +0100 (CET)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGcka-0001u1-K1
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGcjf-0001T4-1o
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:12:55 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:9053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGcjX-0005gg-Fq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:12:53 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 88E6F41CF2;
 Mon,  1 Mar 2021 08:12:36 +0100 (CET)
Message-ID: <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
Date: Mon, 1 Mar 2021 08:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
In-Reply-To: <20210228154208-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, vit9696 <vit9696@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.02.21 21:43, Michael S. Tsirkin wrote:
> Sure. The way to do that is to tie old behaviour to old machine
> versions. We'll need it in stable too ...

Yeah, using machine types is how its meant to be with solving migration
breakage, sure.
But that means we have to permanently pin the VM, and any backup restored from
that to that machine type *forever*. That'd be new for us as we always could
allow a newer machine type for a fresh start (i.e., non migration or the like)
here, and mean that lots of other improvements guarded by a newer machine type
for those VMs will.

Why not a switch + machine type, solves migration and any special cases of it
but also allows machine updates but also to keep the old behavior?

And yeah, stable is wanted, but extrapolating from the current stable releases
frequency, where normally there's maximal one after 5-6 months from the .0
release, means that this will probably still hit all those distributions I
mentioned or is there something more soon planned?

Also, is there any regression testing infrastructure around to avoid such
changes in the future? This change got undetected for 7 months, which can be
pretty the norm for QEMU releases, so some earlier safety net would be good? Is
there anything which dumps various default machine HW layouts and uses them for
an ABI check of some sorts?


