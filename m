Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0775669D75E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 01:00:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUG3c-0002Th-Hg; Mon, 20 Feb 2023 18:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUG3W-0002SS-KN; Mon, 20 Feb 2023 18:58:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUG3U-0007ZA-AK; Mon, 20 Feb 2023 18:58:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5FBE87470AB;
 Tue, 21 Feb 2023 00:58:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2BDFE746FCF; Tue, 21 Feb 2023 00:58:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 292D47457E7;
 Tue, 21 Feb 2023 00:58:42 +0100 (CET)
Date: Tue, 21 Feb 2023 00:58:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>, 
 qemu-ppc@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Subject: Re: [PATCH v2 07/18] hw/ide/piix: Ensure IDE output IRQs are wired
 at realization
In-Reply-To: <27575298-BEFB-48FD-BD07-DC03DBA3292A@gmail.com>
Message-ID: <5665494c-15d8-8075-7402-c5d58d2c60f5@eik.bme.hu>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
 <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
 <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
 <666316cf-6f1e-8f62-dab7-8b0da698faa7@linaro.org>
 <27575298-BEFB-48FD-BD07-DC03DBA3292A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Mon, 20 Feb 2023, Bernhard Beschow wrote:
> IIUC, QEMU guarantees a deprecation period for at least two major 
> versions. So if we deprecated user-creatable piix-ide in 8.1, we are not 
> allowed to remove it before 10.1. Let's stick to our rules to give our 
> users a chance to adapt gracefully.

I think that's not 2 major releases just 2 releases so in your example 
could be removed in 9.0. qemu/docs/about/deprecated.rst says:

"The feature will remain functional for the release in which it was 
deprecated and one further release. After these two releases, the feature 
is liable to be removed."

Regards,
BALATON Zoltan

