Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4F2B9490
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:28:27 +0100 (CET)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfkvC-0006ev-J1
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfktC-00065I-Oj
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfkt7-0006m3-IZ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605795975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7LK4mPnPL0Ke8Ygbxo2SK1yGNW3rt68efwSsqLK0w7s=;
 b=i+PdxrLec6+wJ1KWXNMqvPSqYQQAXtSwrgQ6TGqVZUQR7uTODCjdeZbjxSeNvR/uGBr4FF
 4lWGZ36DqoH+BTKwZKKsCnKYqidGdKnzgnru/sniGuTbX7n1u5r6UWSXWX+Q8QJtMwM8Cq
 RtyawQx4DXg75mlec09YUq5NJ2RcrPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-16dcxWJkMxCXO0Cteh32nA-1; Thu, 19 Nov 2020 09:26:11 -0500
X-MC-Unique: 16dcxWJkMxCXO0Cteh32nA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E7B801B15;
 Thu, 19 Nov 2020 14:26:09 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71F095D9C6;
 Thu, 19 Nov 2020 14:26:09 +0000 (UTC)
Subject: Re: [Bug 498523] Re: Add on-line write compression support to qcow2
To: Bug 498523 <498523@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <20091219150703.18215.63221.malonedeb@palladium.canonical.com>
 <160577877517.17269.4220550038917552817.malone@chaenomeles.canonical.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <58556133-af2a-ef20-00c0-7dbb1b907bf7@redhat.com>
Date: Thu, 19 Nov 2020 08:26:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160577877517.17269.4220550038917552817.malone@chaenomeles.canonical.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:39 AM, Thomas Huth wrote:
> As far as I know, QEMU v5.1 now has support for compression filters,
> e.g. by creating a qcow2 image with:
> 
>  qemu-img create -f qcow2 -o compression_type=zlib image.qcow2 1G
> 
> ... so I think we can finally mark this ticket here as done.

That says what compression type to use when writing the entire disk in
one pass, but not online write compression. I think we may be a bit
premature in calling this 'fix released', although I'm not certain we
will ever try to add the feature requested.

> 
> ** Changed in: qemu
>        Status: Confirmed => Fix Released
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


