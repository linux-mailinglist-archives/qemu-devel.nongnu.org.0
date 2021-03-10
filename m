Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8A334551
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:44:24 +0100 (CET)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2sh-0007NJ-VN
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2YX-0006mB-2D
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2YV-0005Mb-6N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCHS3dmZA+yPkKG1ZjaP/iWTDQ2xiyfhURRDEZIWU1U=;
 b=PeMiKE31gQxV5wncbhH73M+DrH7FEVxJKpSQA6mU8W24YuKjlNVorDpQiS5dBrJOapU9aR
 nxqsjXs6ZCdMO0QL+vVp1GeFkUcAbOcfTBlxtKB8SCYZjswV7L+JgjsgXv+ITyLJFNBsuy
 xL7+iD59IJmWeWw1c+lSHjMEIJp0ciU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-J--jOUC-OC6_dgL42fDd4Q-1; Wed, 10 Mar 2021 12:23:26 -0500
X-MC-Unique: J--jOUC-OC6_dgL42fDd4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE5A801596;
 Wed, 10 Mar 2021 17:23:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8F5860CE9;
 Wed, 10 Mar 2021 17:23:16 +0000 (UTC)
Subject: Re: [PATCH] baum: Fix crash when Braille output is not available
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8624f8c8-d541-051a-13f6-f05d685fefde@redhat.com>
Date: Wed, 10 Mar 2021 18:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 17.08, Samuel Thibault wrote:
> When Braille output is not available, the backend properly reports being
> unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
> imply timer_del()") made the timer_free() call now refuse any NULL
> parameter. char_braille_finalize thus now has to be more careful with
> calling it on baum->cellCount_timer.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---
>   chardev/baum.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/chardev/baum.c b/chardev/baum.c
> index 5deca778bc..aca5bf12fb 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -631,7 +631,9 @@ static void char_braille_finalize(Object *obj)
>   {
>       BaumChardev *baum = BAUM_CHARDEV(obj);
>   
> -    timer_free(baum->cellCount_timer);
> +    if (baum->cellCount_timer) {
> +        timer_free(baum->cellCount_timer);
> +    }
>       if (baum->brlapi) {
>           brlapi__closeConnection(baum->brlapi);
>           g_free(baum->brlapi);

I just tried to debug this problem, too, and came to the same conclusion.

Reviewed-by: Thomas Huth <thuth@redhat.com>


