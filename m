Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE969C768
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:10:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Bk-0003lz-32; Mon, 20 Feb 2023 04:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pU2Be-0003ix-7K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pU2Bb-0002xF-U6
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676884214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KhG4al6aOqwYpaHH2qcrSArT1zz96iswP/naREqwyw=;
 b=WGGcD5oUGK3SmaWr2Ur/0XDq+lbaFf/lFqi896QBIb3Ufhv88KhVQko1CEGpRtyhHLGMlb
 0coJ2xAHRitKdPt961wjaQyJI7Il/npO9q+f+nbMMZP3ug4eOUiCYsDsEKHKzdOkt6914K
 IKK3hbjBsJ5erBAerILQcn0rW8QAtfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-6_MMxi4CN2GtRJH9XGBM_g-1; Mon, 20 Feb 2023 04:10:10 -0500
X-MC-Unique: 6_MMxi4CN2GtRJH9XGBM_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8978811E6E;
 Mon, 20 Feb 2023 09:10:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5BE140EBF6;
 Mon, 20 Feb 2023 09:10:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C6D318009AE; Mon, 20 Feb 2023 10:10:08 +0100 (CET)
Date: Mon, 20 Feb 2023 10:10:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, mst@redhat.com, qemu-block@nongnu.org,
 hpoussin@reactos.org, richard.henderson@linaro.org,
 eduardo@habkost.net, John Snow <jsnow@redhat.com>,
 pbonzini@redhat.com, Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 06.5/18] hw/ide/piix: Allow using PIIX3-IDE as
 standalone PCI function
Message-ID: <20230220091008.tgg2pqockjsttbsm@sirius.home.kraxel.org>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230220080044.4646-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220080044.4646-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 20, 2023 at 09:00:44AM +0100, Philippe Mathieu-Daudé wrote:
> In order to allow Frankenstein uses such plugging a PIIX3
> IDE function on a ICH9 chipset (which already exposes AHCI
> ports...) as:
> 
>   $ qemu-system-x86_64 -M q35 -device piix3-ide
> 
> add a kludge to automatically wires the IDE IRQs on an ISA
> bus exposed by a PCI-to-ISA bridge (usually function #0).
> Restrict this kludge to the PIIX3.

Well.  On physical hardware you have a config switch in the bios
setup which turns off sata and enables ide instead (i.e. the
chipset implements both and can be configured to expose the one
or the other).

If we want support ide for q35 we should IMHO do something simliar
instead of making piix-ide user-pluggable.  We already have -machine
q35,sata={on,off}.  We could extend that somehow, by adding
ide={on,off}, or by using storage={sata,ide,off} instead.

This has been discussed now and then in the past and the usual
conclusion was that there is little reason to implement that given
that you can just use the 'pc' machine type.  For guests that old
that they can't handle sata storage this is usually the better fit
anyway ...

take care,
  Gerd


