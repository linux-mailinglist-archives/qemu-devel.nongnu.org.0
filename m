Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE433C17B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:18:36 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpvP-0007XR-BH
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLptV-0005mD-UV
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLptU-0002L9-0E
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615824994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5360jM2y3pG9jmtvpgTZwAmJoI5AWKWcS+7nrlkS8qU=;
 b=LqT/Gq9Y/XH1XX+VaUbUKjFNE3URhJghNquoteOXht0V5wipwVlF+Fz2NEwUxPF754aa0p
 QJ04cFVRiS9299P+dTjcCaCDPnCNhDLXlCZVIzf6ikxTHyugoRu5cI30W4PQN2n0j+HAYI
 V9b5jJq1YNS4LYDNk/Tn0s6HeZNMH4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516--kqd6NS9MTez7_KUQZSRPw-1; Mon, 15 Mar 2021 12:16:32 -0400
X-MC-Unique: -kqd6NS9MTez7_KUQZSRPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1552719200DB;
 Mon, 15 Mar 2021 16:16:31 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7125D9D3;
 Mon, 15 Mar 2021 16:16:30 +0000 (UTC)
Subject: Re: [PATCH v6 08/10] qapi: Implement deprecated-input=reject for QMP
 commands
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-9-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c4a70e1f-b6ff-c514-9618-514666db7f59@redhat.com>
Date: Mon, 15 Mar 2021 11:16:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312153210.2810514-9-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:32 AM, Markus Armbruster wrote:
> This policy rejects deprecated input, and thus permits "testing the
> future".  Implement it for QMP commands: make deprecated ones fail.
> Example: when QEMU is run with -compat deprecated-input=reject, then
> 
>     {"execute": "query-cpus"}
> 
> fails like this
> 
>     {"error": {"class": "CommandNotFound", "desc": "Deprecated command query-cpus disabled by policy"}}
> 
> When the deprecated command is removed, the error will change to
> 
>     {"error": {"class": "CommandNotFound", "desc": "The command query-cpus has not been found"}}

Again, Dan's patch changes this permanently:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg07566.html

Up to you if you want to tweak the example, but the concept of the patch
is still fine, so my R-b still stands.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


