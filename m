Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4660EFA2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 07:48:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onvgY-0006t3-5J; Thu, 27 Oct 2022 01:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onvgR-0006sO-Gl
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onvgP-00036L-Gt
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666849437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MtIkbCwavHN+ceqXcDrkfgF8CrrQJZjyMLLM8HKfgxg=;
 b=IBEL3E61P3XqhGeipzK0RM1PMoeplVzTt/WfCf4PuzyFrV2+qUnF3+zrizfGARUKIBK8um
 a/zUWKgZmTBxDF16KlhF2uxB4EBUsXcUNm2UFKpyUC1rIDOKxKzDTr5BM3Bf6MVlC6LyYp
 TF++yiIkwVeFbbwks97nJbnTJ+tVUFs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571--D-GBrc-OWWjj4BQZiMeeQ-1; Thu, 27 Oct 2022 01:43:52 -0400
X-MC-Unique: -D-GBrc-OWWjj4BQZiMeeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D1A800B23;
 Thu, 27 Oct 2022 05:43:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B24B61415117;
 Thu, 27 Oct 2022 05:43:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B4C121E6921; Thu, 27 Oct 2022 07:43:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Yan Vugenfirer
 <yan@daynix.com>,  Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 02/16] hw/i386/amd_iommu: Omit errp for
 pci_add_capability
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
 <20221026201527.24063-3-akihiko.odaki@daynix.com>
Date: Thu, 27 Oct 2022 07:43:46 +0200
In-Reply-To: <20221026201527.24063-3-akihiko.odaki@daynix.com> (Akihiko
 Odaki's message of "Thu, 27 Oct 2022 05:15:13 +0900")
Message-ID: <87pmedbz3h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Omitting errp for pci_add_capability() causes it to abort if
> capabilities overlap. This behavior is appropriate heare because all of

Typo: here

Same for later patches.

> the capabilities set in this device are defined in the program and
> their overlap should not happen unless there is a programming error.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Otherwise fine.  Thank you!


