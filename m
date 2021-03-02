Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755332A9EF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:02:36 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAHz-0007xX-He
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHAGA-0006fB-UD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHAG7-0008RH-9y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614711637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcdM9FmdIt8zYPN92ZuXqaexwNYevboFLqyNEiLQ2Og=;
 b=MEF6ARTQ5dXFKoWsQkPf9mlBjK1gnn9CbGNMUp8bD/FarJvmiN12byCuxECW7ePteVK5wV
 M34GFDP3q/2jP40n3CHSINPTj2XpengJyniYawq8FWaW+5Ox8OZE6t6yu2+ztSti+zt+G1
 NQlb6cqhmiwoUmWLwtd1k2QNS+MqVBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-xDwWlFVJOkea8AvzA5BzGQ-1; Tue, 02 Mar 2021 14:00:36 -0500
X-MC-Unique: xDwWlFVJOkea8AvzA5BzGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30EDA100A61D;
 Tue,  2 Mar 2021 19:00:35 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F325D768;
 Tue,  2 Mar 2021 19:00:34 +0000 (UTC)
Subject: Re: [PATCH] qom: Check for wellformed id in user_creatable_add_type()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210302171623.49709-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <84a2bf4c-9943-4347-a23b-e66dc82a1d96@redhat.com>
Date: Tue, 2 Mar 2021 13:00:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302171623.49709-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 11:16 AM, Kevin Wolf wrote:
> Most code paths for creating a user creatable object go through
> QemuOpts, which ensures that the provided 'id' option is actually a
> valid identifier.
> 
> However, there are some code paths that don't go through QemuOpts:
> qemu-storage-daemon --object (since commit 8db1efd3) and QMP object-add
> (since it was first introduced in commit cff8b2c6). We need to have the
> same validity check for those, too.
> 
> This adds the check and makes it print the same error message as
> QemuOpts on failure.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> This makes sense even without the -object QAPIfication, so no reason to
> wait for v3 of that series to get this fixed.
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


