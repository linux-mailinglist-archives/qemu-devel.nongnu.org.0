Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B847630C165
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:24:24 +0100 (CET)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wbP-0002oj-LP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wVJ-0004o3-EF
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wVH-0006yG-MZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOljvJweHfPWH/GskH2ZJwasncGi+SaH0FM719BOBIY=;
 b=Ary0CM7ZqEwMeXruaiv8+lenXztyfOeHoLuPGqNM/3SJKUiSHhQu4ABOdSEmW2lQfDBDAK
 kN2EAEsAX7cLOn6vKYlTKfIjkulGyTDFLf3AjflDllwgGuy2UvyHHAbQuw6dfqJx6il/xc
 +k68fJbJs7cbG89i7cFEBNocgG9OQQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-7p3u_QcjP_6fT_5K2rm5Uw-1; Tue, 02 Feb 2021 09:17:59 -0500
X-MC-Unique: 7p3u_QcjP_6fT_5K2rm5Uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71209801817;
 Tue,  2 Feb 2021 14:17:58 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17FD760CE7;
 Tue,  2 Feb 2021 14:17:58 +0000 (UTC)
Subject: Re: [PATCH v1 07/15] configure: make version_ge more tolerant of
 shady version input
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210202134001.25738-1-alex.bennee@linaro.org>
 <20210202134001.25738-8-alex.bennee@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6424129b-1ac2-e5fd-0322-020dd5acf044@redhat.com>
Date: Tue, 2 Feb 2021 08:17:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202134001.25738-8-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 7:39 AM, Alex Bennée wrote:
> When checking GDB versions we have to tolerate all sorts of random
> distro extensions to the version string. While we already attempt to
> do some of that before we call version_ge is makes sense to try and
> regularise the first input by stripping extraneous -'s. While we at it
> convert the old-style shell quoting into a cleaner form t shut up my
> editors linter lest it confuse me by underlining the whole line.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index e85d6baf8f..432b83fadf 100755
> --- a/configure
> +++ b/configure
> @@ -198,8 +198,8 @@ has() {
>  }
>  
>  version_ge () {
> -    local_ver1=`echo $1 | tr . ' '`
> -    local_ver2=`echo $2 | tr . ' '`
> +    local_ver1=$(expr "$1" : '\([0-9.]*\)' | tr . ' ')
> +    local_ver2=$(echo "$2" | tr . ' ')
>      while true; do
>          set x $local_ver1
>          local_first=${2-0}
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


