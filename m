Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FCE55FC3B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:42:33 +0200 (CEST)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UDQ-0007Cw-5l
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6U8q-0002YE-G5
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:37:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6U8n-0001XI-F4
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656495464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7PEOourXZR8ZPMEVYsFIelzsTqIzR0ky45eGLg7ZJE=;
 b=aEV2Y2u6tcalHyCkYgii2SE/wVbBc5g9Ywh0IkS0uOCeYu6DOf2eQsvLVrELL+G/sNAsgt
 j+U5HkkJJEEL/wCf8YN0B990Dcjfeew0HO5/HAG4PCjIG8NxbQALaQgZr6bfY0lGRGJpC/
 YSbICNaXGMT8Sn2XlXrjEdWc1Kg5Pcw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-yr45Q4aWPZi9_u9-s1n-AQ-1; Wed, 29 Jun 2022 05:37:33 -0400
X-MC-Unique: yr45Q4aWPZi9_u9-s1n-AQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA7353804070;
 Wed, 29 Jun 2022 09:37:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 910EB2026D64;
 Wed, 29 Jun 2022 09:37:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2CF9221E690D; Wed, 29 Jun 2022 11:37:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: kwolf@redhat.com,  stefanha@redhat.com,  armbru@redhat.com,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] libvduse: Fix the incorrect function name
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-2-xieyongji@bytedance.com>
Date: Wed, 29 Jun 2022 11:37:31 +0200
In-Reply-To: <20220627090203.87-2-xieyongji@bytedance.com> (Xie Yongji's
 message of "Mon, 27 Jun 2022 17:02:00 +0800")
Message-ID: <87fsjnq084.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Xie Yongji <xieyongji@bytedance.com> writes:

> In vduse_name_is_valid(), we actually check whether
> the name is invalid or not. So let's change the
> function name to vduse_name_is_invalid() to match
> the behavior.
>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


