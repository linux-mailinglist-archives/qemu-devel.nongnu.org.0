Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD622F4F7E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:06:42 +0100 (CET)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzifR-0008MG-F8
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzicW-0006Is-Jx
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzicT-0005R6-7Y
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610553813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldbg08NfD46plOc5nARieCeUBvHXVWaqqJ/DKkTGMYc=;
 b=dZQ3QMTikNJ6n7Wzz7L6cMFsGzAJfVDbSHM7M0uLId5mBxJEgZOF1JFonqL1XY62qbW6cO
 iT5Tp1WOxdJvMx5Sa/IJ4S8oGNZGb3Mg96GtJWNJOlEuEaRu4ZFw4AyFsyZ2Z2opgCq3mk
 jMDYO4XaGvS5biTl70Wq/3xztBsYRJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-9fZaLG42MKq8GmREydBhSw-1; Wed, 13 Jan 2021 11:03:27 -0500
X-MC-Unique: 9fZaLG42MKq8GmREydBhSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E79100C60E;
 Wed, 13 Jan 2021 16:03:26 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06B575C8A7;
 Wed, 13 Jan 2021 16:03:25 +0000 (UTC)
Subject: Re: [PATCH 6/7] iotests/129: Limit mirror job's buffer size
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-7-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <737d244a-af6e-8d8c-60d8-0b9ddd197af7@redhat.com>
Date: Wed, 13 Jan 2021 10:03:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113140616.150283-7-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 8:06 AM, Max Reitz wrote:
> Issuing 'stop' on the VM drains all nodes.  If the mirror job has many
> large requests in flight, this may lead to significant I/O that looks a
> bit like the job is being drained.
> 
> We can limit the I/O in flight by limiting the buffer size, so mirror
> will make very little progress during the 'stop' drain.
> 
> (We do not need to do anything about commit, which has a buffer size of
> 512 kB by default; or backup, which goes cluster by cluster.  Once we
> have asynchronous requests for backup, that will change, but then we can
> fine-tune the backup job to only perform a single request on a very
> small chunk, too.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/129 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index e6753c90ef..c3ad584ba2 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -69,7 +69,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>      def test_drive_mirror(self):
>          self.do_test_stop("drive-mirror", device="drive0",
>                            target=self.target_img, format=iotests.imgfmt,
> -                          sync="full")
> +                          sync="full", buf_size=65536)
>  
>      def test_drive_backup(self):
>          self.do_test_stop("drive-backup", device="drive0",
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


