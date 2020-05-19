Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8801D9E41
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 19:53:20 +0200 (CEST)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb6QZ-0006go-Lf
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 13:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jb6Pf-0005lp-Pb
 for qemu-devel@nongnu.org; Tue, 19 May 2020 13:52:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43057
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jb6PZ-00036J-Uc
 for qemu-devel@nongnu.org; Tue, 19 May 2020 13:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589910734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubCgkqQIo/W38KsPpXPBTu2TZUYN7ZWmWl5iGVXJ2nU=;
 b=TWYj/owLZbPabA8klgE81I0O8NfDh37bIohbseEYXffsNXrBmVDRzyJn7c/10XBb7BjqOY
 fcXfR3+0pSjv4GAUcs3z365FDybHmln1hHLiRSVLXL8Oq3Y1uFODCaFM0poqeMwkAQd3ud
 ndzdMPHr8tAhfIJrhFw7bqxGK3C+PBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-SCrtlKtkMhKJWAHYLo_f-w-1; Tue, 19 May 2020 13:52:10 -0400
X-MC-Unique: SCrtlKtkMhKJWAHYLo_f-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6B51464;
 Tue, 19 May 2020 17:52:08 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85D4060BE1;
 Tue, 19 May 2020 17:52:08 +0000 (UTC)
Subject: Re: [PULL v2 7/7] qemu-img: Add bitmap sub-command
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20200519161840.810320-1-eblake@redhat.com>
 <20200519161840.810320-8-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9171373f-3761-ca77-3e3b-f7dbeaf84590@redhat.com>
Date: Tue, 19 May 2020 12:52:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519161840.810320-8-eblake@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/20 11:18 AM, Eric Blake wrote:
> Include actions for --add, --remove, --clear, --enable, --disable, and
> --merge (note that --clear is a bit of fluff, because the same can be

> +        case 'g':
> +            granularity = cvtnum(optarg);
> +            if (granularity < 0) {
> +                error_report("Invalid granularity specified");
> +                return 1;
> +            }

Phooey. I forgot to commit my changes before creating the tag. v3 pull 
request coming up :(

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


