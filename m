Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732EB30FD27
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:45:00 +0100 (CET)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kYl-0007wF-Fa
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7k6J-0000x7-52
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7k6F-0004U6-Rk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612466129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAXM4yRY1a6l1YyyizyftSZ0KPJLF2gkJ2DMS3oYW8U=;
 b=BnkUQ4J/ZSlWvBtctqzMB4Au4NBxrTUHG/T+qNyOISrfKRxKwifxAs8hdc9izzT1xAou5x
 wxy7UqRv3sMFYcg5VFxN2+YPxXmLrU6+nR7UpXN6EUOh8qtcRuwcKskutjFBWNMUKkuhRL
 eZD00zhq1yYx0Dg7cBF/3Eu1+sDh3+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-L7GLFOGiMgSRugdVzJTYcQ-1; Thu, 04 Feb 2021 14:15:27 -0500
X-MC-Unique: L7GLFOGiMgSRugdVzJTYcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C77F1800D50;
 Thu,  4 Feb 2021 19:15:26 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1CD6722D9;
 Thu,  4 Feb 2021 19:15:25 +0000 (UTC)
Subject: Re: [PATCH 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1612356810.git.pkrempa@redhat.com>
 <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <00322937-0aaa-271f-5e62-f988f603a20f@redhat.com>
Date: Thu, 4 Feb 2021 13:15:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 7:00 AM, Peter Krempa wrote:
> Bitmap's source persistence is transported over the migration stream and
> the destination mirrors it. In some cases the destination might want to
> persist bitmaps which are not persistent on the source (e.g. the result
> of merge of bitmaps from a number of layers on the source when migrating
> into a squashed image) but currently it would need to create another set
> of persistent bitmaps and merge them.
> 
> This adds 'dest-persistent' optional property to
> 'BitmapMigrationBitmapAlias' which when present overrides the bitmap
> presence state from the source.

persistance

> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  migration/block-dirty-bitmap.c | 30 +++++++++++++++++++++++++++++-
>  qapi/migration.json            |  7 ++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 

> +++ b/qapi/migration.json
> @@ -533,12 +533,17 @@
>  # @alias: An alias name for migration (for example the bitmap name on
>  #         the opposite site).
>  #
> +# @dest-persistent: If populated set the bitmap will be turned persistent
> +#                   or transient depending on this parameter.

s/populated set/present,/

> +#                   (since 6.0)
> +#
>  # Since: 5.2
>  ##
>  { 'struct': 'BitmapMigrationBitmapAlias',
>    'data': {
>        'name': 'str',
> -      'alias': 'str'
> +      'alias': 'str',
> +      '*dest-persistent': 'bool'
>    } }
> 
>  ##
> 

The grammar fix is trivial, so
Reviewed-by: Eric Blake <eblake@redhat.com>

I see there is discussion over whether this is the best approach, but it
makes sense to me.  Unless there's a good reason why something else
would be better, I'm probably going to queue this through my dirty
bitmaps tree for a pull request sometime next week.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


