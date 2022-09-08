Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A065B1D9F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:50:00 +0200 (CEST)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWGyl-00065y-Ns
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWGkQ-00046i-5j
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWGkJ-0000o0-0Q
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662640502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0W/O0Jc3mcTwZZUSLu8AcHhVuTArJjD6I/53BNQfRTI=;
 b=K1QhuYZ3czp9rR2fWdpA+l4fHy49XtJMCZG74BqJvB8dq3WBFi5izZaFWGa20hY22dfkct
 v2Vqvsdlg+sGhOSsSIbVHDe8XjJqJcO5ZZTl1IqJ5K4Ve12LjkcWkSg4IcNQ1EWAIuwr7b
 6easa8lbwK8CESWA1bXWNhnbXd51O+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-FT1XQQ03OZGNTH4vBtauSw-1; Thu, 08 Sep 2022 08:34:59 -0400
X-MC-Unique: FT1XQQ03OZGNTH4vBtauSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EB0818F0262;
 Thu,  8 Sep 2022 12:34:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EBED1415102;
 Thu,  8 Sep 2022 12:34:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FF8921E6900; Thu,  8 Sep 2022 14:34:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: liuhaiwei9699 <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org,  pbonzini@redhat.com,  eduardo@habkost.net,
 eblake@redhat.com,  liuhaiwei <liuhaiwei@inspur.com>,
 David Alan Gilbert <dgilbert@redhat.com>
Subject: Re: [PATCH] Use QMP command object-add instead of object_add for
 memory hotplugin
References: <20220908095247.2582144-1-liuhaiwei9699@126.com>
 <877d2edrf6.fsf@pond.sub.org>
 <6185f50d.391f.1831cf22678.Coremail.liuhaiwei9699@126.com>
Date: Thu, 08 Sep 2022 14:34:56 +0200
In-Reply-To: <6185f50d.391f.1831cf22678.Coremail.liuhaiwei9699@126.com>
 (liuhaiwei's message of "Thu, 8 Sep 2022 19:52:55 +0800 (CST)")
Message-ID: <87r10m59jj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

liuhaiwei9699  <liuhaiwei9699@126.com> writes:

> why the hmp using the object_add , qmp using the object-add command?
> can't we use the same command ?

Command names differ between HMP and QMP for historical reasons.

QMP is a stable interface, and changing names there is no go.

HMP is not a stable interface, but changing names would still
inconvenience users.  We don't do that without really compelling
reasons.

I think HMP could fold '_' and '-' together in command names, so that
both object_add and object-add work.  Best to check with the HMP
maintainer before you start coding.


