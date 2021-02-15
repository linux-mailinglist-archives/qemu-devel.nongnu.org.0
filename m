Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF631C2E4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:18:02 +0100 (CET)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkJl-0003G5-DE
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBkI6-0002Za-Gy
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBkI4-0002X7-Vl
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613420175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQlLCuhxS/O+9x7aMTtaDG3zTEn5gGRB2zY5nYgNs/A=;
 b=SQpgKPDXjkxPdT596yopPZ7mTvarUYs+/rAc0Ot0SI08SqIsb7irK8eDLmyTiXX9pXoLyU
 yduuEyKIP4Tb821TFuisfCxEAopVKLidHvIeyQMVRSnhQJPI1nggJEpQVX9czAlB/G98sf
 Vuo1lBiizdAm9oJ08bID+mi1Pl9oq2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-VnkmxrEnMWmP-hJXQvItFQ-1; Mon, 15 Feb 2021 15:16:10 -0500
X-MC-Unique: VnkmxrEnMWmP-hJXQvItFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3D9C80196C;
 Mon, 15 Feb 2021 20:16:07 +0000 (UTC)
Received: from [10.3.113.98] (ovpn-113-98.phx2.redhat.com [10.3.113.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C0760BE2;
 Mon, 15 Feb 2021 20:15:58 +0000 (UTC)
Subject: Re: [PATCH v7 03/14] block: check return value of bdrv_open_child and
 drop error propagation
To: Kevin Wolf <kwolf@redhat.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-4-vsementsov@virtuozzo.com>
 <e076e88b-b5b0-258f-7300-2e4f6db985c6@redhat.com>
 <20210215092203.GA7226@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <da15e18f-ac36-aaf4-6cca-2550939497a2@redhat.com>
Date: Mon, 15 Feb 2021 14:04:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215092203.GA7226@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, Greg Kurz <groug@kaod.org>, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:22 AM, Kevin Wolf wrote:

>> With this patch applied, 'check unit-test' fails with:
>>
>> Running test test-replication
>> Unexpected error in bdrv_open_driver() at ../block.c:1481:
>> Could not open '/tmp/p_local_disk.z1Ugyc': Invalid argument
>> ERROR test-replication - missing test plan
>>

> The problem is this hunk:
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 5d94f45be9..e8dd42d73b 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -1611,9 +1611,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>      /* Open external data file */
>      s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
>                                     &child_of_bds, BDRV_CHILD_DATA,
> -                                   true, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +                                   true, errp);
> +    if (!s->data_file) {
>          ret = -EINVAL;
>          goto fail;
>      }
> 
> bdrv_open_child() can return NULL in non-error cases, when the child is
> optional and it isn't given. The test doesn't use an external data file,
> so this returns NULL without setting an error, which now gets turned
> into -EINVAL instead.
> 
> This makes the most basic tests fail with qcow2 (iotests 001 is enough).
> 
> The other hunks in this patch don't suffer from the same problem because
> they pass allow_none=false.

Thanks; that's enough to figure out how to repair the patch:

diff --git i/block/qcow2.c w/block/qcow2.c
index e8dd42d73b4c..38137ca30eb0 100644
--- i/block/qcow2.c
+++ w/block/qcow2.c
@@ -1292,6 +1292,7 @@ static int
validate_compression_type(BDRVQcow2State *s, Error **errp)
 static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
                                       int flags, Error **errp)
 {
+    ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
     unsigned int len, i;
     int ret = 0;
@@ -1612,7 +1613,7 @@ static int coroutine_fn
qcow2_do_open(BlockDriverState *bs, QDict *options,
     s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
                                    &child_of_bds, BDRV_CHILD_DATA,
                                    true, errp);
-    if (!s->data_file) {
+    if (*errp) {
         ret = -EINVAL;
         goto fail;
     }


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


