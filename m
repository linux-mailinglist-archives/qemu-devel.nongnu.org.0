Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774B21FC11B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 23:42:51 +0200 (CEST)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlJM1-0005yW-2r
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 17:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jlJKx-0005DN-On
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 17:41:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30612
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jlJKw-0001eX-6d
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 17:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592343701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdDVmKgsjmK2OiCVxfhtt9fr2/4aJRCAyOmfQAsC1LM=;
 b=Z0b7677bvDTkwT6iQPw4P4ELOTOdza7bdNvc1ntPS/ckl45ZEPaVdf2EuB+ImIxub9sBsp
 zYjGgEkmQixgwvo+Gifp+Z9iQ6pfsPHAOUY+PF4czeu3nLWUd79e3CtTngtuhi69xFgjfC
 D4Lebci8Z0T7KNbeFI/p+hLQxR1xnL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-a63_oeElM-CjC6I1Az17SQ-1; Tue, 16 Jun 2020 17:41:34 -0400
X-MC-Unique: a63_oeElM-CjC6I1Az17SQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8F3910AB656;
 Tue, 16 Jun 2020 21:41:33 +0000 (UTC)
Received: from [10.3.112.27] (ovpn-112-27.phx2.redhat.com [10.3.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B3160BE2;
 Tue, 16 Jun 2020 21:41:33 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] qmp.py: change event_wait to use a dict
To: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20200514022536.2568-1-jsnow@redhat.com>
 <20200514022536.2568-2-jsnow@redhat.com>
 <20200514144732.GJ5518@linux.fritz.box>
 <de1026e4-9815-f89c-4cfd-6da35ac23197@redhat.com>
 <20200514155952.GM5518@linux.fritz.box>
 <3fda28e5-2049-1667-4da7-bbabac1fee15@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <792fa6da-bdb7-9760-0840-cc5397f97543@redhat.com>
Date: Tue, 16 Jun 2020 16:41:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3fda28e5-2049-1667-4da7-bbabac1fee15@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/20 2:31 PM, John Snow wrote:

>>>
>>> Nah, it's fine. I'll clean it up. This is pretty close to an RFC series
>>> anyway, so I didn't really polish it.
>>>
>>> (Or, I will try to clean it up. I probably won't work on it again in the
>>> near term. I think I just wanted to see if this seemed useful in general
>>> to people.
>>
>> Ah, there isn't much missing for this series, though. We don't have to
>> wait for a fix-the-world series when we can incrementally improve
>> things.
>>
> 
> Alright, I'll try to hit it halfway -- I spent some time thinking about
> a "full" job running framework but ran into some dead-ends I wasn't too
> happy with, and wasn't convinced this was a simplification of any kind.
> 
> Still, seeing part of the job running code get duplicated in 040 was a
> motivation to try and provide some universal job-running monster that
> would be extensible for nearly any task.
> 
> Unfortunately that complexity does generally make the calling sites look
> worse, so I cooled off on the idea since.
> 
> So I did intend this as an RFC, because I'm not really 100% happy with
> the design.

I noticed that the block-dirty-bitmap-populate series depends on this 
one; is it going to be simpler for me to fix the few things that Kevin 
pointed out here, or to wait for you to post a v5 of this series, or to 
rewrite the iotest in that series to not depend on JobRunner after all?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


