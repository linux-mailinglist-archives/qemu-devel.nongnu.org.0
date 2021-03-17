Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A573133F1D6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:53:44 +0100 (CET)
Received: from localhost ([::1]:49966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWcJ-0001sZ-FO
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMWbG-0001MM-JY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMWbC-0005cX-0q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615989152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S13Qge5Sz4F3pkXRQQhTpe63/uIcX0TdPEV3rLfOK4E=;
 b=aUZ78V13qEyhId5GRiJZkAdzibnyGQ9lbAwOzdE1LkZbOpyDB7Nrzc8+VSeHG5fKQfSMwI
 z7z9fFV9Bljc5d9gaBzJiVvJTPuK3eTjzISRXpvZXZVFwKzX+r1WEhmN9gEkYoM+azv47N
 KF4EiJWD3ENmGuzz2HqL97MKVupQyrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-P9tza8MUPM-xYA5_yxlCvA-1; Wed, 17 Mar 2021 09:52:28 -0400
X-MC-Unique: P9tza8MUPM-xYA5_yxlCvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFE54108BD1B;
 Wed, 17 Mar 2021 13:52:26 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 559A02A2D3;
 Wed, 17 Mar 2021 13:52:26 +0000 (UTC)
Subject: Re: [PULL v2 01/15] utils: Use fixed-point arithmetic in qemu_strtosz
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
 <20210317072216.16316-2-alex.bennee@linaro.org>
 <a6e34081-89bd-2af1-fa0d-72a8fc8daa04@redhat.com> <87h7lac70s.fsf@linaro.org>
 <285185a0-fa94-9e25-317f-cb24a39c001a@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <207c2798-3573-83e3-ed10-7490c2648c4d@redhat.com>
Date: Wed, 17 Mar 2021 08:52:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <285185a0-fa94-9e25-317f-cb24a39c001a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 8:16 AM, Philippe Mathieu-Daudé wrote:

> Yes, the problem is your series doesn't apply on top of 7625a1ed013
> ("utils: Use fixed-point arithmetic in qemu_strtosz")
> 
> $ git am v2_20210317_alex_bennee_misc_fixes_strtoz_plugins_guest_loader.mbx
> Applying: utils: Use fixed-point arithmetic in qemu_strtosz
> error: patch failed: tests/unit/test-cutils.c:2128
> error: tests/unit/test-cutils.c: patch does not apply
> error: patch failed: util/cutils.c:275
> error: util/cutils.c: patch does not apply
> Patch failed at 0001 utils: Use fixed-point arithmetic in qemu_strtosz
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> But skipping this patch, the rest can be applied properly by git-am.

Merging the same patch twice through two independent pull requests is
not a problem with git.  Applying the patches of a pull request is
different than applying a merge request directly (where you failed
trying to reapply a patch that is already present).  There's no need to
respin this pull request just to drop patch 1, but if there is another
reason to respin, rebasing the series will automatically drop patch 1
because it is already upstream through rth's pull request (as you noted,
commit 7625a1ed).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


