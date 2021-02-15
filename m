Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC7B31BFAF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:48:46 +0100 (CET)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBh3F-0004Kx-7g
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBh1K-0003WF-G7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBh1H-0003s8-Ge
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613407602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q65UFJy/gkry1+SfB1Q7gS0yo2Hl7rGlfn75+wdFExI=;
 b=R/BxHniAyVomywZTUdyaqLuAgSG7r6i9cSNwpCKzI1A82rqsipB/rFs3cLuvgPUPDav6/Q
 3RE2S+XHhVv/tAIT+TaRLwyEpUMuXKTGQQOvW6OEBv+ZNoxRd7rovwooCvRVeuckq7ME7e
 3hqts6z74zbe5MBZAtGr0Z4HJEEYT3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-OXepaJ27MNiof0ylOZCSxg-1; Mon, 15 Feb 2021 11:46:38 -0500
X-MC-Unique: OXepaJ27MNiof0ylOZCSxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF7B106BB23;
 Mon, 15 Feb 2021 16:46:37 +0000 (UTC)
Received: from [10.3.112.189] (ovpn-112-189.phx2.redhat.com [10.3.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 411741F0;
 Mon, 15 Feb 2021 16:46:37 +0000 (UTC)
Subject: Re: [PULL 3/5] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
To: Kevin Wolf <kwolf@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
 <20210212232134.1462756-4-eblake@redhat.com>
 <20210215123152.GM7226@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0cd1617d-b22f-4ce1-38c2-df8822c3fbbe@redhat.com>
Date: Mon, 15 Feb 2021 10:46:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215123152.GM7226@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 6:31 AM, Kevin Wolf wrote:
> Am 13.02.2021 um 00:21 hat Eric Blake geschrieben:
>> From: Peter Krempa <pkrempa@redhat.com>
>>
>> Verify that the modification of the bitmap persistence over migration
>> which is controlled via BitmapMigrationBitmapAliasTransform works
>> properly.
>>
>> Based on TestCrossAliasMigration
>>
>> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
>> Message-Id: <d9c8e9827e9b6001b2dd1b92e64aab858e6d2a86.1613150869.git.pkrempa@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> [eblake: Adjust test for explicit read_zeroes=False]
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> This breaks 297:
> 
> --- /home/kwolf/source/qemu/tests/qemu-iotests/297.out
> +++ 297.out.bad
> @@ -1,2 +1,8 @@
>  === pylint ===
> +************* Module 300
> +300:605:0: C0301: Line too long (80/79) (line-too-long)
> +300:677:0: C0301: Line too long (98/79) (line-too-long)

These two are easy fixes (add line breaks for shorter lines), but this:

>  === mypy ===
> +300:646: error: Dict entry 2 has incompatible type "str": "Dict[str, bool]"; expected "str": "str"
> +Found 1 error in 1 file (checked 1 source file)

is beyond my skill.  The typing at line 33:

BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]

is insufficient to allow our new 'transform' member in the new
transform_mapping() -> Block BitmapMapping near line 677:

                'bitmaps': [
                    {
                        'name': 'bmap-a',
                        'alias': 'bmap-a',
                        'transform':
                            {
                                'persistent': True
                            }
                    },

but I'm not sure how to tell python the right type it should be.  John?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


