Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3361CB0EF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:49:53 +0200 (CEST)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX3Nw-0005Si-Aj
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jX3Mu-0004fm-3C
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:48:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jX3Mt-0002pS-3F
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588945726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrIHL21J/uYm+99Y4mvujVqVBaxWFwNlShzU1FFFlcQ=;
 b=Q+1xOWGoVaQQFH33xH6VN+5TmZEwJbsYpQXVb0fY7bimpiwqZfn+KSjXyrBuh2q+fzWAo8
 72wonooagQyxXTktPtdlKgv0XfI71qIbliP+7UsM95lgiljSBhH2vs7ShY0/pkN7H9TUdj
 Vyjm4AoNPK41ugB9I8NX2BgY4hu7WJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-oFreP0IrPNOxRbWarjZ_iA-1; Fri, 08 May 2020 09:48:44 -0400
X-MC-Unique: oFreP0IrPNOxRbWarjZ_iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43223107ACCA;
 Fri,  8 May 2020 13:48:43 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD71C60610;
 Fri,  8 May 2020 13:48:42 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] blockdev: Split off basic bitmap operations for
 qemu-img
To: Kevin Wolf <kwolf@redhat.com>
References: <20200421212019.170707-1-eblake@redhat.com>
 <20200421212019.170707-3-eblake@redhat.com>
 <6ce69bac-9bbc-05fd-e658-89a2ad63a322@redhat.com>
 <a16c3c4d-272b-6c5f-9d67-2a222c8f1f88@redhat.com>
 <20200508113753.GC4970@linux.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <404776ab-6bb4-1bbe-d9a2-751251c947f2@redhat.com>
Date: Fri, 8 May 2020 08:48:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508113753.GC4970@linux.fritz.box>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/20 6:37 AM, Kevin Wolf wrote:

>>>> ---
>>>>    Makefile.objs             |   2 +-
>>>>    include/sysemu/blockdev.h |  14 ++
>>>>    blockbitmaps.c            | 324 ++++++++++++++++++++++++++++++++++++++
>>>
>>> Hm.  Can we get a better name?  blockdev-bitmaps.c, for example?
>>
>> Sure, I'm open to bike-shed suggestions.  I'd also _really_ love to make the
>> new file NOT live in the top-level, but that's a harder task that I'm not
>> sure how to do (it's easy to tweak Makefile.objs for another file in the
>> same directory, but harder to see through the magic to figure out how to
>> relocate things).
> 
> Yes, please move it somewhere else. I'd suggest something like
> block/monitor/bitmap-qmp-cmds.c for the QMP command handlers, and if
> there are functions that are more generally useful, block/bitmaps.c.
> 
> Instead of modifying the top-level Makefile.objs, you would just edit
> block/monitor/Makefile.objs instead and add the filename there. I don't
> think you need to understand any magic apart from knowing that is exists
> and does what you would expect.

Well, you still have to modify the top-level Makefile.objs to tell it to 
look in the right subdirectories, but I got it figured out finally.  v3 
will use block/monitor/bitmap-qmp-cmds.c.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


