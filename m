Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603BC31C18C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:33:42 +0100 (CET)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBign-0008J0-Em
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1lBict-0005b3-6o; Mon, 15 Feb 2021 13:29:40 -0500
Received: from mail.mutex.one ([62.77.152.124]:42214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1lBico-0005qg-95; Mon, 15 Feb 2021 13:29:37 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 2E96CBF44177;
 Mon, 15 Feb 2021 20:29:30 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qC6xwkswqYb; Mon, 15 Feb 2021 20:29:29 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 228C3BF44165;
 Mon, 15 Feb 2021 20:29:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1613413769; bh=bOGSw2KfQysx9MPvNPzIC9mHGdtkmTxSgDe7SV/7s2c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KRyqROT0v5AgpmfCBeSkrhRaS8TJVDkTQPBSOWySes02toHkXjoj3yHDos8QQSYFc
 OOyDDwOVzsopbwEb0WLLMBMEZknj7JZKf+mUHIJvNYuoGZQGO2b5REzAQK/cBRYyzM
 Q5dVDQrdb+Vav7Ke4jFCMRHbObrlrBh8YEPAD0BE=
From: Marian Postevca <posteuca@mutex.one>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] acpi: Remove duplicated code handling OEM ID and OEM
 table ID fields
In-Reply-To: <20210215184404.7e342872@redhat.com>
References: <20210213102233.11428-1-posteuca@mutex.one>
 <20210215184404.7e342872@redhat.com>
Date: Mon, 15 Feb 2021 20:26:10 +0200
Message-ID: <877dn9w5kt.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list:ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> hmm, looks like adding instead of removing
>
Do you mean that the commit message does not describe the change
correctly, or that my refactoring is too extreme?

If it is the latter, I think I tried to simplify things, by creating
macros to be used in multiple places where this structure is created.
And passing the structure around instead of two parameters seemed simpler.

> have you considered, putting this field into X86MachineState?
> (that way you will be able to handle both PC and microvm in one place,
> without duplication io init/property setters)
>
I did not, will try this approach.

