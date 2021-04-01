Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F2E35172F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:26:59 +0200 (CEST)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS15u-0001i7-Hf
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lS13n-0000Y0-Qq
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lS13l-0000cr-Gb
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617297883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaCa2iC7xmTf1a6UohteD9J/G7Oy+DiHsGvpFJbNqKw=;
 b=gH6xZ8zgGWIY7DQ3psQ649mf24tBqZQw6vGJ7R6J3iVkG/ERBKrP+iMlwfDL3v/PbtAKKl
 AEPaOkOzGsvK39D5PR+k+H8YjFATIZWN6z/MpiPrGD+amDJr0wLxCTb6tjwWkyGpe2ZJux
 3Njpnh+L0JlXk518MRSAoUpiEcSr2+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-vrvuFPGvNu6SYwIXVeK03Q-1; Thu, 01 Apr 2021 13:24:42 -0400
X-MC-Unique: vrvuFPGvNu6SYwIXVeK03Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D190190D340;
 Thu,  1 Apr 2021 17:24:41 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A95810074F1;
 Thu,  1 Apr 2021 17:24:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] block/rbd: Don't unescape in qemu_rbd_next_tok()
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210401155211.2093139-1-ckuehl@redhat.com>
 <20210401155211.2093139-3-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c8a21743-6264-fe4e-294f-82f74766a5e7@redhat.com>
Date: Thu, 1 Apr 2021 19:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401155211.2093139-3-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 17:52, Connor Kuehl wrote:
> That's qemu_rbd_unescape()'s job! No need to duplicate the labor.
> 
> Furthermore, this was causing some confusion in the parsing logic to
> where the caller might test for the presence of a character to split on
> like so:
> 
> if (strchr(image_name, '/')) {
>          found_str = qemu_rbd_next_tok(image_name, '/', &image_name);
> 	[..]
> 
> When qemu_rbd_next_tok() performs unescaping as a side effect, the
> parser can get confused thinking that it can split this string, but
> really the delimiter '/' gets unescaped and so qemu_rbd_next_tok() never
> "finds" the delimiter and consumes the rest of the token input stream.

I don’t fully understand.  I understand the strchr() problem and the 
thing you explain next.  But I would have thought that’s a problem of 
using strchr(), i.e. that we’d need a custom function to do strchr() but 
consider escaped characters.  If it’s just about true/false like in your 
example, it could be a new version of qemu_rbd_next_tok() that does not 
modify the string.

Or, well, actually, in your example, one could unconditionally invoke 
qemu_rbd_next_tok() and check whether *found_str is '\0' or not.

> This is problematic because qemu_rbd_next_tok() also steals the input
> pointer to the token stream and sets it to NULL. This causes a segfault
> where the parser expects to split one string into two.

I would say that’s a problem of the caller.  It can pass a different 
variable for the out-pointer, so the input pointer isn’t stolen.

> In this case, the parser is determining if a string is a
> namespace/image_name pair like so:
> 
> 	"foo/bar"
> 
> And clearly it's looking to split it like so:
> 
> 	namespace:  foo
> 	image_name: bar
> 
> but if the input is "foo\/bar", it *should* split into
> 
> 	namespace:  foo\
> 	image_name: bar

Should it?  I would have fully expected it to not be split and the 
parser complains that the input is invalid.  Or, let’s say, 
"foo\/bar/baz” should be split into “foo\/bar” and “baz”.

Max

> and its subordinate parts can be unescaped after tokenization.
> 
> So, instead of tokenizing *and* escaping all at once, do one before the
> other to avoid stumbling into a segfault by confusing the parsing logic.
> 
> Reported-by: Han Han <hhan@redhat.com>
> Fixes: https://bugzilla.redhat.com/1873913
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>   block/rbd.c                | 3 ---
>   tests/qemu-iotests/231     | 4 ++++
>   tests/qemu-iotests/231.out | 3 +++
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index 9071a00e3f..9bed0863e5 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -123,9 +123,6 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
>           if (*end == delim) {
>               break;
>           }
> -        if (*end == '\\' && end[1] != '\0') {
> -            end++;
> -        }
>       }
>       if (*end == delim) {
>           *p = end + 1;
> diff --git a/tests/qemu-iotests/231 b/tests/qemu-iotests/231
> index 0f66d0ca36..8e6c6447c1 100755
> --- a/tests/qemu-iotests/231
> +++ b/tests/qemu-iotests/231
> @@ -55,6 +55,10 @@ _filter_conf()
>   $QEMU_IMG info "json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=${BOGUS_CONF}'}" 2>&1 | _filter_conf
>   $QEMU_IMG info "json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'${BOGUS_CONF}'}" 2>&1 | _filter_conf
>   
> +# Regression test: the qemu-img invocation is expected to fail, but it should
> +# not seg fault the parser.
> +$QEMU_IMG create "rbd:rbd/aa\/bb:conf=${BOGUS_CONF}" 1M 2>&1 | _filter_conf
> +
>   # success, all done
>   echo "*** done"
>   rm -f $seq.full
> diff --git a/tests/qemu-iotests/231.out b/tests/qemu-iotests/231.out
> index 747dd221bb..a785a6e859 100644
> --- a/tests/qemu-iotests/231.out
> +++ b/tests/qemu-iotests/231.out
> @@ -4,4 +4,7 @@ unable to get monitor info from DNS SRV with service name: ceph-mon
>   qemu-img: Could not open 'json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=BOGUS_CONF'}': error connecting: No such file or directory
>   unable to get monitor info from DNS SRV with service name: ceph-mon
>   qemu-img: Could not open 'json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'BOGUS_CONF'}': error connecting: No such file or directory
> +Formatting 'rbd:rbd/aa\/bb:conf=BOGUS_CONF', fmt=raw size=1048576
> +unable to get monitor info from DNS SRV with service name: ceph-mon
> +qemu-img: rbd:rbd/aa\/bb:conf=BOGUS_CONF: error connecting: No such file or directory
>   *** done
> 


