Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C2308A10
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:48:13 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5W0K-0003U1-5H
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5Vyc-0002e5-Ra
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:46:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5VyW-0002J4-2u
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611935175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJ4pPEBIVK5mo7ngkw6ac0iFbFz9deOQ3DqX4VUgST0=;
 b=c94zFOThjKhOBpVtPsg9IMG8r3L1WBv9/BNWudkmx0U949djqlI9CNy87AnU7CfwhByWnl
 KpltUhg0LwnrAFEfUGw8SgQV0s1gtyKteMmXilER0hIkTm0KtfwKf8If21dwiHgZLYfxgk
 WVsY2cZQnH5dDmJZWhiqv+A5TxRGUto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-ADqmaV00PYKwkESDVekz6Q-1; Fri, 29 Jan 2021 10:46:13 -0500
X-MC-Unique: ADqmaV00PYKwkESDVekz6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28AA659;
 Fri, 29 Jan 2021 15:46:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36DDA60CE0;
 Fri, 29 Jan 2021 15:46:11 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] configure: make version_ge more tolerant of shady
 version input
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210122181854.23105-1-alex.bennee@linaro.org>
 <20210122181854.23105-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <433b85da-b438-ce79-e231-aafd960e05fc@redhat.com>
Date: Fri, 29 Jan 2021 16:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122181854.23105-8-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 19.18, Alex Bennée wrote:
> When checking GDB versions we have to tolerate all sorts of random
> distro extensions to the version string. While we already attempt to
> do some of that before we call version_ge is makes sense to try and
> regularise the first input by stripping extraneous -'s. While we at it
> convert the old-style shell quoting into a cleaner form t shut up my
> editors linter lest it confuse me by underlining the whole line.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 6f6a319c2f..dd99939b34 100755
> --- a/configure
> +++ b/configure
> @@ -198,8 +198,8 @@ has() {
>   }
>   
>   version_ge () {
> -    local_ver1=`echo $1 | tr . ' '`
> -    local_ver2=`echo $2 | tr . ' '`
> +    local_ver1=$(expr "$1" : '\([0-9.]*\)' | tr . ' ')
> +    local_ver2=$(echo "$2" | tr . ' ')
>       while true; do
>           set x $local_ver1
>           local_first=${2-0}
> 

This silences the warnings that I've recently seen when running configure.

Tested-by: Thomas Huth <thuth@redhat.com>


