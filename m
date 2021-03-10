Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE1333BD1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:52:58 +0100 (CET)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxOb-0006lm-Lt
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJxNr-0006MJ-33
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJxNo-00088r-LH
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615377127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtbInmUCp4Z0fIv/L/UUsURE18vQEZMyVouvG8i8kUs=;
 b=NojeLkkpVthHqcyYgq5J6bHpE7v6DRAg04Go9h7wnRuhUZsFpedmDFZ8hn+3ggQTyfLGzy
 NpEAwUKMWwmMfayRgZb7h52GGYRLhjHNcaqbFYUUXfUwdB314OBCqEodPr+mrcD35FLjSg
 iB4jNvXNo2+w7wyoh6YnxxuwkNl+OFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-6h9NBDc5O0mJfBAz8ZxwJA-1; Wed, 10 Mar 2021 06:52:03 -0500
X-MC-Unique: 6h9NBDc5O0mJfBAz8ZxwJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD72526862;
 Wed, 10 Mar 2021 11:52:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E741F1037EBA;
 Wed, 10 Mar 2021 11:51:58 +0000 (UTC)
Date: Wed, 10 Mar 2021 12:51:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/2] block/curl: Disconnect sockets from CURLState
Message-ID: <20210310115157.GB6076@merkur.fritz.box>
References: <20210309130541.37540-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309130541.37540-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.03.2021 um 14:05 hat Max Reitz geschrieben:
> Hi,
> 
> There’s been a bug report concerning our curl driver on Launchpad:
>   https://bugs.launchpad.net/qemu/+bug/1916501
> 
> When downloading an image from a certain URL, it crashes.
> (https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img)
> 
> The crash is a use-after-free: A CURLState (which basically represents a
> transfer) has several CURLSocket objects (encapsulating an FD) over
> which the data is transmitted.  Once that transfer is done, the state is
> purged and all CURLSocket objects belonging to it are freed, under the
> assumption that once the transfer is done, the sockets are no longer
> used.
> 
> That seems to work with most servers.
> 
> However, I suspect that in the above case, some sockets might be reused
> for later transfers; so libcurl doesn’t actually tell us to drop them
> (by invoking curl_sock_cb() with CURL_POLL_REMOVE), and that means our
> AIO handler (curl_multi_do()) is invoked for some socket after its
> corresponding CURLSocket object is freed, leading to said
> use-after-free.
> 
> I don’t think libcurl actually says anywhere that sockets are bound to
> CURL states (“CURL” objects), though one is always passed to
> curl_sock_cb().  But I can’t find any mention that a socket might not be
> reused by some other state.
> 
> In fact, there is absolutely no necessity to bind sockets to states.  We
> can trivially replace the CURLState pointer in CURLSocket by a
> BDRVCURLState pointer (patch 1), and very easily move the sockets from a
> per-state list to a global hash table (patch 2).
> 
> By doing so, there is no longer any need to free any socket object when
> purging a CURLState, because the sockets are then independent of any
> such state.  (As far as I can tell from testing, this does not lead to
> any memory leaks.  For every socket there is, libcurl does tell us
> eventually to remove it by invoking curl_sock_cb() with
> CURL_POLL_REMOVE.)

Thanks, applied to the block branch.

Kevin


