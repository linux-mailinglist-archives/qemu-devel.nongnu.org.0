Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E28355693
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:26:08 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmed-0000wS-VY
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lTmdO-0008O0-GT
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lTmdL-0000cL-RB
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617719085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqDIYISWYBOorDobsTgKcwUBhbKATYdUXcLnNEy5fGg=;
 b=OMPtSVE3Li7P8xQOxicXnmgkPOr4FD8BqzwMzt0o2HM5rHyHBjpKoBXBVMVr8aRkhRPGhG
 opzHubbVczQr8kQEYwWo2x9hvlY+RudRTtoh6cDVHO+ZDPUiXm+BMEf46b7h8YNx+ySqOw
 0gVoq5RgUnR/IGX2BTv5yTBGROVR914=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-8w891s8HOeeG__pk82Xc8Q-1; Tue, 06 Apr 2021 10:24:43 -0400
X-MC-Unique: 8w891s8HOeeG__pk82Xc8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CAB8839A42;
 Tue,  6 Apr 2021 14:24:42 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-169.ams2.redhat.com
 [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 527F718A79;
 Tue,  6 Apr 2021 14:24:37 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] block/rbd: Add an escape-aware strchr helper
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210401210150.2127670-1-ckuehl@redhat.com>
 <20210401210150.2127670-3-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <bc5865f8-bb7f-58b5-5f1c-9ec3e5c09ad9@redhat.com>
Date: Tue, 6 Apr 2021 16:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401210150.2127670-3-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 23:01, Connor Kuehl wrote:
> Sometimes the parser needs to further split a token it has collected
> from the token input stream. Right now, it does a cursory check to see
> if the relevant characters appear in the token to determine if it should
> break it down further.
> 
> However, qemu_rbd_next_tok() will escape characters as it removes tokens
> from the token stream and plain strchr() won't. This can make the
> initial strchr() check slightly misleading since it implies
> qemu_rbd_next_tok() will find the token and split on it, except the
> reality is that qemu_rbd_next_tok() will pass over it if it is escaped.
> 
> Use a custom strchr to avoid mixing escaped and unescaped string
> operations.
> 
> Reported-by: Han Han <hhan@redhat.com>
> Fixes: https://bugzilla.redhat.com/1873913
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>   block/rbd.c                | 20 ++++++++++++++++++--
>   tests/qemu-iotests/231     |  4 ++++
>   tests/qemu-iotests/231.out |  3 +++
>   3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index 9071a00e3f..c0e4d4a952 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -134,6 +134,22 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
>       return src;
>   }
>   
> +static char *qemu_rbd_strchr(char *src, char delim)
> +{
> +    char *p;
> +
> +    for (p = src; *p; ++p) {
> +        if (*p == delim) {
> +            return p;
> +        }
> +        if (*p == '\\') {
> +            ++p;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +

So I thought you could make qemu_rbd_do_next_tok() to do this.  (I 
didn’t say you should, but bear with me.)  That would be possible by 
giving it a new parameter (e.g. @find), and if that is set, return @end 
if *end == delim after the loop, and NULL otherwise.

Now, if you add wrapper functions to make it nice, there’s not much more 
difference in lines added compared to just adding a new function, but it 
does mean your function should basically be the same as 
qemu_rbd_next_tok(), except that no splitting happens, that there is no 
*p, and that @end is returned instead of @src.

So there is one difference, and that is that qemu_rbd_next_tok() has 
this condition to skip escaped characters:

     if (*end == '\\' && end[1] != '\0') {

where qemu_rbd_strchr() has only:

     if (*p == '\\') {

And I think qemu_rbd_next_tok() is right; if the string in question has 
a trailing backslash, qemu_rbd_strchr() will ignore the final NUL and 
continue searching past the end of the string.

Max


