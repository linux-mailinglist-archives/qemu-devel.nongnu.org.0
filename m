Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AB4DBB5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 22:53:49 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he444-0004uX-Bo
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 16:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46002)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1he3xn-0000df-Un
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 16:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1he3nE-0004nC-OM
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 16:36:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1he3nE-0004lA-Iu
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 16:36:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 41CAC30A56A6;
 Thu, 20 Jun 2019 20:36:18 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B50396090E;
 Thu, 20 Jun 2019 20:36:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 17:36:14 -0300
Message-Id: <20190620203616.22715-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 20 Jun 2019 20:36:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] i386: Introduce X86CPUCacheCPUID struct
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new struct will let us declare the existing legacy CPU
topology info in a static constant, instead of defining it inside
x86_cpu_realizefn().  While doing it, make the CPU cache
declarations all constants.

This will help us represent the model-specific cache info as QOM
properties in the future.  Currently X86CPUDefinition::cache_info
(which is being renamed to X86CPUDefinition::cache_cpuid) is the
only CPU model field that can't be represented as a QOM property
value.

Eduardo Habkost (2):
  i386: make cache structs const-safe
  i386: Introduce X86CPUCacheCPUID struct

 target/i386/cpu.h |  15 +++---
 target/i386/cpu.c | 134 +++++++++++++++++++++++++++-------------------
 2 files changed, 84 insertions(+), 65 deletions(-)

-- 
2.18.0.rc1.1.g3f1ff2140


