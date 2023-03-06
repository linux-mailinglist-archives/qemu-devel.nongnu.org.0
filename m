Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD26AB8C9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ6Wb-0007tZ-4d; Mon, 06 Mar 2023 03:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pZ6WN-0007Tf-PQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:48:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pZ6WM-0006Pt-6U
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678092517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcTy6AAGv8f3zCCNsdgXS+H4btu5VdEy3wfrCveIEFs=;
 b=QsQLm7sZXUCmLYhV82xcQ9PyHIUp4cRMRpdY47k0pzgVPAhyCy2Fr8xIOjsnY4WPtFQAg7
 h3gVzVasKiC+XTl1m/lTVHBwvcXRiNKXiJjKZVhkLJQA01Owo9gIgDo+BtKEeyADU33PKK
 CXA1U5exOwyAG9a9/eoFxfrrQwF9/Ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-XuCTxh_6PtqBfxDuk9cCsw-1; Mon, 06 Mar 2023 03:48:33 -0500
X-MC-Unique: XuCTxh_6PtqBfxDuk9cCsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A4E1101A521;
 Mon,  6 Mar 2023 08:48:33 +0000 (UTC)
Received: from [10.39.193.0] (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C27F614171C3;
 Mon,  6 Mar 2023 08:48:31 +0000 (UTC)
Message-ID: <2a150935-0a91-ee4e-7cc8-ad227e987fef@redhat.com>
Date: Mon, 6 Mar 2023 09:48:30 +0100
MIME-Version: 1.0
Subject: Re: [Libguestfs] [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Content-Language: en-US
To: Wouter Verhelst <w@uter.be>, Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, nbd@other.debian.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
 <20230303221740.pdwc6jtozstntih7@redhat.com>
 <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/5/23 09:41, Wouter Verhelst wrote:
> On Fri, Mar 03, 2023 at 04:17:40PM -0600, Eric Blake wrote:
>> On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> s-o-b line missed.
>>
>> I'm not sure if the NBD project has a strict policy on including one,
>> but I don't mind adding it.
> 
> I've never required it, mostly because it's something that I myself
> always forget, too, so, *shrug*.
> 
> (if there were a way in git to make it add that automatically, that
> would help; I've looked but haven't found it)
> 

You can point the "commit.template" git-config knob to a particular
file, and then include your S-o-b in that file.

There is also the "-s" ("--signoff") option for git-commit, but I don't
see a git-config knob to make that permanent. (You can always introduce
a git.alias for it though.)

Laszlo


