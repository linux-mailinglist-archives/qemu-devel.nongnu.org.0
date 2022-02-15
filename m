Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6054B6956
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:31:44 +0100 (CET)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJv7X-0005es-59
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:31:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nJuwl-0005c9-DN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:20:35 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nJuwC-0007Jb-QR
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:20:02 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8B93B20780;
 Tue, 15 Feb 2022 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1644920398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5XsoldZcG7fxIgbo+yzHhTn9KY5to7/oAhwKtH+uHZU=;
 b=BzXeDG9AW1Qup0aFoQV60DpinYeQL23FfXOS+aWjwLvFWGi8uaE5IqSqmQLk+K9sqoVaxR
 U1P+7XberziQ32KV7QPhkDUSi8oqHFeY/b23eEvznqpR15xNphLLtScJqEF3lWeABVpZAb
 WKp8G4M2YcXTK0tDKf2ctIjC2SDewAM=
Message-ID: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
Date: Tue, 15 Feb 2022 11:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US-large
To: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Subject: qdev instance_init vs realize split
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm wondering if there are rules or convention about what we put in the 
instance_init() vs realize() for simple devices ? (For complex ones we 
generally have no choice to put everything in realize())

For example we can declare irqs and mmios in instance_init() or 
realize() if they do not depend on some property.

This is not a big deal, but given how works the help message generation 
in the monitor, there are difference if the device is user-creatable.

If we leave irqs and mmios declaration in the instance_init(). They 
appear in the help message.
 > (qemu) device_add ibex-timer,help
 > ibex-timer options:
 >   ibex-timer[0]=<child<memory-region>>
 >   sysbus-irq[0]=<link<irq>>
 >   timebase-freq=<uint32> -  (default: 10000)

If we delay the declaration in realize(), we only have the declared 
qdev-properties (which is maybe more what we expect at this point):

 > (qemu) device_add ibex-timer,help
 > ibex-timer options:
 >   timebase-freq=<uint32> -  (default: 10000)

Any comments ?

Thanks,
Damien

