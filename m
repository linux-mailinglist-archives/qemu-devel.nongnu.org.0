Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C32387741
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:16:24 +0200 (CEST)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixi3-0006Cz-Qt
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lixIX-0001Rc-EX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lixIV-00071a-NV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621334998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qzchsy7W5yaFucidTbb6Zh+i9x5HCmmGxtxpkYQcZ+E=;
 b=LawbvcA1217MdPhyzWI5qHHKF1Ir33x9YOr7Ly4jV1S6DBXWeKZbL1lOO6p7wa7xouvRQ8
 i88dr2a0pc1vPXYK/iju+V7aX8kOb9Zih8ajdjV/98ZLDbwDDULEGodMpg47uxp6AXrKes
 0KKvBRJOtgn7nMW6lQgXhzaiMDLhknw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-13rMrDO9MAu-1KKRP3BVCw-1; Tue, 18 May 2021 06:49:56 -0400
X-MC-Unique: 13rMrDO9MAu-1KKRP3BVCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD1C1966323;
 Tue, 18 May 2021 10:49:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-138.ams2.redhat.com [10.36.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A341E2ED75;
 Tue, 18 May 2021 10:49:54 +0000 (UTC)
Subject: Re: [PATCH 2/3] ci: do not use #processors+1 jobs, #processors is
 enough
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <40f9d46b-d234-c029-3ba2-f5dcac8b87fc@redhat.com>
Date: Tue, 18 May 2021 12:49:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210518084139.97957-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/2021 10.41, Paolo Bonzini wrote:
> I could not reconstruct the origin of the $(($(nproc) + 1)) idiom,
> but I suspect it was there only to have a sensible result when nproc
> or getconf do not exist.  This can be achieved also with an "||".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   .gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 4bd1a91aa8..3f0d86cf0a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -17,7 +17,7 @@ include:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     before_script:
> -    - JOBS=$(expr $(nproc) + 1)
> +    - JOBS=$(nproc || echo 1)

The basic idea of the "+ 1" was to make sure that there is always a thread 
that runs on a CPU while maybe another one is waiting for I/O to complete. 
This is suggested by various sites on the web, e.g.:

 
https://unix.stackexchange.com/questions/519092/what-is-the-logic-of-using-nproc-1-in-make-command

So not sure whether this patch here make sense ... I'd rather drop it.

  Thomas


