Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F668DD38
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQ6H-0003TD-81; Tue, 07 Feb 2023 10:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPQ6E-0003So-Hf
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPQ6C-000616-W6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675784496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=rdWwXJJl7NZ3s/6kcxFJFriBuMysUMsw1HxYvy5+Pyo=;
 b=G9E79EBY/qgavwc8t13S8NnOx8qcKNTHgwdhMR85M2Hw9eqmmlcRHTFWGSfCbod1pxAFd9
 UF6F8IepA4EK1B/qDS/xOOlzZxT8OsJrM8CBT0dr+Pf2UNvWIwUM1OFyW5O01PThYKqSmN
 DuqI9Mg4PDLY5Od6N1MEBSnVZaJrXy4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-fX99W8D9O-ysbkJi0E6SMw-1; Tue, 07 Feb 2023 10:41:15 -0500
X-MC-Unique: fX99W8D9O-ysbkJi0E6SMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 523A3803CBB;
 Tue,  7 Feb 2023 15:39:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0313400EAB9;
 Tue,  7 Feb 2023 15:39:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CCB021E6A1F; Tue,  7 Feb 2023 16:39:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. Berrange <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Mark Burton <mburton@qti.qualcomm.com>, Luc Michel <luc@lmichel.fr>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: Can we unpoison CONFIG_FOO macros?
Date: Tue, 07 Feb 2023 16:39:32 +0100
Message-ID: <87lel9o56z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We have a boatload of CONFIG_FOO macros that may only be used in
target-dependent code.  We use generated config-poison.h to enforce.

This is a bit annoying in the QAPI schema.  Let me demonstrate with an
example: QMP commands query-rocker, query-rocker-ports, and so forth.
These commands are useful only with "rocker" devices.  They are
compile-time optional.  hw/net/Kconfig:

    config ROCKER
        bool
        default y if PCI_DEVICES
        depends on PCI && MSI_NONBROKEN

The rocker device and QMP code is actually target-independent:
hw/net/meson.build puts it into softmmu_ss.

Disabling the "rocker" device type ideally disables the rocker QMP
commands, too.  Should be easy enough: 'if': 'CONFIG_FOO' in the QAPI
schema.

Except that makes the entire code QAPI generates for rocker.json
device-dependent: it now contains #if defined(CONFIG_ROCKER), and
CONFIG_ROCKER is poisoned.  The rocker code implementing monitor
commands also becomes device-dependent, because it includes generated
headers.  We compile all that per target for no sane reason at all.
That's why we don't actually disable the commands.

Not disabling them creates another problem: we have the commands always,
but their implementation depends on CONFIG_ROCKER.  So we provide stubs
that always fail for use when CONFIG_ROCKER is off.  Drawbacks: we
generate, compile and link useless code, and QAPI/QMP introspection is
less useful than it could be.

This isn't terrible.  It still annoys me.  I wonder whether Philippe's
work on having a single qemu-system binary could improve things here.

Comments?


