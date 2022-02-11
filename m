Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DE4B27A0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:14:46 +0100 (CET)
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWhB-00036L-7t
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIWAl-00076B-Gd
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:41:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIWAh-00040V-AR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644586868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxK0qZkwoopLRxeP/+QtCp71zKezZJaHA8YHXMzyQmQ=;
 b=Tu6j2qCleWrYgNHN3hifyfrt4brUNjahvylx9HrNBPMUGl/QEF//TCTJy+jp5yfK4HjSlz
 GmnP+5dR6L8LcHgm7zdcrdtTE4VfxsER4DC9g24VPgj9vRyXyeVGDZvCuJ4ss5Mv7xZGbj
 x3K5tnVKWwDOXdru9tfMocgHfpifw5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-Kp4AOAsRPFKCFgUupoKOww-1; Fri, 11 Feb 2022 08:41:02 -0500
X-MC-Unique: Kp4AOAsRPFKCFgUupoKOww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2EC510066FF;
 Fri, 11 Feb 2022 13:40:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B69A2B4B7;
 Fri, 11 Feb 2022 13:40:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC1DA21E6A00; Fri, 11 Feb 2022 14:40:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 7/7] softmmu/dirtylimit: Implement dirty page rate
 limit
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <cover.1644509582.git.huangy81@chinatelecom.cn>
 <32a65f0fbb691aa66094fc9162bff4daa6d7771d.1644509582.git.huangy81@chinatelecom.cn>
Date: Fri, 11 Feb 2022 14:40:21 +0100
In-Reply-To: <32a65f0fbb691aa66094fc9162bff4daa6d7771d.1644509582.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 11 Feb 2022 00:17:41 +0800")
Message-ID: <87a6exo722.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Implement dirtyrate calculation periodically basing on
> dirty-ring and throttle virtual CPU until it reachs the quota
> dirty page rate given by user.
>
> Introduce qmp commands "set-vcpu-dirty-limit",
> "cancel-vcpu-dirty-limit", "query-vcpu-dirty-limit"
> to enable, disable, query dirty page limit for virtual CPU.
>
> Meanwhile, introduce corresponding hmp commands
> "set_vcpu_dirty_limit", "cancel_vcpu_dirty_limit",
> "info vcpu_dirty_limit" so the feature can be more usable.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


