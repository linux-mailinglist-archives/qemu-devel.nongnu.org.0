Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79E199DB4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 20:06:55 +0200 (CEST)
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJLHq-0001R9-4h
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 14:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jJLGY-0000x8-PU
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 14:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jJLGX-0001gO-J5
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 14:05:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53835
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jJLGX-0001g8-G8
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 14:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585677933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCLiDhwn0dtZ4oqBTHoPy/ENU76ZZhY4NK2e6BpRJvo=;
 b=ZIIKeSjax7sJGEX3k7sDhuzN3esPmKGGR3gFfjSe2qTZyqU1BTovlvV/dewE6wBxG/Ethe
 vC/gc03FXDtigEsyIacyn4ZNIx8no+VGLqW3GoNgM+mFKXZAKuGwMTCy62YBStCyFHrPSM
 m1ESLXLZlZT9ORGQsqLYaUT77EbKdBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-alTmArDdO3inK3HVh5rHyA-1; Tue, 31 Mar 2020 14:05:27 -0400
X-MC-Unique: alTmArDdO3inK3HVh5rHyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF537801A24;
 Tue, 31 Mar 2020 18:05:25 +0000 (UTC)
Received: from [10.3.113.246] (ovpn-113-246.phx2.redhat.com [10.3.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 567535DA82;
 Tue, 31 Mar 2020 18:05:23 +0000 (UTC)
Subject: Re: [PATCH v14 1/4] qcow2: introduce compression type feature
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200331174455.31792-1-dplotnikov@virtuozzo.com>
 <20200331174455.31792-2-dplotnikov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4edd95c8-8b92-444d-db34-6cf9097bbd37@redhat.com>
Date: Tue, 31 Mar 2020 13:05:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331174455.31792-2-dplotnikov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 armbru@redhat.com, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/20 12:44 PM, Denis Plotnikov wrote:
> The patch adds some preparation parts for incompatible compression type
> feature to qcow2 allowing the use different compression methods for
> image clusters (de)compressing.
> 
> It is implied that the compression type is set on the image creation and
> can be changed only later by image conversion, thus compression type
> defines the only compression algorithm used for the image, and thus,
> for all image clusters.
> 
> The goal of the feature is to add support of other compression methods
> to qcow2. For example, ZSTD which is more effective on compression than ZLIB.
> 
> The default compression is ZLIB. Images created with ZLIB compression type
> are backward compatible with older qemu versions.
> 
> Adding of the compression type breaks a number of tests because now the
> compression type is reported on image creation and there are some changes
> in the qcow2 header in size and offsets.
> 
> The tests are fixed in the following ways:
>      * filter out compression_type for many tests
>      * fix header size, feature table size and backing file offset
>        affected tests: 031, 036, 061, 080
>        header_size +=8: 1 byte compression type
>                         7 bytes padding
>        feature_table += 48: incompatible feature compression type
>        backing_file_offset += 56 (8 + 48 -> header_change + feature_table_change)
>      * add "compression type" for test output matching when it isn't filtered
>        affected tests: 049, 060, 061, 065, 144, 182, 242, 255
> 
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> QAPI part:
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/qapi/block-core.json
> @@ -78,6 +78,8 @@
>   #
>   # @bitmaps: A list of qcow2 bitmap details (since 4.0)
>   #
> +# @compression-type: the image cluster compression method (since 5.0)

At this point (-rc1 is due today), I'm thinking that this is going to 
land in 5.1 rather than 5.0.  That will have some ripple effects on the 
patch.

Otherwise,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


