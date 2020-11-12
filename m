Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60F2B0CC6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:36:26 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHSL-0008Ss-TZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdHQU-0006aT-WF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdHQP-0004wY-MB
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AUUXLKYqRyZ5SWmURW/hhF3LKFrydNZvRSAuYLFBac=;
 b=WzVL1ue16JPESJdjDU0VHumibQFLw18PYMcNLH5ueX6dCdZBrTnNOQ0CZrC1lJpk0yJcXv
 ypPYYROdGo3or7WQGEIuX85GGupUtXwn3bt5dU0DnECFabQwbN+xmlA3HOwEAtz/dV9mQ2
 Zr14IdiX1wEhZy1B7TJpJtbFGK/GOHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-QCqRdEqWPtGOF-K0vqXlLA-1; Thu, 12 Nov 2020 13:34:21 -0500
X-MC-Unique: QCqRdEqWPtGOF-K0vqXlLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE1978BE487
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:34:20 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D23960C0F;
 Thu, 12 Nov 2020 18:34:20 +0000 (UTC)
Subject: Re: [PATCH 5/6] qapi: Add support for aliases
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-6-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7864bd70-5567-134f-9238-bbed8a5fbfdb@redhat.com>
Date: Thu, 12 Nov 2020 12:34:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112172850.401925-6-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 11:28 AM, Kevin Wolf wrote:
> Introduce alias definitions for object types (structs and unions). This
> allows using the same QAPI type and visitor for many syntax variations
> that exist in the external representation, like between QMP and the
> command line. It also provides a new tool for evolving the schema while
> maintaining backwards compatibility during a deprecation period.

Cool! Obvious followup patch series: deprecate all QAPI members spelled
with _ by making them aliases of new members spelled with -, so that we
can finally have consistent spellings.


> +=== Aliases ===
> +
> +Object types, including structs and unions, can contain alias
> +definitions.
> +
> +Aliases define alternative member names that may be used in the
> +external representation to provide a value for a member in the same
> +object or in a nested object.
> +
> +Syntax:
> +    ALIAS = { '*alias': STRING,
> +              'source': [ STRING, ... ] }
> +
> +'source' is a list of member names representing the path to an object
> +member, starting from the type where the alias definition is
> +specified.  It may refer to another alias name.  It is allowed to use
> +a path that doesn't necessarily match an existing member in every
> +variant or even at all; in this case, the alias remains unused.
> +
> +If 'alias' is present, then the single member referred to by 'source'
> +is made accessible with the name given in 'alias' in the type where
> +the alias definition is specified.
> +
> +If 'alias' is not present, then all members in the object referred to
> +by 'source' are made accessible in the type where the alias definition
> +is specified with the same name as they have in 'source'.

Is it worth an example of how to use this?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


