Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D226F2075D7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 16:39:27 +0200 (CEST)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo6Yg-0004KF-Fk
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 10:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jo6Xw-0003tg-Cy
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:38:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30563
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jo6Xt-0007rK-PC
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593009516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6k2DIshHTanoT/Ju6L+6voAsa8MY7MZdN2OiRVXllhs=;
 b=D+vlgfqLqOTBN9zn6IQjJfIm+Hax4GVX7DZDze0zk86wfIvNJwB3frddbBtgWYTxgk6rCg
 FIDvJcWol7panq/vkcFjTTBFBpdY52dQD311ILnqv6Nn2mmiCYtFksy4cBf30ubSDjNgv7
 70QynKZjvE+LGVm38MTLptUrxgGlRdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-f-9wr5nwOai_n3I231EGXw-1; Wed, 24 Jun 2020 10:38:34 -0400
X-MC-Unique: f-9wr5nwOai_n3I231EGXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237201005512;
 Wed, 24 Jun 2020 14:38:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-35.ams2.redhat.com [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4648D100239F;
 Wed, 24 Jun 2020 14:38:29 +0000 (UTC)
Subject: Re: [PATCH v2 02/25] crypto/linux_keyring: fix 'secret_keyring'
 configure test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200624140446.15380-1-alex.bennee@linaro.org>
 <20200624140446.15380-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <446d2c5e-d094-e333-bdf6-002d56e83f45@redhat.com>
Date: Wed, 24 Jun 2020 16:38:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200624140446.15380-3-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
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
Cc: fam@euphon.net, berrange@redhat.com, richard.henderson@linaro.org,
 f4bug@amsat.org, David Edmondson <david.edmondson@oracle.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/2020 16.04, Alex Bennée wrote:
> From: David Edmondson <david.edmondson@oracle.com>
> 
> The configure test for 'secret_keyring' incorrectly checked the
> 'have_keyring' variable.
> 
> Fixes: 54e7aac0562452e4fcab65ca5001d030eef2de15
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200618092636.71832-1-david.edmondson@oracle.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index ba88fd18244..69ffd750dbc 100755
> --- a/configure
> +++ b/configure
> @@ -6369,7 +6369,7 @@ EOF
>   fi
>   if test "$secret_keyring" != "no"
>   then
> -    if test "$have_keyring" == "yes"
> +    if test "$have_keyring" = "yes"
>       then
>   	secret_keyring=yes
>       else
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


