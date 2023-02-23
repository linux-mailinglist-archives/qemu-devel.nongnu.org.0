Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D350C6A0EDE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:45:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFeR-00069Z-P1; Thu, 23 Feb 2023 12:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVFeP-00068u-0J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:45:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVFeN-0005YQ-0M
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677174297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KrEGNsqUgyFuDQ5NC4zmF9Ki3sMEWC5byIjTTYe6Pm8=;
 b=Ugl1rBkjgF9EB6nDrRG/Z2WPeIzAq3v488Od7E8LPsSGqd8wROEbBzNApkeVk3bO9JK/wp
 X/ZLizgg3l5x7vqwKTZVh+wt6IfV48RC3f7zyKQGSbvlw3ar1Zdx1w6LRhbTY59pPEKElK
 yoKBfm8dei4+x/Jls4biI4miskvbYYQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-_n6TKRARONyhWsHughppLA-1; Thu, 23 Feb 2023 12:44:56 -0500
X-MC-Unique: _n6TKRARONyhWsHughppLA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5A552808E69;
 Thu, 23 Feb 2023 17:44:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4AE492C3E;
 Thu, 23 Feb 2023 17:44:54 +0000 (UTC)
Date: Thu, 23 Feb 2023 18:44:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: oro@il.ibm.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, oro@il.ibm.com,
 idryomov@gmail.com
Subject: Re: [PATCH v6 2/3] block/rbd: Add luks-any encryption opening option
Message-ID: <Y/el9QZDUtDNQfT3@redhat.com>
References: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
 <20230129113120.722708-3-oro@oro.sl.cloud9.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129113120.722708-3-oro@oro.sl.cloud9.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 29.01.2023 um 12:31 hat ORO@il.ibm.com geschrieben:
> From: Or Ozeri <oro@il.ibm.com>
> 
> Ceph RBD encryption API required specifying the encryption format
> for loading encryption. The supported formats were LUKS (v1) and LUKS2.
> 
> Starting from Reef release, RBD also supports loading with "luks-any" format,
> which works for both versions of LUKS.
> 
> This commit extends the qemu rbd driver API to enable qemu users to use
> this luks-any wildcard format.
> 
> Signed-off-by: Or Ozeri <oro@il.ibm.com>

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 95ac4fa634..e59fb5d453 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3827,10 +3827,16 @@
>  ##
>  # @RbdImageEncryptionFormat:
>  #
> +# luks
> +#
> +# luks2

If we don't want to document these values, there's no reason to have
them listed at all. After all, the undocumented list is already in the
definition.

> +# luks-any: Used for opening either luks or luks2. (Since 8.0)

And here it should be '@luks-any' with @.

>  # Since: 6.1
>  ##
>  { 'enum': 'RbdImageEncryptionFormat',
> -  'data': [ 'luks', 'luks2' ] }
> +  'data': [ 'luks', 'luks2', 'luks-any' ] }

I've fixed this up and applied the series to my block branch. Thanks!

Kevin


