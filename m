Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03132B06EA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:47:07 +0100 (CET)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCwM-00008T-Bp
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdCus-0007sT-IH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:45:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdCun-0000vU-PZ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f73y2dqdCJWdlMN4M1zlxruRF4entWpkeFpIa0Dvx0w=;
 b=KUWGLiOPG5Qg2w9mLdb8U0kb/ZtF4Qaj2T46dNK77w/2keYxFHQr1qiRx8U//WHeG+bK8y
 SBZtyCUwF0CpJMavZZAvch/zCRKXCSijBim/0iflbE35ehwgIO4vmnJEhSSByxFy6kN9Tz
 t6VcnkJIMZklUYCRzutGtFlq1stk2lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-2mfNnuoSO-KoY-s5j-IUjg-1; Thu, 12 Nov 2020 08:45:21 -0500
X-MC-Unique: 2mfNnuoSO-KoY-s5j-IUjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C423D1017DCC;
 Thu, 12 Nov 2020 13:45:19 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF14055766;
 Thu, 12 Nov 2020 13:45:18 +0000 (UTC)
Subject: Re: [PATCH 2/2] qemu-img: align next status sector on destination
 alignment.
To: Peter Lieven <pl@kamp.de>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <20201111153913.41840-3-mlevitsk@redhat.com>
 <2903c8a0-00c9-5f2c-b261-d825ded3042c@kamp.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b4c49375-451b-1bc2-8c98-9d4e6fc62347@redhat.com>
Date: Thu, 12 Nov 2020 07:45:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2903c8a0-00c9-5f2c-b261-d825ded3042c@kamp.de>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 6:40 AM, Peter Lieven wrote:

>>          /*
>> -         * Avoid that s->sector_next_status becomes unaligned to the source
>> -         * request alignment and/or cluster size to avoid unnecessary read
>> -         * cycles.
>> +         * Avoid that s->sector_next_status becomes unaligned to the
>> +         * source/destination request alignment and/or cluster size to avoid
>> +         * unnecessary read/write cycles.
>>           */
>> -        tail = (sector_num - src_cur_offset + n) % s->src_alignment[src_cur];
>> +        alignment = MAX(s->src_alignment[src_cur], s->alignment);
>> +        assert(is_power_of_2(alignment));
>> +
>> +        tail = (sector_num - src_cur_offset + n) % alignment;
>>          if (n > tail) {
>>              n -= tail;
>>          }
> 
> 
> I was also considering including the s->alignment when adding this chance. However, you need the least common multiple of both alignments, not the maximum, otherwise
> 
> you might get misaligned to either source or destination.
> 
> 
> Why exactly do you need the power of two requirement?

The power of two requirement ensures that you h ave the least common
multiple of both alignments ;)

However, there ARE devices in practice that have advertised a
non-power-of-2 discard granularity, such as 15MiB (see commits 430b26a8,
63188c24).  Which means you probably don't want to assert power-of-2,
and in turn need to worry about least common multiple.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


