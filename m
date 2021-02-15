Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199331C21A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:03:27 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBj9a-0004Ye-3m
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBj6l-00027h-1I
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:00:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBj6i-0002zx-ID
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613415628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5gtdXcahcMBi9Kll2e0gVSGCuvLTIvHCfHj71bROhA=;
 b=hkTm8VJW/wIcuxLBAfrYLdL/h7QgDSX/X8opG4/K7JvKl+bL8xxURVoNjsKcfvSNvQ4nQX
 drJJsSMH5E1xzVkH7T1CBwxSz3mHwsgjwjtZuF1XLpKNa+KV4HqSqhAJCoBlicex9zMWk8
 AwTtIt9YhfLnQ9+8uCUfuuXd6ZPpBOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-zfAtJtGZO1SK9SgH4biIkg-1; Mon, 15 Feb 2021 14:00:26 -0500
X-MC-Unique: zfAtJtGZO1SK9SgH4biIkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B9E192D78F;
 Mon, 15 Feb 2021 19:00:24 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08A335D9C0;
 Mon, 15 Feb 2021 19:00:23 +0000 (UTC)
Subject: Re: [PULL 3/5] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
To: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
 <20210212232134.1462756-4-eblake@redhat.com>
 <20210215123152.GM7226@merkur.fritz.box>
 <0cd1617d-b22f-4ce1-38c2-df8822c3fbbe@redhat.com>
 <20210215170902.GS7226@merkur.fritz.box>
 <42192dc8-329c-ef2d-d8f7-3d02ae9d2c85@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <0138182f-0e17-f225-0060-85f1776f26dc@redhat.com>
Date: Mon, 15 Feb 2021 14:00:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <42192dc8-329c-ef2d-d8f7-3d02ae9d2c85@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:25 PM, Eric Blake wrote:
> -BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
> +BlockBitmapMapping = List[Dict[str,
> +                               Union[str,
> +                                     List[Dict[str,
> +                                               Union[str, Dict[str,
> bool]]]]]]]

That looks *very* beefy.

Is the Union because that union is valid for every key, or because every 
key has a potentially different value that is specific to that key?

if it's the latter, I'd ditch the Union and just go with:

Dict[str, object], or
Dict[str, Any]

object: will allow any type, but keeps strict checking enabled. If you 
try to use that value later on without a cast, mypy will warn you if you 
are using it in a manner not guaranteed by the "object" type. Can be 
useful if you are passing values to a function that already does RTTI to 
determine behavior.

Any: Also allows any type, but enables gradual typing. If you later 
"assume" the type of this value, mypy will say nothing. Can be useful 
when you've just got a job to do and the right tool would have been a 
recursive type or a TypedDict (unavailable in Python 3.6.)

--js


