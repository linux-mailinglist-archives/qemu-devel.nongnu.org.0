Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8915AA9B6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:15:35 +0200 (CEST)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU1pu-0000Zl-AO
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1iQ-00020o-Kk
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1iP-0001e6-3u
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662106068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uXy/m1rLYO3kZZZbdDTKSwaoFoghoLxNCul+SA+X4Y=;
 b=Pn6rd23Di2SpbUa81DHFv21im3NdFNRARTpsFDsWK04OJKb3gPdZBx7KluA+m+MhyVJPBe
 rPL9QCmiHbMGb5+/c+atz66eJaPZh8WnfrJHl/koqpNzoTk+nsjfzPkFz/Q3GUh7hLoTVF
 DVUZoBshd6vHp5G9BQ50QbrB3amaV9s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-srwYCGNtNkiZxhklTiERXA-1; Fri, 02 Sep 2022 04:07:47 -0400
X-MC-Unique: srwYCGNtNkiZxhklTiERXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 103C6380390B;
 Fri,  2 Sep 2022 08:07:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1068492C3B;
 Fri,  2 Sep 2022 08:07:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CC3121E6900; Fri,  2 Sep 2022 10:07:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 3/8] migration: Introduce dirty-limit capability
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <fb2a51fcf30d927a2512b397cd2dc6f34c3936c4.1662052189.git.huangy81@chinatelecom.cn>
Date: Fri, 02 Sep 2022 10:07:45 +0200
In-Reply-To: <fb2a51fcf30d927a2512b397cd2dc6f34c3936c4.1662052189.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 2 Sep 2022 01:22:31 +0800")
Message-ID: <87y1v2w65q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TRACKER_ID=0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Introduce migration dirty-limit capability, which can
> be turned on before live migration and limit dirty
> page rate durty live migration.
>
> Introduce migrate_dirty_limit function to help check
> if dirty-limit capability enabled during live migration.
>
> Meanwhile, refactor vcpu_dirty_rate_stat_collect
> so that period can be configured instead of hardcoded.
>
> dirty-limit capability is kind of like auto-converge
> but using dirty limit instead of traditional cpu-throttle
> to throttle guest down. To enable this feature, turn on
> the dirty-limit capability before live migration using
> migratioin-set-capabilities, and set the parameters

migrate-set-capabilities

> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably

"x-vcpu-dirty-limit"

> to speed up convergence.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

Hmm.  You make dirty-limiting as a whole a stable interface (evidence:
capability "dirty-limit" is stable), but keep its two parameters
unstable.  Rationale behind that?


