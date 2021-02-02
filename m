Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0A30C799
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:27:29 +0100 (CET)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zSa-0007PC-I3
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6zQO-00064u-BL
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6zQK-0000q4-IR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612286706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hULJ5arc2rxk6s5kAssJQYf/E9F7fBwIZrVNP2mLmP4=;
 b=i7niG7u5z0/DkR6IbQqZF3YZ9cfP3KgrIzCKbn/uNoXBojuhIarcV0MTktrEN1O1ZWPkez
 /4fkgYNFUJUcApaRpfcxQeag8GPlOvQAdn3A/+wgz3HeFlHHxuz8oSdQEhiRMi7wKQejjj
 SZPGWT2dh+q1Da2ujR2o0t+dpZmwC4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-4eCZS0YKMuqk-CGDuV2ufw-1; Tue, 02 Feb 2021 12:25:04 -0500
X-MC-Unique: 4eCZS0YKMuqk-CGDuV2ufw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D74AFA81;
 Tue,  2 Feb 2021 17:25:03 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648E450A80;
 Tue,  2 Feb 2021 17:25:02 +0000 (UTC)
Subject: Re: [PATCH v10 01/12] block: push error reporting into
 bdrv_all_*_snapshot functions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210202154138.246464-1-berrange@redhat.com>
 <20210202154138.246464-2-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <884ec865-3180-5c19-533f-44887699b2c8@redhat.com>
Date: Tue, 2 Feb 2021 11:25:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202154138.246464-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 9:41 AM, Daniel P. Berrangé wrote:
> The bdrv_all_*_snapshot functions return a BlockDriverState pointer
> for the invalid backend, which the callers then use to report an
> error message. In some cases multiple callers are reporting the
> same error message, but with slightly different text. In the future
> there will be more error scenarios for some of these methods, which
> will benefit from fine grained error message reporting. So it is
> helpful to push error reporting down a level.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> [PMD: Initialize variables]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/monitor/block-hmp-cmds.c |  7 ++--
>  block/snapshot.c               | 77 +++++++++++++++++-----------------
>  include/block/snapshot.h       | 14 +++----
>  migration/savevm.c             | 39 +++++------------
>  monitor/hmp-cmds.c             |  7 +---
>  replay/replay-debugging.c      |  4 +-
>  tests/qemu-iotests/267.out     | 10 ++---
>  7 files changed, 68 insertions(+), 90 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


